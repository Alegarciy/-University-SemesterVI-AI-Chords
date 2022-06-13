%%%%%%%%%%%%%
% CONSTANTS %
%%%%%%%%%%%%%

semitones(['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B']).

%%%%%%%%%%%%%%%%%%%%%%%
% HERLPER LIST LOGICS % 
%%%%%%%%%%%%%%%%%%%%%%%

% element at that when it runs out of elements
% it starts to count from 0 again
element_at(X,[],K,O) :- 
  element_at(X,O,K,O).
element_at(X,[X|_],1,O).
element_at(X,[_|L],K,O) :- 
  K > 1, 
  K1 is K - 1, 
  element_at(X,L,K1,O).

indexOf([Element|_], Element, 0):- !.
indexOf([_|Tail], Element, Index):-
  indexOf(Tail, Element, Index1),
  !,
  Index is Index1+1.

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SEMITONES USEFUL LOGICS %
%%%%%%%%%%%%%%%%%%%%%%%%%%%

showListElements([]).
showListElements([X|Y]) :-
  format('Semitone: ~w ~n', [X]),
  showListElements(Y).

showSemitones :- 
  semitones(X),
  showListElements(X).

amountOfSemitones :-
  semitones(X),
  length(X,Y),
  format('Cantidad de semitonos: ~w ~n', [Y]).

semitoneNumber(Index, Semitone) :-
  semitones(X),
  indexOf(X,Semitone,Index).

semintoneNumberKeyboard(Semitone, Octave, Y) :-
  semitoneNumber(X, Semitone),
  Y is X+(12*Octave).

nameSemitone(SemitoneNumber, Octave, Semitone) :-
  semitones(Z),
  Y is SemitoneNumber - (Octave*12)+1,
  element_at(Semitone,Z,Y,Z).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TRIAD CHORD FROM SINGLE FUNDAMENTAL SEMITONE %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% X (semitone) number exceeds Y (semitone) in 4 semitones
majorSemitone(X,Y) :- X is Y+4.

% X (semitone) number exceeds Y (semitone) in 3 semitones
minorSemitone(X,Y) :- X is Y+3.

% X (semitone) number exceeds Y (semitone) in 7 semitones
finalSemitone(X,Y) :- X is Y+7.

% For any existing x (being it a semitone), it exists a major triad chord
% which implies a composition of three note a majorSemitone and its finalSemitone
fundamentalMajorChord(X, Y, Z) :-
  majorSemitone(Y,X),
  finalSemitone(Z,X).

% For any existing x (being it a semitone), it exists a minor triad chord
% which implies a composition of three note a minorSemintone and its finalSemitone
fundamentalMinorChord(X, Y, Z) :-
  minorSemitone(Y,X),
  finalSemitone(Z,X).

% Given a note and a major or minor predicate,
% finds the fundamental triad chord of the given note
getFundamentalChord(Semitone,Octave,major) :-
  semintoneNumberKeyboard(Semitone,Octave,X),
  fundamentalMajorChord(X, Y, Z),
  nameSemitone(X,Octave,Fundamental),
  nameSemitone(Y,Octave,Major),
  nameSemitone(Z,Octave,Final),
  format('Major chord: [~w,~w,~w] on (~w,~w) ~n',[Fundamental,Major,Final,Fundamental,Octave]).

getFundamentalChord(Semitone,Octave,minor) :-
  semintoneNumberKeyboard(Semitone,Octave,X),
  fundamentalMinorChord(X, Y, Z),
  nameSemitone(X,Octave,Fundamental),
  nameSemitone(Y,Octave,Major),
  nameSemitone(Z,Octave,Final),
  format('Minor chord: [~w,~w,~w] on (~w,~w) ~n',[Fundamental,Major,Final,Fundamental,Octave]).