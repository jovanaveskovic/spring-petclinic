<!DOCTYPE html>

<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="datatables" uri="http://github.com/dandelion/datatables"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>

<html lang="en">

<jsp:include page="../fragments/htmlHeader.jsp" />

<body>
	<petclinic:bodyHeader menuName="vets" />
	<div class="container-fluid">
		<div class="container xd-container">
			<h2>Veterinarians</h2>

			<div class="dataTables_filter">
				<spring:message code="list_size" var="list_size"
					text="Results" htmlEscape="false" />
				<c:out value="${list_size}" />
				<c:forEach var="i" begin="5" end="25" step="5">
					<c:choose>
						<c:when test="${size == i}">
							<c:out value="${i}" />
						</c:when>
						<c:otherwise>
							<spring:url value="" var="sizeUrl">
								<spring:param name="page" value="0" />
								<spring:param name="size" value="${i}" />
							</spring:url>
							<a href="${sizeUrl}">${i}</a>
						</c:otherwise>
					</c:choose>
					<c:out value=" " />
				</c:forEach>
			</div>
			<datatables:table id="vets" data="${vets.content}" row="vet"
				cssClass="table table-striped" pageable="false" info="false">
				<datatables:column title="Name">
					<c:out value="${vet.firstName} ${vet.lastName}" />
				</datatables:column>
				<datatables:column title="Specialties">
					<c:forEach var="specialty" items="${vet.specialties}">
						<c:out value="${specialty.name}" />
					</c:forEach>
					<c:if test="${vet.nrOfSpecialties == 0}">none</c:if>
				</datatables:column>
			</datatables:table>
			<div class="form-group">
				<div class="col-sm-12">
					<petclinic:pagination vetPage="${vets}">
					</petclinic:pagination>
				</div>
			</div>

			<table class="table-buttons">
				<tr>
					<td><a
						href="<spring:url value="/vets.xml" htmlEscape="true" />">View as XML</a></td>
					<td><a
						href="<spring:url value="/vets.json" htmlEscape="true" />">View as JSON</a></td>
				</tr>
			</table>
			<petclinic:pivotal />
		</div>
	</div>
	<jsp:include page="../fragments/footer.jsp" />
	
</body>

</html>
