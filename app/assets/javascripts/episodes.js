if ($('html.episodes').length > 0) {
  $(document).ready(function() {
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
              "data": "id",
              "render": function (data, type, full, meta) {
                var form = $('.episode_update_template')[0].cloneNode(true);
                var form_link = $(form).attr("action").replace(/\d*$/, data);
                $(form).attr("action", form_link);
                return form.outerHTML;
              }
           }
        ]
      }
    );
  });
}
