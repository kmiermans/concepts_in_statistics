# Concepts in Statistics: A short summary

## For whom is this guide?

- you have a solid understanding of math (probability distributions, Taylor series, Fourier transforms and random numbers), but do not yet understand statistics
- you may have used hypothesis tests before, but don't know why should use one hypothesis test over a different one
- you'd like to see an overview of the important concepts in hypothesis testing in a single, relatively short document

## Usage

- This is a work in progress, but I'm nearly done.
- Feel free to make changes!
- Use, share anyway you like.

## Table of Contents

[TOC]



## Jargon

| Term                                | Meaning                                               | Ref  |
| ----------------------------------- | ----------------------------------------------------- | ---- |
| statistic                           | any single numbers that's a function of the data      |      |
| test statistic                      | statistic used for hypothesis tests                   |      |
| $p(z|H_0)$                          | Test statistic distribution under the null hypothesis |      |
| likelihood (function)               | Probability of observing the data in a certain model  |      |
| central limit theorem               |                                                       |      |
| characteristic function             |                                                       |      |
| statistical significance            |                                                       |      |
| statistical power                   |                                                       |      |
| false positive error (type 1 error) |                                                       |      |
| false negative error (type 2 error) |                                                       |      |
| most powerful test (MP)             |                                                       |      |
| uniformly most powerful test (UMP)  |                                                       |      |
| Neyman-Pearson lemma                |                                                       |      |
|                                     |                                                       |      |
|                                     |                                                       |      |

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

**Summary: **The likelihood function of a model is the probability of observing data under that model.

The *likelihood of a parameter $\theta$ is the probability of observing data, given that I know $\theta$*. The likelihood function for a parameter $\theta$ written as $\mathcal L (\theta | X)$, where $\theta$ is a model parameter and $X$ is a datapoint. But that's just mathematical formalism -- what it means is $\mathcal L (\theta | X) = p(X | \theta)$ (notice the arguments were interchanged!). For a model that predicts data extremely well, the likelihood will be high. Therefore, the likelihood expresses a 'goodness of fit' of a model to the data. This does not mean that that model is 'correct', however, since we might have two models that both correctly predict a small number of data-points.

Often, a model has more than one parameter. Then we might write a 'parameter vector' $\vec \theta = {\theta_1, \theta_2,\ldots}$ for all the different model parameters. And almost always do we have more than one datapoint $D = {X_1, X_2, \ldots}$. The likelihood is then just written $\mathcal L (\vec \theta | D) = p( D|\vec \theta)$. The more datapoints we have (so the bigger the size of the set  $D$), the less likely getting *one specific* set of values for those datapoints becomes.[^why-more-datapoints-decrease-likelihood] If the datapoints are *independent*, meaning that gathering the sample $X_1$ did not affect what $X_2$ was going to be, then the probabilities factorize $p(\{X_1, X_2\}) = p(X_1) p( X_2) $, so also the likelihoods factorize:
$$
\mathcal L (\vec \theta | D) = \prod_i \mathcal L (\vec \theta | X_i)\quad \text{if independent }X_i.
$$

[^why-more-datapoints-decrease-likelihood]: For example, suppose we have a fair coin. What is more probable, throwing once heads, or throwing the exact combination {heads, heads, tails, head, heads, tails, tails, tails, heads}?

If the data is distributed as a Gaussian around some average, then
$$
p(x | \mu,\sigma) = \dfrac{1}{\sqrt{ 2\pi \sigma^2}} \exp\left( - \frac{(x-\mu)^2}{2\sigma^2} \right),
$$
so that immediately gives the likelihood of $\mu,\sigma$:
$$
\mathcal{L}(\mu,\sigma | x ) = \dfrac{1}{\sqrt{ 2\pi \sigma^2}} \exp\left( - \frac{(x-\mu)^2}{2\sigma^2} \right).
$$
The likelihood of getting multiple datapoints with the same parameters (assuming the datapoints are indepdent) is then
$$
\mathcal{L}(\mu,\sigma | {X_1,X_2,\ldots..} ) = \prod_i \mathcal{L}(\mu,\sigma | x_i ) = \dfrac{1}{\sqrt{ 2\pi \sigma^2}} \exp\left( - \sum_i \frac{(x_i-\mu)^2}{2\sigma^2} \right).
$$

## Distributions of test statistics

**Summary: **The values of a test statistic are described by a probability distribution. We show what that distribution is for two simple cases.

A test statistic $z$ is a random number, because it is a function of the data, and is therefore characterized by a probability distribution $p(z | \theta)$. I specifically added a conditional on $\theta$, because a test statistic is typically comparing some observed data to a *known model* (which has parameter(s) $\theta$). Each different test statistic will have its own distribution. This is another reason why there are so many probability distributions in classical statistics: for each different test statistic that we propose, we potentially introduce a new, yet unknown distribution! Finding $p(z|\theta)$ can be challenging, but for the simple case of comparing the mean of data to a known model, the *central limit theorem* can be used to compute $p(z|\theta)$ analytically.

### Central limit theorem

**Summary: **We show that $z = (\bar x - \mu) / (\sigma /\sqrt n)$ is a well-chosen test statistic by deriving the central limit theorem. For this, we use the Fourier transform of the probability distribution of random variables, called the characteristic function.

#### Conceptual Description

Suppose we have random variables $X_i$, $i= 1, 2, \ldots$. We'd like to know whether the *average* of $X_i$, $\langle X \rangle$ (I left out the $i$ because we assume all $X_i$ are identically distributed) is equal to some known model. The model both has a specified mean and variance. We now make an *Ansatz* for a test statistic, and we'll see that this form can be used to analytically compute the probability of getting a certain value of that test statistic under the model. The Ansatz is:
$$
z = \dfrac{ \sum_i X_i -  n \mu } {\sqrt n \sigma},
$$
where $n$ is the number of random variables, $\mu$ is the model average that we're comparing the data with and $\sigma$ is the model standard deviation that we're comparing the data with.  This form is based on the observation that $\langle \sum_i X_i \rangle = n \langle X\rangle$, $\mathrm{var} [\sum_i X_i] = n \mathrm{var} [X_i] $.

Using the central limit theorem, we can show that the quantity $z$ has a distribution that no longer depends on $n,\mu$ or $\sigma$. Thus, by first rescaling the data in a clever way, we have found a single distribution that captures how different the sampled mean $\bar x$ is from the model (as described by $\mu, \sigma$)! This distribution is $p(z) \approx \dfrac 1 {\sqrt{2\pi}} e^{-\frac 1 2 z^2}$ (the approximation improves with larger $n$). If $p(z)$ is very small, then our data is very unlikely under the model. That might mean that our data is not described by the model. We'll discuss later how to make that more quantitative.

#### Derivation

To compute the distribution of $z$, $p(z)$, we first split it up into smaller terms: $z_n = \sum_i Y_i / \sqrt n$, where $Y_i = (X_i - \mu)/\sigma$. We do this because $Y_i$ has the nice properties that $\langle Y \rangle = 0, \mathrm{var}[Y] = 1$. We now compute the *characteristic function* of $p(z)$, which is just the Fourier transform of $p(z)$:
$$
\phi_z (k) = \int dz \, p(z) e^{ikz} = \langle e^{ikz} \rangle.
$$
This might seem very ad hoc, but we'll see that this makes our derivation easier. This is not complete coincidence, since derivatives of the characteristic function can be related to averages, variances, etc. Since the exponent transforms a sum into a product ($e^{a+b} = e^a e^b$), we find that
$$
\phi_z (k) = \phi_{\sum_i Y_i/\sqrt n} (k) = \phi_{Y_1 / \sqrt n} \cdot \phi_{Y_2 / \sqrt n} \cdot ... = \prod _i \phi_{Y_i/\sqrt n} (k) = \phi_{Y/\sqrt n} (k)^n,
$$
where in the last step I used the fact that the $Y_i$ are all identically distributed and so have the same characteritic function. We use an additional property of the characteristic function, namely $\phi_{ax}(k) = \phi_x (ak)$, to find
$$
\phi_z (k) = (\phi_Y (k/\sqrt n))^n.
$$
This is useful because $k/\sqrt n \rightarrow 0$ for increasing $n$, which means we can now *Taylor expand* the characteristic function. This gives for the right hand side
$$
\phi_z (k) \approx \left( \phi_{Y} (0) + \frac{k}{\sqrt n} \phi_Y'(0) + \frac 1 2 \frac{k^2}{ n} \phi_Y ''(0) + \ldots  \right)^n.
$$
These three terms are, using the definition of the characteristic function,:

- $\phi_Y (0) = \langle e^{iY\cdot0} \rangle  = \langle 1\rangle  =1 $.
- $\phi_Y' (0) = \langle iY e^{iY\cdot0} \rangle  =0$, because it is an odd function (the integral over the positive and negative $Y$ cancel each other out)
- $\phi_Y'' (0) = \langle (iY)^2 e^{iY\cdot0} \rangle  =- \langle Y^2 \rangle = - \mathrm{var}[Y] = -1$ (as we defined the variance of $Y$ before).

Thus, we find for the characteristic function
$$
\phi_z (k) \approx \left( 1 - \frac {k^2}{2n} + \ldots  \right)^n \rightarrow e^{-\frac 1 2 k^2}.
$$
Now that we have the characteristic function of $z$, we in principle can also compute its probability distribution. For the particular form we found this is very easy, because the Fourier transform of a Gaussian is a Gaussian! This means that, if $\phi_z (k)$ is a Gaussian, then $p(z)$ must be also a Gaussian. In particular,
$$
p(z) \rightarrow \dfrac 1 {\sqrt{2\pi}} e^{-\frac 1 2 z^2}.
$$
So we computed the distribution of the test statistic $z$, and found that it does not depend on either the number of samples $n$ or the variance of the data $\mathrm{var}[X]$ anymore!

### Now that we have the central limit theorem, are we done?

**Summary: **We first propose a test statistic $t$ if the model does not have a known $\sigma $. We then show that the distribution of this test statistic $t$ is the Student's $t-$distribution.

Are we done? No. The central limit theorem made several assumptions that can be broken. Most importantly:

- the datapoints are independently sampled and identically distributed
- the number of datapoints is large
- the model that we're comparing the data with has *known parameters* ($\mu$ and $\sigma$)

Especially the last one's important. What if we'd like to compare the average of a sample with a model, but we don't know the variance of that model? Let's just try the next best thing: using the *sample* standard deviation $s$ instead of the *model* standard deviation $\sigma$. We then have test statistic $ t = (\bar x - \mu) / (s / \sqrt n)$. This is the famous *t-statistic*, and it is not distributed according to a Gaussian.

Here's the distribution that I found numerically for different values of $n$ (blue: $n=2$, orange: $n=4$, green: $n=100$):

![Student's_distribution](Student's_distribution.png)

For many samples $n\gg 1$, the distribution of $t$ looks like a Gaussian. This makes sense, because if we sample very often then of course the sampled standard deviation should look very much like the 'real' standard deviation, $s \approx \sigma$, so $t$ will be the same as $z$ as we found using the central limit theorem. For only a few samples $n \approx 1$, then $s$ can be very different to $\sigma$. Moreover, since $t \sim 1/ s$, if $s$ happens to be very small just by random chance, then $t$ can become very big. This is why the distribution of $t$ has *fat tails* for small values of $n$. The family of functions $p(t | \mu )$ is called the *Student's $t-$distribution*. It is not trivial to derive the formulae for $p(t|\mu)$, but you can see the sketch of a derivation below.

#### Derivation of Student's $t-$distribution

The student's t-distribution is (for simplicity I first subtracted $\mu$ from the datapoints)
$$
p(t) = p(\frac{\sum_i x_i }{\sqrt n s}),
$$
where $s^2 = \sum_i x_i^2 / (n-1)$ is the sample variance. To get to $p(t)$, we need to go through the following steps:

1. ***Task:*** Compute $p(\sum_i x_i | \sigma) $.
   ***Method 1 (common)***: We typically *assume* that $p(x_i)$ is a normal distribution with variance $\sigma^2$, so that $p(\sum_i x_i / n) = \mathcal{N}(0, \sigma^2 / n)$.

   ***Method 2 (general):*** We can find a more general rule for the distribution of a sum by recognizing that the characteristic function satisfies
   $$
   \phi_{U+V}(k) = \langle \exp(ik(U+V)) \rangle = \langle \exp(ikU) \rangle\langle \exp(ikV) \rangle = \phi_U (k) \phi_V (k),
   $$
   and that multiplication in $k-$space corresponds to convolution in real space, so that $p(z=U+V) = (p(U)*p(V))(z)$. So if we know $p(U),p(V)$, then $p(z)$ can formally straightforwardly be found (although the convolution might be a messy integral to compute).

2. ***Task*:** Compute $p(s)$. ***Method:***

   1. Compute $p(y=x^2)$. This can be found using the conservation of probability, $|p(y) d y| = p(x)dx$. From this follows that $p(y=x^2) = \frac{1}{\sqrt{2\pi y}}e^{-y/2}$ .
   2. Now that we have $p(y = x^2)$, we need to find $p(\sum_i y_i)$. For this, we use the convolution theorem for summed variables that we found before.
   3. We now need to find $p(s={\sqrt z}^{-1})$ , which can again be found by using conservation of probability.

3. ***Task:*** Compute $p(\sqrt n \bar x / s)$. ***Method:***

   1. $p(t) = \int ds ~ d\bar x \delta( t- \sqrt n \bar x / s) p(\bar x) p(s)$
   2. Using a variable substitution, we can express the above integral in terms of Gamma functions.



## What do we do with the distribution of a test statistic?

**Summary: **The distribution of a test statistic can be used to compare data against a null hypothesis.

Whatever the form of the test statistic, let's use $Z$ as a catch-all symbol, we have been frequently referring to this distribution $p(Z | \theta)$ where $\theta$ is some model parameter. Why is this a useful quantity? It allows for us to first propose a *null hypothesis* in the form of a model, and then to compare the data probability, under that model.

When comparing the data against a null hypothesis, the idea in the scientific method of *falsifying* a hypothesis very naturally arises: we first propose a null hypothesis model $H_0$, and can then see whether the observed data is (im)probable under that model $p(Z | H_0)$.

### Flow chart of the process

1. Assume a null hypothesis $H_0$:
   - $H_0$ refers to some kind of expectation about your data
   - $H_0$ can be fully parametrized, as was the case when we compared data against a Gaussian with known $\mu,\sigma$; or only be partially parametrized, as was the case when we estimated $\sigma$ using $s$; or even be non-parametrized.
   - $H_0$ makes a statement about the value of a statistic, e.g. that the mean is a certain value.
2. Propose a test statistic $Z$ that captures whether $H_0$ is true or not.
3. Compute the distribution of $Z$ *under $H_0$*, $p(Z|H_0)$. Important: in computing $p(Z|H_0)$, we assume that the data was generated by the process that is consistent with $H_0$.
4. Give your test statistic $Z$ and its associated distribution a cool-sounding name, like *The Pirate-Z* and the *Harr-Distribution* $\mathrm{Harr}(Z)$.

### Why are there so many test statistics? Why are there so many distributions in hypothesis testing?

As we can see in the above flow-chart, testing different quantities needs different test statistics. Testing for whether the median is different in your data compared to a null model? You need a new test statistic! Testing for whether the variance in your data is different to the null model? You need a new test statistic! Comparing the mean of two samples against *each other*, both with their own sample variances? You need a new test statistic! Additionally, if your null model is not fully parametrized, then you might have to estimate that unknown parameter in your test statistic.

It's easy to see why the number of test statistics will expand to account for all these combinations. For each new test statistic that we propose, we have to compute its distribution under the null model $p(Z|H_0)$. In some cases, $p(Z|H_0)$ might be a known distribution from a different problem, but often it is not. This is one reason why the number of distributions is so large: we have to account for all the possible test statistics that we want to use.

## How do we 'accept' or 'reject' a hypothesis?

**Summary: **We discuss false positives, false negatives, and that there exists are trade-off between these two.

When comparing data to a null model $H_0$ (which is true or false), we can reject or not reject that hypothesis. Thus, there are four combinations in total of accepting/rejecting a true/false null hypothesis. Amongst these, there are two erroneous conclusions: rejecting a true null hypothesis ('false positive' or 'type 1 error') and falsely accepting the null hypothesis ('false negative' or 'type 2 error').

Let's denote the false positive and false negative errors by respectively $\alpha$ and $\beta$. The highest value of $\alpha$ that we're willing to accept is also called the *significance*, and the lower the significance the fewer false positives we make (lower is better, everything else being equal). For some reason that I do not know, statisticians more often use the number $1-\beta$ over $\beta$ directly, and they call $1-\beta$ the *statistical size*. When comparing two hypotheses that are mutually exclusive, but when one of them is for sure true, then $1-\beta$ is the *true positive* rate.[^statistical-power-true-positive-relationship] So statistical power is another word for true positive rate in these cases.

[^statistical-power-true-positive-relationship]: That this is so can be seen as follows. The true positive rate is $p(\hat R H_0| \sim H_0)$, where the symbol $\hat R H_0$ refers to 'rejecting the null hypothesis'; and the tilde means that the $H_0$ is false. The false negative rate is $\beta = p(H_0 | \sim H_0)$. Since we either accept or reject the hypothesis, we have $1 = p(H_0|\sim H_0)+p(\hat R H_0 | \sim H_0)$, so we find that the true positive rate $p(\hat R H_0 | \sim H_0) = 1- p(H_0|\sim H_0) = 1- \beta$.

Ideally, we'd like to make both $\alpha$ and $\beta$ as small as possible. It turns out that this is not always possible: there is a *trade-off* between false positives and false negatives. I do not know how general this statement is, or whether there are cases when there isn't a trade-off, but for any hypothesis test by thresholding the test statistic, this trade-off is inevitable. The relationship between $\alpha,\beta$ for a given model and its data can be visualized in the *receiver operator characteristic* (ROC), which is just a fancy term for a graph with the statistical error rates. The graph below [from Wikipedia](https://commons.wikimedia.org/wiki/File:ROC_curves.svg) illustrates this trade-off and the corresponding ROC curve.

![ROC_curves.svg](ROC_curves.svg.png)

Although there is a trade-off between $\alpha$ and $\beta$ *for a given test*, it is perfectly possible for test procedure A to have its error rates always be smaller than of a different test procedure B (i.e. that $\alpha_A < \alpha_B$ and $\beta_A < \beta_B$). In fact, it turns out that, for a given maximum value of $\alpha$, there is a test procedure that unambiguously produces the lowest value of $\beta$. A test that satisfies this condition is called *most powerful*, and for a certain type of hypothesis the likelihood ratio is the test statistic that provides this most powerful test. Thus, **some test statistics are really better than others** That statement is subject of the Neyman-Pearson lemma, which we have reproduced below.

### Why some test statistics are better than others (Neyman-Pearson lemma)

We will show that the test statistic
$$
L = \dfrac{\mathcal L (\theta _0 | x)} {\mathcal L (\theta_1 | x)},
$$
where $x$ is data and $\theta_{0,1}$ are two possible values of a model parameter ($\theta_0$ is the null model value), is the most powerful test statistic for a certain type of hypothesis. The type of hypothesis is one that uses a rejection region, rejecting the hypothesis if $L$ lies in a certain region. Concretely, the rejection region is $R_{NP} = \{x : L \leq \eta \}$ where $\eta$ is a number chosen such that $p(R_{NP} | \theta_0) = \alpha$.

Our task will be to show that $p(R_{NP}|\theta_1) \geq p(R|\theta_1)$, i.e. that the test statistics $L$ with associated rejection region $R_{NP}$ is always more powerful than the other test with region $R$.

For this different test statistic with its own rejection region, we have $p(R | \theta) = \int_R dx p(x | \theta)  = \int_R dx \mathcal L (\theta | x)$. For this test to have significance level $\alpha$, we have $p(R|\theta_0) \leq \alpha$. We will now do some manipulations of the intervals in $p(R|\theta), p(R_{NP} | \theta )$ to make a comparison between the two.

First, we note that, in general
$$
p(R | \theta) = p(R \cap S | \theta) + p(R \cap S^C | \theta),\quad(*)
$$

for any regions $R,S$ and $S^C$ is the complement of $S$. We plug this into the definition of the significance level ($p(R_{NP}|\theta_0) =\alpha \geq p(R | \theta_0)$):
$$
p(R_{NP} \cap R^C|\theta_0) = \alpha \geq p(R_{NP}^C \cap R|\theta_0).\quad(**)
$$
We now have
$$
\begin{align}
p(S=R_{NP} \cap R^C|\theta_1) & = \int_S dx \, \mathcal L (\theta_1 | x) \\
& \geq \int_S dx  \mathcal L (\theta_0 | x) / \eta,
\end{align}
$$
where I plugged in $L \leq \eta $ inside the region $R_{NP}$ so also inside the region $S \in R_{NP}$. Thus
$$
\begin{align}
p(S=R_{NP} \cap R^C|\theta_1) & \geq p(S | \theta_0) \\
& \geq \eta^{-1} p(S^C | \theta_0)\quad(\text{from }**) \\
& = \eta^{-1} \int_{S^C} dx \,  \mathcal L (\theta_0 | x) \\
& > \int_{S^C} dx \, \mathcal L (\theta_1 | x) \quad \because L > \eta\forall x \in S^C \\
& = p(S^C | \theta_1).
\end{align}
$$
So $p(R_{NP} \cap R^C | \theta_1) > p(R_{NP}^C\cap R | \theta_1)$, which by $(*)$ implies that $p(R_{NP}|\theta_1) \geq p(R |\theta_1)$. We have thus found that the likelihood ratio $L$ has, for any choice of the significance level $\alpha$, the lowest possible false negative rate $\beta$ amongst any possible test statistic we could have chosen.