if $('html').is('.episodes')
  $(document).ready ->
    $('#episode-list').DataTable(
      {
        "ajax": "/episodes.json",
        "order": [0, "desc"],
        "columnDefs": [
          {
             "targets": "ep-number",
             "type": "num",
             "data": "number"
           },
           {
              "targets": "ep-title",
              "data": "title"
           },
           {
              "targets": "ep-description",
              "data": "description",
              "width": "600px"
           },
           {
              "targets": "ep-actions",
              "data": "actions"
           }
        ]
      }
    )
