# UCL PhD Thesis Template

This repository contains a UCL-branded PhD thesis LaTeX template adapted from an Imperial College report template.

## Compile

Use LuaLaTeX. On Overleaf, the included `latexmkrc` should select LuaLaTeX automatically. If Overleaf still reports a `fontspec` error, set **Menu > Compiler > LuaLaTeX** manually.

The main entry point is:

```tex
main.tex
```

## Layout modes

The default class layout keeps the UCL binding margin: 4cm at the binding edge and 2.5cm at the outer edge. This is the safer setting for final submission or printing.

For electronic drafting and reading, you can use symmetrical 2.5cm side margins:

```tex
\documentclass[11pt,symmetricmargins]{ucl_phd_thesis}
```

Remove `symmetricmargins` before final submission if your department expects the UCL binding-edge margin.

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
