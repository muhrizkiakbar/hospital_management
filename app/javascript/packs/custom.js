$(document).on("turbolinks:load", function () {
  $('a[data-toggle="collapse"][data-page="department"][role="button"][aria-expanded="false"]').on('click', function(e) { 
    $(this).text(function(i, v) {
      return v === 'Show' ? 'Hide' : 'Show';
    })
  })

  $('#showAll').on('click', function() {
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