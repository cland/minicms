<%@ page import="com.lungelo.minicms.Content" %>



<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'appName', 'error')} required">
	<label for="appName">
		<g:message code="content.appName.label" default="App Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="appName" required="" value="${contentInstance?.appName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="content.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${contentInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="content.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${contentInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'displayLocation', 'error')} required">
	<label for="displayLocation">
		<g:message code="content.displayLocation.label" default="Display Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="displayLocation" required="" value="${contentInstance?.displayLocation}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'displayStatus', 'error')} ">
	<label for="displayStatus">
		<g:message code="content.displayStatus.label" default="Display Status" />
		
	</label>
	<g:checkBox name="displayStatus" value="${contentInstance?.displayStatus}" />

</div>

<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'attachmentAbility', 'error')} ">
	<label for="attachmentAbility">
		<g:message code="content.attachmentAbility.label" default="Attachment Ability" />
		
	</label>
	<g:checkBox name="attachmentAbility" value="${contentInstance?.attachmentAbility}" />

</div>

<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'body', 'error')} required">
	<label for="body">
		<g:message code="content.body.label" default="Please enter content below" />
		<span class="required-indicator">*</span>
	</label>
	<%--g:textField name="body" required="" value="${contentInstance?.body}"/--%>
	<ckeditor:editor name="body" height="400px" width="90%">
		${contentInstance?.body }
	</ckeditor:editor>
</div>

<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'picture', 'error')} ">
	<label for="pictures">
		<g:message default="pictures" />
	</label>
	<input type="file" name="pictures"/>

</div>

