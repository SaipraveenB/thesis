gen: typ -> dest -> prop pers.
ofdest: dest -> typ -> prop pers.

value/contn: value (contn D).

of/letcc: of (letcc \x. E x) T
           <- (All x. of x (conttp T) -> of (E x) T).
of/contn: of (contn D) (conttp T)
           <- ofdest D T.
of/throw: of (throw E1 E2) T'
           <- of E1 T
           <- of E2 (conttp T).

off/throw1: off (throw1 E2) T Tx
             <- of E2 (conttp T).
off/throw2: off (throw2 V1) (conttp T) Tx
             <- of V1 T.

gen/eval: gen T D * !of E T >-> {eval E D}.
gen/retn: gen T D * !of V T * !value V >-> {retn V D}.
gen/cont: gen T D * !off F T' T 
           >-> {Exists d'. gen T' d' * !ofdest d T' * !cont F d' D}.
gen/dest: !ofdest D T * !off F T' T 
           >-> {Exists d'. !ofdest d' T' * !cont F d' D}.