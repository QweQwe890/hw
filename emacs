cscope-indexer -r
 
C-c s s         Find symbol.
C-c s d         Find global definition.
C-c s g         Find global definition (alternate binding).
C-c s G         Find global definition without prompting.
C-c s c         Find functions calling a function.
C-c s C         Find called functions (list functions called from a function).
C-c s t         Find text string.
C-c s e         Find egrep pattern.
C-c s f         Find a file.
C-c s i         Find files #including a file.
 
C-c s b         Display *cscope* buffer.
C-c s B         Auto display *cscope* buffer toggle.
C-c s n         Next symbol.
C-c s N         Next file.
C-c s p         Previous symbol.
C-c s P         Previous file.
C-c s u         Pop mark.
 
(define-key global-map [(control f1)] 'ecb-hide-ecb-windows)
(define-key global-map [(control f2)] 'ecb-show-ecb-windows)
(define-key global-map [(control f3)]  'cscope-set-initial-directory)
(define-key global-map [(control f4)]  'cscope-unset-initial-directory)
(define-key global-map [(f5)]  'cscope-find-this-symbol)
(define-key global-map [(f6)]  'cscope-find-global-definition)
(define-key global-map [(f7)]  'cscope-find-global-definition-no-prompting)
(define-key global-map [(f8)]  'cscope-pop-mark)
(define-key global-map [(f9)]  'cscope-next-symbol)
(define-key global-map [(f10)] 'cscope-next-file)
(define-key global-map [(f11)] 'cscope-prev-symbol)
(define-key global-map [(f12)] 'cscope-prev-file)
(define-key global-map [(meta f9)]     'cscope-display-buffer)
(define-key global-map [(meta f10)]    'cscope-display-buffer-toggle)


(add-to-list 'load-path "~/.emacs.d/slip")

(setq url-proxy-services
   '(("no_proxy" . "^\\(localhost\\|192.*\\)")
     ("http" . "y00:x_2Y@openproxy.xxxx.com:8080")
     ("https" . "y00:x_2Y@openproxy.xxxx.com:8080")))

(setq url-http-proxy-basic-auth-storage
    (list (list "openproxy.huawei.com:8080"
                (cons "Input your LDAP UID !"
                      (base64-encode-string "y00403075:x_2Y0059")))))

(with-eval-after-load 'url-http
  (defun url-https-proxy-connect (connection)
    (setq url-http-after-change-function 'url-https-proxy-after-change-function)
    (process-send-string connection (format (concat "CONNECT %s:%d HTTP/1.1\r\n"
                            "Host: %s\r\n"
                            (let ((proxy-auth (let ((url-basic-auth-storage
                                         'url-http-proxy-basic-auth-storage))
                                    (url-get-authentication url-http-proxy nil 'any nil))))
                              (if proxy-auth (concat "Proxy-Authorization: " proxy-auth "\r\n")))
                            "\r\n")
                        (url-host url-current-object)
                        (or (url-port url-current-object)
                        url-https-default-port)
                        (url-host url-current-object)))))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;;(require 'package)
;;(package-initialize)
;;(add-to-list'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;;(add-to-list 'package-archives
;;             '("melpa" . "http://melpa.org/packages/") t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#839496" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#fdf6e3"))
 '(beacon-color "#d33682")
 '(custom-safe-themes
   (quote
    ("6213a6047cc19f580c37ef3f6d47fd5a55ebdf9b5590475d8f7a6aecd79a1cc0" "e006d90eaf64a2d78154ecb277ccc82327e1b975d7d0e2f933acca3131cd0177" "1c10e946f9a22b28613196e4c02b6508970e3b34660282ec92d9a1c293ee81bb" "cc2f32f5ee19cbd7c139fc821ec653804fcab5fcbf140723752156dc23cdb89f" "d422c7673d74d1e093397288d2e02c799340c5dabf70e87558b8e8faa3f83a6c" "c51e302edfe6d2effca9f7c9a8a8cfc432727efcf86246002a3b45e290306c1f" "b48599e24e6db1ea612061252e71abc2c05c05ac4b6ad532ad99ee085c7961a7" "daeaa8249f0c275de9e32ed822e82ff40457dabe07347fe06afc67d962a3b1e9" "ff6a8955945028387ed1a2b0338580274609fbb0d40cd011b98ca06bd00d9233" "5e402ccb94e32d7d09e300fb07a62dc0094bb2f16cd2ab8847b94b01b9d5e866" "6a674ffa24341f2f129793923d0b5f26d59a8891edd7d9330a258b58e767778a" "4e7e04c4b161dd04dc671fb5288e3cc772d9086345cb03b7f5ed8538905e8e27" "701b4b4e7989329a0704b92fc17e6600cc18f9df4f2466617ec91c932b5477eb" "ff8c6c2eb94e776c9eed9299a49e07e70e1b6a6f926dec429b99cf5d1ddca62a" "b71da830ae97a9b70d14348781494b6c1099dbbb9b1f51494c3dfa5097729736" "1127f29b2e4e4324fe170038cbd5d0d713124588a93941b38e6295a58a48b24f" "abd7719fd9255fcd64f631664390e2eb89768a290ee082a9f0520c5f12a660a8" "0973b33d2f15e6eaf88400eee3dc8357ad8ae83d2ca43c125339b25850773a70" "deb7ae3a735635a85c984ece4ce70317268df6027286998b0ea3d10f00764c9b" "e26e879d250140e0d4c4d5ab457c32bcb29742599bd28c1ce31301344c6f2a11" "cdc2a7ba4ecf0910f13ba207cce7080b58d9ed2234032113b8846a4e44597e41" "a02c000c95c43a57fe1ed57b172b314465bd11085faf6152d151385065e0e4b1" "0e8c264f24f11501d3f0cabcd05e5f9811213f07149e4904ed751ffdcdc44739" "cb30d82b05359203c8378638dec5ad6e37333ccdda9dee8b9fdf0c902e83fad7" "6b4f7bde1ce64ea4604819fe56ff12cda2a8c803703b677fdfdb603e8b1f8bcb" "01e0367d8c3249928a2e0ebc9807b2f791f81a0d2a7c8656e1fbf4b1dbaa404c" "6291d73aaeb6a3d7e455d85ca3865260a87afe5f492b6d0e2e391af2d3ea81dd" "6c0d748fb584ec4c8a0a1c05ce1ae8cde46faff5587e6de1cc59d3fc6618e164" "335ad769bcd7949d372879ec10105245255beec6e62213213835651e2eb0b8e0" "4bcdfc98cf64ce6145684dc8288fd87489cfa839e07f95f6c791d407624d04f8" "31772cd378fd8267d6427cec2d02d599eee14a1b60e9b2b894dd5487bd30978e" "8e7044bfad5a2e70dfc4671337a4f772ee1b41c5677b8318f17f046faa42b16b" "b5cff93c3c6ed12d09ce827231b0f5d4925cfda018c9dcf93a2517ce3739e7f1" "3ed2e1653742e5059e3d77af013ee90c1c1b776d83ec33e1a9ead556c19c694b" "5f4dfda04fbf7fd55228266c8aab73953d3087cea7fd06dd7f8ff1e4a497c739" "2ae4b0c50dd49a5f74edeae3e49965bf8853954b63c5712a7967ea0a008ecd5b" "1f126eb4a1e5d6b96b3faf494c8c490f1d1e5ad4fc5a1ce120034fe140e77b88" "cb39485fd94dabefc5f2b729b963cbd0bac9461000c57eae454131ed4954a8ac" "0ca71d3462db28ebdef0529995c2d0fdb90650c8e31631e92b9f02bd1bfc5f36" "fc1137ae841a32f8be689e0cfa07c872df252d48426a47f70dba65f5b0f88ac4" "aad7fd3672aad03901bf91e338cd530b87efc2162697a6bef79d7f8281fd97e3" "fe349b21bb978bb1f1f2db05bc87b2c6d02f1a7fe3f27584cd7b6fbf8e53391a" "a11043406c7c4233bfd66498e83600f4109c83420714a2bd0cd131f81cbbacea" "63aff36a40f41b28b0265ac506faa098fd552fac0a1813b745ba7c27efa5a943" "780c67d3b58b524aa485a146ad9e837051918b722fd32fd1b7e50ec36d413e70" "57d7e8b7b7e0a22dc07357f0c30d18b33ffcbb7bcd9013ab2c9f70748cfa4838" "d9e811d5a12dec79289c5bacaecd8ae393d168e9a92a659542c2a9bab6102041" "b4fd44f653c69fb95d3f34f071b223ae705bb691fb9abaf2ffca3351e92aa374" "9a3c51c59edfefd53e5de64c9da248c24b628d4e78cc808611abd15b3e58858f" "9dc64d345811d74b5cd0dac92e5717e1016573417b23811b2c37bb985da41da2" "6cf0e8d082a890e94e4423fc9e222beefdbacee6210602524b7c84d207a5dfb5" "f831c1716ebc909abe3c851569a402782b01074e665a4c140e3e52214f7504a0" "11e5e95bd3964c7eda94d141e85ad08776fbdac15c99094f14a0531f31a156da" "595099e6f4a036d71de7e1512656e9375dd72cf60ff69a5f6d14f0171f1de9c1" "ed92c27d2d086496b232617213a4e4a28110bdc0730a9457edf74f81b782c5cf" "5eb4b22e97ddb2db9ecce7d983fa45eb8367447f151c7e1b033af27820f43760" "b8c5adfc0230bd8e8d73450c2cd4044ad7ba1d24458e37b6dec65607fc392980" "1a094b79734450a146b0c43afb6c669045d7a8a5c28bc0210aba28d36f85d86f" "db510eb70cf96e3dbd48f5d24de12b03db30674ea0853f06074d4ccf7403d7d3" "6e03b7f86fcca5ce4e63cda5cd0da592973e30b5c5edf198eddf51db7a12b832" "67b11ee5d10f1b5f7638035d1a38f77bca5797b5f5b21d16a20b5f0452cbeb46" "3fe4861111710e42230627f38ebb8f966391eadefb8b809f4bfb8340a4e85529" "5c83b15581cb7274085ba9e486933062652091b389f4080e94e4e9661eaab1aa" "da8e6e5b286cbcec4a1a99f273a466de34763eefd0e84a41c71543b16cd2efac" "77515a438dc348e9d32310c070bfdddc5605efc83671a159b223e89044e4c4f1" "a513bb141af8ece2400daf32251d7afa7813b3a463072020bb14c82fd3a5fe30" "9bd5ee2b24759fbc97f86c2783d1bf8f883eb1c0dd2cf7bda2b539cd28abf6a9" "0c5204945ca5cdf119390fe7f0b375e8d921e92076b416f6615bbe1bd5d80c88" "39a854967792547c704cbff8ad4f97429f77dfcf7b3b4d2a62679ecd34b608da" "2d5c40e709543f156d3dee750cd9ac580a20a371f1b1e1e3ecbef2b895cf0cd2" "392f19e7788de27faf128a6f56325123c47205f477da227baf6a6a918f73b5dc" "7bd626fcc9fbfb44186cf3f08b8055d5a15e748d5338e47f9391d459586e20db" "be5b03913a1aaa3709d731e1fcfd4f162db6ca512df9196c8d4693538fa50b86" "a455366c5cdacebd8adaa99d50e37430b0170326e7640a688e9d9ad406e2edfd" "fb09acc5f09e521581487697c75b71414830b1b0a2405c16a9ece41b2ae64222" "72c530c9c8f3561b5ab3bf5cda948cd917de23f48d9825b7a781fe1c0d737f2f" "d8a7a7d2cffbc55ec5efbeb5d14a5477f588ee18c5cddd7560918f9674032727" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "8530b2f7b281ea6f263be265dd8c75b502ecd7a30b9a0f28fa9398739e833a35" default)))
 '(ecb-options-version "2.50")
 '(ecb-source-path (quote (("/" "/"))))
 '(ecb-windows-height 0.8)
 '(ecb-windows-width 0.5)
 '(fci-rule-color "#073642")
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(frame-background-mode (quote dark))
 '(org-export-backends (quote (ascii html icalendar latex md odt)))
 '(package-selected-packages
   (quote
    (color-theme-x colorless-themes magit color-theme color-theme-approximate color-theme-buffer-local color-theme-modern color-theme-sanityinc-solarized color-theme-sanityinc-tomorrow color-theme-solarized ecb window-numbering)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#cb4b16")
     (60 . "#b58900")
     (80 . "#859900")
     (100 . "#2aa198")
     (120 . "#268bd2")
     (140 . "#d33682")
     (160 . "#6c71c4")
     (180 . "#dc322f")
     (200 . "#cb4b16")
     (220 . "#b58900")
     (240 . "#859900")
     (260 . "#2aa198")
     (280 . "#268bd2")
     (300 . "#d33682")
     (320 . "#6c71c4")
     (340 . "#dc322f")
     (360 . "#cb4b16"))))
 '(vc-annotate-very-old-color nil)
 '(window-divider-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;时间显示设置
;;启用时间显示设置，在minibuffer上面的那个杠上
(display-time-mode 1)
;;时间使用24小时制
(setq display-time-24hr-format t)
;;时间显示包括日期和具体时间
(setq display-time-day-and-date t)
(setq display-time-format "%Y/%m/%d %A %H:%M")
(setq display-time-interval 10)
;;显示时间的格式

;;;(require 'color-theme)
;;;(color-theme-initialize)
(setq color-theme-is-global t)
;;;(load-theme 'jonadabian-slate)
;;;(load-theme 'kingsajz)
;;;(load-theme 'pok-wog)
;;;(load-theme 'resolve)
;;(load-theme 'sanityinc-tomorrow-eighties)
(load-theme 'charcoal-black)

;; then in your init you can load all of the themes
;; without enabling theme (or just load one)
;;(load-theme 'ample t t)
;;;(load-theme 'ample-flat t t)
;;;(load-theme 'ample-light t t)
;; choose one to enable
;;(enable-theme 'ample)
;;;(enable-theme 'ample-flat)
;; (enable-theme 'ample-light)


(require 'window-numbering)
(window-numbering-mode 1)
(setq window-numbering-assign-func
      (lambda () (when (equal (buffer-name) "*Calculator*") 9)))

(require 'linum)
(setq linum-format "%3d| ")
(global-linum-mode 1)
(column-number-mode t)
(global-hl-line-mode 1) ;当前行高亮
(show-paren-mode t) ;括号匹配高亮

(setq whitespace-line-column 80)
(setq whitespace-style '(face empty tabs lines-tail trailing))

(setq default-tab-width 8)
(setq indent-tabs-mode nil)
(setq c-default-style "linux")


;;cedet
(semantic-mode 1)
(defun my:add-semantic-to-autocomplete()
  (add-to-list 'ac-sources 'ac-source-semantic))
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)

(global-semanticdb-minor-mode t)         ;;缓存解析过的源代码的结果，以便以后可以使用
(global-semantic-idle-scheduler-mode t)  ;;emacs空闲时分析源代码
(global-semantic-idle-summary-mode t)    ;;对当前位点处符号，显示分析出来的结果的摘要
(global-semantic-idle-completions-mode t);;代码补全功能，可以使用命令进行选择
(global-semantic-decoration-mode t)      ;;顾名思义，使用不同的显示风格来显示分析出来的不同结果
(global-semantic-highlight-func-mode t)  ;;高亮函数或者标签的声明行
(global-semantic-stickyfunc-mode t)      ;;在文本的最上层显示函数的声明信息
(global-semantic-mru-bookmark-mode t)    ;;保存使用过的所有tag，mru是最多最近使用的意思
;;f2补全快捷键
;;(global-set-key [f2] 'semantic-ia-complete-symbol-menu)

(require 'semantic/analyze)
(provide 'semantic-analyze)
(provide 'semantic-ctxt)
(provide 'semanticdb)
(provide 'semanticdb-find)
(provide 'semanticdb-mode)
(provide 'semantic-load)
(setq stack-trace-on-error t)
(require 'ecb)

(setq ecb-auto-activate t)
(setq ecb-tip-of-the-day nil)




;;;; 各窗口间切换
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)

;;; 隐藏和显示ecb窗口
(require 'xcscope)
(define-key global-map [(control f1)] 'ecb-hide-ecb-windows)
(define-key global-map [(control f2)] 'ecb-show-ecb-windows)
(define-key global-map [(control f3)]  'cscope-set-initial-directory)
(define-key global-map [(control f4)]  'cscope-unset-initial-directory)
(define-key global-map [(f5)] 'cscope-prev-symbol)
(define-key global-map [(f6)]  'cscope-find-this-symbol)
(define-key global-map [(f7)]  'cscope-find-global-definition)
(define-key global-map [(f8)]  'cscope-next-symbol)
;;;(define-key global-map [(f9)]  'cscope-find-global-definition-no-prompting)
(define-key global-map [(f9)]  'cscope-find-this-text-string)
(define-key global-map [(f10)]  'cscope-pop-mark)
(define-key global-map [(f11)] 'cscope-next-file)
(define-key global-map [(f12)] 'cscope-prev-file)
(define-key global-map [(meta f9)]     'cscope-display-buffer)
(define-key global-map [(meta f10)]    'cscope-display-buffer-toggle)

;;;; 使某一ecb窗口最大化
;;(define-key global-map "/C-c1" 'ecb-maximize-window-directories)
;;(define-key global-map "/C-c2" 'ecb-maximize-window-sources)
;;(define-key global-map "/C-c3" 'ecb-maximize-window-methods)
;;(define-key global-map "/C-c4" 'ecb-maximize-window-history)
;;;; 恢复原始窗口布局
;;(define-key global-map "/C-c`" 'ecb-restore-default-window-sizes)

;;;(ecb-layout-define "my-cscope-layout" left nil
;;;                   (ecb-set-methods-buffer)
;;;                   (ecb-split-ver 0.3 t)
;;;                   (other-window 1)
;;;                   (ecb-set-sources-buffer)
;;;                   (ecb-split-ver 0.3 t)
;;;                   (other-window 1)
;;;                   (ecb-set-cscope-buffer))

(ecb-layout-define "my-cscope-layout" top nil
                   (select-window (next-window))
                   (ecb-split-ver 0.8 t)
                   (ecb-set-methods-buffer)
                   (ecb-split-hor 0.4)
                   (ecb-set-cscope-buffer))

(defecb-window-dedicator-to-ecb-buffer ecb-set-cscope-buffer " *ECB cscope-buf*"
                         (switch-to-buffer "*cscope*")
                         (set-window-dedicated-p (selected-window) nil))


(setq ecb-layout-name "my-cscope-layout")
;;;(setq ecb-layout-name "top2")

;; Disable buckets so that history buffer can display more entries
(setq ecb-history-make-buckets 'never)

(defun display-buffer-at-bottom--display-buffer-at-bottom-around (orig-fun &rest args)
"Bugfix for ECB: cannot use display-buffer-at-bottom', call display-buffer-use-some-window' instead in ECB frame."
(if (and ecb-minor-mode (equal (selected-frame) ecb-frame))
(apply 'display-buffer-use-some-window args)
(apply orig-fun args)))
(advice-add 'display-buffer-at-bottom :around #'display-buffer-at-bottom--display-buffer-at-bottom-around)

;;(setq whitespace-line-column 80)
;;(setq whitespace-style '(face empty tabs lines-tail trailing))

;; 默认显示 80列就换行
;;(setq default-fill-column 80)

(add-to-list 'auto-mode-alist  '("\\.org\\'" . org-mode))
(eval-after-load "org"
  '(require 'ox-gfm nil t))

(add-hook 'org-mode-hook
        (lambda()
        (setq truncate-lines nil)))
