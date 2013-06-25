include:
  - clojure
  - jvm.drip

drake_repo:
  git.latest:
    - name: https://github.com/Factual/drake.git
    - target: /usr/src/drake
    - rev: master

drake_uberjar_cmd:
  cmd.run:
    - name: LEIN_ROOT=true lein uberjar
    - cwd: /usr/src/drake

drake_runner:
  file.managed:
    - name: /usr/bin/drake
    - src: salt://drake/drake
    - mode: 755
    - require:
      - cmd: drake_uberjar_cmd
