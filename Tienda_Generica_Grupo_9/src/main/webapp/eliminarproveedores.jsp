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
<title>Eliminar proveedor</title>
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
			</a> <a class="navbar-brand links" href="listaproveedores.jsp"> <i
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
			<i class="fas fa-plus-circle"></i> Nit del proveedor a eliminar
		</h2>
		
		<div class="container">		
		
			<div id="error" class="alert alert-danger visually-hidden"
					role="alert">Error al eliminar el proveedor,</div>
					
			<div id="no_encontrado" class="alert alert-danger visually-hidden"
					role="alert">proveedor no encontrado, verifique que este ingresando
					un numero de nit registrado</div>
					
			<div id="correcto" class="alert alert-success visually-hidden"
				role="alert">Proveedor Eliminado con exito</div>

			<form id="form1">
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">Nit del proveedor</span>
					 <input type="text" class="form-control"
						placeholder="Inserte nit aqui..."
						aria-describedby="basic-addon1" required id="proveedorsearch">
				</div>

			</form>

			<div class="container p-4">
				<div class="col text-center">
					
					<button type="button" class="btn btn-success" onclick="buscar()">
						<i class="fas fa-check"></i> Buscar proveedor
					</button>
		 			<button type="button" class="btn btn-danger" onclick="eliminar()">
						<i class="fas fa-check"></i> Eliminar proveedor
					</button>
	 			</div>
			</div>
			
			<div id="table" class="contenedor visually-hidden">
					
			<h2><i class="fas fa-list-ol"></i> Datos del proveedor a eliminar</h2>
			<div class="container">
				<div class="row">
					<!--  Aqui es donde se autogenera la tabla basado en el script -->
					<div class="col align-self-center" id="proveedorinfo">
					
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
				  		onclick="window.location.href='/insertarproveedores.jsp'">
					<i class="fas fa-plus-circle"></i> Agregar proveedor</button>
					<button type="button" class="btn btn-warning"
						onclick="window.location.href='/actualizarproveedores.jsp'">
					<i class="fas fa-pen-alt"></i> Actualizar proveedor</button>
					<button type="button" class="btn btn-dark"
						onclick="window.location.href='/buscarproveedores.jsp'">
					<i class="fas fa-search"></i> Buscar un proveedor</button>
					<button type="button" class="btn btn-primary"
						onclick="window.location.href='/listaproveedores.jsp'">
					<i class="fas fa-search"></i> Lista de proveedores</button>
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
		var nit_proveedor=   document.getElementById("proveedorsearch").value;
		req.open('GET', 'http://localhost:8080/consultarproveedores?nit_proveedor='+nit_proveedor, false);
		req.send(null);
		var proveedor = null;
			
			if (req.readyState === 4 && req.status === 200) {
				proveedores = JSON.parse(xmlhttp.responseText);
				console.log(JSON.parse(req.responseText));
				var main = "";
				for (i = 0; i < proveedores.length; i++) {
					
					console.log(proveedores[i].nit_proveedor);					
					
					if (proveedores[i].nit_proveedor ==nit_proveedor ) {
						console.log("si");
						var tbltop = "<table class='table  table-dark table-striped'><tr><th>Nit</th><th>Ciudad</th><th>Dirección</th><th>Nombre</th><th>Teléfono</th></tr>";
						var element = document.getElementById("tabla");
						element.classList.remove("visually-hidden");
						console.log(proveedores[i].nit_proveedor +" "+nit_proveedor);	
					
						main = "<tr><td>" + proveedores[i].nit_proveedor
							 + "</td><td>" + proveedores[i].ciudad_proveedor
							 + "</td><td>" + proveedores[i].direccion_proveedor
							 + "</td><td>" + proveedores[i].nombre_proveedor
							 + "</td><td>" + proveedores[i].telefono_proveedor + "</td></tr>";
					break;
					
					} else {
						console.log("proveedor no encontrado");
						var element = document.getElementById("no_encontrado");
						element.classList.remove("visually-hidden");
						document.getElementById("proveedorsearch").value = "";
						return;			
				}
				
				var tblbottom = "</table>";
				var tbl = tbltop + main + tblbottom;
				document.getElementById("proveedorinfo").innerHTML = tbl;
			}
				console.log("no encontrado");
				var element = document.getElementById("no_encontrado");
				element.classList.remove("visually-hidden");
				document.getElementById("proveedorsearch").value = "";
				return;
		} else{
			console.log("error al comunicar con la base de datos");
		};
		req.send();
	}
	
	function eliminar() {
		var y = document.getElementById("proveedorsearch").value;
		var req = new XMLHttpRequest();
		var coincidencia = false;
		req.open('GET', 'http://localhost:8080/listarproveedores', false);
		req.send(null);
		var proveedores = null;
		if (req.status == 200)
			proveedores = JSON.parse(req.responseText);
		console.log(JSON.parse(req.responseText));

		for (i = 0; i < proveedores.length; i++) {
			
			console.log(proveedores[i].nit_proveedor);
			if (proveedores[i].nit_proveedor == y) {
				console.log(proveedores[i].nit_proveedor + " " + y);
				coincidencia = true
				break;
			}
		}
		console.log(coincidencia);

		if (coincidencia != false) {
			var nit=document.getElementById("proveedorsearch").value;
			
			var xhr = new XMLHttpRequest();
			xhr.open("DELETE", "http://localhost:8080/eliminarproveedores?nit_proveedor="+nit);
			
			var element = document.getElementById("error");
			element.classList.add("visually-hidden");
			
			var element2 = document.getElementById("correcto");
			element2.classList.remove("visually-hidden");

			document.getElementById("proveedorsearch").value = "";
			xhr.send();

		} else {
			var element = document.getElementById("error");
			element.classList.remove("visually-hidden");
			
			var element2 = document.getElementById("correcto");
			element2.classList.add("visually-hidden");
			
			document.getElementById("proveedorsearch").value = "";;
		}
	}
</script>

</body>
</html>