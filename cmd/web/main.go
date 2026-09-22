package main

import (
	"log"
	"net/http"
)

func main() {
	log.Println("starting server on :4000")

	err := http.ListenAndServe(":4000", nil)
	log.Fatal(err)
}
