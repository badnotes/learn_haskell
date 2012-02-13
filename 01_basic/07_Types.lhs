# Types

Types are in the heart of Haskell.
In Haskell, types are strong and static.

Why is this important? It will help you _a lot_ not to make some mistake.

Static typing is generally essential to reach fast execution time.
But in common languages static typing has the price of bad generalization.
What saves Haskell is that types can be inferred.

Here are some examples on how to simulate a simple square function in Haskell
in other statically typed langauges:


> square x = x * x
> 
> square 2
> 4
> square 2.1
> 4.41
> 
> :m Data.Complex
> (2 :+ 1) * (2 :+ 1) 
> 3.0 :+ 4.0

`x :+ y` is the notation for the complex (<i>x + ib</i>).

<code class="c">
// in C
int     int_square(int x) { return x*x; }
float   fl_square(float x) {return x*x; }
complex complex_square (complex z) {
    complex tmp; 
    tmp.real = z.real * z.real - z.img * z.img;
    tmp.img = 2 * z.img * z.real;
}
</code>

To compensate a bit, C++ has templates:

<code class="c++">
class Number<T> {
    T value;
    square() {
        value = value*value;
    }
}

Number<int> i;
i.square;

Number<float> f;
f.square;

class Complex {
    int real;
    int img;
    Complex operator<*>(Complex z) {
        Complex result;
        result.real = real*z.real - img*z.img;
        result.img  = img*z.real + real*z.img;
        return res;
    }
}

Number<Complex> z;
z.square
</code>

I have given the `C++` implementation of the (C++) class Complex.

