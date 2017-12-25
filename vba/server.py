#!/usr/local/bin/python3

from http.server import HTTPServer, CGIHTTPRequestHandler

class Handler(CGIHTTPRequestHandler):
    cgi_directories = ["/cgi-bin"]

PORT = 8000
httpd = HTTPServer(("", PORT), Handler)
httpd.serve_forever()

