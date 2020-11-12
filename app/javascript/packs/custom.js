$(document).on("turbolinks:load", function () {
  // Custom Client Side Validation
  // Example starter JavaScript for disabling form submissions if there are invalid fields
  (function () {
    "use strict";
    window.addEventListener(
      "load",
      function () {
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.getElementsByClassName("needs-validation");
        // Loop over them and prevent submission
        var validation = Array.prototype.filter.call(forms, function (form) {
          form.addEventListener(
            "submit",
            function (event) {
              if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
              }
              form.classList.add("was-validated");
            },
            false
          );
        });
      },
      false
    );
  })();
});

$(document).on("turbolinks:load", function () {
  $('a[data-toggle="collapse"][data-page="department"][role="button"][aria-expanded="false"]').on('click', function(e) { 
    $(this).text(function(i, v) {
      return v === 'Show' ? 'Hide' : 'Show';
    })
    
  })
});