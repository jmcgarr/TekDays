<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="layout" content="main" />
		<title>Tek Event Search Results</title> 
	</head>
	<body>
	
	
		<div class="body">
			<h1>Search Results</h1>
			<ul>
				<g:if test="${events}">
					<g:each in="${events}" var="event">
						<li>
							<g:link action="show" id="${event.id}">${event}</g:link>
						</li>
					</g:each>
				</g:if>
				<g:else>
					<h3>No Matching Results Found</h3>
				</g:else>
			</ul>			
		</div>
	
	
	</body>
</html>