% Given two notes, the distance between them is a minorThird - 3 semintones
minorThird(X,Y) :- Y is X+3.

% Given two notes, the distance between them is a majorThird - 4 semitones
majorThird(X,Y) :- Y is X+4.

% Given three notes X,Y,Z if X,Y is a majorThird and Y,Z a minorThird, then it is a minorFundamentalChord
minorFundamentalChord(X,Y,Z) :- majorThird(X,Y), minorThird(Y,Z).

% Given three notes X,Y,Z if X,Z is a majorThird and X,Y a minorThird, then it is a minorFirstInvChord
minorFirstInvChord(X,Y,Z) :- majorThird(X,Z), minorThird(X,Y).

% Given three notes X,Y,Z if Z,Y is a majorThird and Z,X a minorThird, then it is a minorSecondInvChord
minorSecondInvChord(X,Y,Z) :- majorThird(Z,Y), minorThird(Z,X).

% Given three notes X,Y,Z if X,Y is a minorThird and Y,Z a majorThird, then it is a majorFundamentalChord
majorFundamentalChord(X,Y,Z) :- minorThird(X,Y), majorThird(Y,Z).

% Given three notes X,Y,Z if X,Z is a majorThird and X,Y a minorThird, then it is a majorFirstInvChord
majorFirstInvChord(X,Y,Z) :- minorThird(X,Z), majorThird(X,Y).

% Given three notes X,Y,Z if Z,Y is a majorThird and Z,X a minorThird, then it is a majorSecondInvChord
majorSecondInvChord(X,Y,Z) :- minorThird(Z,Y), majorThird(Z,X).

% Given three notes, this evaluates the three of them
% in order to see which condition applies from the following
% minorFundamentalChord, minorFirstInvChord, minorSecondInvChord,
% majorFundamentalChord, majorFirstInvChord, majorSecondInvChord.
Chords(X,Y,Z) :-
  nameSemitone(X,Y,Z),
  minorFundamentalChord(X,Y,Z),
  minorFirstInvChord(X,Y,Z),
  minorSecondInvChord(X,Y,Z),
  majorFundamentalChord(X,Y,Z),
  majorFirstInvChord(X,Y,Z),
  majorSecondInvChord(X,Y,Z),
  semitoneNumber(X,Y,Z),
  format('').