
<%@ page import="com.lungelo.minicms.Content" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'content.label', default: 'Content')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-content" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-content" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="appName" title="${message(code: 'content.appName.label', default: 'App Name')}" />
					
						<g:sortableColumn property="title" title="${message(code: 'content.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'content.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="displayLocation" title="${message(code: 'content.displayLocation.label', default: 'Display Location')}" />
					
						<g:sortableColumn property="displayStatus" title="${message(code: 'content.displayStatus.label', default: 'Display Status')}" />
					
						<g:sortableColumn property="attachmentAbility" title="${message(code: 'content.attachmentAbility.label', default: 'Attachment Ability')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${contentInstanceList}" status="i" var="contentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${contentInstance.id}">${fieldValue(bean: contentInstance, field: "appName")}</g:link></td>
					
						<td>${fieldValue(bean: contentInstance, field: "title")}</td>
					
						<td>${fieldValue(bean: contentInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: contentInstance, field: "displayLocation")}</td>
					
						<td><g:formatBoolean boolean="${contentInstance.displayStatus}" /></td>
					
						<td><g:formatBoolean boolean="${contentInstance.attachmentAbility}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${contentInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
