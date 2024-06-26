import { pool } from "../config/db.js";

export const readCategory = async (req, res) => {
    try {
        const profileId = req.query.profileId

        if (profileId == 1) {

            const [category] = await pool.execute(`SELECT * FROM category`)

            if (category.length === 0) { return res.status(404).json({ message: 'No hay categorias agregadas' }) }
            
            return res.status(200).json({ message: `Estas son las categorias: `, category })
        }
        else {
            res.status(401).json({
                message: `SOLO EL ADMIN TIENE ACCESO`
            })
        }
    }

    catch (error) {
        res.status(500).json(error)
    }
}

export const createCategory = async (req, res) => {
    try {
        const profileId = req.query.profileId
        const { description } = req.body
        if (profileId == 1) {
            const [commentNew] = await pool.execute(`INSERT INTO category (description) VALUES(?)`, [description])
            const { affectedRows } = commentNew

            if (affectedRows === 1) {
                return res.status(200).json({ message: `Categoria creado por el Admin` })
            }
            else { res.status(500).json({ message: `Error al crear la categoria` }) }
        }

        else { return res.status(401).json({ message: `ACCESO DENEGADO` }) }
    } catch (error) {
        res.status(500).json({ message: 'Error de servidor', error })
    }

}

export const updateCategory = async (req, res) => {
    try {
        const profileId = req.query.profileId

        const { category_id, description } = req.body

        if (profileId == 1) {
            const [commentNew] = await pool.execute(`UPDATE category SET description=? WHERE category_id=?`, [description, category_id])
            const { affectedRows } = commentNew

            if (affectedRows === 1) {
                return res.status(200).json({ message: `Categoria actualizada por el Admin` })
            }
            else { res.status(500).json({ message: `Error al actualizar la categoria` }) }
        }

        else { return res.status(401).json({ message: `ACCESO DENEGADO` }) }
    } catch (error) {
        res.status(500).json({ message: 'Error de servidor', error })
    }

}

export const deleteCategory = async (req, res) => {
    try {
        const profileId = req.query.profileId
        const categoryId = req.query.categoryId

        if (profileId == 1) {
            const [deleteCategory] = await pool.execute(`DELETE FROM category WHERE category_id=?`, [categoryId])

            if (deleteCategory.affectedRows !== 1) {
                return res.status(500).json({ message: 'No se pudo Eliminar la categoria' })
            }
            else { return res.status(200).json({ message: 'Categoria ELIMINADA con exito por el Admin' }) }
        }

        else { return res.status(401).json({ message: `ACCESO DENEGADO` }) }
    } catch (error) {
        res.status(500).json({ message: 'Error de servidor', error })
    }

}