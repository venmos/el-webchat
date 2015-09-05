(unless (and (boundp 'package--initialized)
			 package--initialized)
  (package-initialize))
(define-derived-mode webchat-mode org-mode "WebChat"
  "Major mode for running webchat"
  (make-local-variable 'scroll-step)
  (setq scroll-step 2)
  (org-indent-mode 1)
  (if (require 'htmlize nil t)
	  (progn 
		(make-local-variable 'org-src-fontify-natively)
		(setq org-src-fontify-natively t))
	(warn "无法加载htmlize,无法使用本地代码高亮")))

(defun webchat-build-window (content-buffer talk-buffer)
  "构建webchat窗口模式"
  (switch-to-buffer (get-buffer-create content-buffer))
  (webchat-mode)
  (read-only-mode)
  (select-window (split-window-below -4))
  (switch-to-buffer (get-buffer-create talk-buffer))
  (webchat-mode))
(provide 'webchat-mode)
