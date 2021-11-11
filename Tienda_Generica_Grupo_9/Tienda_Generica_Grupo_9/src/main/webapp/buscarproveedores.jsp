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
<title>Buscar proveedor</title>
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


<body id="body_proveedores">
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
				<div class="container p-3">
				<div class="col text-center">
					<button type="button" class="btn btn-success" 
				  		onclick="window.location.href='/insertarproveedores.jsp'">
					<i class="fas fa-plus-circle"></i> Agregar proveedor</button>
					<button type="button" class="btn btn-danger"
						onclick="window.location.href='/eliminarproveedores.jsp'">
					<i class="fas fa-trash"></i> Eliminar proveedor</button>
					<button type="button" class="btn btn-warning"
						onclick="window.location.href='/actualizarproveedores.jsp'">
					<i class="fas fa-pen-alt"></i> Actualizar proveedor</button>
					<button type="button" class="btn btn-secondary"
						onclick="window.location.href='/buscarproveedores.jsp'">
					<i class="fas fa-search"></i> Buscar proveedor</button>
					<button type="button" class="btn btn-primary"
						onclick="window.location.href='/listaproveedores.jsp'">
					<i class="fas fa-search"></i> Lista de proveedores</button>


					
				</div>
			</div>
			<div class="header">
				<h1 style="color:gray;" >
					<i class="fas fa-search"></i> Buscar proveedor
				</h1>		
			</div>
	<div style="padding-left: 5px">

		<div class="container">


			<div id="error" class="alert alert-danger visually-hidden"
				role="alert">Error al buscar el proveedor, el proveedor no existe</div>

			<div id="correcto" class="alert alert-success visually-hidden"
				role="alert">proveedor encontrado con exito</div>

			<form id="form1" class="preselection">
			
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">proveedor a buscar</span> <input
						type="text" class="form-control" 
						placeholder="Inserte el nit aqui..."
						aria-describedby="basic-addon1" required id="nit_proveedor">
				</div>
				<br>

				<button type="button" class="btn btn-secondary" onclick="enviar()">
				<i class="fas fa-search"></i> Buscar proveedor
				</button>				
				<br>
				<br>
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon2">Ciudad</span> <input
						type="text" class="form-control" 
						aria-describedby="basic-addon2" required id="ciudad_proveedor" disabled="disabled">
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon3">Direccion</span>
					<input type="text" class="form-control" 
						aria-describedby="basic-addon3" required id="direccion_proveedor"  disabled="disabled">
				</div>
				
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon4">Nombre Completo</span> <input
						type="text" class="form-control" 
						aria-describedby="basic-addon4" required id="nombre_proveedor"  disabled="disabled">
				</div>

				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon5">Telefono</span> <input
						type="text" class="form-control" 
						aria-describedby="basic-addon5" required id="telefono_proveedor"  disabled="disabled">
				</div>
			</form>
			<br>
			<br>
			<br>
			<br>
			
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
		function enviar() {
				
				var req = new XMLHttpRequest();
				var coincidencia = false;
				var user=   document.getElementById("nit_proveedor").value;
				req.open('GET', 'http://localhost:8080/consultarproveedores?nit_proveedor='+user, false);
				req.send(null);
				var proveedors = null;
				if (req.status == 200)
					proveedors = JSON.parse(req.responseText);
				console.log(JSON.parse(req.responseText));				

				var element = document.getElementById("error");
				element.classList.add("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.remove("visually-hidden");
				
				console.log(proveedors.toString());
				
			if (proveedors.toString()!=""){

				document.getElementById("ciudad_proveedor").value = proveedors[0].ciudad_proveedor;
				document.getElementById("direccion_proveedor").value = proveedors[0].direccion_proveedor;
				document.getElementById("nombre_proveedor").value = proveedors[0].nombre_proveedor;
				document.getElementById("telefono_proveedor").value = proveedors[0].telefono_proveedor;
				
				document.getElementById("nit_proveedor").value = "";			

			} else {
				var element = document.getElementById("error");
				element.classList.remove("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.add("visually-hidden");
				document.getElementById("ciudad_proveedor").value = "";
				document.getElementById("direccion_proveedor").value = "";
				document.getElementById("nombre_proveedor").value = "";
				document.getElementById("telefono_proveedor").value = "";
				document.getElementById("user").value = "";
			}
		}
	</script>

</body>
</html>