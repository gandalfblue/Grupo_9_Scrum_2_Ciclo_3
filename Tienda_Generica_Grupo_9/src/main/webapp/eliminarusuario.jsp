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
<title>Eliminar usuario</title>
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


<body>
	<!-- Navbar-->
	<nav class="navbar navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand links" href="index.html">
			<i class="fas fa-shopping-basket"></i> Tienda Generica</a>
		</div>
	</nav>

	<!-- Navbar modulos-->
	<nav class="navbar navbar-dark bg-primary">
		<div class="container">
			<a class="navbar-brand links" href="listausuarios.jsp"> <i
				class="fas fa-users"></i> Usuarios
			</a> <a class="navbar-brand links" href="listaclientes.jsp"> <i
				class="fas fa-address-book"></i> Clientes
			</a> <a class="navbar-brand links" href="listausuarios.jsp"> <i
				class="fas fa-truck"></i> Proveedores
			</a> <a class="navbar-brand links" href="listausuarios.jsp"> <i
				class="fas fa-apple-alt"></i> Productos
			</a> <a class="navbar-brand links" href="listausuarios.jsp"> <i
				class="fas fa-money-check-alt"></i> Ventas
			</a> <a class="navbar-brand links" href="listausuarios.jsp"> <i
				class="fas fa-clipboard-list"></i> Reportes
			</a>
		</div>
	</nav>

	<div style="padding-left: 5px">
		<h2>
			<i class="fas fa-plus-circle"></i> Cedula del usuario a eliminar
		</h2>
		
		<div class="container">		
		
			<div id="error" class="alert alert-danger visually-hidden"
					role="alert">Error al eliminar el usuario,</div>
					
			<div id="no_encontrado" class="alert alert-danger visually-hidden"
					role="alert">Usuario no encontrado, verifique que este ingresando
					un numero de cedula registrado</div>
					
			<div id="correcto" class="alert alert-success visually-hidden"
				role="alert">Usuario Eliminado con exito</div>

			<form id="form1">
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">Cedula del usuario</span>
					 <input type="text" class="form-control"
						placeholder="Inserte cedula aqui..."
						aria-describedby="basic-addon1" required id="usersearch">
				</div>

			</form>

			<div class="container p-4">
				<div class="col text-center">
					
					<button type="button" class="btn btn-primary" onclick="buscar()">
						<i class="fas fa-search"></i> Buscar usuario
					</button>
		 			<button type="button" class="btn btn-danger" onclick="eliminar()">
						<i class="fas fa-trash"></i> Eliminar usuario
					</button>
	 			</div>
			</div>
			
			<div class="contenedor" id="tabla visually-hidden">
					
			<h2><i class="fas fa-list-ol"></i> Datos del usuario a eliminar</h2>
			<div class="container">
				<div class="row">
					<!--  Aqui es donde se autogenera la tabla basado en el script -->
					<div class="col align-self-center" id="usuarioinfo">
					
					</div>
	
				</div>
			</div>
		</div>
			
			<h2>
				<i class="fas fa-cogs"></i> Operaciones
				
			</h2>
			
			<div class="container">
				<div class="row">
					<button type="button" class="btn btn-success" 
				  		onclick="window.location.href='/insertarusuario.jsp'">
					<i class="fas fa-plus-circle"></i> Agregar usuario</button>
					<button type="button" class="btn btn-warning"
						onclick="window.location.href='/actualizarusuario.jsp'">
					<i class="fas fa-pen-alt"></i> Actualizar usuario</button>
					<button type="button" class="btn btn-dark"
						onclick="window.location.href='/buscarusuario.jsp'">
					<i class="fas fa-search"></i> Buscar un usuario</button>
					<button type="button" class="btn btn-primary"
						onclick="window.location.href='/listasuarios.jsp'">
					<i class="fas fa-search"></i> Lista de usuarios</button>
				</div>

			</div>
		</div>

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
	
	<script>	
	
	function buscar() {
		
		var req = new XMLHttpRequest();
		var coincidencia = false;
		var cedula_usuario=   document.getElementById("usersearch").value;
		req.open('GET', 'http://localhost:8080/consultarusuario_cedula?cedula_usuario='+cedula_usuario, false);
		req.send(null);
		var usurios = null;
		var tbltop = "<table class='table' id='tabla' visually-hidden' table-dark table-striped'><tr><th>Cédula</th><th>Email</th><th>Nombre</th><th>Password</th><th>Usuario</th></tr>";
		document.getElementById("usuarioinfo").innerHTML = tbl;
		
			if (req.readyState == 4 && req.status == 200) {
				usuarios = JSON.parse(req.responseText);
				console.log(JSON.parse(req.responseText));
				var main = "";
				for (i = 0; i < usuarios.length; i++) {
					
					console.log(usuarios[i].cedula_usuario);					
					
					if (usuarios[i].cedula_usuario ==cedula_usuario ) {
						console.log("si");
						var elemento = document.getElementById("tabla");
						elemento.classList.remove("visually-hidden");
						console.log(usuarios[i].cedula_usuario +" "+cedula_usuario);	
					
						main = "<tr><td>" + usuarios[i].cedula_usuario
						+ "</td><td>" + usuarios[i].email_usuario
						+ "</td><td>" + usuarios[i].nombre_usuario
						+ "</td><td>" + usuarios[i].password 
						+ "</td><td>" + usuarios[i].usuario + "</td></tr>";
					break;
					
					} else {
						console.log("usuario no encontrado");
						var element = document.getElementById("no_encontrado");
						element.classList.remove("visually-hidden");
						document.getElementById("cedula_usuario").value = "";
						return;			
				}
				
				var tblbottom = "</table>";
				var tbl = tbltop + main + tblbottom;
				
			}
				console.log("no encontrado");
				var element = document.getElementById("no_encontrado");
				element.classList.remove("visually-hidden");
				document.getElementById("cedula_usuario").value = "";
				return;
		} else{
			console.log("error al comunicar con la base de datos");
		};
		req.send();
	}
	
	function eliminar() {
		var y = document.getElementById("usersearch").value;
		var req = new XMLHttpRequest();
		var coincidencia = false;
		req.open('GET', 'http://localhost:8080/listarusuarios', false);
		req.send(null);
		var usuarios = null;
		if (req.status == 200)
			usuarios = JSON.parse(req.responseText);
		console.log(JSON.parse(req.responseText));

		for (i = 0; i < usuarios.length; i++) {
			
			console.log(usuarios[i].cedula_usuario);
			if (usuarios[i].cedula_usuario == y) {
				console.log(usuarios[i].cedula_usuario + " " + y);
				coincidencia = true
				break;
			}
		}
		console.log(coincidencia);

		if (coincidencia != false) {
			var cedula=document.getElementById("usersearch").value;
			
			var xhr = new XMLHttpRequest();
			xhr.open("DELETE", "http://localhost:8080/eliminarusuario?cedula_usuario="+cedula);
			
			var element = document.getElementById("error");
			element.classList.add("visually-hidden");
			
			var element2 = document.getElementById("correcto");
			element2.classList.remove("visually-hidden");

			document.getElementById("usersearch").value = "";
			xhr.send();

		} else {
			var element = document.getElementById("error");
			element.classList.remove("visually-hidden");
			
			var element2 = document.getElementById("correcto");
			element2.classList.add("visually-hidden");
			
			document.getElementById("usersearch").value = "";;
		}
	}
</script>

</body>
</html>