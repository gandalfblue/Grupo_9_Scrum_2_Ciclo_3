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
<title>Eliminar cliente</title>
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



<body id="body_clientes">

	<!-- Navbar-->
	<nav class="navbar navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand links" href="index.html">
			<i class="fas fa-shopping-basket"></i> Tienda Generica</a>
			<a class="navbar-brand links" href="index_usuarios.jsp">
			<i class="fas fa-users"></i> Usuarios</a> 
			<a class="navbar-brand links" href="index_clientes.jsp">
			<i class="fas fa-address-book"></i> Clientes</a>
			<a class="navbar-brand links" href="index_proveedores.jsp">
			<i class="fas fa-truck"></i> Proveedores</a>
			<a class="navbar-brand links" href="index_productos.jsp">
			<i class="fas fa-apple-alt"></i> Productos</a>
			<a class="navbar-brand links" href="listaventas.jsp">
			<i class="fas fa-money-check-alt"></i> Ventas</a>
			<a class="navbar-brand links" href="reportes.jsp">
			<i class="fas fa-clipboard-list"></i> Reportes</a>
		</div>
	</nav>

	
			<div class="container p-4">
				<div class="col text-center">
					<button type="button" class="btn btn-success" 
				  		onclick="window.location.href='/insertarclientes.jsp'">
					<i class="fas fa-plus-circle"></i> Agregar cliente</button>
					<button type="button" class="btn btn-danger"
						onclick="window.location.href='/eliminarclientes.jsp'">
					<i class="fas fa-trash"></i> Eliminar cliente</button>
					<button type="button" class="btn btn-warning"
						onclick="window.location.href='/actualizarclientes.jsp'">
					<i class="fas fa-pen-alt"></i> Actualizar cliente</button>
					<button type="button" class="btn btn-secondary"
						onclick="window.location.href='/buscarclientes.jsp'">
					<i class="fas fa-search"></i> Buscar un cliente</button>
					<button type="button" class="btn btn-primary"
						onclick="window.location.href='/listaclientes.jsp'">
					<i class="fas fa-search"></i> Lista de clientes</button>
					
				</div>
			</div>
		<div class="header">	
			<h1 style="color:red;">
			<i class="fas fa-trash"></i> Eliminar cliente
		</h1>



		</div>
		<br>
		<br>

	<div style="padding-left: 5px">	
		<div class="container">		
		
			<div id="error" class="alert alert-danger visually-hidden"
					role="alert">Error al eliminar el cliente,</div>
					
			<div id="no_encontrado" class="alert alert-danger visually-hidden"
					role="alert">Cliente no encontrado, verifique que este ingresando
					un numero de cedula registrado</div>
					
			<div id="correcto" class="alert alert-success visually-hidden"
				role="alert">Cliente Eliminado con exito</div>

			<form id="form1" class="preselection">
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">Cedula del cliente</span>
					 <input type="text" class="form-control"
						placeholder="Inserte cedula aqui..."
						aria-describedby="basic-addon1" required id="clientesearch">
				</div>

			</form>


		 			<button type="button" class="btn btn-danger" onclick="eliminar()">
						<i class="fas fa-trash"></i> Eliminar cliente
					</button>

			</div>
		</div>

		

	</div>
	<nav class="navbar fixed-bottom navbar-dark bg-dark">
		<div class="row justify-content-between">
			<div class="col-4">
				<a class="navbar-brand links" href="#"><i class="fas fa-code"></i>
					Dise?ado y programado por Carol Mart?nez, Claudia Gonz?lez, David Mu?oz, Andr?s Lozada <i
					class="fas fa-code-branch"></i></a>
			</div>
		</div>
	</nav>
	
	<script>	
	
	function eliminar() {
		var y = document.getElementById("clientesearch").value;
		var req = new XMLHttpRequest();
		var coincidencia = false;
		req.open('GET', 'http://localhost:8080/listarclientes', false);
		req.send(null);
		var clientes = null;
		if (req.status == 200)
			clientes = JSON.parse(req.responseText);
		console.log(JSON.parse(req.responseText));

		for (i = 0; i < clientes.length; i++) {
			
			console.log(clientes[i].cedula_cliente);
			if (clientes[i].cedula_cliente == y) {
				console.log(clientes[i].cedula_cliente + " " + y);
				coincidencia = true
				break;
			}
		}
		console.log(coincidencia);

		if (coincidencia != false) {
			var cedula=document.getElementById("clientesearch").value;
			
			var xhr = new XMLHttpRequest();
			xhr.open("DELETE", "http://localhost:8080/eliminarclientes?cedula_cliente="+cedula);
			
			var element = document.getElementById("error");
			element.classList.add("visually-hidden");
			
			var element2 = document.getElementById("correcto");
			element2.classList.remove("visually-hidden");

			document.getElementById("clientesearch").value = "";
			xhr.send();

		} else {
			var element = document.getElementById("error");
			element.classList.remove("visually-hidden");
			
			var element2 = document.getElementById("correcto");
			element2.classList.add("visually-hidden");
			
			document.getElementById("clientesearch").value = "";;
		}
	}
</script>

</body>
</html>