/-
As discussed in the last unit, a 
predicate is a proposition with
one more more arguments. 

In the last unit, we studied 
predicates with one argument. We 
saw that such a predicate can be 
seen as specifying a *property* 
of values of its argument type.
Examples included the properties
of being even, being equal to 0,
and being a perfect square. You
should think of at least a few
more properties that you could
specify as predicates.

Such a predicate can also be
seen as specifying a set, namely
the set of values having the
specified property. We will 
pursue this idea further later.

We now look at predicates with
multiple arguments, and we focus
on the idea that such predicates
can be used to specify properties
of combinations values. We refer
to properties involving multiple 
values as relations.

As an example we can consider 
equality as a relation between
two values. We represent this
relation as a predicate with
two arguments, n and m. In
turn, as in the last unit, we 
represent this predicate as a 
function, from two arguments
now, to Prop.
-/

def areEqual : ℕ → ℕ → Prop :=
    λ n m, n = m

/-
Be sure you're comfortable with
that definition. We define areEqual
as a function that takes n and m as
arguments (of type ℕ) and that then
returns the *proposition*, n = m.
Be clear that this function does 
not return a proof. Check out the
following to see what propositions
are generated by applying the
predicate to pairs of values.
-/

#reduce areEqual 0 0
#reduce areEqual 1 1
#reduce areEqual 1 0
#reduce areEqual 1 2

/-
This predicate, with two arguments,
defines an infinity of propositions,
each one about each possible pair of
natural numbers. Some of these are
provable (true), others are not. The
predicate thus "picks out" a subset
of all possible pairs, namely those
for which its proposition is true.
These pairs include (0, 0) and (1, 1)
but not (1, 2). 

Such a set of pairs is what we think 
of as the relation that the predicate
specifies. In particular it specifies
what we call a "binary" relation: a
relation with two arguments.

Let's prove that a few elements are
in, and that another one is not in,
the areEqual(n,m) relation.
-/

-- (0, 0) is in the relation
theorem zeqz : areEqual 0 0 :=
    eq.refl 0

-- (1, 1) is in the relation
theorem oeqo : areEqual 1 1 :=
    eq.refl 1

-- (2, 2) is in the relation
theorem teqt : areEqual 2 2 :=
    eq.refl 2

-- but (0, 1) is not in it
theorem zneo : ¬ areEqual 0 1 :=
    λ zeqo, nat.no_confusion zeqo


/-
EXAMPLE: Express the relation
between natural numbers and 
their squares and prove that
(3, 9) is in the relation.
-/

-- Answer

def square: ℕ → ℕ → Prop :=
    λ n nsq, nsq = n^2

theorem thSqIsNine : square 3 9 
:=
begin
unfold square,  -- notice unfold
exact rfl,
end

/-
EXERCISE: In lean, the function,
string.length returns the length
of a given string. Specify a new
predicate sHasLenL taking a string
and a natural number as arguments
that asserts that a given string
has the given length.  Write the
function using lambda notation to
make the type of the predicate as
clear as possible.
-/

#eval string.length "Hello"

-- answer here

def sHasLenL : string → ℕ → Prop :=
    λ s n, (string.length s) = n

