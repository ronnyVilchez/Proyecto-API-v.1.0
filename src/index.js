import express from 'express'
import { PORT } from './config/config.js'
import morgan from 'morgan'

import swaggerUi from 'swagger-ui-express'
import jsonDocs from './config/swagger-output.json' assert {type: 'json'}

import usersRoutes from './routes/users.routes.js'
import publicationRoutes from './routes/publication.routes.js'
import commentRoutes from './routes/comment.routes.js'
import categoryRooutes from './routes/category.routes.js'

const app = express()

app.use(morgan('dev'))
app.use(express.json())

app.use('/user',usersRoutes)

app.use('/publication',publicationRoutes)

app.use('/comment', commentRoutes)

app.use('/category',categoryRooutes)

app.use('/api-docs',swaggerUi.serve, swaggerUi.setup(jsonDocs))

app.listen(PORT, () => console.log(`SERVIDOR LISTO EN EL PUERTO ${PORT}`))