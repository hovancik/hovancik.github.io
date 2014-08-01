---
title: This is not awesome
date: 2014-07-31 12:09 UTC
tags: example, school
---

Markdown Viewer
==========

A simple live markdown editor built with [markdown.js](https://github.com/evilstreak/markdown-js). Supports John Gruber's original markdown dialect.

Headings
-----

# First-level heading
## Second
### Third
#### Fourth-level heading

The first two heading levels also have an alternative syntax:

First-level heading
===================
 
Second-level heading
--------------------

Paragraphs
----------
A paragraph is one or more consecutive lines of text separated by one or more blank lines. Normal paragraphs should not be indented with spaces or tabs:

This is a paragraph. It has two sentences.

This is another paragraph. It also has 
two sentences.

Lists
--------
* An item in a bulleted (unordered) list
    * A subitem, indented with 4 spaces
* Another item in a bulleted list  
- - -
1. An item in an enumerated (ordered) list  
    1.1. A subitem, indented with 4 spaces
2. Another item in an enumerated list

Line return
----------
Line breaks inserted in the text are removed from the final result: the web browser is in charge of breaking lines depending on the available space. To force a line break, insert two spaces at the end of the line.

Emphasized text
-----------------
*emphasis* or _emphasis_  (e.g., italics)  
**strong emphasis** or __strong emphasis__ (e.g., boldface)

Code
--------------
To include code (formatted in monospace font), you can either surround inline code with backticks, like in

Some text with `some code` inside,

or indent several lines of code by at least four spaces, as in:

```ruby
  <% content_for :header do %>
    <% content_tag :p, :class => "container soc_links " do %>
      <%= link_to '<i class="fa fa-home fa-2x"></i>', "/blog", :title => "Back to Blog" %>
      <%= link_to image_tag("hovancik.jpg", :id => "blog_photo"), "/", :title => "Back to Home page" %>
      <%= link_to '<i class="fa fa-linkedin-square fa-2x"></i>', "https://www.linkedin.com/in/janhovancik", :title => "LinkedIn profile" %>
      <%= link_to '<i class="fa fa-github-square fa-2x"></i>', "https://www.github.com/hovancik", :title => "Github" %>
      <%= link_to '<i class="fa fa-envelope-square fa-2x"></i>', "mailto:conta.srdr@gmail.com", :title => "Email" %>
      <%= link_to '<i class="fa fa-twitter-square fa-2x"></i>', "https://www.twitter.com/JanHovancik", :title => "Twitter" %>
    <% end %>
  <% end %>  
```

The latter option makes Markdown retain all whitespace,as opposed to the usual behaviour, which, by removing line breaks and excess spaces, would break indentation and code layout.

Line breaks
-------------
When you do want to insert a break tag using Markdown, you end a line with two or more spaces, then type return. For example:

def show_results  
end  

You can also use two newlines. For example:  

sentence A

sentence B

Blockquotes
--------

> "This entire paragraph of text will be enclosed in an HTML blockquote element.
Blockquote elements are reflowable. You may arbitrarily
wrap the text to your liking, and it will all be parsed
into a single blockquote element."

External links
------
Links may be included inline:
[link text here](link.address.here)
Ex. [Markdown](http://en.wikipedia.com/wiki/Markdown)

Alternatively, links can be placed in footnotes outside of the paragraph, being referenced with some sort of reference tag. For example, including the following inline:

[link text here][linkref]

would produce a link if the following showed up outside of the paragraph (or at the end of the document):

[linkref]: link.address.here "link title here"

Images
---------------
Images have similar syntax to links with a preceding exclamation point.

![Alt text](/path/to/img.jpg)
or
![Alt text](/path/to/img.jpg "Optional title")

Like links, Images also have a footnote style syntax

![Alt text][id]

with a reference later in the document defining the url location

[id]: url/to/image  "Optional title attribute"

Horizontal rules
-----------------
Horizontal rules are created by placing three or more hyphens, asterisks, or underscores on a line by themselves. You may use spaces between the hyphens or asterisks. Each of the following lines will produce a horizontal rule:
* * *
***
*****
-----------------------------
- - -

