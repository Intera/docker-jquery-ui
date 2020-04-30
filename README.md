# Docker Image for jQuery UI Theme Roller

This image allow you to run a local instance of the jQuery UI theme roller.

You can simply start it with this command:

```bash
docker run --rm -p 8088:8088 intera/jquery-ui:latest
```

After that you should be able to access the download builder and the theme roller on your local machine:

**Theme Roller**

http://localhost:8088/themeroller/

**Download Builder**

http://localhost:8088/download/

## Public demo

You can check out a public demo of the container here:

https://jquery-ui.intera.ws/

## Theme loading issue

Unfortunatly sometimes the loading of the theme does not seem to work. The preview loads correctly, but the form fields do not contain the correct values (see also [#1](https://github.com/Intera/docker-jquery-ui/issues/1)).

It seems the problem can be fixed by clearing your browser caches. If you have any input on this issue, please add a comment.
