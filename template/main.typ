#import "@preview/outrageous:0.1.0"
#import "@preview/i-figured:0.2.4"

#let font_sizes = (
  tiny: 6pt,
  scriptsize: 8pt,
  footnotesize: 9.6pt,
  small: 10.95pt,
  normalsize: 11.5pt,
  large: 13.8pt,
  Large: 16.70pt,
  LARGE: 20.74pt,
  huge: 24.88pt,
  Huge: 24.88pt,
)

#let frontpage(title, thesis_type, students, advisor, date) = page[
  #set align(center)

  #v(2mm)
  #[
    #set text(size: font_sizes.large)
    *TÜRKİYE CUMHURİYETİ\
    YILDIZ TEKNİK ÜNİVERSİTESİ\
    BİLGİSAYAR MÜHENDİSLİĞİ BÖLÜMÜ*
  ]

  #v(3mm)
  #image("ytu_logo.png", width: 25%)
  #v(1.8cm)

  #set text(size: font_sizes.Large)
  *#title*

  #set align(horizon)
  #grid(
    columns: (auto, auto, auto),
    align: (right, center, left),
    column-gutter: 0.3em,
    row-gutter: 1em,
    ..for student in students {
      (student.no, [--], student.name)
    },
  )

  #set align(bottom)

  #set text(size: font_sizes.large)
  *#thesis_type*

  #v(2.2cm)
  #set text(size: font_sizes.normalsize)
  Danışman\ #advisor

  #v(1.78cm)
  #set text(size: font_sizes.large)
  #date
  #v(2mm)
]

#let copyright_notice = page[
  #set align(bottom + center)
  #set text(size: font_sizes.footnotesize)
  // The negative padding counteracts page margins, making the following fit on a single line.
  #pad(x: -5em)[*#sym.copyright Bu projenin bütün hakları Yıldız Teknik Üniversitesi Bilgisayar Mühendisliği Bölümü'ne aittir.*]
]

#let template(
  title: [TITLE],
  thesis_type: [THESIS],
  students: (),
  abstract: [],
  keywords: (),
  advisor: [],
  date: [],
  abbreviations: [],
  symbols: [],
  acknowledgement: [],
  it,
) = [
  #set page(
    paper: "a4",
    margin: (left: 35mm, rest: 25mm),
    binding: left,
  )
  #set text(
    font: "XCharter",
    number-width: "tabular",
    size: 12pt,
  )

  #frontpage(title, thesis_type, students, advisor, date)
  #copyright_notice
  
  #set par(
    leading: 0.90em,
    justify: true,
    spacing: 2em,
  )

  #counter(page).update(1)
  #set page(numbering: "i")

  #show heading.where(level: 1): it => {
    set align(end)
    pagebreak(weak: true)
    stack(
      dir: ttb,
      if it.numbering != none [
        #set text(size: font_sizes.Huge)
        #numbering(it.numbering, ..counter(heading).get())
      ],
      v(0.5em),
      it.body,
      v(0.6cm),
      line(length: 100%, stroke: 0.3pt),
      v(2em),
    )
  }

  #if acknowledgement not in ([], none) [
    #heading(outlined: false)[TEŞEKKÜR]
    #set text(size: font_sizes.normalsize)
    #acknowledgement
  ]

  #{
    show outline.entry: outrageous.show-entry.with(
      ..outrageous.presets.typst,
      font-weight: ("bold", auto),
      fill: (none, repeat(gap: 0.4em)[.]),
      fill-right-pad: 1.5em,
      vspace: (1.5em, none),
    )

    outline(
      title: [İÇİNDEKİLER],
      indent: auto,
    )
  }

  #if symbols not in ([], none) [
    = SİMGE LİSTESİ

    #{
      show terms: it => grid(
        columns: (auto, 1fr),
        column-gutter: 4em,
        row-gutter: 1.5em,
        ..it.children.map(c => (c.term, c.description)).flatten()
      )

      symbols
    }
  ]

  #if abbreviations not in ([], none) [
    = KISALTMA LİSTESİ

    #{
      show terms: it => grid(
        columns: (auto, 1fr),
        column-gutter: 4em,
        row-gutter: 1.5em,
        ..it.children.map(c => (c.term, c.description)).flatten()
      )

      abbreviations
    }
  ]

  #context if query(figure).len() > 0 [
    = ŞEKİL LİSTESİ
    #outline(title: none, target: figure)
  ]

  #if abstract not in ([], none) [
    = ÖZET
    #[
      #set align(center)
      #set par(justify: false)
      #text(size: font_sizes.Large)[*#title*]

      #for student in students [
        #student.name\
      ]

      Bilgisayar Mühendisliği Bölümü\
      Bilgisayar Projesi

      Danışman: #advisor
    ]
    #abstract
  ]

  #if keywords not in ((), none) [
    #set terms(hanging-indent: 0pt)
    / Anahtar Kelimeler: #keywords.join(", ")
  ]

  #set heading(numbering: "1.1")
  #set page(numbering: "1")

  #counter(page).update(1)

  #it

  #bibliography("/references.bib", title: "Referanslar", style: "ieee")

  #heading(numbering: none)[Özgeçmiş]

  #for student in students [
    #set terms(separator: [: ])
    / İsim-Soyisim: #student.name
    / Doğum Tarihi ve Yeri: #student.birthdate.display("[day].[month].[year]"), #student.birthplace
    / Email: #link("mailto:" + student.email)
    / Telefon: #student.phone
  ]
]
