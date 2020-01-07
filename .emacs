;;    _______ .___  ___.      ___       ______     _______.
;;   |   ____||   \/   |     /   \     /      |   /       |
;;   |  |__   |  \  /  |    /  ^  \   |  ,----'  |   (----`
;;   |   __|  |  |\/|  |   /  /_\  \  |  |        \   \    
;; __|  |____ |  |  |  |  /  _____  \ |  `----.----)   |   
;;(__)_______||__|  |__| /__/     \__\ \______|_______/   
;;
;; file .init di emacs di Enrico
;; ultima modifica: 10.11.2019

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                    Configurazione generale                      ;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; rimuoviamo gli elementi grafici
;; (menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;; togliamo la schermata iniziale
(setq inhibit-startup-screen  t)
;;usa un font più largo
(setq default-frame-alist '((font . "Source Code Pro-13")))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                              Latex                              ;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; carica auctex e preview-latex
;; (load "auctex.el" nil t t)
;; (load "preview-latex.el" nil t t)

;; abilita autosalvataggio e parsing per i documenti latex
(setq TeX-auto-save t)
(setq TeX-parse-self t)
;; questo se si usa \include o \input nei docc latex (per documenti multi-file)
;; Ogni volta che si apre un nuovo file auctex chiede quale è il file principale
;; (setq-default Tex-master nil)

;; inizializza i pacchetti (ed è bene che stia all'inizio del fileprima del tema colori)
(package-initialize)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                           Repository                            ;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Repository MELPA
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                           Estensioni                            ;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; use-package (per utilizzare pacchetti di estensioni)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; evil mode (per avere i comandi stile vim)
(use-package evil
  :ensure t
  :init
  (evil-mode 1))

;; which-key (per visualizzare i keybindings)
(use-package which-key
  :ensure t
  :init
  (which-key-mode 1))

;; IDO (per navigare comodamente tra i buffer copo C-c C-f)
(require 'ido)
(setq ido-everywhere t)
(setq ido-create-new-buffer 'always)
(ido-mode 1)
(use-package ido-vertical-mode
  :ensure t
  :init
  (ido-vertical-mode 1))

;; evidenzia la riga del cursore
;; (global-hl-line-mode 1)

;; numeri di linea relativi
(require 'nlinum-relative)
(nlinum-relative-setup-evil)                    ;; setup for evil
(add-hook 'prog-mode-hook 'nlinum-relative-mode)
(setq nlinum-relative-redisplay-delay 0)      ;; delay
(setq nlinum-relative-current-symbol "")      ;; or "" for display current line number
(setq nlinum-relative-offset 0)                 ;; 1 if you want 0, 2, 3...

;; beacon ovvero il cursore lampeggiante
;; (use-package beacon
;;  :ensure t
;;  :init
;;  (beacon-mode 1))



  

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                          Tema colori                            ;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(blink-cursor-mode nil)
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (hemisu-dark)))
 '(custom-safe-themes
   (quote
    ("a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "77bd459212c0176bdf63c1904c4ba20fce015f730f0343776a1a14432de80990" "c1fb68aa00235766461c7e31ecfc759aa2dd905899ae6d95097061faeb72f9ee" "7feeed063855b06836e0262f77f5c6d3f415159a98a9676d549bfeb6c49637c4" "3860a842e0bf585df9e5785e06d600a86e8b605e5cc0b74320dfe667bcbe816c" "59e82a683db7129c0142b4b5a35dbbeaf8e01a4b81588f8c163bd255b76f4d21" "f11e219c9d043cbd5f4b2e01713c2c24a948a98bed48828dc670bd64ae771aa1" "2540689fd0bc5d74c4682764ff6c94057ba8061a98be5dd21116bf7bf301acfb" "47ec21abaa6642fefec1b7ace282221574c2dd7ef7715c099af5629926eb4fd7" default)))
 '(frame-brackground-mode (quote dark))
 '(fringe-mode 10 nil (fringe))
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(hl-paren-colors (quote ("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900")))
 '(linum-format " %6d ")
 '(magit-diff-use-overlays nil)
 '(main-line-color1 "#222232")
 '(main-line-color2 "#333343")
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(package-selected-packages
   (quote
    (language-detection latex-extra latex-preview-pane markdown-mode markdown-mode+ markdown-preview-eww markdown-toc pacmacs pdf-tools pdf-view-restore auctex darkroom writeroom-mode which-key use-package solarized-theme nlinum-relative nlinum-hl ido-vertical-mode hemisu-theme gruber-darker-theme grandshell-theme evil cyberpunk-theme clues-theme beacon afternoon-theme)))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(powerline-color1 "#222232")
 '(powerline-color2 "#333343")
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#d54e53")
     (40 . "goldenrod")
     (60 . "#e7c547")
     (80 . "DarkOliveGreen3")
     (100 . "#70c0b1")
     (120 . "DeepSkyBlue1")
     (140 . "#c397d8")
     (160 . "#d54e53")
     (180 . "goldenrod")
     (200 . "#e7c547")
     (220 . "DarkOliveGreen3")
     (240 . "#70c0b1")
     (260 . "DeepSkyBlue1")
     (280 . "#c397d8")
     (300 . "#d54e53")
     (320 . "goldenrod")
     (340 . "#e7c547")
     (360 . "DarkOliveGreen3"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; fine del tema di colori

