<h3>Volunteers</h3>
<table>


	<thead>
		<tr>
			<th>Name</th>
			<th>Email Address</th>
			<th>Web Site</th>
		</tr>
	</thead>
	
	
	<g:each in="${volunteers}" var="volunteer">
		<tr>
			<td>
				<g:link controller="tekUser" action="show" id="${volunteer.id}">
					${volunteer.fullName}
				</g:link>
			</td>
			<td><a href="mailto:${volunteer.email}">${volunteer.email}</a></td>
			<td><a href="http://${volunteer.website}">${volunteer.website}</a></td>
		</tr>
	</g:each>
	
	
</table>