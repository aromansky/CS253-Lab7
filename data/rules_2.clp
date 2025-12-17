(defrule r61
  (declare (salience 50))
  (item (id 31) (conf ?c0))
  (item (id 17) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 46)))
=>
  (assert (item (id 46) (conf (* 0.9 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f46 added by r61"))
  (halt)
)

(defrule r62
  (declare (salience 50))
  (item (id 31) (conf ?c0))
  (item (id 19) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 46)))
=>
  (assert (item (id 46) (conf (* 0.8 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f46 added by r62"))
  (halt)
)

(defrule r63
  (declare (salience 50))
  (item (id 31) (conf ?c0))
  (item (id 26) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 53)))
=>
  (assert (item (id 53) (conf (* 0.85 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f53 added by r63"))
  (halt)
)

(defrule r64
  (declare (salience 50))
  (item (id 37) (conf ?c0))
  (item (id 26) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 53)))
=>
  (assert (item (id 53) (conf (* 0.9 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f53 added by r64"))
  (halt)
)

(defrule r65
  (declare (salience 50))
  (item (id 32) (conf ?c0))
  (item (id 16) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 47)))
=>
  (assert (item (id 47) (conf (* 0.85 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f47 added by r65"))
  (halt)
)

(defrule r66
  (declare (salience 50))
  (item (id 32) (conf ?c0))
  (item (id 17) (conf ?c1))
  (item (id 26) (conf ?c2))
  ?proxy <- (ioproxy)
  (not (item (id 47)))
=>
  (assert (item (id 47) (conf (* 0.75 (min ?c0 ?c1 ?c2)))))
  (modify ?proxy (messages "f47 added by r66"))
  (halt)
)

(defrule r67
  (declare (salience 50))
  (item (id 33) (conf ?c0))
  (item (id 19) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 48)))
=>
  (assert (item (id 48) (conf (* 0.9 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f48 added by r67"))
  (halt)
)

(defrule r68
  (declare (salience 50))
  (item (id 33) (conf ?c0))
  (item (id 17) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 48)))
=>
  (assert (item (id 48) (conf (* 0.8 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f48 added by r68"))
  (halt)
)

(defrule r69
  (declare (salience 50))
  (item (id 34) (conf ?c0))
  (item (id 18) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 49)))
=>
  (assert (item (id 49) (conf (* 0.8 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f49 added by r69"))
  (halt)
)

(defrule r70
  (declare (salience 50))
  (item (id 34) (conf ?c0))
  (item (id 27) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 49)))
=>
  (assert (item (id 49) (conf (* 0.9 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f49 added by r70"))
  (halt)
)

(defrule r71
  (declare (salience 50))
  (item (id 41) (conf ?c0))
  (item (id 27) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 50)))
=>
  (assert (item (id 50) (conf (* 0.85 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f50 added by r71"))
  (halt)
)

(defrule r72
  (declare (salience 50))
  (item (id 34) (conf ?c0))
  (item (id 20) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 50)))
=>
  (assert (item (id 50) (conf (* 0.8 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f50 added by r72"))
  (halt)
)

(defrule r73
  (declare (salience 50))
  (item (id 35) (conf ?c0))
  (item (id 22) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 51)))
=>
  (assert (item (id 51) (conf (* 0.75 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f51 added by r73"))
  (halt)
)

(defrule r74
  (declare (salience 50))
  (item (id 42) (conf ?c0))
  (item (id 22) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 51)))
=>
  (assert (item (id 51) (conf (* 0.9 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f51 added by r74"))
  (halt)
)

(defrule r75
  (declare (salience 50))
  (item (id 35) (conf ?c0))
  (item (id 30) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 52)))
=>
  (assert (item (id 52) (conf (* 0.8 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f52 added by r75"))
  (halt)
)

(defrule r76
  (declare (salience 50))
  (item (id 43) (conf ?c0))
  (item (id 30) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 52)))
=>
  (assert (item (id 52) (conf (* 0.9 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f52 added by r76"))
  (halt)
)

(defrule r77
  (declare (salience 50))
  (item (id 36) (conf ?c0))
  (item (id 23) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 54)))
=>
  (assert (item (id 54) (conf (* 0.95 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f54 added by r77"))
  (halt)
)

(defrule r78
  (declare (salience 50))
  (item (id 45) (conf ?c0))
  (item (id 23) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 54)))
=>
  (assert (item (id 54) (conf (* 0.85 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f54 added by r78"))
  (halt)
)

(defrule r79
  (declare (salience 50))
  (item (id 29) (conf ?c0))
  (item (id 36) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 54)))
=>
  (assert (item (id 54) (conf (* 0.6 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f54 added by r79"))
  (halt)
)

(defrule r80
  (declare (salience 50))
  (item (id 38) (conf ?c0))
  (item (id 24) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 55)))
=>
  (assert (item (id 55) (conf (* 0.95 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f55 added by r80"))
  (halt)
)

(defrule r81
  (declare (salience 50))
  (item (id 38) (conf ?c0))
  (item (id 28) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 55)))
=>
  (assert (item (id 55) (conf (* 0.7 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f55 added by r81"))
  (halt)
)

(defrule r82
  (declare (salience 50))
  (item (id 39) (conf ?c0))
  (item (id 28) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 55)))
=>
  (assert (item (id 55) (conf (* 0.6 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f55 added by r82"))
  (halt)
)

(defrule r83
  (declare (salience 50))
  (item (id 44) (conf ?c0))
  (item (id 26) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 53)))
=>
  (assert (item (id 53) (conf (* 0.9 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f53 added by r83"))
  (halt)
)

(defrule r84
  (declare (salience 50))
  (item (id 37) (conf ?c0))
  (item (id 44) (conf ?c1))
  (item (id 26) (conf ?c2))
  ?proxy <- (ioproxy)
  (not (item (id 53)))
=>
  (assert (item (id 53) (conf (* 0.95 (min ?c0 ?c1 ?c2)))))
  (modify ?proxy (messages "f53 added by r84"))
  (halt)
)

(defrule r85
  (declare (salience 50))
  (item (id 33) (conf ?c0))
  (item (id 37) (conf ?c1))
  (item (id 26) (conf ?c2))
  ?proxy <- (ioproxy)
  (not (item (id 53)))
=>
  (assert (item (id 53) (conf (* 0.85 (min ?c0 ?c1 ?c2)))))
  (modify ?proxy (messages "f53 added by r85"))
  (halt)
)

(defrule r86
  (declare (salience 50))
  (item (id 46) (conf ?c0))
  ?proxy <- (ioproxy)
  (not (item (id 56)))
=>
  (assert (item (id 56) (conf (* 0.95 (min ?c0)))))
  (modify ?proxy (messages "f56 added by r86"))
  (halt)
)

(defrule r87
  (declare (salience 50))
  (item (id 46) (conf ?c0))
  (item (id 53) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 56)))
=>
  (assert (item (id 56) (conf (* 0.95 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f56 added by r87"))
  (halt)
)

(defrule r88
  (declare (salience 50))
  (item (id 53) (conf ?c0))
  ?proxy <- (ioproxy)
  (not (item (id 59)))
=>
  (assert (item (id 59) (conf (* 0.9 (min ?c0)))))
  (modify ?proxy (messages "f59 added by r88"))
  (halt)
)

(defrule r89
  (declare (salience 50))
  (item (id 53) (conf ?c0))
  (item (id 48) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 59)))
=>
  (assert (item (id 59) (conf (* 0.85 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f59 added by r89"))
  (halt)
)

(defrule r90
  (declare (salience 50))
  (item (id 48) (conf ?c0))
  ?proxy <- (ioproxy)
  (not (item (id 58)))
=>
  (assert (item (id 58) (conf (* 0.95 (min ?c0)))))
  (modify ?proxy (messages "f58 added by r90"))
  (halt)
)

(defrule r91
  (declare (salience 50))
  (item (id 48) (conf ?c0))
  (item (id 46) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 58)))
=>
  (assert (item (id 58) (conf (* 0.9 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f58 added by r91"))
  (halt)
)

(defrule r92
  (declare (salience 50))
  (item (id 47) (conf ?c0))
  ?proxy <- (ioproxy)
  (not (item (id 59)))
=>
  (assert (item (id 59) (conf (* 0.8 (min ?c0)))))
  (modify ?proxy (messages "f59 added by r92"))
  (halt)
)

(defrule r93
  (declare (salience 50))
  (item (id 49) (conf ?c0))
  ?proxy <- (ioproxy)
  (not (item (id 57)))
=>
  (assert (item (id 57) (conf (* 0.95 (min ?c0)))))
  (modify ?proxy (messages "f57 added by r93"))
  (halt)
)

(defrule r94
  (declare (salience 50))
  (item (id 50) (conf ?c0))
  ?proxy <- (ioproxy)
  (not (item (id 57)))
=>
  (assert (item (id 57) (conf (* 0.9 (min ?c0)))))
  (modify ?proxy (messages "f57 added by r94"))
  (halt)
)

(defrule r95
  (declare (salience 50))
  (item (id 49) (conf ?c0))
  (item (id 50) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 57)))
=>
  (assert (item (id 57) (conf (* 0.95 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f57 added by r95"))
  (halt)
)

(defrule r96
  (declare (salience 50))
  (item (id 51) (conf ?c0))
  ?proxy <- (ioproxy)
  (not (item (id 59)))
=>
  (assert (item (id 59) (conf (* 0.95 (min ?c0)))))
  (modify ?proxy (messages "f59 added by r96"))
  (halt)
)

(defrule r97
  (declare (salience 50))
  (item (id 52) (conf ?c0))
  ?proxy <- (ioproxy)
  (not (item (id 59)))
=>
  (assert (item (id 59) (conf (* 0.9 (min ?c0)))))
  (modify ?proxy (messages "f59 added by r97"))
  (halt)
)

(defrule r98
  (declare (salience 50))
  (item (id 51) (conf ?c0))
  (item (id 52) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 59)))
=>
  (assert (item (id 59) (conf (* 0.95 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f59 added by r98"))
  (halt)
)

(defrule r99
  (declare (salience 50))
  (item (id 54) (conf ?c0))
  ?proxy <- (ioproxy)
  (not (item (id 57)))
=>
  (assert (item (id 57) (conf (* 0.95 (min ?c0)))))
  (modify ?proxy (messages "f57 added by r99"))
  (halt)
)

(defrule r100
  (declare (salience 50))
  (item (id 54) (conf ?c0))
  (item (id 29) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 57)))
=>
  (assert (item (id 57) (conf (* 0.85 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f57 added by r100"))
  (halt)
)

(defrule r101
  (declare (salience 50))
  (item (id 55) (conf ?c0))
  ?proxy <- (ioproxy)
  (not (item (id 60)))
=>
  (assert (item (id 60) (conf (* 0.95 (min ?c0)))))
  (modify ?proxy (messages "f60 added by r101"))
  (halt)
)

(defrule r102
  (declare (salience 50))
  (item (id 55) (conf ?c0))
  (item (id 28) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 60)))
=>
  (assert (item (id 60) (conf (* 0.85 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f60 added by r102"))
  (halt)
)

(defrule r103
  (declare (salience 50))
  (item (id 46) (conf ?c0))
  (item (id 48) (conf ?c1))
  (item (id 53) (conf ?c2))
  ?proxy <- (ioproxy)
  (not (item (id 56)))
=>
  (assert (item (id 56) (conf (* 0.9 (min ?c0 ?c1 ?c2)))))
  (modify ?proxy (messages "f56 added by r103"))
  (halt)
)

(defrule r104
  (declare (salience 50))
  (item (id 49) (conf ?c0))
  (item (id 55) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 60)))
=>
  (assert (item (id 60) (conf (* 0.85 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f60 added by r104"))
  (halt)
)

(defrule r105
  (declare (salience 50))
  (item (id 54) (conf ?c0))
  (item (id 55) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 60)))
=>
  (assert (item (id 60) (conf (* 0.9 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f60 added by r105"))
  (halt)
)

(defrule r106
  (declare (salience 50))
  (item (id 49) (conf ?c0))
  (item (id 50) (conf ?c1))
  (item (id 55) (conf ?c2))
  ?proxy <- (ioproxy)
  (not (item (id 60)))
=>
  (assert (item (id 60) (conf (* 0.9 (min ?c0 ?c1 ?c2)))))
  (modify ?proxy (messages "f60 added by r106"))
  (halt)
)

(defrule r107
  (declare (salience 50))
  (item (id 46) (conf ?c0))
  (item (id 47) (conf ?c1))
  (item (id 48) (conf ?c2))
  ?proxy <- (ioproxy)
  (not (item (id 56)))
=>
  (assert (item (id 56) (conf (* 0.95 (min ?c0 ?c1 ?c2)))))
  (modify ?proxy (messages "f56 added by r107"))
  (halt)
)

(defrule r108
  (declare (salience 50))
  (item (id 47) (conf ?c0))
  (item (id 53) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 59)))
=>
  (assert (item (id 59) (conf (* 0.8 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f59 added by r108"))
  (halt)
)

(defrule r109
  (declare (salience 50))
  (item (id 51) (conf ?c0))
  (item (id 52) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 59)))
=>
  (assert (item (id 59) (conf (* 0.85 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f59 added by r109"))
  (halt)
)

(defrule r110
  (declare (salience 50))
  (item (id 54) (conf ?c0))
  (item (id 55) (conf ?c1))
  (item (id 53) (conf ?c2))
  ?proxy <- (ioproxy)
  (not (item (id 60)))
=>
  (assert (item (id 60) (conf (* 0.9 (min ?c0 ?c1 ?c2)))))
  (modify ?proxy (messages "f60 added by r110"))
  (halt)
)

(defrule r111
  (declare (salience 50))
  (item (id 49) (conf ?c0))
  (item (id 51) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 57)))
=>
  (assert (item (id 57) (conf (* 0.8 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f57 added by r111"))
  (halt)
)

(defrule r112
  (declare (salience 50))
  (item (id 50) (conf ?c0))
  (item (id 52) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 57)))
=>
  (assert (item (id 57) (conf (* 0.8 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f57 added by r112"))
  (halt)
)

(defrule r113
  (declare (salience 50))
  (item (id 48) (conf ?c0))
  (item (id 53) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 58)))
=>
  (assert (item (id 58) (conf (* 0.9 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f58 added by r113"))
  (halt)
)

(defrule r114
  (declare (salience 50))
  (item (id 46) (conf ?c0))
  (item (id 55) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 60)))
=>
  (assert (item (id 60) (conf (* 0.85 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f60 added by r114"))
  (halt)
)

(defrule r115
  (declare (salience 50))
  (item (id 54) (conf ?c0))
  (item (id 48) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 58)))
=>
  (assert (item (id 58) (conf (* 0.75 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f58 added by r115"))
  (halt)
)

(defrule r116
  (declare (salience 50))
  (item (id 50) (conf ?c0))
  (item (id 51) (conf ?c1))
  (item (id 53) (conf ?c2))
  ?proxy <- (ioproxy)
  (not (item (id 59)))
=>
  (assert (item (id 59) (conf (* 0.8 (min ?c0 ?c1 ?c2)))))
  (modify ?proxy (messages "f59 added by r116"))
  (halt)
)

(defrule r117
  (declare (salience 50))
  (item (id 47) (conf ?c0))
  (item (id 55) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 60)))
=>
  (assert (item (id 60) (conf (* 0.8 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f60 added by r117"))
  (halt)
)

(defrule r118
  (declare (salience 50))
  (item (id 54) (conf ?c0))
  (item (id 52) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 57)))
=>
  (assert (item (id 57) (conf (* 0.75 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f57 added by r118"))
  (halt)
)

(defrule r119
  (declare (salience 50))
  (item (id 49) (conf ?c0))
  (item (id 46) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 57)))
=>
  (assert (item (id 57) (conf (* 0.8 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f57 added by r119"))
  (halt)
)

(defrule r120
  (declare (salience 50))
  (item (id 48) (conf ?c0))
  (item (id 55) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id 60)))
=>
  (assert (item (id 60) (conf (* 0.9 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f60 added by r120"))
  (halt)
)
