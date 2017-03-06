# web_search from terminal

function web_search() {
  emulate -L zsh

  # define search engine URLS
  typeset -A urls
  urls=(
    google      "https://www.google.com/search?q="
    bing        "https://www.bing.com/search?q="
    yahoo       "https://search.yahoo.com/search?p="
    duckduckgo  "https://www.duckduckgo.com/?q="
    startpage   "https://www.startpage.com/do/search?q="
    yandex      "https://yandex.ru/yandsearch?text="
    github      "https://github.com/search?q="
    ecosia      "https://www.ecosia.org/search?q="
    goodreads   "https://www.goodreads.com/search?q="
    qwant       "https://www.qwant.com/?q="
    alternativeto "https://alternativeto.net/software/"
    ebay	"http://www.ebay.com/sch/i.html?TRS0&_nkw="
    prisjakt	"https://www.prisjakt.no/search.php?query="
    wolfram	"http://www.wolframalpha.com/input/?i="
    maps	"https://www.google.no/maps/place/"
    so		"https://stackoverflow.com/search?q="
  )

  # check whether the search engine is supported
  if [[ -z "$urls[$1]" ]]; then
    echo "Search engine $1 not supported."
    return 1
  fi

  # search or go to main page depending on number of arguments passed
  if [[ $# -gt 1 ]]; then
    # build search url:
    # join arguments passed with '+', then append to search engine URL
    url="${urls[$1]}${(j:+:)@[2,-1]}"
  else
    # build main page url:
    # split by '/', then rejoin protocol (1) and domain (2) parts with '//'
    url="${(j://:)${(s:/:)urls[$1]}[1,2]}"
  fi

  open_command "$url"
}


alias bing='web_search bing'
alias google='web_search google'
alias yahoo='web_search yahoo'
alias ddg='web_search duckduckgo'
alias sp='web_search startpage'
alias yandex='web_search yandex'
alias github='web_search github'
alias ecosia='web_search ecosia'
alias alternativeto='web_search alternativeto'
alias ebay='web_search ebay'
alias prisjakt='web_search prisjakt'
alias wolfram='web_search wolfram'
alias maps='web_search maps'
alias so='web_search so'

#add your own !bang searches here
alias alternativeto='web_search alternativeto'
alias ali='web_search aliexpress'
alias ebay='web_search ebay'
alias prisjakt='web_search prisjakt'
alias wolfram='web_search wolfram'
alias maps='web_search maps'
alias so='web_search so'
alias wiki='web_search duckduckgo \!w'
alias news='web_search duckduckgo \!n'
alias youtube='web_search duckduckgo \!yt'
alias map='web_search duckduckgo \!m'
alias image='web_search duckduckgo \!i'
alias ducky='web_search duckduckgo \!'
