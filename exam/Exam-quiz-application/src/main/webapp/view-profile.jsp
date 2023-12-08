<jsp:include page="includes/header.jsp" />

	

    <!-- Page Content -->
    <div class="page-heading contact-heading header-text">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="text-content">
              <h4>Update Profile</h4>
            </div>
          </div>
        </div>
      </div>
    </div>


    

   <div class="send-message mb-5">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="section-heading">
              <h2>Signup</h2>
            </div>
          </div>
          <div class="col-md-8">
            <div class="contact-form">
              <form id="contact" action="updateProfile" method="post">
                <div class="row">
                  <div class="col-lg-12 col-md-12 col-sm-12">
                    <fieldset>
                      <input type="text" id="firstName" name="firstName" value="${user.firstName}" class="form-control" required/>
                    </fieldset>
                  </div>
                  <div class="col-lg-12 col-md-12 col-sm-12">
                    <fieldset>
                      <input type="text" id="lastName" name="lastName" value="${user.lastName}"  class="form-control" required/>
                    </fieldset>
                  </div>
                  <div class="col-lg-12 col-md-12 col-sm-12">
                    <fieldset>
                      <input type="text" id="emailId" name="emailId" value="${user.emailId}" class="form-control" required/>
                    </fieldset>
                  </div>
                  <div class="col-lg-12 col-md-12 col-sm-12">
                    <fieldset>
                      <input type="text" id="mobileNumber" name="mobileNumber" value="${user.mobileNumber}" class="form-control" required/>
                    </fieldset>
                  </div>
                  <div class="col-lg-12">
                    <fieldset>
                      <button type="submit" id="form-submit" class="filled-button">Update Profile</button>
                    </fieldset>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
<jsp:include page="includes/footer.jsp" />