#!/bin/bash

#!/bin/bash

# Detiene el contenedor si está corriendo
docker stop ssh-tunnel 2>/dev/null || echo "Contenedor ssh-tunnel no estaba corriendo."

# Lo elimina si existe
docker rm ssh-tunnel 2>/dev/null || echo "Contenedor ssh-tunnel no existía."
