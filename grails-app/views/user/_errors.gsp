<g:hasErrors bean="${flash.errors}">
   
      <g:eachError bean="${flash.errors}" var="error">
        <li
          <g:if test="${error in org.springframework.validation.FieldError}"></g:if>><g:message error="${error}" /></li>
      </g:eachError>
   
</g:hasErrors>