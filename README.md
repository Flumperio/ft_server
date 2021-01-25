# ft_server
 ft_server_42

Introducción
Esta evaluación tiene como objetivo hacerle descubrir la administración de sistemas y concienciarle de la importancia que tiene el uso de scripts para la automatización de sus tareas. Para ello, vamos a hacerle descubrir la tecnología "Docker"para que pueda instalar un servidor web completo, capaz de hacer funcionar varios servicios como Wordpress, Phpmyadmin y una base de datos.

Instrucciones generales
• Tiene que entregar todos los archivos necesarios para la configuración de su servidor en un directorio srcs.
• Su archivo Dockerfile tendrá que estar en la raíz de su repositorio. Se usará para construir su contenedor. No puede usar docker-compose.
• Todos los archivos necesarios para su wordpress tendrán que estar en el directorio srcs.

Parte obligatoria
• Tendrá que instalar un servidor web con Nginx, dentro de un solo contenedor Doc- ker. El contenedor tendrá que funcionar sobre Debian Buster.
• Su servidor tendrá que permitir que funcionen varios servicios a la vez. Los servicios serán un Wordpress, que tendrá que instalar Ud. mismo, Phpmyadmin y MySQL. Tendrá que asegurarse de que su base de datos SQL funciona con wordpress y con phpmyadmin.
• Cuando sea posible, su servidor debe poder utilizar el protocolo SSL.
• Tendrá que asegurarse de que su servidor redirige hacia el sitio web correcto, en función de la url introducida.
También se debe asegurar de que su servidor funcione con un índice automático, que se puede desactivar.
