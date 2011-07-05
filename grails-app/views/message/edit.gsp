

<%@ page import="tekdays.Message" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'message.label', default: 'Message')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${messageInstance}">
            <div class="errors">
                <g:renderErrors bean="${messageInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${messageInstance?.id}" />
                <g:hiddenField name="version" value="${messageInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="subject"><g:message code="message.subject.label" default="Subject" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: messageInstance, field: 'subject', 'errors')}">
                                    <g:textField name="subject" value="${messageInstance?.subject}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="content"><g:message code="message.content.label" default="Content" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: messageInstance, field: 'content', 'errors')}">
                                    <g:textArea name="content" cols="40" rows="5" value="${messageInstance?.content}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="parent"><g:message code="message.parent.label" default="Parent" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: messageInstance, field: 'parent', 'errors')}">
                                    <g:select name="parent.id" from="${tekdays.Message.list()}" optionKey="id" value="${messageInstance?.parent?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="author"><g:message code="message.author.label" default="Author" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: messageInstance, field: 'author', 'errors')}">
                                    <g:select name="author.id" from="${tekdays.TekUser.list()}" optionKey="id" value="${messageInstance?.author?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="event"><g:message code="message.event.label" default="Event" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: messageInstance, field: 'event', 'errors')}">
                                    <g:select name="event.id" from="${tekdays.TekEvent.list()}" optionKey="id" value="${messageInstance?.event?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
