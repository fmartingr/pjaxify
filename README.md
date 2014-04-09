pjaxify
=======

Use data tags to make your links use the pjax request method automatically.

## Main configuration

You need to specify pjax containers to load your content. For this purpose, we will use the HTML attribute `data-pjax-container="..."`, where the value is the container name.

The main container should be called "main", so there need to be a `data-pjax-container="main"` in your layout since this will be the default

## Usage

Add `data-pjax-container="main"` into your main content layer, this will be the default DOM element where content will be loaded.

```
<div id="main_content" data-pjax-container="main">...</div>
```

Add `data-pjax` on the links you want to use pjax.

```
<a href="/blog" data-pjax>Blog</a>
```

It's done! The link will load into your container instead of opening the full link directly. (**[read backend instructions here](https://github.com/defunkt/jquery-pjax#overview)**)

## Using custom containers

You can use custom containers too! For example, you can have a sidebar container:

```
<div class="sidebar" data-pjax-container="sidebar">...</div>
```

To load the link on the custom container you only need to specify a value in the link `data-pjax` attribute.

```
<a href="/updates_sidebar" data-pjax="sidebar">Whoops</a>
```

This link will load the URL contents to the sidebar container instead of the main container.

## Using the closest container

Using `data-pjax="closest"` will use the closest `[data-pjax-container]` DOM element as a container.


## Other options

### Do not push URL to the brower

Add `data-pjax-nopush` to the links that don't need to update the browsers URL.

## Custom handlers

TODO

## Custom selectors

TODO

## License

See LICENSE file.
