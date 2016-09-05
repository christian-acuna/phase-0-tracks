What are some common HTTP status codes?

- 500 (Internal server error)
- 404 (Not found)
- 403 (Forbidden)
- 400 (Bad request)
- 401 (Unauthorized)
- 502 (Bad Gateway)

What is the difference between a GET request and a POST request? When might each be used?

- A GET requests data from a server
- A POST request submits data to a server. They supply additional information to
the server in the message body.
- A GET may be used to visit a URL and a POST may be used to submit an HTML form.

Optional bonus question: What is a cookie (the technical kind, not the delicious kind)? How does it relate to HTTP requests?

- Cookies enable websites to remember stateful information and generally improve
a user's experience on a site. They are usually small text files that can be accessed by the user's client computer or a web server when making a request.
They are essentially a table of key-value pairs that are sometimes encrypted.
When submitting an HTTP request cookie information is passed in the request
headers and the receiving server uses it to return the proper resource based.
