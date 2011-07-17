<h3>Enter Custom Content for Event Show Page</h3>
<g:form name="blurbForm" action="updateBlurb" id="${blurb?.id}">
	<textarea name="content" cols="60" rows="3" style="width:100%; height:6-px">${blurb?.content}</textarea>
	<br/>
	<input type="hidden" name="eventId" value="${event?.id}" />
	<input type="submit" value="Update Content" />
</g:form>