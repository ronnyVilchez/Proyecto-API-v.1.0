import { Router } from 'express'
import { createCategory, deleteCategory, readCategory, updateCategory } from '../controllers/category.controller.js'

const router = Router()

router.get('/:profileId', readCategory)
router.post('/:profileId', createCategory)
router.patch('/:profileId', updateCategory)
router.delete('/:profileId/:categoryId', deleteCategory)

export default router
