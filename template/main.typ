#import "@preview/outrageous:0.4.0"
#import "@preview/i-figured:0.2.4"
#import "@preview/linguify:0.4.2"
#import linguify: linguify as l

/// linguify that needs external context, returning non-opaque output
#let bare-linguify(key, from: auto, lang: auto, default: auto, args: auto) = {
  import linguify.lflib: *
  let result = _linguify(key, from: from, lang: lang, args: args)
  if is-ok(result) {
    result.ok
  } else {
    if-auto-then(default, panic(result.error))
  }
}

#let font_sizes = (
  tiny: 6pt,
  scriptsize: 8pt,
  footnotesize: 9.6pt,
  small: 10pt,
  normalsize: 11.5pt,
  large: 13.8pt,
  Large: 16.70pt,
  LARGE: 20.74pt,
  huge: 24.88pt,
  Huge: 24.88pt,
)

#let auto-heading = heading.with(numbering: none)

#let frontpage(title, thesis_type, students, advisor, date) = page[
  #set align(center)

  #v(2mm)
  #[
    #set text(size: font_sizes.large)
    *#l("TÜRKİYE CUMHURİYETİ")\
    #l("YILDIZ TEKNİK ÜNİVERSİTESİ")\
    #l("BİLGİSAYAR MÜHENDİSLİĞİ BÖLÜMÜ")*
  ]

  #v(3mm)
  #image("ytu_logo.png", width: 25%)
  #v(1.8cm)

  #set text(size: font_sizes.Large)
  #if type(title) == dictionary [
    *#(context title.at(text.lang))*
  ] else [
    *#title*
  ]

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
  #l("Danışman")\ #advisor

  #v(1.78cm)
  #set text(size: font_sizes.large)
  #date
  #v(2mm)
]

#let make_abstract(title, students, advisor, abstract, keywords) = [
  #context auto-heading(bare-linguify("ÖZET"))
  #[
    #set align(center)
    #set par(justify: false)

    #text(size: font_sizes.Large)[
      #if type(title) == dictionary [
        *#(context title.at(text.lang))*
      ] else [
        *#title*
      ]
    ]

    #for student in students [
      #student.name\
    ]

    #l("Bilgisayar Mühendisliği Bölümü")\
    #l("Bilgisayar Projesi")

    #l("Danışman"): #advisor
  ]
  #abstract
  #if keywords not in ((), none) [
    #set terms(hanging-indent: 0pt)

    / #l("Anahtar Kelimeler"): #keywords.join(", ")
  ]
]

#let copyright_notice = page[
  #set align(bottom + center)
  #set text(size: font_sizes.footnotesize)
  // The negative padding counteracts page margins, making the following fit on a single line.
  #pad(x: -5em)[*#sym.copyright #l("copyright notice").*]
]

#let terms-to-grid(
  columns: (auto, 1fr),
  column-gutter: 4em,
  row-gutter: 1.5em,
  it,
) = grid(
  columns: columns,
  column-gutter: column-gutter,
  row-gutter: row-gutter,
  ..it.children.map(c => (c.term, c.description)).flatten()
)

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
  #let lang_db = toml("/lang.toml")
  #linguify.set-database(lang_db)

  #set page(
    paper: "a4",
    margin: (left: 35mm, rest: 25mm),
    binding: left,
  )
  #set text(
    font: "XCharter",
    number-width: "tabular",
    size: font_sizes.normalsize,
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

  #show heading: set block(above: 3em, below: 1em)

  // Section header rule
  #show heading.where(level: 1): it => {
    set align(end)
    pagebreak(weak: true)
    stack(
      dir: ttb,
      v(3em),
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

  // Per-chapter figure numbering
  #show heading.where(level: 1): it => (
    counter(figure.where(kind: image)).update(0) + it
  )
  #set heading(numbering: "1")
  #set figure(
    numbering: num => numbering(
      "1.1",
      counter(heading).get().first(),
      num,
    ),
  )

  #if acknowledgement not in ([], none) [
    #context auto-heading[#bare-linguify("TEŞEKKÜR")]
    #acknowledgement
    #align(right, students.map(s => s.name).join(linebreak()))
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
      title: [#l("İÇİNDEKİLER")],
      indent: auto,
    )
  }

  #if symbols not in ([], none) [
    #context auto-heading(bare-linguify("SİMGE LİSTESİ"))

    #show terms: terms-to-grid
    #symbols
  ]

  #if abbreviations not in ([], none) [
    #context auto-heading(bare-linguify("KISALTMA LİSTESİ"))

    #show terms: terms-to-grid
    #abbreviations
  ]

  #let selector_figures = figure.where(kind: image)
  #context if query(selector_figures).len() > 0 [
    #context auto-heading(bare-linguify("ŞEKİL LİSTESİ"))
    #outline(title: none, target: selector_figures)
  ]

  #let selector_tables = figure.where(kind: table)
  #context if query(selector_tables).len() > 0 [
    #auto-heading(l("TABLO LİSTESİ"))
    #outline(title: none, target: selector_tables)
  ]

  #if abstract not in ([], none) {
    if type(abstract) == dictionary {
      for (lang, abstract) in abstract.pairs() {
        set text(lang: lang)
        make_abstract(title, students, advisor, abstract, keywords.at(lang))
      }
    } else {
      make_abstract(title, students, advisor, abstract, keywords)
    }
  }

  #set heading(numbering: "1.1")
  #set page(numbering: "1")

  #show figure.where(kind: image): set figure(supplement: l("Şekil"))
  #show figure.where(kind: table): set figure(supplement: l("Tablo"))
  #show figure.where(kind: raw): set figure(supplement: l("Kod"))
  #show figure.where(kind: table): set figure.caption(position: top)
  #set list(indent: 1.5em)

  #counter(page).update(1)

  #it

  #context {
    bibliography(
      "/references.bib",
      title: bare-linguify("Referanslar"),
      style: "ieee",
    )
  }

  #context heading(numbering: none, bare-linguify("Özgeçmiş"))

  #for student in students [
    #set terms(separator: [: ])
    / #l("İsim-Soyisim"): #student.name
    / #l("Doğum Tarihi ve Yeri"): #student.birthdate.display("[day].[month].[year]"), #student.birthplace
    / #l("Email"): #link("mailto:" + student.email)
    / #l("Telefon"): #student.phone
  ]
]
