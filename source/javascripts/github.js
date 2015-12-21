var github = (function(){
  function renderRepos(target, repos){
    var i = 0, fragment = '', t = $(target)[0];

    for(i = 0; i < repos.length; i++) {
      if(repos[i].fork) {
        continue;
      }
      fragment += '<h4><a href="'+repos[i].html_url+'">'+repos[i].name+'</a></h4><p>'+(repos[i].description||'')+'</p>';
    }
    t.innerHTML = fragment;
  }

  return {
    showRepos: function(options){
      $.ajax({
          url: "https://api.github.com/users/"+options.user+"/repos"
        , error: function (err) { $(options.target + ' p.loading').addClass('error').text("Error loading feed"); }
        , success: function(data) {
          var repos = [];
          for (var i = 0; i < data.length; i++) {
            if (options.skip_forks && data[i].fork) { continue; }
            repos.push(data[i]);
          }
          repos.sort(function(a, b) {
            var aDate = new Date(a.pushed_at).valueOf(),
                bDate = new Date(b.pushed_at).valueOf();

            if (aDate === bDate) { return 0; }
            return aDate > bDate ? -1 : 1;
          });
          if (options.count) { repos.splice(options.count); }
          renderRepos(options.target, repos);
        }
      });
    }
  }
})();
