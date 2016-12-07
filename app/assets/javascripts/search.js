$(document).ready(function() {
  function _search(query) {
    $('li').each(function(index, li) {
      var element = $(li);
      var text = element.text().toLowerCase();

      if (text.indexOf(query) === -1) {
        element.addClass('hidden');
      } else {
        element.removeClass('hidden');
      }
    });
  }

  function clear() {
    $('li').removeClass('hidden');
  }

  function search() {
    var query = $('input#query').val().toLowerCase();

    if (query.length > 0) {
      _search(query);
    } else {
      clear();
    }
  }

  $('input#query').on('keyup', function(event) {
    search();
  });

  $('#search').on('click', function(event) {
    event.preventDefault();

    search();
  });

  $('#clear').on('click', function(event) {
    event.preventDefault();

    clear();
  });
});
