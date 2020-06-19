import 'js-autocomplete/auto-complete.css';
import autocomplete from 'js-autocomplete';

const autocompleteSearch = function() {
  const element = document.getElementById('search-data')
  console.log("fora")
  if (element) {
  console.log("dentro")
    const movies = JSON.parse(document.getElementById('search-data').dataset.movies);
    const searchInput = document.getElementById('query'); 
    new autocomplete({
      selector: searchInput,
      minChars: 1,
      source: function(term, suggest){
          term = term.toLowerCase();
          const choices = movies;
          const matches = [];
          for (let i = 0; i < choices.length; i++)
              if (~choices[i].toLowerCase().indexOf(term)) matches.push(choices[i]);
          suggest(matches);
      },
    }); 
  }
};

export { autocompleteSearch };