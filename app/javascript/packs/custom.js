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
  $('a[data-toggle="collapse"][data-page="department"][role="button"][aria-expanded="false"]').on('click', function (e) {
    $(this).text(function (i, v) {
      return v === 'Show' ? 'Hide' : 'Show';
    })
  })

  $('#showAll').on('click', function () {
    let $buttonCollapse = $('a[data-toggle="collapse"][data-page="department"]');
    let $containerCollapse = $('.collapse.department-collapse');
    if ($(this)[0].checked) {
      $containerCollapse.addClass('show');
      $buttonCollapse.each(function () {
        $(this).text('Hide')
      })
    } else {
      $containerCollapse.removeClass('show');
      $buttonCollapse.each(function () {
        $(this).text('Show')
      })
    }

  })
});

$(document).on("turbolinks:load", function () {
  
  function passwordToggle(toggleBtn) {
    // console.log(toggleBtn.closest('.input-group-append').siblings('input').attr("type"));
    let toggleState = toggleBtn.closest('.input-group-append').siblings('input').attr("type");
    if (toggleState == "text") {
      toggleBtn.closest('.input-group-append').siblings("input[type='text']").attr("type", "password");
      toggleBtn.find('.svg-inline--fa').toggleClass("fa-eye");
      toggleState = false;
    } else if (toggleState == "password"){
      toggleBtn.closest('.input-group-append').siblings("input[type='password']").attr("type", "text");
      toggleBtn.find('.svg-inline--fa').toggleClass("fa-eye-slash");
      toggleState = true;
    }
  }

  $('.show-pass').on("click", function() {
    passwordToggle($(this));
  });
});