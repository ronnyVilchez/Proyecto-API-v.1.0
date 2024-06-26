import { pool } from '../config/db.js'

/* -----------------CRUD PUBLICATON------------------- */

export const readPublication = async (req, res) => {
  try {
    const publicationId = req.query.publicationId
    if (publicationId) {
      const [publication] = await pool.execute('SELECT * FROM publication WHERE publication_id=?', [publicationId])
      if (publication.length === 0) { return res.status(404).json({ message: 'No existe esta publicacion' }) }

      res.status(200).json({ message: `Esta publicacion se llama: '${publication[0].title}' ` })
    } else {
      const [publication] = await pool.execute('SELECT * FROM publication')
      res.status(200).json({ message: 'Bienvenido 😃 estas son todas las publicaciones', publication })
    }
  } catch (error) {
    res.status(500).json(error)
  }
}

export const createPublication = async (req, res) => {
  try {
    const profileId = req.query.profileId

    const { title, desciption, category_id } = req.body

    const [publicationAd] = await pool.execute('INSERT INTO publication (title, desciption, profile_id) VALUES (?,?,?)', [title, desciption, profileId])

    const { affectedRows, insertId } = publicationAd

    for (const categoryId of category_id) {
      await pool.execute(
        'INSERT INTO publication_category (publication_id, category_id) VALUES (?, ?)',
        [insertId, categoryId]
      )
    }

    if (affectedRows === 1 && profileId == 1) {
      return res.status(200).json({ message: 'Publicacion creado por el Admin' })
    } else if (affectedRows === 1 && profileId !== 1) { return res.status(200).json({ message: `Publicacion creado por el usuario numero: ${profileId}` }) } else { res.status(500).json({ message: 'Error Interno al crear la publicacion' }) }
  } catch (error) {
    if (error.errno === 1452) { return res.status(404).json({ message: 'El perfil no existe', error }) }
    res.status(500).json(error)
  }
}

export const updatePublication = async (req, res) => {
  try {
    const profileId = req.query.profileId
    const publicationId = req.query.publicationId

    const { title, desciption, category_id } = req.body

    switch (profileId) {
      case '1':
        let query = 'UPDATE publication SET'
        const params = []

        if (title) {
          query += ' title=?,'
          params.push(title)
        }
        if (desciption) {
          query += ' desciption=?,'
          params.push(desciption)
        }

        query = query.slice(0, -1)
        query += ' WHERE publication_id=?'
        params.push(publicationId)

        const [update] = await pool.execute(query, params)

        await pool.execute(
          'DELETE FROM publication_category WHERE publication_id = ?',
          [publicationId])

        for (const categoryId of category_id) {
          await pool.execute(
            'INSERT INTO publication_category (publication_id, category_id) VALUES (?, ?)',
            [publicationId, categoryId]
          )
        }

        if (update.affectedRows !== 1) {
          return res.status(500).json({ message: 'No se puso actualizar la publicacion' })
        }
        return res.status(200).json({ message: 'Publicacion actualizada con exito por el Admin' })

      default:

        const [publicationVerification] = await pool.execute(`SELECT pb.* FROM publication pb INNER JOIN profile pr 
                 ON pb.profile_id = pr.profile_id
                 WHERE pr.profile_id = ? AND pb.publication_id=?`, [profileId, publicationId])

        if (publicationVerification.length === 0) {
          res.status(200).json({ message: 'NO PUEDES ACTUALIZAR ESTA PUBLICACION' })
        } else {
          let query = 'UPDATE publication SET'
          const params = []

          if (title) {
            query += ' title=?,'
            params.push(title)
          }
          if (desciption) {
            query += ' desciption=?,'
            params.push(desciption)
          }

          if (profileId) {
            query += ' profile_id=?,'
            params.push(profileId)
          }

          query = query.slice(0, -1)
          query += ' WHERE publication_id=?'
          params.push(publicationId)

          const [update] = await pool.execute(query, params)

          await pool.execute(
            'DELETE FROM publication_category WHERE publication_id = ?',
            [publicationId])

          for (const categoryId of category_id) {
            await pool.execute(
              'INSERT INTO publication_category (publication_id, category_id) VALUES (?, ?)',
              [publicationId, categoryId]
            )
          }

          if (update.affectedRows !== 1) {
            return res.status(500).json({ message: 'No se pudo actualizar la publicacion' })
          }
          return res.status(200).json({ message: 'Publicacion actualizada con exito por el usuario' })
        }

        break
    }
  } catch (error) {
    res.status(500).json(error)
  }
}

export const deletePublication = async (req, res) => {
  try {
    const profileId = req.query.profileId
    const publicationId = req.query.publicationId

    switch (profileId) {
      case '1':

        const [deleteprof] = await pool.execute('DELETE FROM publication WHERE publication_id=?', [publicationId])

        if (deleteprof.affectedRows !== 1) {
          return res.status(500).json({ message: 'No se puso Eliminar la publicacion' })
        } else { return res.status(200).json({ message: 'Publicacion ELIMINADO con exito por el Admin' }) }

      default:

        const [publicationVerification] = await pool.execute(`SELECT pb.* FROM publication pb INNER JOIN profile pr 
            ON pb.profile_id = pr.profile_id
            WHERE pr.profile_id = ? AND pb.publication_id=?`, [profileId, publicationId])

        if (publicationVerification.length === 0) {
          res.status(200).json({ message: 'NO PUEDES ELIMINAR ESTA PUBLICACION' })
        } else {
          const [deleteprof] = await pool.execute('DELETE FROM publication WHERE publication_id=?', [publicationId])

          if (deleteprof.affectedRows !== 1) {
            return res.status(500).json({ message: 'No se puso Eliminar la publicacion' })
          }
          res.status(200).json({ message: 'Publicacion ELIMINADA con exito por el Usuario' })
        }

        break
    }
  } catch (error) {
    res.status(500).json(error)
  }
}

export const categoryPublication = async (req, res) => {
  try {
    const categoryId = req.query.categoryId
    if (categoryId) {
      const [publication] = await pool.execute(`SELECT * FROM publication p INNER JOIN publication_category pc
            ON p.publication_id = pc.publication_id
            WHERE pc.category_id=?`, [categoryId])

      if (publication.length === 0) { return res.status(404).json({ message: 'No existen publicaciones para esta categoria' }) }

      return res.status(200).json({ message: 'Estas son las publicacion para la categoria:', publication })
    } else {
      const [publication] = await pool.execute('SELECT * FROM publication')
      res.status(200).json({ message: 'Bienvenido 😃 estas son todas las publicaciones. Escoge una categoria', publication })
    }
  } catch (error) {
    res.status(500).json(error)
  }
}
export const titlePublication = async (req, res) => {
  try {
    const titleP = req.query.title
    const title = `%${titleP}%`

    if (titleP) {
      const [publication] = await pool.execute('SELECT * FROM publication WHERE title LIKE ?', [title])

      if (publication.length === 0) { return res.status(404).json({ message: 'No existen publicaciones con esta palabra' }) }

      return res.status(200).json({ message: 'Estas son las publicacion que encontre:', publication })
    } else {
      return res.status(200).json({ message: 'Bienvenido, INGRESA ALGUNA PALABRA PARA BUSCAR 😃' })
    }
  } catch (error) {
    res.status(500).json(error)
  }
}
