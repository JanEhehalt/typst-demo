#import "utils.typ": todo
#import "glossary.typ": glossary

= Introduction <chapter_introduction>

== Subchapter 1

#todo[TODO: BACHELORARBEIT]

// Der language server checkt das hier leider nicht hrmpf :(
ZITAT: @cite_todo
Ich kann auch @hosney2022artificial zitieren. :)

When using a acronym for the first time it looks like this: 

@rest

When using a acronym a second time it looks like this: 

@rest


#lorem(10)

== Subchapter 2

As shown in @dummy_figure, this is wonderful. Typst documentation #footnote(link("https://typst.app/docs")) or that way #footnote[Google einfach]. Look at @einstein. Du kannst dir auch mal @dummy_table anschauen.

#figure(
  [#image("dummy_image.svg", width: 25%)],
  caption: [
    CAPTION DUMMY BILD
  ]
) <dummy_figure>

#figure(
  [
    #table(
      columns: 2,
      [*Amount*], [*Ingredient*],
      [360g], [Baking flour],
      [250g], [Butter (room temp.)],
      [150g], [Brown sugar],
      [100g], [Cane sugar],
      [100g], [70% cocoa chocolate],
      [100g], [35-40% cocoa chocolate],
      [2], [Eggs],
      [Pinch], [Salt],
      [Drizzle], [Vanilla extract],
    )
  ],
  caption: [
    CAPTION DUMMY TABELLE
  ]
) <dummy_table>

MATHEMATIK
$
E = M C^2
$ <einstein>
