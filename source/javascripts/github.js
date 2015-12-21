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

  function renderContributions(target, contributions){
    var i = 0, fragment = '', t = $(target)[0];

    for(repo in contributions) {

      if(repo.match('chrishenry') || repo.match('geonosis')) {
        continue;
      }

      repo_url = getRepoUrlFromPull(contributions[repo][0].pull_request.html_url)
      repo_name = getRepoNameFromPull(contributions[repo][0].pull_request.html_url)

      // Append a header
      fragment += '<h2><a href="'+repo_url+'">'+repo_name+'</a></h4>'
      fragment += '<ul>'
      for(i = 0; i < contributions[repo].length; i++) {
        pr = contributions[repo][i]
        fragment += '<li><a href="'+pr.pull_request.html_url+'">'+pr.title+'</a></li>';
      }
      fragment += '</ul>'

    }

    t.innerHTML = fragment;
  }

  function getRepoUrlFromPull(pull_url){
     return pull_url.split('pull')[0]
  }

  function getRepoNameFromPull(pull_url){
     repo_url = getRepoUrlFromPull(pull_url)
     repo_name = repo_url.replace('https://github.com/', '')
     return repo_name.substr(0, repo_name.length - 1)
  }

  return {
    showRepos: function(options){
      $.ajax({
          url: "https://api.github.com/users/"+options.user+"/repos"
        , error: function (err) { $(options.target + ' p.loading').addClass('error').text("Error loading repos"); }
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
    },
    showContributions: function(options){
      $.ajax({
        url: "https://api.github.com/search/issues"
       ,data: {
          q: 'author:chrishenry is:pr is:public',
          ref: 'searchresults',
          type: 'Issues',
          utf: 'utf8=%E2%9C%93'
        }
       ,error: function (err) { $(options.target + ' p.loading').addClass('error').text("Error loading Contributions"); }
       ,success: function(data) {
         var repos = {}

         // Group by repo
         for(var i = 0; i < data.items.length; i++) {
           repo = getRepoUrlFromPull(data.items[i].html_url)
           if(typeof(repos[repo]) !== 'undefined') {
             repos[repo].push(data.items[i])
           } else {
             repos[repo] = []
             repos[repo].push(data.items[i])
           }
         }
         renderContributions(options.target, repos)
       }
      });
    }
  }
})();
