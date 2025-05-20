# Quiz

Aplicación web ASP.NET responsive (bootstrap)
Objetivo: 
* Crear una aplicación web que permita al usuario responder un cuestionario
* Luego de responder el cuestionar, la aplicación debe mostrar al usuario el candidato
(nombre y foto) municipal sugerido para su voto

Requerimientos:
* ASP.NET, se sugiere MVC y Bootstrap (responsive, debe adaptarse a las pantallas
pequeñas de dispositivos móviles)
* Base de datos SQL Server 2012 (o superior), ya tiene las tablas y datos de ejemplo listos
* La lógica para obtener la lista de preguntas, guardar el cuestionario (respuestas del
usuario) y mostrar el candidato municipal sugerido debe ser creado en una clase que
podamos reutilizar más adelante en otros proyectos

Especificaciones:

1. La lista de preguntas y respuestas se puede obtener desde una vista ya existente en la base de
datos (vQuestionAnswer) o directamente desde las tablas question y answer (ver diagrama de
tablas al final del documento)
2. Todas las preguntas del cuestionario son de selección única.
3. Cada pregunta tiene foto relacionada (campo question_picture) que puede ser mostrada en el
cuestionario bajo cada pregunta. OJO: medir el tiempo, este punto es opcional.
Mockup propuesto:
<Quiz>
<Responda a las siguientes preguntas:>
<1....>
<2....>
4. El usuario no puede enviar (guardar) el cuestionario si no ha completado todas la preguntas
5. El proceso de guardar el cuestionario debe crear un registro en la tabla quiz, completando solo
los campos quiz_code (código auto generado y único para el cuestionario) y quiz_date (fecha y
hora actual). Asimismo, debe guardar las respuestas del usuario en la tabla detalle quiz_answer.
6. El proceso de guardar el custionario debe llamar al procedimiento almacenado ya existente
upCalculateMatchingCandidates envíando como parámetro el quiz_id. Este procedimiento
almacenado ya tiene la lógica de cálculo del candidato sugerido para el usuario, actualiza el
campo candidate1_id del quiz. Utilizando este campo se puede consultar la tabla candidate para
obtener el nombre y foto del candidato.
7. Luego de que se haya guardado el cuestionado y calculado el candidato sugerido, se debe
mostrar una página con el nombre del candidato municipal sugerido para el usuario.
8. Opcionalmente, mostrar la foto del cantidato sugerido.
Mockup propuesto:
<En base a sus respuestas sugerimos el siguiente candidato>
<Nombre del candidato>
<Foto del candidato>
Notas:
* El campo question_picture hace referencia a la ruta relativa de la imagen en la carpeta images-questions

--------------------------------------------------------------------

Quiz Challenge con ADO.NET, La app esta se encuentra dockerizada, el docker compose levanta el SQL Server y corre el script init.sql para crear la base de datos.
