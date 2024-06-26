import { pool } from '../config/db.js'

/* -----------------CRUD COMMENT------------------- */

export const readComment = async (req, res) => {
  try {
    const publicationId = req.query.publicationId

    if (publicationId) {
      const [comment] = await pool.execute(`SELECT c.* FROM publication p INNER JOIN comment c
            ON p.publication_id = c.publication_id
            WHERE p.publication_id =?`, [publicationId])

      if (comment.length === 0) { return res.status(404).json({ message: 'No hay comentarios' }) }

      res.status(200).json({ message: 'Estos son los comentarios:', comment })
    } else {
      res.status(200).json({
        message: 'Selecciona una publicacion para ver sus comentarios'
      })
    }
  } catch (error) {
    res.status(500).json(error)
  }
}

export const createComment = async (req, res) => {
  try {
    const publicationId = req.query.publicationId
    const profileId = req.query.profileId
    const { description } = req.body

    const [commentNew] = await pool.execute('INSERT INTO comment (description,publication_id,profile_id) VALUES(?,?,?)', [description, publicationId, profileId])
    const { affectedRows } = commentNew

    if (affectedRows === 1 && profileId == 1) {
      return res.status(200).json({ message: 'Comentario creado por el Admin' })
    } else if (affectedRows === 1 && profileId !== 1) { return res.status(200).json({ message: `Comentario creado por el usuario numero: ${profileId}` }) } else { return res.status(500).json({ message: 'Error Interno al crear el comentario' }) }
  } catch (error) {
    res.status(500).json({ message: 'Error de servidor', error })
  }
}

export const updateComment = async (req, res) => {
  try {
    const publicationId = req.query.publicationId
    const profileId = req.query.profileId
    const { comment_id, description } = req.body

    switch (profileId) {
      case '1':
        let query = 'UPDATE comment SET'
        const params = []

        if (description) {
          query += ' description=?,'
          params.push(description)
        }
        if (publicationId) {
          query += ' publication_id=?,'
          params.push(publicationId)
        }

        query = query.slice(0, -1)
        query += ' WHERE comment_id=?'

        params.push(comment_id)

        const [update] = await pool.execute(query, params)

        if (update.affectedRows === 1) {
          res.status(200).json({ message: 'Comentario actualizada con exito por el Admin' })
        } else {
          return res.status(500).json({ message: 'No se puso actualizar el comentario' })
        }
        break

      default:

        const [commentVerification] = await pool.execute(`SELECT c.* FROM comment c INNER JOIN profile p
                ON c.profile_id = p.profile_id
                WHERE c.profile_id=? AND c.comment_id=?;`, [profileId, comment_id])

        if (commentVerification.length === 0) {
          return res.status(200).json({ message: 'ESTE COMENTARIO NO ES TUYO' })
        } else {
          let query = 'UPDATE comment SET'
          const params = []

          if (description) {
            query += ' description=?,'
            params.push(description)
          }
          if (publicationId) {
            query += ' publication_id=?,'
            params.push(publicationId)
          }

          query = query.slice(0, -1)
          query += ' WHERE comment_id=?'

          params.push(comment_id)

          const [update] = await pool.execute(query, params)

          if (update.affectedRows === 1) {
            return res.status(200).json({ message: 'Comentario actualizada con exito por el Usuario' })
          } else {
            return res.status(500).json({ message: 'No se puso actualizar el comentario' })
          }
        }
    }
  } catch (error) {
    res.status(500).json({ message: 'Error de servidor', error })
  }
}

export const deleteComment = async (req, res) => {
  try {
    const profileId = req.query.profileId
    const commentId = req.query.commentId

    switch (profileId) {
      case '1':

        const [deleteCom] = await pool.execute('DELETE FROM comment WHERE comment_id=?', [commentId])

        if (deleteCom.affectedRows !== 1) {
          return res.status(500).json({ message: 'No se puso Eliminar el comentario' })
        } else { return res.status(200).json({ message: 'Comentario ELIMINADO con exito por el Admin' }) }

      default:

        const [commentVerification] = await pool.execute(`SELECT c.* FROM comment c INNER JOIN profile p
            ON c.profile_id = p.profile_id
            WHERE c.profile_id=? AND c.comment_id=?;`, [profileId, commentId])

        if (commentVerification.length === 0) {
          res.status(200).json({ message: 'NO PUEDES ELIMINAR ESTE COMENTARIO' })
        } else {
          const [deleteCom] = await pool.execute('DELETE FROM comment WHERE comment_id=?', [commentId])

          if (deleteCom.affectedRows !== 1) {
            return res.status(500).json({ message: 'No se pudo Eliminar el comentario' })
          }
          res.status(200).json({ message: 'Comentario ELIMINADO con exito por el Usuario' })
        }

        break
    }
  } catch (error) {
    res.status(500).json(error)
  }
}
