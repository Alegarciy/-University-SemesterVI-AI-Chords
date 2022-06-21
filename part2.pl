% X (semitone) number exceeds Y (semitone) in 4 semitones
majorSemitone(X,Y) :- X is Y+4.

% X (semitone) number exceeds Y (semitone) in 3 semitones
minorSemitone(X,Y) :- X is Y+3.

minorThird(X,Y) :- X is Y+4.
majorThird(X,Y) :- X is Y+3.
majorFundamentalChord(X,Y,Z) :- majorThird(X,Y), minorThird(Y,Z).
majorFirstInvChord(X,Y,Z) :- majorThird(X,Z), minorThird(X,Y).
majorSecondInvChord(X,Y,Z) :- majorThird(Z,Y), minorThird(Z,X).
minorFundamentalChord(X,Y,Z) :- minorThird(X,Y), majorThird(Y,Z).
minorFirstInvChord(X,Y,Z) :- minorThird(X,Z), majorThird(X,Y).
minorSecondInvChord(X,Y,Z) :- minorThird(Z,Y), majorThird(Z,X).
