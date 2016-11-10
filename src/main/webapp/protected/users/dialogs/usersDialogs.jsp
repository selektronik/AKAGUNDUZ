<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div id="deleteUsersModal" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Delete User</h4>
      </div>
      <div class="modal-body">
            <div class="modal-body">
        <form name="deleteUserForm" novalidate>
            <p><spring:message code="delete.confirm"/>:&nbsp;{{selectedUserName}}?</p>

            <input type="submit"
                   class="btn btn-primary"
                   ng-click="deleteUser();"
                   value='<spring:message code="delete"/>'/>
            <button class="btn btn-default"
                    data-dismiss="modal"
                    ng-click="exit('#deleteUsersModal');"
                    aria-hidden="true">
                <spring:message code="cancel"/>
            </button>
        </form>
    </div>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




<!-- Modal -->
<div class="modal fade" id="createUsersModal" tabindex="-1" role="dialog" aria-labelledby="createUsersModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Create User</h4>
      </div>
      <div class="modal-body">
         <form name="newUserForm" novalidate >
            <div class="">
                <div>
                    <div class="col-lg-3 col-md-3">
                        <label><spring:message code="users.name"/>:</label>
                    </div>
                    <div class="col-lg-5 col-md-5">
                        <input type="text"
                               required
                               autofocus
                               ng-model="user.name"
                               name="name"
                               placeholder=""/>
                    </div>
                    <div class="col-lg-4 col-md-4">
                        <label>
                                <span class="alert alert-danger"
                                      ng-show="displayValidationError && newUserForm.name.$error.required">
                                        <spring:message code="required"/>
                                </span>
                        </label>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <br/>
                <div>
                    <div class="col-lg-3 col-md-3">
                        <label><spring:message code="users.surname"/>:</label>
                    </div>
                    <div class="col-lg-5 col-md-5">
                        <input type="text"
                               required
                               ng-model="user.surname"
                               name="surname"
                               placeholder=""/>
                    </div>
                    <div class="col-lg-4 col-md-4">
                        <label>
                                <span class="alert alert-danger"
                                      ng-show="displayValidationError && newUserForm.surname.$error.required">
                                    <spring:message code="required"/>
                                </span>
                        </label>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <br/> 
                
                <div>
                    <div class="col-lg-3 col-md-3">
                        <label><spring:message code="users.phone_number"/>:</label>
                    </div>
                    <div class="col-lg-5 col-md-5">
                         <input type='text' phone-input ng-model="user.phone_number" name="phone_number" />
                    </div> 
                    <div class="col-lg-4 col-md-4">
                        <label>
                                <span class="alert alert-danger"
                                      ng-show="displayValidationError && newUserForm.phone_number.$error.required">
                                    <spring:message code="required"/>
                                </span>
                        </label>
                    </div>
                    <div  class="clearfix"></div>
                </div>
                 <br/> 
                
                
                <div>
                   
                    <div  class="col-lg-8 col-md-8" >                    
                         <simple-captcha valid="captchaValid"></simple-captcha>
                    </div> 
                    
                    <div class="clearfix"></div>
                </div>
                
            </div>
        </form>
        <div class="clearfix"></div>
      </div>
      <div class="modal-footer">
        <input type="submit"class="btn btn-primary" ng-click="createUser(newUserForm);" value='<spring:message code="create"/>'/>
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>        
      </div>
    </div>
  </div>
</div>


<!-- Modal -->
<div class="modal fade" id="updateUsersModal" tabindex="-1" role="dialog" aria-labelledby="updateUsersModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Update User</h4>
      </div>
      <div class="modal-body">
         <form name="updateUserForm" novalidate >
            <div class="">
                <div>
                     <div class="col-lg-3 col-md-3">
                        <label><spring:message code="users.name"/>:</label>
                    </div>
                     <div class="col-lg-5 col-md-5">
                        <input type="text"
                               required
                               autofocus
                               ng-model="user.name"
                               name="name"
                               placeholder=""/>
                    </div>
                   <div class="col-lg-4 col-md-4">
                        <label>
                                <span class="alert alert-danger"
                                      ng-show="displayValidationError && updateUserForm.name.$error.required">
                                        <spring:message code="required"/>
                                </span>
                        </label>
                        </div>
                        <div class="clearfix"></div>
                                       
                  </div>
                   <br/>
                 
                <div>
                     <div class="col-lg-3 col-md-3">
                        <label><spring:message code="users.surname"/>:</label>
                    </div>
                    <div class="col-lg-5 col-md-5">
                        <input type="text"
                               required
                               ng-model="user.surname"
                               name="surname"
                               placeholder=""/>
                    </div>
                     <div class="col-lg-4 col-md-4">
                        <label>
                                <span class="alert alert-danger"
                                      ng-show="displayValidationError && updateUserForm.surname.$error.required">
                                    <spring:message code="required"/>
                                </span>
                        </label>
                        </div>
                          <div class="clearfix"></div>
                    </div>
                   
                     
                      <br/>
                
                <div>                               
                    <div class="col-lg-3 col-md-3">
                        <label><spring:message code="users.phone_number"/>:</label>
                    </div>
                   <div class="col-lg-5 col-md-5">
                        <input type="text"
                                phone-input
                               ng-model="user.phone_number"
                               name="phone_number"
                               placeholder=""/>
                    </div> 
                     <div class="col-lg-4 col-md-4">
                        <label>
                                <span class="alert alert-danger"
                                      ng-show="displayValidationError && updateUserForm.phoneNumber.$error.required">
                                    <spring:message code="required"/>
                                </span>
                        </label>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div>
                   
                    <div class="col-lg-5 col-md-5">
                         <simple-captcha valid="captchaValid"></simple-captcha>
                    </div> 
                    
                    <div class="clearfix"></div>
                </div>
                 
            </div>
        
        </form>
       
        <div class="clearfix"></div>    
      </div>
      <div class="modal-footer">
        <input type="submit"class="btn btn-primary" ng-click="updateUser(updateUserForm);" value='<spring:message code="update"/>'/>
        <button type="button" class="btn btn-default" ng-click="resetUser();" data-dismiss="modal">Cancel</button>        
      </div>
      
    </div>
  </div>
</div>

<script src="<c:url value="/resources/js/pages/captcha.js" />"></script>




