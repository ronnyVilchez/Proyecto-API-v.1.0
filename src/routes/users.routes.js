import { Router } from "express";
import { createProfile, deleteProfile, readProfileUser, updateProfile } from "../controllers/users.controller.js";

const router = Router()

router.get('/:profileId', readProfileUser)  // --> '/:profileId?userID=ID'
router.post('/', createProfile) // --> '/?profileId?userID=ID'
router.patch('/:profileId', updateProfile) // --> '/:profileId=ID & profileUserID=ID'
router.delete('/:profileId', deleteProfile) // --> '/:profileId?userID=ID & profileUserID=ID'

export default router