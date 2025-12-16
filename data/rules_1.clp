
(deftemplate item
  (slot id)
  (slot conf (type FLOAT) (default 0.0))
)

(deftemplate ioproxy
  (slot messages (type STRING) (default ""))
  (slot answers  (type STRING) (default ""))
  (slot user-input (type STRING) (default ""))
)

(defrule init-proxy
  (declare (salience 100))
  (not (ioproxy))
  =>
  (assert (ioproxy))
)

(defrule combine
  (declare (salience 60))
  ?i1 <- (item (id ?f1) (conf ?conf1))
  ?i2 <- (item (id ?f2) (conf ?conf2))
  ?proxy <- (ioproxy)
=>
  (if (and (eq ?f1 ?f2) (!= ?conf1 ?conf2)) then
    (assert (item (id ?f1) (conf (- (+ ?conf1 ?conf2) (* ?conf1 ?conf2)))))
    (retract ?i1)
    (retract ?i2)
    (modify ?proxy (messages "Confidence recalculated"))
    (halt))
)

(defrule r01
  (declare (salience 50))
  (item (id f01) (conf ?c0))
  (item (id f02) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id f16)))
=>
  (assert (item (id f16) (conf (* 0.95 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f16 added by r01"))
  (halt)
)

(defrule r02
  (declare (salience 50))
  (item (id f01) (conf ?c0))
  (item (id f03) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id f16)))
=>
  (assert (item (id f16) (conf (* 0.95 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f16 added by r02"))
  (halt)
)

(defrule r03
  (declare (salience 50))
  (item (id f01) (conf ?c0))
  (item (id f02) (conf ?c1))
  (item (id f04) (conf ?c2))
  ?proxy <- (ioproxy)
  (not (item (id f17)))
=>
  (assert (item (id f17) (conf (* 0.9 (min ?c0 ?c1 ?c2)))))
  (modify ?proxy (messages "f17 added by r03"))
  (halt)
)

(defrule r04
  (declare (salience 50))
  (item (id f04) (conf ?c0))
  (item (id f05) (conf ?c1))
  (item (id f06) (conf ?c2))
  ?proxy <- (ioproxy)
  (not (item (id f17)))
=>
  (assert (item (id f17) (conf (* 0.85 (min ?c0 ?c1 ?c2)))))
  (modify ?proxy (messages "f17 added by r04"))
  (halt)
)

(defrule r05
  (declare (salience 50))
  (item (id f05) (conf ?c0))
  (item (id f06) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id f19)))
=>
  (assert (item (id f19) (conf (* 0.8 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f19 added by r05"))
  (halt)
)

(defrule r06
  (declare (salience 50))
  (item (id f06) (conf ?c0))
  (item (id f04) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id f19)))
=>
  (assert (item (id f19) (conf (* 0.75 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f19 added by r06"))
  (halt)
)

(defrule r07
  (declare (salience 50))
  (item (id f03) (conf ?c0))
  (item (id f01) (conf ?c1))
  (item (id f07) (conf ?c2))
  ?proxy <- (ioproxy)
  (not (item (id f18)))
=>
  (assert (item (id f18) (conf (* 0.7 (min ?c0 ?c1 ?c2)))))
  (modify ?proxy (messages "f18 added by r07"))
  (halt)
)

(defrule r08
  (declare (salience 50))
  (item (id f08) (conf ?c0))
  (item (id f10) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id f18)))
=>
  (assert (item (id f18) (conf (* 0.65 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f18 added by r08"))
  (halt)
)

(defrule r09
  (declare (salience 50))
  (item (id f09) (conf ?c0))
  (item (id f01) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id f18)))
=>
  (assert (item (id f18) (conf (* 0.55 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f18 added by r09"))
  (halt)
)

(defrule r10
  (declare (salience 50))
  (item (id f07) (conf ?c0))
  (item (id f11) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id f20)))
=>
  (assert (item (id f20) (conf (* 0.75 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f20 added by r10"))
  (halt)
)

(defrule r11
  (declare (salience 50))
  (item (id f07) (conf ?c0))
  (item (id f12) (conf ?c1))
  (item (id f11) (conf ?c2))
  ?proxy <- (ioproxy)
  (not (item (id f20)))
=>
  (assert (item (id f20) (conf (* 0.8 (min ?c0 ?c1 ?c2)))))
  (modify ?proxy (messages "f20 added by r11"))
  (halt)
)

(defrule r12
  (declare (salience 50))
  (item (id f10) (conf ?c0))
  (item (id f08) (conf ?c1))
  (item (id f11) (conf ?c2))
  ?proxy <- (ioproxy)
  (not (item (id f27)))
=>
  (assert (item (id f27) (conf (* 0.7 (min ?c0 ?c1 ?c2)))))
  (modify ?proxy (messages "f27 added by r12"))
  (halt)
)

(defrule r13
  (declare (salience 50))
  (item (id f08) (conf ?c0))
  (item (id f12) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id f21)))
=>
  (assert (item (id f21) (conf (* 0.85 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f21 added by r13"))
  (halt)
)

(defrule r14
  (declare (salience 50))
  (item (id f10) (conf ?c0))
  (item (id f12) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id f21)))
=>
  (assert (item (id f21) (conf (* 0.8 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f21 added by r14"))
  (halt)
)

(defrule r15
  (declare (salience 50))
  (item (id f08) (conf ?c0))
  (item (id f10) (conf ?c1))
  (item (id f12) (conf ?c2))
  ?proxy <- (ioproxy)
  (not (item (id f21)))
=>
  (assert (item (id f21) (conf (* 0.9 (min ?c0 ?c1 ?c2)))))
  (modify ?proxy (messages "f21 added by r15"))
  (halt)
)

(defrule r16
  (declare (salience 50))
  (item (id f01) (conf ?c0))
  (item (id f03) (conf ?c1))
  (item (id f09) (conf ?c2))
  ?proxy <- (ioproxy)
  (not (item (id f22)))
=>
  (assert (item (id f22) (conf (* 0.6 (min ?c0 ?c1 ?c2)))))
  (modify ?proxy (messages "f22 added by r16"))
  (halt)
)

(defrule r17
  (declare (salience 50))
  (item (id f08) (conf ?c0))
  (item (id f12) (conf ?c1))
  (item (id f15) (conf ?c2))
  ?proxy <- (ioproxy)
  (not (item (id f22)))
=>
  (assert (item (id f22) (conf (* 0.65 (min ?c0 ?c1 ?c2)))))
  (modify ?proxy (messages "f22 added by r17"))
  (halt)
)

(defrule r18
  (declare (salience 50))
  (item (id f10) (conf ?c0))
  (item (id f15) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id f30)))
=>
  (assert (item (id f30) (conf (* 0.5 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f30 added by r18"))
  (halt)
)

(defrule r19
  (declare (salience 50))
  (item (id f01) (conf ?c0))
  (item (id f15) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id f30)))
=>
  (assert (item (id f30) (conf (* 0.5 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f30 added by r19"))
  (halt)
)

(defrule r20
  (declare (salience 50))
  (item (id f14) (conf ?c0))
  (item (id f08) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id f23)))
=>
  (assert (item (id f23) (conf (* 0.9 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f23 added by r20"))
  (halt)
)

(defrule r21
  (declare (salience 50))
  (item (id f14) (conf ?c0))
  (item (id f13) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id f23)))
=>
  (assert (item (id f23) (conf (* 0.8 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f23 added by r21"))
  (halt)
)

(defrule r22
  (declare (salience 50))
  (item (id f13) (conf ?c0))
  (item (id f10) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id f29)))
=>
  (assert (item (id f29) (conf (* 0.6 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f29 added by r22"))
  (halt)
)

(defrule r23
  (declare (salience 50))
  (item (id f13) (conf ?c0))
  (item (id f08) (conf ?c1))
  (item (id f12) (conf ?c2))
  ?proxy <- (ioproxy)
  (not (item (id f29)))
=>
  (assert (item (id f29) (conf (* 0.7 (min ?c0 ?c1 ?c2)))))
  (modify ?proxy (messages "f29 added by r23"))
  (halt)
)

(defrule r24
  (declare (salience 50))
  (item (id f15) (conf ?c0))
  (item (id f12) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id f24)))
=>
  (assert (item (id f24) (conf (* 0.4 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f24 added by r24"))
  (halt)
)

(defrule r25
  (declare (salience 50))
  (item (id f15) (conf ?c0))
  (item (id f08) (conf ?c1))
  (item (id f10) (conf ?c2))
  ?proxy <- (ioproxy)
  (not (item (id f24)))
=>
  (assert (item (id f24) (conf (* 0.45 (min ?c0 ?c1 ?c2)))))
  (modify ?proxy (messages "f24 added by r25"))
  (halt)
)

(defrule r26
  (declare (salience 50))
  (item (id f04) (conf ?c0))
  (item (id f06) (conf ?c1))
  (item (id f15) (conf ?c2))
  ?proxy <- (ioproxy)
  (not (item (id f26)))
=>
  (assert (item (id f26) (conf (* 0.6 (min ?c0 ?c1 ?c2)))))
  (modify ?proxy (messages "f26 added by r26"))
  (halt)
)

(defrule r27
  (declare (salience 50))
  (item (id f04) (conf ?c0))
  (item (id f05) (conf ?c1))
  (item (id f06) (conf ?c2))
  (item (id f15) (conf ?c3))
  ?proxy <- (ioproxy)
  (not (item (id f26)))
=>
  (assert (item (id f26) (conf (* 0.75 (min ?c0 ?c1 ?c2 ?c3)))))
  (modify ?proxy (messages "f26 added by r27"))
  (halt)
)

(defrule r28
  (declare (salience 50))
  (item (id f10) (conf ?c0))
  (item (id f11) (conf ?c1))
  (item (id f15) (conf ?c2))
  ?proxy <- (ioproxy)
  (not (item (id f28)))
=>
  (assert (item (id f28) (conf (* 0.7 (min ?c0 ?c1 ?c2)))))
  (modify ?proxy (messages "f28 added by r28"))
  (halt)
)

(defrule r29
  (declare (salience 50))
  (item (id f12) (conf ?c0))
  (item (id f11) (conf ?c1))
  (item (id f15) (conf ?c2))
  ?proxy <- (ioproxy)
  (not (item (id f28)))
=>
  (assert (item (id f28) (conf (* 0.75 (min ?c0 ?c1 ?c2)))))
  (modify ?proxy (messages "f28 added by r29"))
  (halt)
)

(defrule r30
  (declare (salience 50))
  (item (id f10) (conf ?c0))
  (item (id f14) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id f25)))
=>
  (assert (item (id f25) (conf (* 0.65 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f25 added by r30"))
  (halt)
)

(defrule r31
  (declare (salience 50))
  (item (id f16) (conf ?c0))
  (item (id f17) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id f31)))
=>
  (assert (item (id f31) (conf (* 0.85 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f31 added by r31"))
  (halt)
)

(defrule r32
  (declare (salience 50))
  (item (id f16) (conf ?c0))
  (item (id f19) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id f31)))
=>
  (assert (item (id f31) (conf (* 0.7 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f31 added by r32"))
  (halt)
)

(defrule r33
  (declare (salience 50))
  (item (id f16) (conf ?c0))
  (item (id f26) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id f37)))
=>
  (assert (item (id f37) (conf (* 0.75 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f37 added by r33"))
  (halt)
)

(defrule r34
  (declare (salience 50))
  (item (id f17) (conf ?c0))
  (item (id f26) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id f37)))
=>
  (assert (item (id f37) (conf (* 0.8 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f37 added by r34"))
  (halt)
)

(defrule r35
  (declare (salience 50))
  (item (id f17) (conf ?c0))
  (item (id f19) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id f33)))
=>
  (assert (item (id f33) (conf (* 0.85 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f33 added by r35"))
  (halt)
)

(defrule r36
  (declare (salience 50))
  (item (id f16) (conf ?c0))
  (item (id f17) (conf ?c1))
  (item (id f26) (conf ?c2))
  ?proxy <- (ioproxy)
  (not (item (id f32)))
=>
  (assert (item (id f32) (conf (* 0.6 (min ?c0 ?c1 ?c2)))))
  (modify ?proxy (messages "f32 added by r36"))
  (halt)
)

(defrule r37
  (declare (salience 50))
  (item (id f16) (conf ?c0))
  (item (id f17) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id f32)))
=>
  (assert (item (id f32) (conf (* 0.5 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f32 added by r37"))
  (halt)
)

(defrule r38
  (declare (salience 50))
  (item (id f26) (conf ?c0))
  ?proxy <- (ioproxy)
  (not (item (id f44)))
=>
  (assert (item (id f44) (conf (* 0.8 (min ?c0)))))
  (modify ?proxy (messages "f44 added by r38"))
  (halt)
)

(defrule r39
  (declare (salience 50))
  (item (id f17) (conf ?c0))
  (item (id f19) (conf ?c1))
  (item (id f26) (conf ?c2))
  ?proxy <- (ioproxy)
  (not (item (id f44)))
=>
  (assert (item (id f44) (conf (* 0.85 (min ?c0 ?c1 ?c2)))))
  (modify ?proxy (messages "f44 added by r39"))
  (halt)
)

(defrule r40
  (declare (salience 50))
  (item (id f18) (conf ?c0))
  ?proxy <- (ioproxy)
  (not (item (id f34)))
=>
  (assert (item (id f34) (conf (* 0.95 (min ?c0)))))
  (modify ?proxy (messages "f34 added by r40"))
  (halt)
)

(defrule r41
  (declare (salience 50))
  (item (id f18) (conf ?c0))
  (item (id f27) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id f40)))
=>
  (assert (item (id f40) (conf (* 0.85 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f40 added by r41"))
  (halt)
)

(defrule r42
  (declare (salience 50))
  (item (id f20) (conf ?c0))
  (item (id f27) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id f41)))
=>
  (assert (item (id f41) (conf (* 0.8 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f41 added by r42"))
  (halt)
)

(defrule r43
  (declare (salience 50))
  (item (id f18) (conf ?c0))
  (item (id f20) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id f34)))
=>
  (assert (item (id f34) (conf (* 0.9 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f34 added by r43"))
  (halt)
)

(defrule r44
  (declare (salience 50))
  (item (id f27) (conf ?c0))
  ?proxy <- (ioproxy)
  (not (item (id f41)))
=>
  (assert (item (id f41) (conf (* 0.7 (min ?c0)))))
  (modify ?proxy (messages "f41 added by r44"))
  (halt)
)

(defrule r45
  (declare (salience 50))
  (item (id f21) (conf ?c0))
  (item (id f22) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id f35)))
=>
  (assert (item (id f35) (conf (* 0.9 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f35 added by r45"))
  (halt)
)

(defrule r46
  (declare (salience 50))
  (item (id f21) (conf ?c0))
  (item (id f28) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id f39)))
=>
  (assert (item (id f39) (conf (* 0.85 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f39 added by r46"))
  (halt)
)

(defrule r47
  (declare (salience 50))
  (item (id f21) (conf ?c0))
  (item (id f30) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id f35)))
=>
  (assert (item (id f35) (conf (* 0.9 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f35 added by r47"))
  (halt)
)

(defrule r48
  (declare (salience 50))
  (item (id f21) (conf ?c0))
  (item (id f25) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id f29)))
=>
  (assert (item (id f29) (conf (* 0.6 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f29 added by r48"))
  (halt)
)

(defrule r49
  (declare (salience 50))
  (item (id f22) (conf ?c0))
  ?proxy <- (ioproxy)
  (not (item (id f42)))
=>
  (assert (item (id f42) (conf (* 0.7 (min ?c0)))))
  (modify ?proxy (messages "f42 added by r49"))
  (halt)
)

(defrule r50
  (declare (salience 50))
  (item (id f22) (conf ?c0))
  (item (id f30) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id f43)))
=>
  (assert (item (id f43) (conf (* 0.8 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f43 added by r50"))
  (halt)
)

(defrule r51
  (declare (salience 50))
  (item (id f30) (conf ?c0))
  ?proxy <- (ioproxy)
  (not (item (id f35)))
=>
  (assert (item (id f35) (conf (* 0.95 (min ?c0)))))
  (modify ?proxy (messages "f35 added by r51"))
  (halt)
)

(defrule r52
  (declare (salience 50))
  (item (id f22) (conf ?c0))
  (item (id f28) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id f35)))
=>
  (assert (item (id f35) (conf (* 0.6 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f35 added by r52"))
  (halt)
)

(defrule r53
  (declare (salience 50))
  (item (id f23) (conf ?c0))
  ?proxy <- (ioproxy)
  (not (item (id f36)))
=>
  (assert (item (id f36) (conf (* 0.95 (min ?c0)))))
  (modify ?proxy (messages "f36 added by r53"))
  (halt)
)

(defrule r54
  (declare (salience 50))
  (item (id f23) (conf ?c0))
  (item (id f25) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id f36)))
=>
  (assert (item (id f36) (conf (* 0.8 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f36 added by r54"))
  (halt)
)

(defrule r55
  (declare (salience 50))
  (item (id f23) (conf ?c0))
  (item (id f29) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id f45)))
=>
  (assert (item (id f45) (conf (* 0.75 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f45 added by r55"))
  (halt)
)

(defrule r56
  (declare (salience 50))
  (item (id f29) (conf ?c0))
  ?proxy <- (ioproxy)
  (not (item (id f45)))
=>
  (assert (item (id f45) (conf (* 0.4 (min ?c0)))))
  (modify ?proxy (messages "f45 added by r56"))
  (halt)
)

(defrule r57
  (declare (salience 50))
  (item (id f24) (conf ?c0))
  ?proxy <- (ioproxy)
  (not (item (id f38)))
=>
  (assert (item (id f38) (conf (* 0.9 (min ?c0)))))
  (modify ?proxy (messages "f38 added by r57"))
  (halt)
)

(defrule r58
  (declare (salience 50))
  (item (id f24) (conf ?c0))
  (item (id f28) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id f38)))
=>
  (assert (item (id f38) (conf (* 0.7 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f38 added by r58"))
  (halt)
)

(defrule r59
  (declare (salience 50))
  (item (id f24) (conf ?c0))
  (item (id f26) (conf ?c1))
  ?proxy <- (ioproxy)
  (not (item (id f37)))
=>
  (assert (item (id f37) (conf (* 0.65 (min ?c0 ?c1)))))
  (modify ?proxy (messages "f37 added by r59"))
  (halt)
)

(defrule r60
  (declare (salience 50))
  (item (id f28) (conf ?c0))
  ?proxy <- (ioproxy)
  (not (item (id f39)))
=>
  (assert (item (id f39) (conf (* 0.95 (min ?c0)))))
  (modify ?proxy (messages "f39 added by r60"))
  (halt)
)