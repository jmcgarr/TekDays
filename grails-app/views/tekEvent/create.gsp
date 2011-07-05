

<%@ page import="tekdays.TekEvent" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'tekEvent.label', default: 'TekEvent')}" />
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
            <g:hasErrors bean="${tekEventInstance}">
            <div class="errors">
                <g:renderErrors bean="${tekEventInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="tekEvent.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tekEventInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${tekEventInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="city"><g:message code="tekEvent.city.label" default="City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tekEventInstance, field: 'city', 'errors')}">
                                    <g:textField name="city" value="${tekEventInstance?.city}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="tekEvent.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tekEventInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" cols="40" rows="5" value="${tekEventInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="organizer"><g:message code="tekEvent.organizer.label" default="Organizer" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tekEventInstance, field: 'organizer', 'errors')}">
                                    <g:select name="organizer.id" from="${tekdays.TekUser.list()}" optionKey="id" value="${tekEventInstance?.organizer?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="venue"><g:message code="tekEvent.venue.label" default="Venue" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tekEventInstance, field: 'venue', 'errors')}">
                                    <g:textField name="venue" value="${tekEventInstance?.venue}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startDate"><g:message code="tekEvent.startDate.label" default="Start Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tekEventInstance, field: 'startDate', 'errors')}">
                                    <g:datePicker name="startDate" precision="day" value="${tekEventInstance?.startDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endDate"><g:message code="tekEvent.endDate.label" default="End Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tekEventInstance, field: 'endDate', 'errors')}">
                                    <g:datePicker name="endDate" precision="day" value="${tekEventInstance?.endDate}"  />
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
