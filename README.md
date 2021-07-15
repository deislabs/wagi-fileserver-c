# Fileserver-C

A [Wagi](https://github.com/deislabs/wagi) static fileserver written in C.

> DeisLabs is experimenting with many WASM technologies right now.
> This is one of a multitude of projects designed to test the limits
> of WebAssembly as a cloud-based runtime. This code is not stable or
> production ready.

## Running in Wagi

```console
$ make build
.tools/wasi-sdk-12.0/bin/clang ./src/main.c -o fileserver.wasm -glldb --sysroot .tools/wasi-sdk-12.0/share/wasi-sysroot/

$ make bindle-push
hippofactory HIPPOFACTS -v production --action bindle --server http://127.0.0.1:8080/v1
pushed: fileserver-c/0.1.0
```

Then run it in Wagi

```console
$ wagi --bindle fileserver-c/0.1.0 --bindle-server http://127.0.0.1:8080/v1
```

### Testing the Static Fileserver with `curl`

Assuming you have Wagi running on `http://localhost:3000`

```console
$ curl -v localhost:3000/static/LICENSE
*   Trying 127.0.0.1...
* TCP_NODELAY set
* Connected to localhost (127.0.0.1) port 3000 (#0)
> GET /LICENSE HTTP/1.1
> Host: localhost:3000
> User-Agent: curl/7.64.1
> Accept: */*
>
< HTTP/1.1 200 OK
< Content-Length: 1104
< Content-Type: text/plain
< Date: Thu, 15 Jul 2021 18:14:49 GMT
<
The MIT License (MIT)

Copyright (c) Microsoft Corporation. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE
* Connection #0 to host localhost left intact
* Closing connection 0
```

## Code of Conduct

This project has adopted the [Microsoft Open Source Code of
Conduct](https://opensource.microsoft.com/codeofconduct/).

For more information see the [Code of Conduct
FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact
[opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional
questions or comments.
