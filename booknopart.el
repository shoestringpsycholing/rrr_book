;; This code adds a `custom-book' option for org-mode export, which
;; gets rid of the `part' level of sections in a regular LaTeX
;; book class, and also removes loading of the org-mode default packages.  
;; To use this, evaluate this elisp code, or put this in your .emacs file.
;; Then in the top of your org-mode file, put: 
;; #+LATEX_CLASS booknopart
;; Then when you do export to LaTeX (C-c C-e l) or PDF (C-c C-e p),
;; it will export the higher heading levels as \chapter, not \part.
(require 'org-latex)
(add-to-list 'org-export-latex-classes
             '("custom-book"
               "\\documentclass{book}
               [NO-DEFAULT-PACKAGES][PACKAGES][EXTRA]"
               ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
             )
