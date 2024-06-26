import { Router } from 'express'
import { createCategory, deleteCategory, readCategory, updateCategory } from '../controllers/category.controller.js'

const router = Router()

router.get('/', readCategory) // --> '/?profileId= ID
router.post('/', createCategory) // --> '/?profileId= ID
router.patch('/', updateCategory) // --> '/?profileId= ID
router.delete('/', deleteCategory) // --> '/?profileId= ID categoryId= ID

export default router
