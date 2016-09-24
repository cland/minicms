
<%@ page import="com.lungelo.minicms.Content" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'content.label', default: 'Content')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-content" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-content" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list content">
			
				<g:if test="${contentInstance?.appName}">
				<li class="fieldcontain">
					<span id="appName-label" class="property-label"><g:message code="content.appName.label" default="App Name" /></span>
					
						<span class="property-value" aria-labelledby="appName-label"><g:fieldValue bean="${contentInstance}" field="appName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contentInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="content.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${contentInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contentInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="content.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${contentInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contentInstance?.displayLocation}">
				<li class="fieldcontain">
					<span id="displayLocation-label" class="property-label"><g:message code="content.displayLocation.label" default="Display Location" /></span>
					
						<span class="property-value" aria-labelledby="displayLocation-label"><g:fieldValue bean="${contentInstance}" field="displayLocation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contentInstance?.displayStatus}">
				<li class="fieldcontain">
					<span id="displayStatus-label" class="property-label"><g:message code="content.displayStatus.label" default="Display Status" /></span>
					
						<span class="property-value" aria-labelledby="displayStatus-label"><g:formatBoolean boolean="${contentInstance?.displayStatus}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${contentInstance?.attachmentAbility}">
				<li class="fieldcontain">
					<span id="attachmentAbility-label" class="property-label"><g:message code="content.attachmentAbility.label" default="Attachment Ability" /></span>
					
						<span class="property-value" aria-labelledby="attachmentAbility-label"><g:formatBoolean boolean="${contentInstance?.attachmentAbility}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${contentInstance?.body}">
				<li class="fieldcontain">
					<span id="body-label" class="property-label"><g:message code="content.body.label" default="Body" /></span>
					
						<span class="property-value" aria-labelledby="body-label"><g:fieldValue bean="${contentInstance}" field="body"/></span>
					
				</li>
				</g:if>
				<%--g:if test="${contentInstance }">
				<attachments:each bean="${contentInstance}">
						<img src="${request.contextPath}/attachmentable/show/${contentInstance?.attachment?.id }" style="width:50px;vertical-align:top;"/><br/>		
						
					</attachments:each>
				</g:if --%>
			
			</ol>
			<g:form url="[resource:contentInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${contentInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
