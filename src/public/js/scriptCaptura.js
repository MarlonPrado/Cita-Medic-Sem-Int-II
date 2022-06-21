const $canvas = document.querySelector("#canvas"),
$btnDescargar = document.querySelector("#btnDescargar");

// Lo siguiente dibuja en el canvas, no tiene que ver con el tutorial, solo es demostración
const contexto = $canvas.getContext("2d");
contexto.beginPath();
contexto.arc(95, 50, 40, 0, 2 * Math.PI);
contexto.stroke();

// Listener del botón
$btnDescargar.addEventListener("click", () => {
      // Crear un elemento <a>
      let enlace = document.createElement('a');
      // El título
      enlace.download = "Canvas como imagen.png";
      // Convertir la imagen a Base64 y ponerlo en el enlace
      enlace.href = canvas.toDataURL();
      // Hacer click en él
      enlace.click();
});