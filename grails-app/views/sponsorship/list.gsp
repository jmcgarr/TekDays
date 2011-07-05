
<%@ page import="tekdays.Sponsorship" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'sponsorship.label', default: 'Sponsorship')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'sponsorship.id.label', default: 'Id')}" />
                        
                            <th><g:message code="sponsorship.event.label" default="Event" /></th>
                        
                            <th><g:message code="sponsorship.sponsor.label" default="Sponsor" /></th>
                        
                            <g:sortableColumn property="contributionType" title="${message(code: 'sponsorship.contributionType.label', default: 'Contribution Type')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'sponsorship.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="notes" title="${message(code: 'sponsorship.notes.label', default: 'Notes')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${sponsorshipInstanceList}" status="i" var="sponsorshipInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${sponsorshipInstance.id}">${fieldValue(bean: sponsorshipInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: sponsorshipInstance, field: "event")}</td>
                        
                            <td>${fieldValue(bean: sponsorshipInstance, field: "sponsor")}</td>
                        
                            <td>${fieldValue(bean: sponsorshipInstance, field: "contributionType")}</td>
                        
                            <td>${fieldValue(bean: sponsorshipInstance, field: "description")}</td>
                        
                            <td>${fieldValue(bean: sponsorshipInstance, field: "notes")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${sponsorshipInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
