import { Router } from 'express'
import { createComment, deleteComment, readComment, updateComment } from '../controllers/comment.controller.js'

const router = Router()

router.get('/', readComment) // --> '/?publicationId= ID
router.post('/', createComment) // --> '/?publicationId= ID & profileId=(admin || user)
router.patch('/', updateComment) // --> '/?publicationId= ID & profileId=(admin || user)  **Body requiere comment_id
router.delete('/', deleteComment) // --> '/?commentId= ID & profileId=(admin || user)

export default router
