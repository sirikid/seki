(load "./guix/github.com%2Fsirikid%2Fseki/packages.scm")

(use-modules
 (github.com%2Fsirikid%2Fseki packages)
 (guix gexp)
 (guix git-download)
 (guix packages))

(package
  (inherit seki)
  (version "git")
  (source
   (let ((dir (dirname (current-filename))))
     (local-file dir #:recursive? #t #:select? (git-predicate dir)))))
