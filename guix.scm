(define-module (sklv packages seki)
  #:use-module (guix build-system gnu)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix licenses)
  #:use-module (guix packages))

(define-public seki
  (let ((revision "1")
        (commit "abc93488deccfb21c9995b8de9a81abad9e139c8"))
    (package
      (name "seki")
      (version (git-version "0.1.4" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri
          (git-reference
           (url "https://github.com/sirikid/seki.git")
           (commit commit)))
         (sha256
          (base32 "1ijcrkfklf5wxmzwdq5c3c7dhzm44wirz3ky4dhs0w4c3v4zfi0d"))
         (file-name (git-file-name name version))))
      (build-system gnu-build-system)
      (arguments
       (list
        #:tests? #f
        #:make-flags #~(list "CC=gcc" (string-append "PREFIX=" #$output))
        #:phases
        #~(modify-phases %standard-phases
            (delete 'configure))))
      (home-page "https://github.com/sirikid/seki")
      (synopsis "Example of using Make")
      (description #f)
      (license gpl3))))

(package
  (inherit seki)
  (version "git")
  (source
   (let ((dir (dirname (current-filename))))
     (local-file dir #:recursive? #t #:select? (git-predicate dir)))))
