
<%@ page import="tekdays.TekUser" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'tekUser.label', default: 'TekUser')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'tekUser.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="fullName" title="${message(code: 'tekUser.fullName.label', default: 'Full Name')}" />
                        
                            <g:sortableColumn property="userName" title="${message(code: 'tekUser.userName.label', default: 'User Name')}" />
                        
                            <g:sortableColumn property="email" title="${message(code: 'tekUser.email.label', default: 'Email')}" />
                        
                            <g:sortableColumn property="website" title="${message(code: 'tekUser.website.label', default: 'Website')}" />
                        
                            <g:sortableColumn property="bio" title="${message(code: 'tekUser.bio.label', default: 'Bio')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${tekUserInstanceList}" status="i" var="tekUserInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${tekUserInstance.id}">${fieldValue(bean: tekUserInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: tekUserInstance, field: "fullName")}</td>
                        
                            <td>${fieldValue(bean: tekUserInstance, field: "userName")}</td>
                        
                            <td>${fieldValue(bean: tekUserInstance, field: "email")}</td>
                        
                            <td>${fieldValue(bean: tekUserInstance, field: "website")}</td>
                        
                            <td>${fieldValue(bean: tekUserInstance, field: "bio")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${tekUserInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
