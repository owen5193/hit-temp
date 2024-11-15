
// This is an example typst template (based on the default template that ships
// with Quarto). It defines a typst function named 'article' which provides
// various customization options. This function is called from the 
// 'typst-show.typ' file (which maps Pandoc metadata function arguments)
//
// If you are creating or packaging a custom typst template you will likely
// want to replace this file and 'typst-show.typ' entirely. You can find 
// documentation on creating typst templates and some examples here: 
//   - https://typst.app/docs/tutorial/making-a-template/
//   - https://github.com/typst/templates


#let article(
  title: none,
  authors: none,
  date: none,
  subtitle: none,
  abstract: none,
  abstract-title: none,
  cols: 1,
  margin: (x: 1.25in, y: 1.25in),
  paper: "us-letter",
  lang: "en",
  region: "US",
  font: (),
  fontsize: 11pt,
  sectionnumbering: none,
  toc: false,
  toc_title: none,
  toc_depth: none,
  toc_indent: 1.5em,
  doc,
) = {

  set page(
    paper: paper,
    margin: margin
  )
  set par(justify: true)
  set text(lang: lang,
           region: region,
           font: font,
           size: fontsize)
  set heading(numbering: sectionnumbering)
  
      // Configure headings.
  show heading.where(level: 1): set block(below: 0.5cm, above: 0.5cm)
  show heading.where(level: 2): set block(above: 0.5cm, below: 0.5cm)
  show heading.where(level: 3): set block(above: 0.5cm, below: 0.5cm)
  show heading.where(level: 4): set block(above: 0.5cm, below: 0.5cm)
  
  // Links should be blue.
  show link: set text(rgb("#0F4985"))
  show link: underline
  
  // Configure lists and links.
  set list(indent: 24pt, body-indent: 5pt, marker: ([•], [--]))
  
  align(right)[
  #image("images/hit-logo.png", width: 30%)]
  
  set text(size: 20pt)

  if title != none {
align(horizon)[#table(
  columns: 1fr,
  stroke: 2pt,
  inset: 15pt,
  [#text(weight: 800, size: 1em)[#title \ \ #date]])]
  }
  
  align(bottom)[*Public Health Intelligence*]
  
  pagebreak()
  
set text(size: 12pt)
  
align(top)[The Public Health Intelligence team are part of the Directorate of Public Health of NHS Highland and provide an expert resource on epidemiology, demography and population health evidence.]


align(horizon)[#grid(
  columns: (3cm, 10cm),
  rows: (auto, 60pt),
  gutter: 2cm,
  grid.cell(
    colspan: 1,
    image("images/at.png", width: 100%),
  ),
  align(horizon)[nhsh.publichealthintelligence\@nhs\.scot],
  align(top)[#grid.cell(
    colspan: 1,
    image("images/office.png", width: 100%),
  )],
  align(horizon)[Public Health Intelligence Team \ Directorate of Public Health \ NHS Highland \ Assynt House \ Beechwood business Park \ Inverness IV2 3BW]
  )]
  
  


  if authors != none {
align(bottom)[#grid(
      columns: 1,
      row-gutter: 1.5em,
      ..authors.map(author =>
          align(left)[Prepared by #author.name. 
          ]
      )
    )]
  }
  
linebreak()

align(bottom)[If you require this document in an alternative format, such as large print or on a coloured background, please contact us to discuss your needs.]

linebreak()

align(left)[
  #table(columns: (1fr, auto),
  stroke: 1pt,
  table.header[*Distribution*][*Method*],
  [Public Health Directorate], [Intranet with email link \ \ Public health intelligence intranet page]
)
]

  pagebreak()

  if toc {
    let title = if toc_title == none {
      auto
    } else {
      toc_title
    }
    block(above: 0em, below: 2em)[
    #show outline.entry.where(
  level: 1
): it => {
  v(11pt, weak: true)
  strong(it)
}
    #outline(
      title: toc_title,
      depth: toc_depth,
      indent: toc_indent//,
      //fill: box(width: 1fr, repeat[-])
    );
    ]
  }
  
    pagebreak()
    
set page(
  footer: [
    #text(style: "italic", weight: 100, fill: luma(0))[NHS Highland \ Public Health Intelligence Team]
    #h(1fr)
    #counter(page).display()
  ]
)

 counter(page).update(1)

  if cols == 1 {
    doc
  } else {
    columns(cols, doc)
  }
}



#set table(
  inset: 6pt,
  stroke: none
)
