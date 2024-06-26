import express from 'express'
import { PORT } from './config/config.js'
import morgan from 'morgan'

import swaggerUi from 'swagger-ui-express'
import jsonDocs from './config/swagger-output.json' assert {type: 'json'}


//import { updateProfile, createProfile, readProfileUser, deleteProfile } from './controllers/users.controller.js'
import usersRoutes from './routes/users.routes.js'

//import { categoryPublication, createPublication, deletePublication, readPublication, titlePublication, updatePublication } from './controllers/publication.controller.js'
import publicationRoutes from './routes/publication.routes.js'

//import { createComment, deleteComment, readComment, updateComment } from './controllers/comment.controller.js'
import commentRoutes from './routes/comment.routes.js'

//import { createCategory, deleteCategory, readCategory, updateCategory } from './controllers/category.controller.js'
import categoryRooutes from './routes/category.routes.js'

const app = express()
app.use(morgan('dev'))
app.use(express.json())
/* ---------USER----------- */

app.use('/user',usersRoutes)
/* app.get('/user/:profileId', readProfileUser)  // --> '/:profileId?userID=ID'
app.post('/user/:profileId', createProfile) // --> '/:profileId?userID=ID'
app.patch('/user/:profileId', updateProfile) // --> '/:profileId=ID & profileUserID=ID'
app.delete('/user/:profileId', deleteProfile) // --> '/:profileId?userID=ID & profileUserID=ID'
 */
/* ---------PUBLICATON----------- */

app.use('/publication',publicationRoutes)

/* app.get('/publication', readPublication)  // --> '/?publicationId'
app.post('/publication', createPublication) // --> '/?profileId=(admin || user)'  **Requiere category_id en Array en el body
app.patch('/publication',updatePublication) // --> '/?publicationId= ID & profileId=(admin || user)
app.delete('/publication',deletePublication) // --> '/?publicationId= ID & profileId=(admin || user)

app.get('/publication/category/:categoryId?', categoryPublication)  // -->  **Filtra por categoria
app.get('/publication/title/:title?', titlePublication)  // -->  **Busqueda por titulo
*/

/* ---------COMMENT----------- */

app.use('/comment', commentRoutes)
/* app.get('/comment', readComment) // --> '/?publicationId= ID
app.post('/comment', createComment) // --> '/?publicationId= ID & profileId=(admin || user)
app.patch('/comment',updateComment) // --> '/?publicationId= ID & profileId=(admin || user)  **Body requiere comment_id
app.delete('/comment',deleteComment) // --> '/?commentId= ID & profileId=(admin || user)
 */
/* ---------CATEGORY----------- */
app.use('/category',categoryRooutes)
/* app.get('/category', readCategory) // --> '/?profileId= ID
app.post('/category', createCategory) // --> '/?profileId= ID
app.patch('/category', updateCategory) // --> '/?profileId= ID 
app.delete('/category', deleteCategory) // --> '/?profileId= ID categoryId= ID
 */


app.use('/api-docs',swaggerUi.serve, swaggerUi.setup(jsonDocs))

app.listen(PORT, () => console.log(`SERVIDOR LISTO EN EL PUERTO ${PORT}`))