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
                var template = $('.episode-action-template')[0].cloneNode(true);
                var watch_episode_form = $(template).find(".watch-episode");
                var watch_link = watch_episode_form.attr("action").replace(/\d*$/, data);
                watch_episode_form.attr("action", watch_link);

                var watch_id = watch_episode_form.attr("id").replace(/\d*$/, data);
                watch_episode_form.attr("id", watch_id);

                var transcript_form = $(template).find(".read-transcript");
                var transcript_link = transcript_form.attr("action").replace(/\d*$/, data);
                transcript_form.attr("action", transcript_link);

                return template.innerHTML;
              }
           }
        ]
      }
    );

    $('#episode-list').on('ajax:success', '.watch-episode', function(event, data, status, xhr) {
      location.href = data["video_url"];
    });

    $('#episode-list').on('ajax:success', '.read-transcript', function(event, data, status, xhr) {
      $('#modal-title-display').text(data['number'] + ' - ' + data['title']);
      $('#modal-transcript-display').html(data['transcription']);
      $('pre').each(function(i, block) {
        hljs.highlightBlock(block);
      });
      $('#episode-modal').modal();
    });
  });
}
