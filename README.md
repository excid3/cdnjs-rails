Serving js files from a publicly available [CDN](http://en.wikipedia.org/wiki/Content_Delivery_Network) has clear benefits:

* **Speed**: Users will be able to download file from the closest physical location.
* **Caching**: CDN is used so widely that potentially your users may not need to download files at all.
* **Parallelism**: Browsers have a limitation on how many connections can be made to a single host. Using a CDN for file offloads a big one.

=============

### Features

This gem offers the following features:

* Supports [cdnjs.com](http://cdnjs.com/)
* All libraries and versions are set in your application.rb file
* Automatically fallback to local files stored in your vendor directory:
  * You're on a development environment, so that you can work offline.
  * The CDN is down or unreachable.

On top of that, if you're using asset pipeline, you may have noticed that the major chunks of the code in combined `application.js` is jQuery. Implications of externalizing js files from `application.js` are:

* Updating your JS code won't evict the entire cache in browsers.
  * Cached jQuery in the client browsers will survive deployments.
  * Your code changes more often than jQuery upgrades, right?
* `rake assets:precompile` will run faster and use less memory.

=============

### Installation

If you're using the asset pipeline with Rails 3.1+,

- Start by removing `//= require jquery` and other includes where applicable from your `application.js` file.

If you're using the asset pipeline with Rails 4+,

- Create a vendor directory `mkdir vendor/assets/javascripts/` for each library you would like to include, or only if you see fit
- Download the version of the library you want to use from the [cdnjs.com](http://cdnjs.com/) and save the file to this directory. The file should look something like `jquery.min.js`.
- Add the gem to your gem file:

```ruby
gem 'jquery-rails'
gem 'cdnjs-rails'
```

- In the supplied demo app, we are including 2 libraries `jquery` and `jquery-ui` where `cdnjs` is the name of the partial path on [cdnjs.com](http://cdnjs.com/) and `localpath` matches the folder path in your local application i.e. vendor directory. Add this to your `config/application.rb` file so that it is loaded in all environments:

```ruby
# Specify CDNJS Libraries to include in the header with fallback using an array of hashes
config.cdnjs = [
  {:cdnjs => 'jquery/2.0.2/jquery.min.js', :localpath => 'jquery.min.js'},
  {:cdnjs => 'jqueryui/1.10.3/jquery-ui.min.js', :localpath => 'jquery-ui.min.js'}
]
```

- Finally add this section to your layouts file.

```html
<%= cdnjs_include_tag %>
<%= javascript_include_tag "application", "data-turbolinks-track" => true %>
```

- Please verify you do not have a duplicate `application` js include as this can cause issues with libraries down the road like ember. Here is an example layout of a rails 4 application:

```html
<!DOCTYPE html>
<html>
<head>
  <title>Demoapp</title>
  <%= cdnjs_include_tag %>
  <%= javascript_include_tag "application", "data-turbolinks-track" => true %>
  <%= stylesheet_link_tag    "application", media: "all", "data-turbolinks-track" => true %>
  <%= csrf_meta_tags %>
</head>
<body>

<%= yield %>

</body>
</html>
```

The gem will generate the following across all modes production, testing, and development:

```html
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<script>
//<![CDATA[
window.jQuery || document.write(unescape('%3Cscript src="/assets/jquery.min.js?body=1">%3C/script>'))
//]]>
</script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<script>
//<![CDATA[
window.jQuery || document.write(unescape('%3Cscript src="/assets/jquery-ui.min.js?body=1">%3C/script>'))
//]]>
</script>
```
