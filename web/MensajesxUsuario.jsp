<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <canvas id="myCanvas" width="1000" height="500" ></canvas>
        <script>
            function Dibujar(adias, aval){
            var canvas=document.getElementById("myCanvas");
            var ancho=canvas.width;
            var alto=canvas.height;
            var contexto=canvas.getContext("2d");
            contexto.beginPath();
            contexto.moveTo(0,0);
            contexto.lineTo(0,alto);
            contexto.lineTo(ancho,alto);
            contexto.lineTo(ancho,0);
            contexto.lineTo(0,0);
            
            contexto.moveTo(20,alto-10);
            contexto.lineTo(ancho-20,alto-10);
            
            contexto.moveTo(20,alto-10);
            contexto.lineTo(20,0);
            for (var i = 0; i < 8; i++) {

                contexto.moveTo(150+i*100,alto-10);
                contexto.lineTo(150+i*100,alto-10-aval[i]*3.5);
                contexto.fillText(adias[i],150+i*100,alto-10-aval[i]*3.5);
                contexto.lineTo(150+(i+1)*100,alto-10-aval[i+1]*3.5);
            }
            //contexto.moveTo(150+8*100,alto-10);
            //contexto.lineTo(150+8*100,alto-10-aval[8]*4);
            to.strokeStyle="00000k";
            contexto.stroke();
            
            
        }
        </script>
        
        <script> 
            var A=[17,18,19,23,25,26,27,30,31];
            var B=[100,100,110,117,118,110,119,123];
            Dibujar(A,B);
        </script>
    </body>

</html>
