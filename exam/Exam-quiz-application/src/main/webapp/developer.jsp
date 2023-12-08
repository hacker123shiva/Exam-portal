<style>
  /* Add some styles to hide details initially */
    .person-details {
      display: none;
</style>
 
<div class="container marketing my-4">
 
<h1 class="display-4 text-center mb-4">About Team</h1>
<hr class="featurette-divider">
  <div class="row justify-content-center mt-4">
  
     <div class="col-lg-4 d-flex flex-column align-items-center">
      <img class="rounded-circle" src="assets/images/shiva.jpeg" alt="Generic placeholder image" width="140" height="140">
      <h2>Shiva Srivastava</h2>
      <p class="text-center">Worked on Backend and Cloud in this project.</p>
      <!-- Add a button with a unique ID to trigger the details toggle -->
      <p><a class="btn btn-secondary" href="#details1" role="button" onclick="toggleDetails('details1')">View details »</a></p>
      <!-- Details container with a unique ID -->
       
      <div id="details1" class="person-details mt-3 p-3 border rounded">
  <h4> Details about this person:</h4>
  <hr>

  <div class="row">
    <div class="col-md-6">
      <p><strong>Skills:</strong> Java, Servlet, JSP, AWS, MySql</p>
    </div>
    <div class="col-md-6">
      <p><strong>Email:</strong> shiva@gmail.com</p>
      <p><strong>Contribution:</strong> Active contributor to this project</p>
    </div>
  </div>
</div>
      
    </div><!-- /.col-lg-4 -->
       <div class="col-lg-4 d-flex flex-column align-items-center">
      <img class="rounded-circle" src="assets/images/musk.jpg" alt="Generic placeholder image" width="140" height="140">
      <h2>Muskan Garg</h2>
      <p class="text-center"> Worked on Backend and Database in this project.</p>
      <!-- Add a button with a unique ID to trigger the details toggle -->
      <p><a class="btn btn-secondary" href="#details2" role="button" onclick="toggleDetails('details2')">View details »</a></p>
      <!-- Details container with a unique ID -->
       
      <div id="details2" class="person-details mt-3 p-3 border rounded">
  <h4>Details about this person:</h4>
  <hr>

  <div class="row">
    <div class="col-md-6">
      <p><strong>Skills:</strong>Java, Servlet, JSP, MySql</p>
    </div>
    <div class="col-md-6">
      <p ><strong>Email:</strong>muskan@gmail.com/p>
      <p><strong>Contribution:</strong> Active contributor to this project</p>
    </div>
  </div>
</div>
      
    </div><!-- /.col-lg-4 -->
     <div class="col-lg-4 d-flex flex-column align-items-center">
      <img class="rounded-circle" src="assets/images/ritika.jpg" alt="Generic placeholder image" width="140" height="140">
      <h2>Ritika Singh</h2>
      <p class="text-center"> Worked on Frontend</p>
      <!-- Add a button with a unique ID to trigger the details toggle -->
      <p><a class="btn btn-secondary" href="#details3" role="button" onclick="toggleDetails('details3')">View details »</a></p>
      <!-- Details container with a unique ID -->
       
      <div id="details3" class="person-details mt-3 p-3 border rounded">
  <h4>Details about this person:</h4>
  <hr>

  <div class="row">
    <div class="col-md-6">
      <p><strong>Skills:</strong> HTML, CSS , JavaScript, Bootstrap</p>
      <p><strong>Age:</strong> 30</p>
    </div>
    <div class="col-md-6">
      <p><strong>Email:</strong> ritika@example.com</p>
      <p><strong>Contribution:</strong> Active contributor to this project</p>
    </div>
  </div>
</div>
      
    </div><!-- /.col-lg-4 -->
  </div>
</div>

<script>
  // JavaScript function to toggle the visibility of details
  function toggleDetails(detailsId) {
    var detailsContainer = document.getElementById(detailsId);
    detailsContainer.style.display = (detailsContainer.style.display === 'none') ? 'block' : 'none';
  }
</script>