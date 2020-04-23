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

## Theme loading issue

Unfortunatly the loading of a theme via URL only works exactly **once** after the container was started.

After that the preview loads correctly, but the form fields do not contain the correct values.

See also: https://github.com/Intera/docker-jquery-ui/issues/1

Any help on this issue is highly appreciated.
