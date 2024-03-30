(load "./guix/sklv/packages/seki.scm")

(use-modules
 (guix gexp)
 (guix git-download)
 (guix packages)
 (sklv packages seki))

(package
  (inherit seki)
  (version "git")
  (source
   (let ((dir (dirname (current-filename))))
     (local-file dir #:recursive? #t #:select? (git-predicate dir)))))
