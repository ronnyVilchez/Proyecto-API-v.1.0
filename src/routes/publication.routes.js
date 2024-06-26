import { Router } from "express"
import { categoryPublication, createPublication, deletePublication, readPublication, titlePublication, updatePublication } from "../controllers/publication.controller.js"

const router = Router()


router.get('/', readPublication)  // --> '/?publicationId'
router.post('/', createPublication) // --> '/?profileId=(admin || user)'  **Requiere category_id en Array en el body
router.patch('/',updatePublication) // --> '/?publicationId= ID & profileId=(admin || user)
router.delete('/',deletePublication) // --> '/?publicationId= ID & profileId=(admin || user)

router.get('/category', categoryPublication)  // -->  **Filtra por categoria
router.get('/title', titlePublication)  // -->  **Busqueda por titulo

export default router