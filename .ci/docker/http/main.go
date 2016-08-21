package main

import(
	"log"
	"net/url"
	"net/http"
	"net/http/httputil"
)

func main() {
	log.Print("Starting reverse proxy...")
	remote, err := url.Parse("http://gerrit:8080")
	if err != nil {
		panic(err)
	}

	proxy := httputil.NewSingleHostReverseProxy(remote)
	http.HandleFunc("/", handler(proxy))
	err = http.ListenAndServe(":8088", nil)
	if err != nil {
		panic(err)
	}
}

func handler(proxy *httputil.ReverseProxy) func(http.ResponseWriter, *http.Request) {
	return func(w http.ResponseWriter, request *http.Request) {
		// TODO auth handling


		request.Header.Set("X-Remote-User", "Administrator")
		proxy.ServeHTTP(w, request)
	}
}
