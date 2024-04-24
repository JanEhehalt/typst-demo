//#import "@preview/exzellenz-tum-thesis:0.1.0": exzellenz-tum-thesis

#import "utils.typ": inwriting, draft, todo
#import "glossary.typ": glossary
#import "@preview/glossarium:0.2.6": make-glossary, print-glossary, gls, glspl
#show: make-glossary


// Global Settings //
#set text(lang: "en", size: 12pt)
#set text(ligatures: false)
#set text(font: "Times New Roman")

// Set numbering mode
#set page(numbering: "1")
#set math.equation(numbering: "(1)")
#set heading(numbering: "1.1")

// Set fonts
#set text(font: "Times New Roman")
#show raw: set text(font: "Times New Roman")
#show math.equation: set text(font: "Times New Roman")

// Set font size
#show heading.where(level: 3): set text(size: 1.05em)
#show heading.where(level: 4): set text(size: 1.0em)
#show figure: set text(size: 0.9em)

// Set spacing
#set par(leading: 0.9em, first-line-indent: 1.8em, justify: true)
#show par: set block(spacing: 1em)
#set table(inset: 6.5pt)
#show table: set par(justify: false)
#show figure: it => [#v(1em) #it #v(1em)]

#show heading.where(level: 1): set block(above: 1.95em, below: 1em)
#show heading.where(level: 2): set block(above: 1.85em, below: 1em)
#show heading.where(level: 3): set block(above: 1.75em, below: 1em)
#show heading.where(level: 4): set block(above: 1.55em, below: 1em)

// Pagebreak before level 1 headings
#show heading.where(level: 1): it => [
  #pagebreak(weak: true)
  #it
]

// Names for headings
#set heading(supplement: it => {
  if (it.has("level")) {
    if it.level == 1 [Part]
    else if it.level == 2 [Chapter]
    else [Section]
  } else {
    [ERROR, this should not happen]
  }
})


// Set citation style
#set cite(style: "alphanumeric")

// Table stroke
#set table(stroke: 0.5pt + black)


// show reference targets in brackets
#show ref: it => {
  let el = it.element
  if el != none and el.func() == heading {

    [#it (#el.body)]
  } else [#it]
}

// color links and references
//#show ref: set text(fill: color.blue)
//#show link: set text(fill: color.blue)


// style table-of-contents
#show outline.entry.where(
  level: 1
): it => { strong(it) }



// Draft Settings //
#show cite: set text(fill: black) if inwriting
#show footnote: set text(fill: black) if inwriting
#set cite(style: "chicago-author-date") if inwriting

// ------ Deckblatt ------

#include "Deckblatt.typ"

// ------ Content ------

// Table of contents.
#outline(
  title: {
    text(1.3em, weight: 700, "Content")
    v(10mm)
  },
  indent: 2em,
  depth: 3
)
#pagebreak(weak: false)


// --- Chapters ---


#include "Chapter_Introduction.typ"


// --- Appendixes ---

// restart page numbering using roman numbers
//#set page(numbering: "i")
//#counter(page).update(1)


#include("Chapter_Appendix.typ")

// List of Acronyms.
#heading(numbering: none)[List of Acronyms]
#print-glossary(glossary)

// List of figures.
#heading(numbering: none)[List of Figures]
#outline(
  title: none,
  target: figure.where(kind: image),
)

// List of tables.
#heading(numbering: none)[List of Tables]
#outline(
  title: none,
  target: figure.where(kind: table)
)

// KI Verzeichnis
#heading(numbering: none)[KI-Verzeichnis]
#include "KI-Verzeichnis.typ"

// --- Bibliography ---

#set par(leading: 0.7em, first-line-indent: 0em, justify: true)
#bibliography("items.bib", style: "ieee")