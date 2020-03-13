## Jargon

| Term                  | Meaning                             | Ref  |
| --------------------- | ----------------------------------- | ---- |
| statistic             | any function of the data            |      |
| test statistic        | statistic used for hypothesis tests |      |
| likelihood (function) |                                     |      |

## Statistics and test statistics: What are they and why do we need them?

**Summary: **Test statistics are single numbers that we use to test whether two processes are statistically identical. We discuss the properties that test statistics must have.

To do hypothesis tests, we use *test statistics*. For example, if we'd like to test whether the random numbers $X$ from process A are bigger than those $Y$ of process B, a test statistic could be $\Delta x = X - Y$, which is $\Delta x >0$ if the numbers from A are consistently bigger. However, $\Delta x$ only takes into acount *one* number, making it very susceptible to noise. Thus, we'd like to sample more often to make our testing procedure more reliable. So what about $\Delta x_n = \sum_{i=1}^n (X_i - Y_i)$ for $n$ samples? Unfortunately, this test statistic suffers from a different problem: bigger values of $n$ will typically make $\Delta x_n$ consistently grow in the positive or negative direction. We say that this test statistic is not *standardized*: we cannot say whether a larger $\Delta x_n$ is (un)expected without first specifying $n$.

Here are some additional poor choices of test statistics:

- $X_1 + X_2 - Y_1$  -- because it is naturally biased towards $X$)
- $n^{-1} \sum_{i=1}^n (X_i - Y_i)$ -- it doesn't depend on $n$ and isn't biased towards $X$ or $Y$, but it doesn't take into account the natural size of randomness of $X$ and $Y$ (the larger the random variation in $X,Y$ are, the larger $X_i-Y_i$ will be).

A proper test statistic needs to take into account both:

- The number of datapoints by dividing by $n$.
- Take into account the natural variation in the random variables.

We'll later prove that the *central limit theorem* provides us with a possible answer to this question in some cases. There are additional desirable properties of a test statistic (but that are not strictly necessary):

- We can find a closed solution for the distribution of that test statistic. We'll see later why that's useful.
- The 'performance' of the test statistic is good. We'll see later that not every test statistic has the same performance.
- The test statistic doesn't suffer much from practical problems such as outliers.

Statisticians developed new test statistics to improve performance in these desirable properties. That's one reason why there are so many test statistics, but we'll see that there are also more fundamental reason why we can't escape having many test statistics.

Once we have a test statistics that compares A and B (let's call it $Z$), then probably a big value $Z \gg 0$ indicates that A and B are 'not the same'. How big is big enough? How probable is probably? It would be nice to have an exact criterion for this. That's what we'll do in the next two sections.

## The likelihood

The *likelihood function* is 

## Distributions of test statistics

**Summary: **We 