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
