import { Router } from 'express'
import { createComment, deleteComment, readComment, updateComment } from '../controllers/comment.controller.js'

const router = Router()

router.get('/:publicationId', readComment)
router.post('/:publicationId/:profileId', createComment)
router.patch('/:publicationId/:profileId', updateComment) //* *Body requiere category_id
router.delete('/:profileId/:commentId', deleteComment)

export default router
