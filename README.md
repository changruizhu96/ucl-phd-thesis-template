# UCL PhD Thesis Template

This repository contains a UCL-branded PhD thesis LaTeX template adapted from an Imperial College report template.

## Compile

Use LuaLaTeX. On Overleaf, the included `latexmkrc` should select LuaLaTeX automatically. If Overleaf still reports a `fontspec` error, set **Menu > Compiler > LuaLaTeX** manually.

The main entry point is:

```tex
main.tex
```

## Layout modes

The default class layout uses symmetrical 2.5cm side margins for both electronic drafting and general thesis writing.

If a print copy requires a larger binding edge, add the `bindingmargins` class option:

```tex
\documentclass[11pt,bindingmargins]{ucl_phd_thesis}
```

This sets a 4cm left binding edge and keeps the right margin at 2.5cm.

## Thesis-by-publication structure

The template includes a front-matter section for publications and author contributions, followed by:

- `chapters/Chapter1.tex` for the general introduction
- `chapters/LiteratureReview.tex` for the thesis-level literature review
- `chapters/PaperChapter1.tex` to `chapters/PaperChapter4.tex` for paper-based chapters
- `chapters/Synthesis.tex` for cross-paper synthesis
- `chapters/Conclusions.tex` for conclusions and future work

Each paper-based chapter starts with `\chapterpublicationnote{...}` so that the source publication, publication status, DOI/link, copyright statement, and author contribution can be declared at the start of the chapter.

## Notes

The declaration and copyright sections contain placeholders. Replace them with the current required UCL wording before submission.
