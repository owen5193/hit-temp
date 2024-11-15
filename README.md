# Hit-temp Format

## Installing

```bash
quarto use template owen5193/hit-temp
```

This will install the format extension and create an example qmd file
that you can use as a starting place for your health intelligence document.

## What's included

* template.qmd which shows the behaviour of the document
* data folder, to store your files
* references folder which contains a bibtex file with one exemplar reference
* styles folder with the csl for Vancouver superscript from the zotero project
* images folder which includes image for the template
  + Additional images used during your project can be stored here
* _extensions folder
  + _extension.yml
    - You may need to update this document to reduce quarto version required to ">=1.4.0"
  + tpyst-show.typ
    - This can be left alone
  + typst-template.typ
    - Behaviour of the document layout can be controlled from here

## Using

This will create a folder where your project can be based. This extension uses the Typst language which is similar to Latex but, more user friendly and easier to learn. More information can be found on the [Typst](https://typst.app/about/) website.