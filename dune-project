(lang dune 3.11)

(name tty)

(generate_opam_files true)

(source (github leostera/tty))

(authors "Leandro Ostera <leandro@abstractmachines.dev>")

(maintainers "Leandro Ostera <leandro@abstractmachines.dev>")

(license MIT)

(package
 (name tty)
 (synopsis "A library for interacting with teletype and terminal emulators")
 (description "TTY is a library for directly interacting with teletypes and terminal emulators, including escape sequences, colors, and consuming stdin")
 (depends
   (ocaml (>= "5.1"))
   (uutf (>= "1.0.3")))
 (tags (terminal ansi tty teletype utf8)))

