import { Router } from 'express'
import { createProfile, deleteProfile, readProfileUser, updateProfile } from '../controllers/users.controller.js'

const router = Router()

router.get('/:profileId', readProfileUser) // --> '?userID=ID'
router.post('/', createProfile) // --> '/?profileId&userID=ID'
router.patch('/:profileId', updateProfile) // --> '/:userId=ID & profileUserID=ID'
router.delete('/:profileId', deleteProfile) // --> '/?userID=ID & profileUserID=ID'

export default router
