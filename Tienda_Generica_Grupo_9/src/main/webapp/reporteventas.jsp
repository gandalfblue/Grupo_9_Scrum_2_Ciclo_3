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
<title>Reporte de ventas</title>
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
		
		<div style="padding-left: 5px">
			<div class="container">
				<div id="error" class="alert alert-danger visually-hidden"
					role="alert">Error al buscar el cliente, el cliente no existe</div>
	
				<div id="correcto" class="alert alert-success visually-hidden"
					role="alert">Cliente encontrado con exito</div>
			</div>
		</div>
				<br>
				<br>
	
		<div class="row">
					<div class="col-xl-8">
						<div class="card m-4">
							<div class="card-header text-white bg-dark">
								<i class="fas fa-table"></i> Tabla de relacion de cliente con ventas
							</div>
							<div class="card-body">
								<table id="datatablesusers">
									<thead>
										<tr> 
											<div class="col-6">
			
												<div class="input-group mb-3 input-group-sm">    												
    												<span class="input-group-text" id="basic-addon1">Cedula cliente</span>
													<input type="text" placeholder="Inserte la cedula aqui y presione enter"
													class="form-control" id="cedula_cliente" onkeypress="if (event.keyCode == 13) traerCliente()">
												</div>
											</div>
										<tr>
											<th>Cedula del cliente</th>
											<th>Nombre del cliente</th>
											<th>Valor venta</th>											
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>Cedula del cliente</th>
											<th>Nombre del cliente</th>
											<th>Valor venta</th>
										</tr>
									</tfoot>
									<tbody id="usuariosinfo">

									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
					
					<div class="col-xl">
						<div class="container p-3">
							<div class="col text-center">
								<ul class="list-group" style="list-style-type:none;">
				  	
									<li><button type="button" class="btn btn-secondary btn-lg"
										onclick="window.location.href='/reporteclientes.jsp'">
									<i class="fas fa-address-book"></i> Listado de clientes</button></li>
									<li><button type="button" class="btn btn-info btn-lg"
										onclick="window.location.href='/reporteventas.jsp'">
									<i class="fas fa-money-check-alt"></i> Ventas por cliente</button></li>
								</ul>
							</div>
						</div>
					</div>
				
				
	<nav class="navbar fixed-bottom navbar-dark bg-dark">
		<div class="row justify-content-between">
			<div class="col-4">
				<a class="navbar-brand links" href="#"><i class="fas fa-code"></i>
					Diseñado y programado por Carol Martinez, Claudia Gonzalez, David Muñoz, Andrés Lozada <i
					class="fas fa-code-branch"></i></a>
			</div>
		</div>
	</nav>	

<script>

	window.addEventListener('DOMContentLoaded', event => {
	let table=null;
    if (datatablesusers) {
        table=new simpleDatatables.DataTable("#datatablesusers", {
            searchable: false,
            perPageSelect: false,
            
            labels: {
                placeholder: "Buscar cedula...",
                perPage: "{select} registros por pagina",
                noRows: "No hay registros",
                info: "Mostrando {start} a {end} de {rows} registros",                
            },             
        });        
    }    
});
	
	function traerCliente() {		

    	var cliente= document.getElementById("cedula_cliente").value;
    	let table=true;
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.open("GET", "http://localhost:8080/consultarventa?cedula_cliente=" + cliente,false);
		xmlhttp.addEventListener("load", function(e) {
			
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

				var venta_cliente = JSON.parse(xmlhttp.responseText);
				console.log(venta_cliente)				
				var element = document.getElementById("error");
				element.classList.add("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.remove("visually-hidden");
				
				if (venta_cliente.toString() != "") {
					for (i = 0; i < venta_cliente.length; i++) {
						let fila = [
							venta_cliente[i].cedula_cliente.toString(), 
							venta_cliente[i].nombre_cliente.toString(), 
							venta_cliente[i].valor_venta.toString()							
						];
												
						table.insert(fila);
					}				
				}else {
					var element = document.getElementById("error");
					element.classList.remove("visually-hidden");
					var element2 = document.getElementById("correcto");
					document.getElementById("cedula_cliente").value = "";					
				}
			}
		});
		
		xmlhttp.send();		
	}
</script>

<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
crossorigin="anonymous"></script>

</body>
</html>