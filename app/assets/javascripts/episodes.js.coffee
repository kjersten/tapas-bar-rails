$(document).ready(function(){
  $('#episode-list').dataTable(
    {
      "ajax": "/list",
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
          "data": "actions",
          "searchable": false,
          "orderable": false
       }]}
    );
});
