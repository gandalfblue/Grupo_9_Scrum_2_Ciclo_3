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
<title>Lista de usuarios</title>
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
    // Simple-DataTables
    // https://github.com/fiduswriter/Simple-DataTables/wiki
	let table=null;
    if (datatablesusers) {
        table=new simpleDatatables.DataTable("#datatablesusers", {
            searchable: true,
            labels: {
                placeholder: "Buscar...",
                perPage: "{select} registros por pagina",
                noRows: "No hay registros",
                info: "Mostrando {start} a {end} de {rows} registros",
            }, 
            
        });
        
    }
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.open("GET", "http://localhost:8080/listarusuarios", true);
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

				var usuarios = JSON.parse(xmlhttp.responseText);

				for (i = 0; i < usuarios.length; i++) {
					let fila = [
						usuarios[i].cedula_usuario.toString(), 
						usuarios[i].email_usuario, 
						usuarios[i].nombre_usuario, 
						usuarios[i].password, 
						usuarios[i].usuario
					];

				    table.rows().add(fila);
				}
			}
		};
		
		xmlhttp.send();
});
</script>
</head>

<body>
	
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
			<a class="navbar-brand links" href="reportes.jsp">
			<i class="fas fa-clipboard-list"></i> Reportes</a>
		</div>
	</nav>	
	<div class="container p-4">
				<div class="col text-center">
				<img src="Coffee shop-rafiki.png" id="corner_usuarios">
				
				  	<button type="button" class="btn btn-success" 
				  		onclick="window.location.href='/insertarusuario.jsp'">
					<i class="fas fa-plus-circle"></i> Insertar usuario</button>
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
					<i class="fas fa-list-ol"></i> Lista de usuarios</button>				
				</div>
			</div>

	<br>
	<br>
	
		<div class="header">
			<h1 style="color:blue; "><i class="fas fa-list-ol fa-1x"></i> Lista de usuarios</h1>
		</div>
	<br>
	<br>
		<div class="row justify-content-center">
					<div class="col-xl-8">
						<div class="card m-4">
							<div class="card-header text-white bg-dark">
								<i class="fas fa-table"></i> Lista de usuarios
							</div>
							<div class="card-body">
								<table id="datatablesusers" data-page-length='5'>
									<thead>
										<tr>
											<th>Cedula</th>
											<th>Email</th>
											<th>Nombre</th>
											<th>Password</th>
											<th>Usuario</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>Cedula</th>
											<th>Email</th>
											<th>Nombre</th>
											<th>Password</th>
											<th>Usuario</th>
										</tr>
									</tfoot>
									<tbody id="usuariosinfo">

									</tbody>
								</table>
							</div>
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