$(document).ready ->
  $("#topics .page").infinitescroll
    loading: {
      msgText: '',
      finishedMsg: '',
    }
    dataType: 'js',
    animate: true,
    navSelector: "nav.pagination" # selector for the paged navigation (it will be hidden)
    nextSelector: "nav.pagination a[rel=next]" # selector for the NEXT link (to page 2)
    itemSelector: "#topics .topic" # selector for all items you'll retrieve