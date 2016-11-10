<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container PaddingTop_10" ng-controller="usersController">

	<div ng-app="userApp" ng-cloak>

		<div id="gridContainer"
			ng-class="{'': state == 'list', 'none': state != 'list'}">
			<table class="table table-bordered table-striped">
				<thead>
					<tr>
						<th scope="col"><spring:message code="NAME" /></th>
						<th scope="col"><spring:message code="SURNAME" /></th>
						<th scope="col"><spring:message code="PHONE NUMBER" /></th>
						<th scope="col"><spring:message code="ACTION" /></th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<tr ng-repeat="user in users">
						<td class="tdContactsCentered">{{user.name}}</td>
						<td class="tdContactsCentered">{{user.surname}}</td>
						<td class="tdContactsCentered">{{user.phone_number | tel}}</td>
						<td class="width15">			
							<div class="text-center">
								<input type="hidden" value="{{user.id}}" /> 							
								
								<button type="button"
									title="<spring:message code="update"/>&nbsp;<spring:message code="user"/>"
									class="btn btn-inverse" data-toggle="modal"
									data-target="#updateUsersModal"
									ng-click="selectUser(user.id)">
									<i class="glyphicon glyphicon-pencil"></i>
								</button>															
								
								<button type="button"
									title="<spring:message code="delete"/>&nbsp;<spring:message code="user"/>"
									class="btn btn-inverse" data-toggle="modal"
									data-target="#deleteUsersModal"
									ng-click="selectUser(user.id)">
									<i class="glyphicon glyphicon-minus"></i>
								</button>
							</div>
																
							
						</td>
					</tr>
				</tbody>
			</table>

		</div>
		<br /> 
		
		<button type="button"
			title="<spring:message code="create"/>&nbsp;<spring:message code="user"/>"
			class="btn btn-default" data-toggle="modal"
			data-target="#createUsersModal"
			ng-click="resetUser();">
			<i class="glyphicon glyphicon-user"></i> Create User
		</button>

		<jsp:include page="dialogs/usersDialogs.jsp" />

	</div>
</div>

<script src="<c:url value="/resources/js/pages/users.js" />"></script>
