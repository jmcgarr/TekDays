<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Messages</title>
        <g:javascript library="prototype"/>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton">
            	<a class="home" href="${createLink(uri: '/')}">Home</a>
           	</span>
            <span class="menuButton">
            	<g:link class="create" action="create" params='["event.id":"${event?.id}"]'>New Message</g:link>
           	</span>
        </div>
        <div class="body">
        	<h1>${event?.name} - Forum Messages</h1>
        	<div id="messageList">
        		<g:each in="${messageInstanceList}" var="messageInstance">
        			<g:remoteLink action="showDetail" id="${messageInstance?.id}" update="details">
        				${messageInstance.author.fullName} - ${messageInstance.subject} <br/>
        			</g:remoteLink>
        		</g:each>
        	</div>
        	<h3>Message Details</h3>
        	<div id="details">
        	</div>
        </div>
    </body>
</html>
