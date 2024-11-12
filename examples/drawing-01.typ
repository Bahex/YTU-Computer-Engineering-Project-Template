// Refer to the CeTZ manual at https://cetz-package.github.io/ for more information

#import "@preview/cetz:0.3.1"
#set page(width: auto, height: auto, margin: 2em)

#cetz.canvas({
  import cetz.draw: *

  set-style(
    circle: (radius: 2pt, fill: gray, stroke: black + 0.5pt),
    line: (stroke: black + 0.5pt),
  )

  let n = 10
  let step = 360deg / n
  for x in range(0, n).map(x => x * step) {
    // x is an angle, as in type(x) == angle
    // CeTZ interprets pairs in the form (angle, length) as polar coordinates

    // here, we draw the circles on layer 1, rather than the default layer 0 so
    // they are in front of the lines
    on-layer.with(1)({
      circle((x, 2), name: "inner")
      circle((x - 10deg, 3), name: "mid")
      circle((x + 5deg, 4), name: "outer")
    })

    // we can use the names existing elements in place of their coordinates
    line("inner", (x + (step * 3), 2))

    line("mid", "outer")
    line("mid", (x + step, 2))
    line("mid", (0, 0))

    line("outer", (x + 41deg, 4))
  }
})
