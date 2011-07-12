<h3>Things to Do</h3>
<table>
	
	
	<thead>
		<tr>
			<th>Task Title</th>
			<th>Due Date</th>
			<th>Assigned To</th>
		</tr>
	</thead>
	
	
	<g:each in="${tasks}" var="task">
		<tr>
			<td>${task.title}</td>
			<td><g:formatDate format="MMM/dd/yyy" date="${task.dueDate}"/></td>
			<td>${task.assignedTo}</td>
		</tr>
	</g:each>
	
	
	<g:link controller="task" action="list" id="${event.id}">
		View all ${event.tasks.size()} tasks for this event.
	</g:link>
	
	
</table>