$(document).on("turbolinks:load", function () {
  // Custom Client Side Validation
  // Example starter JavaScript for disabling form submissions if there are invalid fields
  (function () {
    "use strict";
    console.log('load form validation');
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
  if (window.matchMedia("(max-width: 768px)").matches) {
    console.log('max width : 768px');
    $('.bs-stepper').addClass("vertical");
    $('.bs-stepper-content').removeClass("p-5");
    $('.bs-stepper-header').removeClass("mb-3");
  }
  const stepper = new Stepper(document.querySelector('.bs-stepper'), {linear: false});
  $('.next-stepper').on("click", function() {
    stepper.next();
  });
});