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

<body>
	
	<!-- Navbar-->	
   	<nav class="navbar navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand links" href="index.html">
			<i class="fas fa-shopping-basket"></i> Tienda Generica</a>			
		</div>
	</nav>	
	
	
	<header id=titulo_3> Pagina principal Tienda Generica</header>
	
	<div class="container p-4">
		<div class="row justify-align-center">
				<div class="col text-center col-xl-12 col-lg-10 col-sm-11">
					
					<ul class="list-group" style="list-style:none">								
					  	<li><button type="button" class="btn btn-lg" 
					  		onclick="window.location.href='/index_usuarios.jsp'">
							<i class="fas fa-users"></i>Usuarios</button></li>
						<li><button type="button" class="btn btn-lg"
							onclick="window.location.href='/index_clientes.jsp'">
							<i class="fas fa-address-book"></i>Clientes</button></li>
						<li><button type="button" class="btn btn-lg"
							onclick="window.location.href='/index_proveedores.jsp'">
							<i class="fas fa-truck"></i>Proveedores</button></li>
						<li><button type="button" class="btn btn-lg"
							onclick="window.location.href='/index_productos.jsp'">
							<i class="fas fa-apple-alt"></i> Productos</button></li>
						<li><button type="button" class="btn btn-lg"
							onclick="window.location.href='/listaventas.jsp'">
							<i class="fas fa-money-check-alt"></i>Ventas</button></li>
						<li><button type="button" class="btn btn-lg"
							onclick="window.location.href='/reportes.jsp'">
							<i class="fas fa-clipboard-list"></i>Reportes</button></li>
					</ul>				
				</div>
			</div>
		</div>
	<br>
	<br>
	
	<nav class="navbar2 fixed-bottom navbar-dark bg-dark">
			<div class="row justify-content-between">
				<div class="col-4">
					<a class="navbar-brand links" href="#"><i class="fab fa-battle-net"></i>
					Diseñado y programado por Carol Martínez, Claudia González, David Muñoz, Andrés Lozada
					<i class="fas fa-cogs"></i></a>
				</div>
			</div>
		</nav>
</body>
</html>