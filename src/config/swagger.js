import swaggerAutogen from 'swagger-autogen'

const doc = {
  info: {
    title: 'API PUBLICACIONES',
    description: 'Esta API  maneja los datos de los usuarios, publicaciones, comentarios y categorias.'
  },
  host: 'localhost:3000'
}
const outputFile = './swagger-output.json'
const routes = ['./src/index.js']
swaggerAutogen()(outputFile, routes, doc)
