# README
- Los queries de la aplicación han sido optimizadas.
- Se uso grape para crear una Rest API.
- Se utilizó un algoritmo simple para ordernar las horas.(Random Pick)
- Se utilizó un builder y un strategy en el proyecto.
- Se crearon algunos specs, no fueron completados por tiempo.

Cosas necesarias:
* Ruby version
3.0.2

* Configuration
`rails db:create && db:migrate && db:seed`

* How to run the test suite
`rspec spec/`

Se debe agregar un archivo .env al root del proyecto con la siguiente env var, ya que se utiliza cors para detectar el origen de los requests:
`MONITORING_FRONT_URL=http://localhost:8080`