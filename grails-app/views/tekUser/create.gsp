

<%@ page import="tekdays.TekUser" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'tekUser.label', default: 'TekUser')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${tekUserInstance}">
            <div class="errors">
                <g:renderErrors bean="${tekUserInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fullName"><g:message code="tekUser.fullName.label" default="Full Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tekUserInstance, field: 'fullName', 'errors')}">
                                    <g:textField name="fullName" value="${tekUserInstance?.fullName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="userName"><g:message code="tekUser.userName.label" default="User Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tekUserInstance, field: 'userName', 'errors')}">
                                    <g:textField name="userName" value="${tekUserInstance?.userName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="tekUser.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tekUserInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${tekUserInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="website"><g:message code="tekUser.website.label" default="Website" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tekUserInstance, field: 'website', 'errors')}">
                                    <g:textField name="website" value="${tekUserInstance?.website}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="bio"><g:message code="tekUser.bio.label" default="Bio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tekUserInstance, field: 'bio', 'errors')}">
                                    <g:textArea name="bio" cols="40" rows="5" value="${tekUserInstance?.bio}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password"><g:message code="tekUser.password.label" default="Password" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tekUserInstance, field: 'password', 'errors')}">
                                    <g:textField name="password" value="${tekUserInstance?.password}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
