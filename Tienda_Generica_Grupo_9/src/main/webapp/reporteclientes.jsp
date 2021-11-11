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
<title>Reporte de clientes</title>
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

<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />

<script>

window.addEventListener('DOMContentLoaded', event => {
	let table=null;
    if (datatablesusers) {
        table=new simpleDatatables.DataTable("#datatablesusers", {
            searchable: true,
            labels: {
                placeholder: "Buscar...",
                perPage: "{select} registros por pagina",
                noRows: "No hay registros",
                info: "Mostrando {start} a {end} de {rows} registros",
            }
        });
    }
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.open("GET", "http://localhost:8080/listarclientes", true);
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

				var clientes = JSON.parse(xmlhttp.responseText);
				for (i = 0; i < clientes.length; i++) {
					let fila = [
						clientes[i].cedula_cliente.toString(),
						clientes[i].direccion_cliente,
						clientes[i].email_cliente, 
						clientes[i].nombre_cliente, 
						clientes[i].telefono_cliente
					];

				    table.rows().add(fila);
				}
			}
		};
		
		xmlhttp.send();
});
</script>

</head>

<body id="body_reportes">

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
	
	<br>

	<br>
	<br>
	
		<div class="row">
					<div class="col-xl-8">
						<div class="card m-4">
							<div class="card-header text-white bg-dark">
								<i class="fas fa-table"></i> Tabla de clientes
							</div>
							<div class="card-body">
								<table id="datatablesusers" data-page-length='5'>
									<thead>
										<tr>
											<th>Cedula</th>
											<th>Direccion</th>
											<th>Email</th>
											<th>Nombre</th>
											<th>Telefono</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>Cedula</th>
											<th>Direccion</th>
											<th>Email</th>
											<th>Nombre</th>
											<th>Telefono</th>
										</tr>
									</tfoot>
									<tbody id="clientesinfo">

									</tbody>
								</table>
							</div>
						</div>
					</div>
					
					<div class="col-xl">
						<div class="container p-3">
							<div class="col text-center">
								<ul class="list-group" style="list-style-type:none;">
				  	
									<li><button type="button" class="btn btn-primary btn-lg" 
				  						onclick="window.location.href='/reporteusuario.jsp'">
										<i class="fas fa-users"></i> Lstado de usuarios</button></li>
									<li><button type="button" class="btn btn-info btn-lg"
										onclick="window.location.href='/reporteventas.jsp'">
									<i class="fas fa-money-check-alt"></i> Ventas por cliente</button></li>
								</ul>
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

<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
crossorigin="anonymous"></script>

</body>
</html>