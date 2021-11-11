<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<!-- paquete de caracteres -->
<meta charset="utf-8">
<!-- Tamaño de la pantalla -->
<meta name="viewport" content="width=device-width">
<!-- titulo de la pestaña -->
<title>Tienda Generica</title>

<!-- bootstrap-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<!-- font awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">

<!-- Cargando mi hoja de estilo -->
<link href="style.css" rel="stylesheet" type="text/css" />

</head>

<body class="index">
	<!-- Navbar-->
	<nav class="navbar navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand links" href="index.html"> 
			<i class="fas fa-shopping-basket"></i> Tienda Generica
			</a>
		</div>
	</nav>
	
			<div class="header">
			<br>
			<br>
				<h1><i class='fas fa-list-ol fa-pulse fa-spin fa-1x'></i> Bienvenido</h1>
			</div>
 
	
	<!-- Contenedor de los botones y texto -->
	<form class="formulario">

     <div class="contenedor">
     
     	<div class="input-contenedor mb-3">
			<i class="fas fa-user-check" id="icono1"></i> 
			<input id="inputuser" class="sinborde" type="text"
				placeholder="Usuario" aria-label="Usuario"
				aria-describedby="basic-addon1">
			</div>

		<div class="input-contenedor mb-3">
			<i class="fas fa-unlock-alt" id="icono2"></i>
			<input id="inputpass"  class="sinborde" type="password"				
				placeholder="Contraseña" aria-label="Contraseña"
				aria-describedby="basic-addon1">
				
			<button class="btn btn-primary" type="button" 
			onmousedown="showPassword()" onmouseup="hidePassword()"> 
         	<span class="fa fa-eye-slash show-password"></span>
         	</button>
		</div>
		
			<div style="margin: auto; text-align: center;">
				<button type="button" class="button btn-success" onclick="comparar()">
					<i class="fas fa-sign-in-alt"></i> Iniciar Sesión
				</button>
				
				<p>Aceptas nuestras Condiciones de uso y Política de privacidad.</p>
         		<p>¿Ya tienes una cuenta?<a class="link" href="insertarusuario_login.jsp"> Registrarse</a></p>
				
				<div id="error" class="alert alert-danger visually-hidden"
					role="alert">Usuario o contraseña incorrecta!</div>
			</div>
		</div>
</form>

	<footer class=" text-center text-white">
	  <!-- Grid container -->
	  <div class="container p-4 pb-0">
	    <!-- Section: Social media -->
	    <section class="mb-4">
	      <!-- Facebook -->
	      <a
	        class="btn btn-primary btn-floating m-1"
	        id="facebook"
	        href="https://www.facebook.com"
	        role="button"
	        ><i class="fab fa-facebook-f"></i
	      ></a>
	
	      <!-- Twitter -->
	      <a
	        class="btn btn-primary btn-floating m-1"
	        id="twitter"
	        href="https://twitter.com"
	        role="button"
	        ><i class="fab fa-twitter"></i
	      ></a>
	
	      <!-- Google -->
	      <a
	        class="btn btn-primary btn-floating m-1"
	        id="google"
	        href="https://www.google.com.co"
	        role="button"
	        ><i class="fab fa-google"></i
	      ></a>
	
	      <!-- Instagram -->
	      <a
	        class="btn btn-primary btn-floating m-1"
	        id="instagram"
	        href="https://github.com"
	        role="button"
	        ><i class="fab fa-instagram"></i
	      ></a>
	
	      <!-- Linkedin -->
	      <a
	        class="btn btn-primary btn-floating m-1"
	        id="linkedin"
	        href="#!"
	        role="button"
	        ><i class="fab fa-linkedin-in"></i
	      ></a>
	      <!-- Github -->
	      <a
	        class="btn btn-primary btn-floating m-1"
	        id="github"
	        href="#!"
	        role="button"
	        ><i class="fab fa-github"></i
	      ></a>
	    </section>
	    <!-- Section: Social media -->
	  </div>
	  <!-- Grid container -->
	
	  <!-- Copyright -->	  
	  <div class="text-center pt-10" style="background-color: rgba(0, 0, 0, 0.4);">
    Grupo 9 Equipo 2  
  </div>
	<nav class="navbar fixed-bottom navbar-dark bg-dark">
		<div class="row justify-content-between">
			<div class="col-4">
				<a class="navbar-brand links" href="#"><i class="fas fa-code"></i>
					Diseñado y programado por Carol Martínez, Claudia González, David Muñoz, Andrés Lozada <i
					class="fas fa-code-branch"></i></a>
			</div>
		</div>
	</nav>
	  <!-- Copyright -->
	</footer>
			<!--  
			<div class="col-4">
				<a class="navbar-brand links" href="https://github.com/roca12"><i
					class="fab fa-github-square"></i> Github</a> <a
					class="navbar-brand links" href=""><i class="fab fa-twitter"></i>
					Twitter</a>
			</div>
			-->
			
	<script>
	function showPassword(){
		var change = document.getElementById("inputpass");
		if(change.type == "password"){
			change.type = "text";
		}else{
			change.type = "password";
		}
	}
	
		function hidePassword(){
			var change = document.getElementById("inputpass");
			if(change.type == "text"){
				change.type = "password";
			}else{
				change.type = "text";
			}
	}</script>
				
	<!-- Script que trae la informacion de la api y la compara con las entradas -->
	<script>
		function comparar() {
			//trayendo texto de input de username
			var x = document.getElementById("inputuser").value;
			//trayendo texto de input de password
			var y = document.getElementById("inputpass").value;
			//url de la api 
			var baseurl = "http://localhost:8080/listarusuarios";
			//creando un objeto de manipulacion de solicitudes
			var xmlhttp = new XMLHttpRequest();
			//abriendo la api
			xmlhttp.open("GET", baseurl, true);
			//funcion interna que compara la información
			xmlhttp.onreadystatechange = function() {
				//si se obtiene un 200 (Conexion correcta)
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					//convirtiendo JSON en variable javascrip
					var usuarios = JSON.parse(xmlhttp.responseText);
					
					//verificando uno por uno si existe ese usuario
					for (i = 0; i < usuarios.length; i++) {
						
						//imprimiendo en la consola del navegador pata verificar
						console.log(usuarios);
						console.log(x);
						console.log(usuarios[i].usuario);
						console.log(y);
						console.log(usuarios[i].password);
						
						//si el nombre coincide
						if (usuarios[i].usuario == x) {
							//si la clave coincide
							if (usuarios[i].password == y) {
								console.log("si");
								var element = document.getElementById("error");
								element.classList.add("visually-hidden");
								document.getElementById("inputuser").value = "";
								document.getElementById("inputpass").value = "";
								window.location.href = "index2.jsp";
								return;
							} else {
								//si la clave NO coincide
								console.log("error clave");
								var element = document.getElementById("error");
								element.classList.remove("visually-hidden");
								document.getElementById("inputuser").value = "";
								document.getElementById("inputpass").value = "";
								return;
							}
						}
					}
					//Si no existe el usuario
					console.log("no encontrado");
					
					//quitando la capacidad de ocultacion del error para mostrarlo
					var element = document.getElementById("error");
					element.classList.remove("visually-hidden");
					document.getElementById("inputuser").value = "";
					document.getElementById("inputpass").value = "";
					return;
				}
			};
			//ejecutando
			xmlhttp.send();
		}
	</script>

</body>

</html>