# Phycat for InkDo

Eleven [InkDo](https://github.com/karimboubouh/InkDoV2) themes ported from
**[Phycat](https://github.com/sumruler/typora-theme-phycat)** by **sumruler (徐继龙)**, the Typora
theme series (MIT, v2.7.2, 2026-03-01). All credit for the design goes upstream; this repository
only carries it across to InkDo's editor.

| Light (phycat-color) | Dark (phycat-neon) |
| --- | --- |
| Cherry, Caramel, Forest, Mint, Sky, Prussian, Sakura, Mauve | Vampire, Radiation, Abyss |

InkDo ships these themes on its Community shelf (Settings › Appearance › Community), so most
people never need this repository. It exists so the port has a home of its own, like any other
community theme: you can read it, fork it, and send fixes.

## Install one by hand

1. Pick a folder in `themes/`, e.g. `themes/Cherry/`.
2. Compress it in Finder (Cherry.zip).
3. In InkDo: Settings (⌘,) › Appearance › Theme › **Import .zip…**

## Layout

```
src/palettes/<name>.css   InkDo's tokens (checked at 4.5:1) and upstream's colours as --pc-*
src/chrome.css            headings, marks and links, after upstream phycat.light.css
src/blocks.css            quotes, rules, code, highlights, tasks and tables
src/neon.css              the dark series' glass and glow, after upstream phycat.dark.css
build.sh                  writes themes/<Name>/theme.css (palette + chrome + blocks [+ neon])
themes/<Name>/theme.css   built; one complete theme each
```

Edit `src/`, run `./build.sh`, then import the theme to try it.

## What differs from upstream

InkDo themes are CSS with three limits (InkDo's THEMING.md), and the port keeps to them:

- **Nothing loads.** No fonts or images: upstream's chain icon on links (an SVG mask) is drawn
  with two bordered links in the same thin line, turning the same half circle on hover. The
  heading icons, page textures and code-block window dots, all SVG images upstream, are left
  out. Fonts are named (Optima, Cascadia Code) and used when they are installed.
- **No margins.** InkDo's editor measures every line, so spacing stays InkDo's; the H2 pill is
  drawn behind the line instead of around a block.
- **Readable text.** Text you read (bold, links, hover colours) uses each palette's InkDo accent,
  checked at 4.5:1 against the page. Upstream's lighter colours draw the decorations. The H2
  pill keeps upstream's white on its gradient, which is lighter than 4.5:1 in some palettes.

Quotes become a bubble across their lines (✨, or 💡 in the dark series) without the hover zoom,
since a quote is a row of lines in InkDo, not one block.

## Licence

MIT, as upstream: see [LICENSE](LICENSE), which keeps upstream's copyright notice.
