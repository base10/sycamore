# Sycamore data modeling

## Users

- name
- email
- admin (Boolean)
- devise fields

## Sites

- id
- name
- url

## Articles

- slug
- title
- summary
- body
- `belongs_to` status
- `belongs_to` sites
- `belongs_to` users
- `belongs_to` tags
- `belongs_to` topics

## Photos

- slug
- title
- description
- `file_name`
- `copyright_year`
- geoprivacy
- latitude
- longitude
- `shutter_speed`
- aperture
- `belongs_to` status
- `belongs_to` users
- `belongs_to` sites
- `belongs_to` articles (?)
    - Keep this simple for now, but I'll need a way to place associated photos within an article
    - On the photos centric things, I'll need to
- `belongs_to` tags
    - PhotosTagsAssoc
- `belongs_to` topics (?)
    - TopicsPhotosAssoc
- `belongs_to` galleries (in time)

## Tags

*An orthogonal and flat organization from topics*

## Links

- title
- url
- notes
- `belongs_to` status
- `belongs_to` users
- `belongs_to` sites
- belongs

## Topics

*Topics may in the future have hierarchy, but for now, keep it flat and general. My thought is each of these has its own RSS feed*

- name
- slug
- description

## Photo Galleries

## Topic features

## Newsletters

- A general newsletter for the site
- Topic specific newsletters when new articles are posted
    - I'd like the ability to have a pop-up newsletter as well
- Keep the subscriber info in the Sycamore DB
- Use a transactional service for the sending infrastructure

## Article Responses

- Trackbacks and selected comments on articles

## Topic Responses

- Trackbacks and selected comments on topics
