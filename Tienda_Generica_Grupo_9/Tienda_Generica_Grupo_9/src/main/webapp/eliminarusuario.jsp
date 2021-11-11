<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<!-- paquete de caracteres -->
<meta charset="utf-8">
<!-- TamaÃ±o de la pantalla -->
<meta name="viewport" content="width=device-width">
<!-- titulo de la pestaÃ±a -->
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



<body id="body_usuarios">
	<!-- Navbar-->
	<nav class="navbar navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand links" href="index.html">
			<i class="fas fa-shopping-basket"></i> Tienda Generica</a>
			<a class="navbar-brand links" href="listausuarios.jsp">
			<i class="fas fa-users"></i> Usuarios</a> 
			<a class="navbar-brand links" href="listaclientes.jsp">
			<i class="fas fa-address-book"></i> Clientes</a>
			<a class="navbar-brand links" href="listaproveedores.jsp">
			<i class="fas fa-truck"></i> Proveedores</a>
			<a class="navbar-brand links" href="listaproductos.jsp">
			<i class="fas fa-apple-alt"></i> Productos</a>
			<a class="navbar-brand links" href="listaventas.jsp">
			<i class="fas fa-money-check-alt"></i> Ventas</a>
			<a class="navbar-brand links" href="listareportes.jsp">
			<i class="fas fa-clipboard-list"></i> Reportes</a>
		</div>
	</nav>
	
		<br>
			<div class="container p-4">
				<div class="col text-center">
				  	<button type="button" class="btn btn-success" 
				  		onclick="window.location.href='/insertarusuario.jsp'">
					<i class="fas fa-plus-circle"></i> Agregar usuario</button>
					<button type="button" class="btn btn-danger"
						onclick="window.location.href='/eliminarusuario.jsp'">
					<i class="fas fa-trash"></i> Eliminar usuario</button>
					<button type="button" class="btn btn-warning"
						onclick="window.location.href='/actualizarusuario.jsp'">
					<i class="fas fa-pen-alt"></i> Actualizar usuario</button>
					<button type="button" class="btn btn-secondary"
						onclick="window.location.href='/buscarusuario.jsp'">
					<i class="fas fa-search"></i> Buscar un usuario</button>
					<button type="button" class="btn btn-primary"
						onclick="window.location.href='/listasuarios.jsp'">
					<i class="fas fa-search"></i> Lista de usuarios</button>				
				</div>
			</div>
  	 	<br>
				<div class="header">
					<h1 style="color:red; "><i class="fas fa-trash"></i> Eliminar usuario</h1>
				</div>
			<br>
		<br>
	<br>
     <div style="padding-left: 5px">	
		<div class="container">		
			<div id="error" class="alert alert-danger visually-hidden"
					role="alert">Error al eliminar el usuario,</div>
					
			<div id="no_encontrado" class="alert alert-danger visually-hidden"
					role="alert">Usuario no encontrado, verifique que este ingresando
					un numero de cedula registrado</div>
					
			<div id="correcto" class="alert alert-success visually-hidden"
				role="alert">Usuario Eliminado con exito</div>

			<form id="form1" class="preselection">
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">Cedula del usuario</span>
					 <input type="text" class="form-control"
						placeholder="Inserte cedula aqui..."
						aria-describedby="basic-addon1" required id="usersearch">
				</div>

			</form>
		
	
		<button type="button" class="btn btn-danger" onclick="eliminar()">
				<i class="fas fa-trash"></i> Eliminar usuario
		</button>
		
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