---
layout: pages
title:  Responsive Galleries with Foundation
categories: [blog ]
tags: [Tool, Mac,]
description: 一个年度最佳新工具的榜单
gallery:
    - image_url: gallery-example-1.jpg
      caption: Great images by Unsplash.com
    - image_url: gallery-example-2.jpg
      caption: Great images by Unsplash.com
    - image_url: gallery-example-3.jpg
      caption: Great images by Unsplash.com
    - image_url: gallery-example-4.jpg
      caption: Great images by Unsplash.com
    - image_url: gallery-example-5.jpg
      caption: Great images by Unsplash.com
    - image_url: gallery-example-6.jpg
      caption: Great images by Unsplash.com
    - image_url: gallery-example-7.jpg
      caption: Great images by Unsplash.com
    - image_url: gallery-example-8.jpg
      caption: Great images by Unsplash.com
---




{% include gallery %}


## How to embed a gallery

`{% raw %}{% include gallery %}{% endraw %}` lets you easily embed a gallery into your post. To use the gallery-include...


### Step 1

1. Make two images: a thumbnail and a big image.
2. Name the thumbnail *gallery-image-thumb.jpg* and...
3. ...name the big *gallery-image.jpg*.
4. Place them in the *images*-folder.


### Step 2

Define the big version in frontmatter,  

~~~
gallery:
    - image_url: gallery-image.jpg
~~~

If you like captions, give each image a caption:

~~~
gallery:
    - image_url: gallery-image.jpg
       caption: Starting Page with huge One Logo
~~~

### Step 3

Add the include whereever you want in your content with `{% raw %}{% include gallery %}{% endraw %}`.

{% include alert info='Have a look at this example-entry. And have a look into the images-folder. :)' %}











## Other Post Formats
{: .t60 }
{% include list-posts tag='post format' %}



 [1]: http://foundation.zurb.com/docs/components/clearing.html
 [2]: http://foundation.zurb.com/docs/components/block_grid.html
 [3]: {{ site.url }}/design/page/
 [4]: {{ site.url }}/design/page-fullwidth/
