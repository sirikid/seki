(load "./guix/github.com/sirikid/seki/packages.scm")

(use-modules
 (github.com/sirikid/seki packages)
 (guix gexp)
 (guix git-download)
 (guix packages))

(package
  (inherit seki)
  (version "git")
  (source
   (let ((dir (dirname (current-filename))))
     (local-file dir #:recursive? #t #:select? (git-predicate dir)))))
