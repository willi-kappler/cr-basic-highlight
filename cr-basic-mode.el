;;; cr-basic-mode.el

;; Copyright © 2016, Willi Kappler

;; Author: Willi Kappler ( grandorgmx.de )
;; Version: 0.1.0
;; Created: 26 Sep 2016
;; Keywords: CR Basic
;; Homepage: https://www.github.com/
;; Based on the nice tutorial of Xah Lee: http://ergoemacs.org/emacs/elisp_syntax_coloring.html

;; This file is not part of GNU Emacs.

;;; License:

;; You can redistribute this program and/or modify it under the terms of the GNU General Public License version 2.

;;; Commentary:

;; Simple syntax highlighting mode for CR basic


;;; Code:

;; define several category of keywords
;; TODO: This is not a complete list...
(setq cr-basic-keywords '("StationName" "Const" "Dim" "Alias" "Units" "DataTable" "EndTable" "Sub" "EndSub" "If" "EndIf" "Then" "Else" "BeginProg" "For" "Next" "Call" "Scan" "NextScan" "SlowSequence" "EndSequence" "EndProg" "Do" "While" "Loop" "ExitFor" "True" "False" "As"))
(setq cr-basic-types '("String" "Boolean" "Long" "FP2" "IEEE4"))
(setq cr-basic-functions '("SerialOpen" "SerialOut" "SerialIn" "SerialOutBlock" "SerialClose" "SetStatus" "PortSet" "CallTable" "DataInterval" "TableFile" "Average" "Maximum" "FieldNames" "Totalize" "Minimum" "CardOut" "WindVector" "DataEvent" "Sample" "TimeIntoInterval" "FileOpen" "FileRead" "FileClose" "NaN" "CheckSum" "CHR" "Trim"))
(setq cr-basic-operators '("\+" "-" "\*" "/" "=" "<" ">" "AND" "OR"))

;; generate regex string for each category of keywords
(setq cr-basic-keywords-regexp (regexp-opt cr-basic-keywords 'words))
(setq cr-basic-type-regexp (regexp-opt cr-basic-types 'words))
(setq cr-basic-functions-regexp (regexp-opt cr-basic-functions 'words))
(setq cr-basic-operators-regexp (regexp-opt cr-basic-operators))

;; create the list for font-lock.
;; each category of keyword is given a particular face
(setq cr-basic-font-lock-keywords
      `(
	("'.*" . font-lock-comment-face)
	("\".*?\"" . font-lock-string-face)
        (,cr-basic-type-regexp . font-lock-type-face)
        (,cr-basic-functions-regexp . font-lock-function-name-face)
        (,cr-basic-keywords-regexp . font-lock-keyword-face)
        (,cr-basic-operators-regexp . font-lock-constant-face)
        ))

;;;###autoload
(define-derived-mode cr-basic-mode prog-mode "cr-basic mode"
  "Major mode for editing CR-Basic files"

  ;; code for syntax highlighting
  (setq font-lock-defaults '((cr-basic-font-lock-keywords) t))
  )

;; clear memory. no longer needed
(setq cr-basic-keywords nil)
(setq cr-basic-types nil)
(setq cr-basic-functions nil)
(setq cr-basic-operators nil)

;; clear memory. no longer needed
(setq cr-basic-keywords-regexp nil)
(setq cr-basic-types-regexp nil)
(setq cr-basic-functions-regexp nil)
(setq cr-basic-operators-regexp nil)

;; add the mode to the `features' list
(provide 'cr-basic-mode)

;; Local Variables:
;; coding: utf-8
;; End:

;;; cr-basic-mode.el ends here
