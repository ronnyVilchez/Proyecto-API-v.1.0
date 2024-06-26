import { Router } from 'express'
import { categoryPublication, createPublication, deletePublication, readPublication, titlePublication, updatePublication } from '../controllers/publication.controller.js'

const router = Router()

router.get('/:publicationId', readPublication) // --> '/?publicationId'
router.post('/:profileId', createPublication) // --> '/?profileId=(admin || user)'  **Requiere category_id en Array en el body
router.patch('/:publicationId/:profileId', updatePublication) // --> '/?publicationId= ID & profileId=(admin || user)
router.delete('/:publicationId/:profileId', deletePublication) // --> '/?publicationId= ID & profileId=(admin || user)

router.get('/:categoryId', categoryPublication) // -->  **Filtra por categoria
router.get('/:title', titlePublication) // -->  **Busqueda por titulo

export default router
