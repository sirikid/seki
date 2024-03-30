(define-module (sklv packages seki)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system gnu)
  #:use-module (guix git-download)
  #:use-module (guix licenses)
  #:use-module (guix packages))

(define-public seki
  (let ((revision "2")
        (commit "f594dd96d0359be67b640c14705f593247afb0f4"))
    (package
      (name "seki")
      (version (git-version "0.1.5" revision commit))
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
       (list #:tests? #f))
      (native-inputs
       (list autoconf automake pkg-config))
      (home-page "https://github.com/sirikid/seki")
      (synopsis "Example of using Make")
      (description #f)
      (license gpl3))))
