<h2 id="hard-part">Hard Part</h2>

The hard part could now begins.

<h3 id="functional-style">Functional style</h3>

In this section, I give a short example of the impressive refactoring ability provided by Haskell.
We will choose a problem and resolve it the standard way. 
Then I will make the code evolve.
The end result will be both more elegant and easier to adapt. 

Let's resolve the following problem:

 > Given a list of integer, return the sum of its even numbers.

To show differences between functional and imperative approach, 
I'll start by providing an imperative solution (in javascript):

<code class="javascript">
function evenSum(list) {
    var result = 0
    for (i=0; i< list.length ; i++) {
        if (list[i] % 2 ==0) {
            result += list[i];
        }
    }
    return result;
}
</code>

But, in Haskell we don't have variable, nor for loop.
One solution to achieve the same result without loop is to use recursion.

 > _Remark_:  
 > Recursion is generally perceived as slow in imperative language.
 > But it is generally not the case in functional programming.
 > Most of the time Haskell will handle recursive function efficiently.

Here is a `C` version of the recursive function.
Note, for simplicity, I assume the int list should end with the first `null` (value `0`):


<code class="c">
int evenSum(int *list) {
    return accumSum(0,list);
}

// In C I should have declared this 
// function before evenSum, but
// I find it easier this way
int accumSum(int n, int *list) {
    if (list == nil) { // if the list is empty
        return n;
    } else {
        x = list[0]; // let x be the first element of the list
        xs = list+1; // let xs be the list without its head
        if ( 0 == (x%2) ) { // if x is even
            return accumSum(n+x, xs);
        } else {
            return accumSum(n, xs);
        }
    }
}
</code>

Keep this code in mind. We will translate it in Haskell.
But before, I need to introduce three simple but useful function we will use:

> even :: Integral a => a -> Bool
> head :: [a] -> a
> tail :: [a] -> [a]

`even` verify if a number is even.

~~~
even :: Integral a => a -> Bool
even 3  ⇒ False
even 2  ⇒ True
~~~

`head` returns the first element of a list:

~~~
head :: [a] -> a
head [1,2,3] ⇒ 1
head []      ⇒ ERROR
~~~

`tail`, returns all element except the first of a list:

~~~
tail :: [a] -> [a]
tail [1,2,3] ⇒ [2,3]
tail [3]     ⇒ []
tail []      ⇒ ERROR
~~~

Remark that for any non empty list `l`, 
`l ⇔ (head l):(tail l)`
