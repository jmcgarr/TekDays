
<%@ page import="tekdays.Message" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'message.label', default: 'Message')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'message.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="subject" title="${message(code: 'message.subject.label', default: 'Subject')}" />
                        
                            <g:sortableColumn property="content" title="${message(code: 'message.content.label', default: 'Content')}" />
                        
                            <th><g:message code="message.parent.label" default="Parent" /></th>
                        
                            <th><g:message code="message.author.label" default="Author" /></th>
                        
                            <th><g:message code="message.event.label" default="Event" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${messageInstanceList}" status="i" var="messageInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${messageInstance.id}">${fieldValue(bean: messageInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: messageInstance, field: "subject")}</td>
                        
                            <td>${fieldValue(bean: messageInstance, field: "content")}</td>
                        
                            <td>${fieldValue(bean: messageInstance, field: "parent")}</td>
                        
                            <td>${fieldValue(bean: messageInstance, field: "author")}</td>
                        
                            <td>${fieldValue(bean: messageInstance, field: "event")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${messageInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
