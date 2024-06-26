import { pool } from '../config/db.js'

/* -----------------CRUD PERFIL------------------ */

export const readProfileUser = async (req, res) => {
  try {
    const profileId = req.params.profileId
    const userId = req.query.userId

    switch (profileId) {
      case '1':
        const [admin] = await pool.execute('SELECT * FROM profile')
        return res.status(200).json({ message: 'Bienvenido Administrador,estos son los perfiles:', perfil: admin })

      default:
        const [profile] = await pool.execute(`SELECT * FROM profile p INNER JOIN users u
                ON p.profile_id = u.profile_id
                WHERE u.users_id=?  AND p.profile_id=?`, [userId, profileId])

        if (profile.length === 0) { return res.status(404).json({ message: 'Este no es tu perfil' }) } else { return res.status(200).json({ message: `Bienvenido a tu perfil '${profile[0].username}' ` }) }
    }
  } catch (error) {
    res.status(500).json(error)
  }
}

export const createProfile = async (req, res) => {
  try {
    const profileId = req.query.profileId
    const userId = req.query.userId

    const { firstName, lastName, age, username, email, password } = req.body

    switch (profileId) {
      case '1':
        const [profileAd] = await pool.execute('INSERT INTO profile (firstName, lastName, age,username,email,password)VALUES (?,?,?,?,?,?)', [firstName, lastName, age, username, email, password])
        const { affectedRows, insertId } = profileAd

        if (affectedRows === 1) {
          await pool.execute('INSERT INTO users (profile_id,admin_id) VALUES (?,?)', [insertId, profileId])
          return res.status(200).json({ message: 'Perfil creado por el Admin' })
        } else { res.status(500).json({ message: 'Error Interno al crear perfil' }) }
        break

      default:

        const [profileVerification] = await pool.execute(`SELECT * FROM profile p INNER JOIN users u
            ON p.profile_id = u.profile_id
            WHERE u.users_id=?`, [userId])

        if (profileVerification.length === 0) {
          const [profileNew] = await pool.execute('INSERT INTO profile (firstName, lastName, age,username,email,password)VALUES (?,?,?,?,?,?)', [firstName, lastName, age, username, email, password])
          const { affectedRows, insertId } = profileNew
          if (affectedRows === 1) {
            await pool.execute('INSERT INTO users (profile_id,admin_id) VALUES (?,?)', [insertId, 1])
            return res.status(200).json({ message: 'Perfil creado por el Usuario' })
          } else { res.status(500).json({ message: 'Error al crear perfil' }) }
        } else { res.status(200).json({ message: `Ya tienes un perfil: '${profileVerification[0].username}' ` }) }

        break
    }
  } catch (error) {
    res.status(500).json(error)
  }
}

export const updateProfile = async (req, res) => {
  try {
    const profileId = req.params.profileId
    const userId = req.query.userId
    const profileUserId = req.query.profileUserId

    const { firstName, lastName, age, username, email, password } = req.body

    switch (profileId) {
      case '1':
        let query = 'UPDATE profile SET'
        const params = []

        if (firstName) {
          query += ' firstName=?,'
          params.push(firstName)
        }
        if (lastName) {
          query += ' lastName=?,'
          params.push(lastName)
        }
        if (age) {
          query += ' age=?,'
          params.push(age)
        }
        if (username) {
          query += ' username=?,'
          params.push(username)
        }
        if (email) {
          query += ' email=?,'
          params.push(email)
        }
        if (password) {
          query += ' password=?,'
          params.push(password)
        }

        query = query.slice(0, -1)
        query += ' WHERE profile_id=?'
        params.push(profileUserId)

        const [update] = await pool.execute(query, params)

        if (update.affectedRows !== 1) {
          return res.status(500).json({ message: 'No se puso actualizar el usuario' })
        }
        res.status(200).json({ message: 'Perfil actualizado con exito desde el Admin' })
        break

      default:

        const [profileVerification] = await pool.execute(`SELECT * FROM profile p INNER JOIN users u
            ON p.profile_id = u.profile_id
            WHERE u.users_id=?  AND p.profile_id=?`, [userId, profileId])

        if (profileVerification.length === 0) {
          return res.status(401).json({ message: 'NO PUEDES ACTUALIZAR ESTE PERFIL' })
        } else {
          let query = 'UPDATE profile SET'
          const params = []

          if (firstName) {
            query += ' firstName=?,'
            params.push(firstName)
          }
          if (lastName) {
            query += ' lastName=?,'
            params.push(lastName)
          }
          if (age) {
            query += ' age=?,'
            params.push(age)
          }
          if (username) {
            query += ' username=?,'
            params.push(username)
          }
          if (email) {
            query += ' email=?,'
            params.push(email)
          }
          if (password) {
            query += ' password=?,'
            params.push(password)
          }

          query = query.slice(0, -1)
          query += ' WHERE profile_id=?'
          params.push(profileId)

          const [update] = await pool.execute(query, params)

          if (update.affectedRows !== 1) {
            return res.status(500).json({ message: 'No se puso actualizar el usuario' })
          }
          res.status(200).json({ message: 'Perfil actualizado con exito por el usuario' })
        }

        break
    }
  } catch (error) {
    if (error.errno === 1452) { return res.status(404).json({ message: 'El perfil no existe', error }) }
    res.status(500).json(error)
  }
}
export const deleteProfile = async (req, res) => {
  try {
    const profileId = req.params.profileId
    const userId = req.query.userId
    const profileUserId = req.query.profileUserId

    switch (profileId) {
      case '1':

        const [deleteprof] = await pool.execute('DELETE FROM profile WHERE profile_id=?', [profileUserId])

        if (deleteprof.affectedRows !== 1) {
          return res.status(500).json({ message: 'No se puso Eliminar el usuario' })
        } else { return res.status(200).json({ message: 'Perfil ELIMINADO con exito desde el Admin' }) }

      default:

        const [profileVerification] = await pool.execute(`SELECT * FROM profile p INNER JOIN users u
            ON p.profile_id = u.profile_id
            WHERE u.users_id=${userId}  AND p.profile_id=${profileId}`)

        if (profileVerification.length === 0) {
          res.status(200).json({ message: 'NO PUEDES ELIMINAR ESTE PERFIL' })
        } else {
          const [deleteprof] = await pool.execute('DELETE FROM profile WHERE profile_id=?', [profileId])

          if (deleteprof.affectedRows !== 1) {
            return res.status(500).json({ message: 'No se puso Eliminar el usuario' })
          }
          res.status(200).json({ message: 'Perfil ELIMINADO con exito por el usuario' })
        }

        break
    }
  } catch (error) {
    res.status(500).json(error)
  }
}
