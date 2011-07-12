<h3>Forum Messages</h3>
<table>

	<thead>
		<tr>
			<th>Author</th>
			<th>Subject</th>
			<th>Content</th>
		</tr>
	</thead>
	
	
	<g:each in="${messages}" var="msg">
		<tr>
			<td>
				<g:link controller="tekUser" action="show" id="${msg.author.id}">
					${msg.author}
				</g:link>
			</td>
			<td>${msg.subject}</td>
			<td>
				${msg.content[0..Math.min(msg.content.size() -1, 24)] }
				${msg.content.size() > 25 ? '...'  : '' }
			</td>
		</tr>
	</g:each>
	
	
	<g:link controller="messgae" action="list" id="${event.id}">
		View threaded messages for this event.
	</g:link>
	

</table>