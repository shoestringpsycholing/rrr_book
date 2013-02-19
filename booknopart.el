;; This code adds a `booknopart' option for org-mode export, which
;; gets rid of the `part' level of sections in a regular LaTeX
;; book class.  To use this, evaluate this elisp code, or put this 
;; in your .emacs file.  Then in the top of your org-mode file, put:
;; #+LATEX_CLASS booknopart
;; Then when you do export to LaTeX (C-c C-e l) or PDF (C-c C-e p),
;; it will export the higher heading levels as \chapter, not \part.
(require 'org-latex)
(add-to-list 'org-export-latex-classes
             '("booknopart"
               "\\documentclass{book}"
               ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
             )
