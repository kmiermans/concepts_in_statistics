# Concepts in Statistics: A short summary

## For whom is this guide?

- you have a solid understanding of math (probability distributions, Taylor series, Fourier transforms and random numbers), but do not yet understand statistics
- you may have used hypothesis tests before, but don't know why should use one hypothesis test over a different one
- you'd like to see an overview of the important concepts in hypothesis testing in a single, relatively short document

## Usage

- This is a work in progress, but I'm nearly done.
- Feel free to make changes!
- Use, share anyway you like.

## Table of contents

[TOC]

# Jargon

| Term                                | Meaning                                               | Ref  |
| ----------------------------------- | ----------------------------------------------------- | ---- |
| statistic                           | any single numbers that's a function of the data      |      |
| test statistic                      | statistic used for hypothesis tests                   |      |
| <img src="svgs/8da378ea51dd127a81c941b1dfb19725.svg" align=middle width=55.02870614999999pt height=24.65753399999998pt/>                          | Test statistic distribution under the null hypothesis |      |
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

# Statistics and test statistics: What are they and why do we need them?

**Summary: **Test statistics are single numbers that we use to test whether two processes are statistically identical. We discuss the properties that test statistics must have.

To do hypothesis tests, we use *test statistics*. For example, if we'd like to test whether the random numbers <img src="svgs/cbfb1b2a33b28eab8a3e59464768e810.svg" align=middle width=14.908688849999992pt height=22.465723500000017pt/> from process A are bigger than those <img src="svgs/91aac9730317276af725abd8cef04ca9.svg" align=middle width=13.19638649999999pt height=22.465723500000017pt/> of process B, a test statistic could be <img src="svgs/cf346e8cd512485c2ec1b75b17fd5076.svg" align=middle width=93.20753474999998pt height=22.465723500000017pt/>, which is <img src="svgs/cadf2fe66531a3c8631846ce20387b18.svg" align=middle width=53.23049984999998pt height=22.465723500000017pt/> if the numbers from A are consistently bigger. However, <img src="svgs/3919bbc84b8079e27194efe99a1f6a80.svg" align=middle width=23.09366069999999pt height=22.465723500000017pt/> only takes into acount *one* number, making it very susceptible to noise. Thus, we'd like to sample more often to make our testing procedure more reliable. So what about <img src="svgs/3dabdfc4f53ba8a806370410393c761d.svg" align=middle width=160.41195719999996pt height=26.438629799999987pt/> for <img src="svgs/55a049b8f161ae7cfeb0197d75aff967.svg" align=middle width=9.86687624999999pt height=14.15524440000002pt/> samples? Unfortunately, this test statistic suffers from a different problem: bigger values of <img src="svgs/55a049b8f161ae7cfeb0197d75aff967.svg" align=middle width=9.86687624999999pt height=14.15524440000002pt/> will typically make <img src="svgs/ac87b3dee752f676705ab4eaeb869853.svg" align=middle width=31.21968299999999pt height=22.465723500000017pt/> consistently grow in the positive or negative direction. We say that this test statistic is not *standardized*: we cannot say whether a larger <img src="svgs/ac87b3dee752f676705ab4eaeb869853.svg" align=middle width=31.21968299999999pt height=22.465723500000017pt/> is (un)expected without first specifying <img src="svgs/55a049b8f161ae7cfeb0197d75aff967.svg" align=middle width=9.86687624999999pt height=14.15524440000002pt/>.

Here are some additional poor choices of test statistics:

- <img src="svgs/47662fec64038058ebf75da1f7e3edde.svg" align=middle width=98.26475174999999pt height=22.465723500000017pt/>  -- because it is naturally biased towards <img src="svgs/cbfb1b2a33b28eab8a3e59464768e810.svg" align=middle width=14.908688849999992pt height=22.465723500000017pt/>)
- <img src="svgs/dde8815ab9cc12609e34755cea61c4ad.svg" align=middle width=136.70772225pt height=26.76175259999998pt/> -- it doesn't depend on <img src="svgs/55a049b8f161ae7cfeb0197d75aff967.svg" align=middle width=9.86687624999999pt height=14.15524440000002pt/> and isn't biased towards <img src="svgs/cbfb1b2a33b28eab8a3e59464768e810.svg" align=middle width=14.908688849999992pt height=22.465723500000017pt/> or <img src="svgs/91aac9730317276af725abd8cef04ca9.svg" align=middle width=13.19638649999999pt height=22.465723500000017pt/>, but it doesn't take into account the natural size of randomness of <img src="svgs/cbfb1b2a33b28eab8a3e59464768e810.svg" align=middle width=14.908688849999992pt height=22.465723500000017pt/> and <img src="svgs/91aac9730317276af725abd8cef04ca9.svg" align=middle width=13.19638649999999pt height=22.465723500000017pt/> (the larger the random variation in <img src="svgs/7c7983b2cd2968086bca685696c4e4c0.svg" align=middle width=34.49769179999999pt height=22.465723500000017pt/> are, the larger <img src="svgs/ca2be8fbc4d1bf92851e1fab5fa30de4.svg" align=middle width=53.377039649999986pt height=22.465723500000017pt/> will be).

A proper test statistic needs to take into account both:

- The number of datapoints by dividing by <img src="svgs/55a049b8f161ae7cfeb0197d75aff967.svg" align=middle width=9.86687624999999pt height=14.15524440000002pt/>.
- Take into account the natural variation in the random variables.

We'll later prove that the *central limit theorem* provides us with a possible answer to this question in some cases. There are additional desirable properties of a test statistic (but that are not strictly necessary):

- We can find a closed solution for the distribution of that test statistic. We'll see later why that's useful.
- The 'performance' of the test statistic is good. We'll see later that not every test statistic has the same performance.
- The test statistic doesn't suffer much from practical problems such as outliers.

Statisticians developed new test statistics to improve performance in these desirable properties. That's one reason why there are so many test statistics, but we'll see that there are also more fundamental reason why we can't escape having many test statistics.

Once we have a test statistics that compares A and B (let's call it <img src="svgs/5b51bd2e6f329245d425b8002d7cf942.svg" align=middle width=12.397274999999992pt height=22.465723500000017pt/>), then probably a big value <img src="svgs/9302c9c8da4286cadc24d90074a4fc8f.svg" align=middle width=46.18707884999999pt height=22.465723500000017pt/> indicates that A and B are 'not the same'. How big is big enough? How probable is probably? It would be nice to have an exact criterion for this. That's what we'll do in the next two sections.

# The likelihood

**Summary: **The likelihood function of a model is the probability of observing data under that model.

The *likelihood of a parameter <img src="svgs/27e556cf3caa0673ac49a8f0de3c73ca.svg" align=middle width=8.17352744999999pt height=22.831056599999986pt/> is the probability of observing data, given that I know <img src="svgs/27e556cf3caa0673ac49a8f0de3c73ca.svg" align=middle width=8.17352744999999pt height=22.831056599999986pt/>*. The likelihood function for a parameter <img src="svgs/27e556cf3caa0673ac49a8f0de3c73ca.svg" align=middle width=8.17352744999999pt height=22.831056599999986pt/> written as <img src="svgs/3fe2b009a752b6f5feaaea200cb8048a.svg" align=middle width=51.77179589999999pt height=24.65753399999998pt/>, where <img src="svgs/27e556cf3caa0673ac49a8f0de3c73ca.svg" align=middle width=8.17352744999999pt height=22.831056599999986pt/> is a model parameter and <img src="svgs/cbfb1b2a33b28eab8a3e59464768e810.svg" align=middle width=14.908688849999992pt height=22.465723500000017pt/> is a datapoint. But that's just mathematical formalism -- what it means is <img src="svgs/029886f0172c2e6b172ddac2fe4e221b.svg" align=middle width=122.39384354999997pt height=24.65753399999998pt/> (notice the arguments were interchanged!). For a model that predicts data extremely well, the likelihood will be high. Therefore, the likelihood expresses a 'goodness of fit' of a model to the data. This does not mean that that model is 'correct', however, since we might have two models that both correctly predict a small number of data-points.

Often, a model has more than one parameter. Then we might write a 'parameter vector' <img src="svgs/27b7ee76c64e98529a60d016fec233db.svg" align=middle width=94.06361909999998pt height=32.16441360000002pt/> for all the different model parameters. And almost always do we have more than one datapoint <img src="svgs/ee8c2cc9552027c4ae74e0732abb8d1b.svg" align=middle width=111.76004069999999pt height=22.465723500000017pt/>. The likelihood is then just written <img src="svgs/93c0d67f045ab9aa23b50de5cda7a770.svg" align=middle width=120.70897244999999pt height=32.16441360000002pt/>. The more datapoints we have (so the bigger the size of the set  <img src="svgs/78ec2b7008296ce0561cf83393cb746d.svg" align=middle width=14.06623184999999pt height=22.465723500000017pt/>), the less likely getting *one specific* set of values for those datapoints becomes.[^why-more-datapoints-decrease-likelihood] If the datapoints are *independent*, meaning that gathering the sample <img src="svgs/4a0dab614eaf1e6dc58146666d67ace8.svg" align=middle width=20.17129784999999pt height=22.465723500000017pt/> did not affect what <img src="svgs/f6fac43e354f1b2ca85658091df26df1.svg" align=middle width=20.17129784999999pt height=22.465723500000017pt/> was going to be, then the probabilities factorize <img src="svgs/79b7d5f627c992386bc59184177fc1fe.svg" align=middle width=192.80277884999998pt height=24.65753399999998pt/>, so also the likelihoods factorize:
<p align="center"><img src="svgs/8cb710f869b0d4d62c51c216a47b7ef3.svg" align=middle width=300.86148015pt height=36.6554298pt/></p>

[^why-more-datapoints-decrease-likelihood]: For example, suppose we have a fair coin. What is more probable, throwing once heads, or throwing the exact combination {heads, heads, tails, head, heads, tails, tails, tails, heads}?

If the data is distributed as a Gaussian around some average, then
<p align="center"><img src="svgs/e0208b98cc6c99a3ffcf06bfaf6353d1.svg" align=middle width=275.6910156pt height=40.11819404999999pt/></p>
so that immediately gives the likelihood of <img src="svgs/7b0881fb1fe04f6ff118b6c65e811738.svg" align=middle width=27.19370774999999pt height=14.15524440000002pt/>:
<p align="center"><img src="svgs/579b0e9d3ee334e7a834027728828ad9.svg" align=middle width=278.75839199999996pt height=40.11819404999999pt/></p>
The likelihood of getting multiple datapoints with the same parameters (assuming the datapoints are indepdent) is then
<p align="center"><img src="svgs/d8bef619ef1e2dd5bf567b67e15d6305.svg" align=middle width=509.94751664999995pt height=49.315569599999996pt/></p>

# Distributions of test statistics

**Summary: **The values of a test statistic are described by a probability distribution. We show what that distribution is for two simple cases.

A test statistic <img src="svgs/f93ce33e511096ed626b4719d50f17d2.svg" align=middle width=8.367621899999993pt height=14.15524440000002pt/> is a random number, because it is a function of the data, and is therefore characterized by a probability distribution <img src="svgs/c614f0a80ddb90ba8922662a93f65e1c.svg" align=middle width=42.16337069999999pt height=24.65753399999998pt/>. I specifically added a conditional on <img src="svgs/27e556cf3caa0673ac49a8f0de3c73ca.svg" align=middle width=8.17352744999999pt height=22.831056599999986pt/>, because a test statistic is typically comparing some observed data to a *known model* (which has parameter(s) <img src="svgs/27e556cf3caa0673ac49a8f0de3c73ca.svg" align=middle width=8.17352744999999pt height=22.831056599999986pt/>). Each different test statistic will have its own distribution. This is another reason why there are so many probability distributions in classical statistics: for each different test statistic that we propose, we potentially introduce a new, yet unknown distribution! Finding <img src="svgs/9a5225f3064fc77522e2c33d73c4ba6b.svg" align=middle width=42.16337069999999pt height=24.65753399999998pt/> can be challenging, but for the simple case of comparing the mean of data to a known model, the *central limit theorem* can be used to compute <img src="svgs/9a5225f3064fc77522e2c33d73c4ba6b.svg" align=middle width=42.16337069999999pt height=24.65753399999998pt/> analytically.

# Central limit theorem

**Summary: **We show that <img src="svgs/cc6e98e61e214f13f4b577d6dddb0ef6.svg" align=middle width=145.2340461pt height=24.995338500000003pt/> is a well-chosen test statistic by deriving the central limit theorem. For this, we use the Fourier transform of the probability distribution of random variables, called the characteristic function.

## Conceptual Description

Suppose we have random variables <img src="svgs/1338d1e5163ba5bc872f1411dd30b36a.svg" align=middle width=18.269651399999987pt height=22.465723500000017pt/>, <img src="svgs/72c406f73b0f4ea0534f41a0196ff981.svg" align=middle width=77.80903184999998pt height=21.68300969999999pt/>. We'd like to know whether the *average* of <img src="svgs/1338d1e5163ba5bc872f1411dd30b36a.svg" align=middle width=18.269651399999987pt height=22.465723500000017pt/>, <img src="svgs/49188d6a93d491968eac687abcd5473f.svg" align=middle width=27.694099949999988pt height=24.65753399999998pt/> (I left out the <img src="svgs/77a3b857d53fb44e33b53e4c8b68351a.svg" align=middle width=5.663225699999989pt height=21.68300969999999pt/> because we assume all <img src="svgs/1338d1e5163ba5bc872f1411dd30b36a.svg" align=middle width=18.269651399999987pt height=22.465723500000017pt/> are identically distributed) is equal to some known model. The model both has a specified mean and variance. We now make an *Ansatz* for a test statistic, and we'll see that this form can be used to analytically compute the probability of getting a certain value of that test statistic under the model. The Ansatz is:
<p align="center"><img src="svgs/00b6ee164fd296142c83e9f2ac07fa98.svg" align=middle width=123.31526954999998pt height=38.958780299999994pt/></p>
where <img src="svgs/55a049b8f161ae7cfeb0197d75aff967.svg" align=middle width=9.86687624999999pt height=14.15524440000002pt/> is the number of random variables, <img src="svgs/07617f9d8fe48b4a7b3f523d6730eef0.svg" align=middle width=9.90492359999999pt height=14.15524440000002pt/> is the model average that we're comparing the data with and <img src="svgs/8cda31ed38c6d59d14ebefa440099572.svg" align=middle width=9.98290094999999pt height=14.15524440000002pt/> is the model standard deviation that we're comparing the data with.  This form is based on the observation that <img src="svgs/26a9caf154654af48db7bd1a2552115b.svg" align=middle width=116.9196963pt height=24.657735299999988pt/>, <img src="svgs/999944a4880ebebd0da5c64ec8f9e761.svg" align=middle width=158.63692844999997pt height=24.657735299999988pt/>.

Using the central limit theorem, we can show that the quantity <img src="svgs/f93ce33e511096ed626b4719d50f17d2.svg" align=middle width=8.367621899999993pt height=14.15524440000002pt/> has a distribution that no longer depends on <img src="svgs/06b5aaaed2a773cd04319ba167748d81.svg" align=middle width=27.07768304999999pt height=14.15524440000002pt/> or <img src="svgs/8cda31ed38c6d59d14ebefa440099572.svg" align=middle width=9.98290094999999pt height=14.15524440000002pt/>. Thus, by first rescaling the data in a clever way, we have found a single distribution that captures how different the sampled mean <img src="svgs/c97fba47d1059b5c2d3fa5f52768a2a7.svg" align=middle width=9.39498779999999pt height=18.666631500000015pt/> is from the model (as described by <img src="svgs/ad5bfc709b2e6c94b4dab37e68111117.svg" align=middle width=27.19370774999999pt height=14.15524440000002pt/>)! This distribution is <img src="svgs/915e8c48633f3adc2db7753975c9cac3.svg" align=middle width=126.97750889999998pt height=43.42856099999997pt/> (the approximation improves with larger <img src="svgs/55a049b8f161ae7cfeb0197d75aff967.svg" align=middle width=9.86687624999999pt height=14.15524440000002pt/>). If <img src="svgs/8fffcccc47f9f88dac738cc6bbf65e09.svg" align=middle width=29.42361839999999pt height=24.65753399999998pt/> is very small, then our data is very unlikely under the model. That might mean that our data is not described by the model. We'll discuss later how to make that more quantitative.

<details><summary>Derivation of Central Limit Theorem</summary>
To compute the distribution of <img src="svgs/f93ce33e511096ed626b4719d50f17d2.svg" align=middle width=8.367621899999993pt height=14.15524440000002pt/>, <img src="svgs/8fffcccc47f9f88dac738cc6bbf65e09.svg" align=middle width=29.42361839999999pt height=24.65753399999998pt/>, we first split it up into smaller terms: <img src="svgs/9456d07855d6d3510ac4031a49c8af6f.svg" align=middle width=110.87528429999999pt height=24.995338500000003pt/>, where <img src="svgs/87284acfc7d9cab9246d7c3cb9ee8d8e.svg" align=middle width=117.00903554999998pt height=24.65753399999998pt/>. We do this because <img src="svgs/c503cd3cc90b9dc8646daa73c42365ae.svg" align=middle width=14.19429989999999pt height=22.465723500000017pt/> has the nice properties that <img src="svgs/96f3c94049603177c673e7ae1ec30371.svg" align=middle width=138.31036559999998pt height=24.65753399999998pt/>. We now compute the *characteristic function* of <img src="svgs/8fffcccc47f9f88dac738cc6bbf65e09.svg" align=middle width=29.42361839999999pt height=24.65753399999998pt/>, which is just the Fourier transform of <img src="svgs/8fffcccc47f9f88dac738cc6bbf65e09.svg" align=middle width=29.42361839999999pt height=24.65753399999998pt/>:
<p align="center"><img src="svgs/9423563ceecbb4194675156cac04d411.svg" align=middle width=222.97205699999998pt height=36.53007435pt/></p>
This might seem very ad hoc, but we'll see that this makes our derivation easier. This is not complete coincidence, since derivatives of the characteristic function can be related to averages, variances, etc. Since the exponent transforms a sum into a product (<img src="svgs/8482c2e3fe4d93ac5bd4ef07456052d2.svg" align=middle width=82.4376564pt height=27.91243950000002pt/>), we find that
<p align="center"><img src="svgs/702a6e7c6e0c9718c66c1c4783f0c7a1.svg" align=middle width=533.13053475pt height=36.6554298pt/></p>
where in the last step I used the fact that the <img src="svgs/c503cd3cc90b9dc8646daa73c42365ae.svg" align=middle width=14.19429989999999pt height=22.465723500000017pt/> are all identically distributed and so have the same characteritic function. We use an additional property of the characteristic function, namely <img src="svgs/4defab76fc56da744d202e5b35952bb1.svg" align=middle width=117.6003741pt height=24.65753399999998pt/>, to find
<p align="center"><img src="svgs/9ceec0ec8d641efef3d014e1185d0da3.svg" align=middle width=162.267138pt height=17.4097869pt/></p>
This is useful because <img src="svgs/e8b40c26627bf7caca68e40fba7c381f.svg" align=middle width=74.64993029999998pt height=24.995338500000003pt/> for increasing <img src="svgs/55a049b8f161ae7cfeb0197d75aff967.svg" align=middle width=9.86687624999999pt height=14.15524440000002pt/>, which means we can now *Taylor expand* the characteristic function. This gives for the right hand side
<p align="center"><img src="svgs/f97be2594835dc176afd7f294d19397f.svg" align=middle width=367.6619067pt height=41.00863635pt/></p>
These three terms are, using the definition of the characteristic function,:

- <img src="svgs/37227f2bba7841aa2e4340420d37630f.svg" align=middle width=184.08344294999998pt height=27.6567522pt/>.
- <img src="svgs/fc3413a5bb88efbed2f12c12ad768d34.svg" align=middle width=160.02077684999998pt height=27.6567522pt/>, because it is an odd function (the integral over the positive and negative <img src="svgs/91aac9730317276af725abd8cef04ca9.svg" align=middle width=13.19638649999999pt height=22.465723500000017pt/> cancel each other out)
- <img src="svgs/0e421c4d494545d64c71d0778e0fa87d.svg" align=middle width=340.47749174999996pt height=27.6567522pt/> (as we defined the variance of <img src="svgs/91aac9730317276af725abd8cef04ca9.svg" align=middle width=13.19638649999999pt height=22.465723500000017pt/> before).

Thus, we find for the characteristic function
<p align="center"><img src="svgs/68d58ab34673319e4b6dabd8c3698611.svg" align=middle width=256.01445209999997pt height=41.00863635pt/></p>
Now that we have the characteristic function of <img src="svgs/f93ce33e511096ed626b4719d50f17d2.svg" align=middle width=8.367621899999993pt height=14.15524440000002pt/>, we in principle can also compute its probability distribution. For the particular form we found this is very easy, because the Fourier transform of a Gaussian is a Gaussian! This means that, if <img src="svgs/2b3503d6adb2148079284d3658461dc5.svg" align=middle width=39.229609649999986pt height=24.65753399999998pt/> is a Gaussian, then <img src="svgs/8fffcccc47f9f88dac738cc6bbf65e09.svg" align=middle width=29.42361839999999pt height=24.65753399999998pt/> must be also a Gaussian. In particular,
<p align="center"><img src="svgs/2215729028c663e7f11ca21a3b6bd93d.svg" align=middle width=136.84051095pt height=37.0017615pt/></p>
So we computed the distribution of the test statistic <img src="svgs/f93ce33e511096ed626b4719d50f17d2.svg" align=middle width=8.367621899999993pt height=14.15524440000002pt/>, and found that it does not depend on either the number of samples <img src="svgs/55a049b8f161ae7cfeb0197d75aff967.svg" align=middle width=9.86687624999999pt height=14.15524440000002pt/> or the variance of the data <img src="svgs/7f58d2dffa0159e5fc0d00ee69279da1.svg" align=middle width=46.461275849999986pt height=24.65753399999998pt/> anymore!

</derivation>

## Now that we have the central limit theorem, are we done?

**Summary: **We first propose a test statistic <img src="svgs/4f4f4e395762a3af4575de74c019ebb5.svg" align=middle width=5.936097749999991pt height=20.221802699999984pt/> if the model does not have a known <img src="svgs/7aed918aa12a276a602e30e90b0b109d.svg" align=middle width=9.98290094999999pt height=14.15524440000002pt/>. We then show that the distribution of this test statistic <img src="svgs/4f4f4e395762a3af4575de74c019ebb5.svg" align=middle width=5.936097749999991pt height=20.221802699999984pt/> is the Student's <img src="svgs/944d1711a090dfbf9e813cbd3a10ded1.svg" align=middle width=18.72153029999999pt height=20.221802699999984pt/>distribution.

Are we done? No. The central limit theorem made several assumptions that can be broken. Most importantly:

- the datapoints are independently sampled and identically distributed
- the number of datapoints is large
- the model that we're comparing the data with has *known parameters* (<img src="svgs/07617f9d8fe48b4a7b3f523d6730eef0.svg" align=middle width=9.90492359999999pt height=14.15524440000002pt/> and <img src="svgs/8cda31ed38c6d59d14ebefa440099572.svg" align=middle width=9.98290094999999pt height=14.15524440000002pt/>)

Especially the last one's important. What if we'd like to compare the average of a sample with a model, but we don't know the variance of that model? Let's just try the next best thing: using the *sample* standard deviation <img src="svgs/6f9bad7347b91ceebebd3ad7e6f6f2d1.svg" align=middle width=7.7054801999999905pt height=14.15524440000002pt/> instead of the *model* standard deviation <img src="svgs/8cda31ed38c6d59d14ebefa440099572.svg" align=middle width=9.98290094999999pt height=14.15524440000002pt/>. We then have test statistic <img src="svgs/69198485a36d8fdb9b9f796e29e8f5c2.svg" align=middle width=140.52512265pt height=24.995338500000003pt/>. This is the famous *t-statistic*, and it is not distributed according to a Gaussian.

Here's the distribution that I found numerically for different values of <img src="svgs/55a049b8f161ae7cfeb0197d75aff967.svg" align=middle width=9.86687624999999pt height=14.15524440000002pt/> (blue: <img src="svgs/da60d8ce586cf444dfc2735588ee6cab.svg" align=middle width=40.00371704999999pt height=21.18721440000001pt/>, orange: <img src="svgs/180bde3f581b83f9e0205ff90404a62d.svg" align=middle width=40.00371704999999pt height=21.18721440000001pt/>, green: <img src="svgs/60956056c8ac4a0bb767ef199f98b76b.svg" align=middle width=56.442135749999984pt height=21.18721440000001pt/>):

![Student's_distribution](Student's_distribution.png)

For many samples <img src="svgs/bd0e84fa44072440418590ed368aa5cd.svg" align=middle width=43.65668669999999pt height=21.18721440000001pt/>, the distribution of <img src="svgs/4f4f4e395762a3af4575de74c019ebb5.svg" align=middle width=5.936097749999991pt height=20.221802699999984pt/> looks like a Gaussian. This makes sense, because if we sample very often then of course the sampled standard deviation should look very much like the 'real' standard deviation, <img src="svgs/c98e16ece767d2a0d4061ef00a1cbfef.svg" align=middle width=39.606010949999984pt height=15.883457699999983pt/>, so <img src="svgs/4f4f4e395762a3af4575de74c019ebb5.svg" align=middle width=5.936097749999991pt height=20.221802699999984pt/> will be the same as <img src="svgs/f93ce33e511096ed626b4719d50f17d2.svg" align=middle width=8.367621899999993pt height=14.15524440000002pt/> as we found using the central limit theorem. For only a few samples <img src="svgs/2b1dd818c8d59054a639e174faecd8a9.svg" align=middle width=40.00371704999999pt height=21.18721440000001pt/>, then <img src="svgs/6f9bad7347b91ceebebd3ad7e6f6f2d1.svg" align=middle width=7.7054801999999905pt height=14.15524440000002pt/> can be very different to <img src="svgs/8cda31ed38c6d59d14ebefa440099572.svg" align=middle width=9.98290094999999pt height=14.15524440000002pt/>. Moreover, since <img src="svgs/6eb0fbd98e16e35403529c915ec49b0c.svg" align=middle width=51.99762644999999pt height=24.65753399999998pt/>, if <img src="svgs/6f9bad7347b91ceebebd3ad7e6f6f2d1.svg" align=middle width=7.7054801999999905pt height=14.15524440000002pt/> happens to be very small just by random chance, then <img src="svgs/4f4f4e395762a3af4575de74c019ebb5.svg" align=middle width=5.936097749999991pt height=20.221802699999984pt/> can become very big. This is why the distribution of <img src="svgs/4f4f4e395762a3af4575de74c019ebb5.svg" align=middle width=5.936097749999991pt height=20.221802699999984pt/> has *fat tails* for small values of <img src="svgs/55a049b8f161ae7cfeb0197d75aff967.svg" align=middle width=9.86687624999999pt height=14.15524440000002pt/>. The family of functions <img src="svgs/9b68b67b54de4ece1432314cff7b9574.svg" align=middle width=41.46324599999999pt height=24.65753399999998pt/> is called the *Student's <img src="svgs/944d1711a090dfbf9e813cbd3a10ded1.svg" align=middle width=18.72153029999999pt height=20.221802699999984pt/>distribution*. It is not trivial to derive the formulae for <img src="svgs/2dd05df5f614aac171df87d71ac56bf0.svg" align=middle width=41.46324599999999pt height=24.65753399999998pt/>, but you can see the sketch of a derivation below.

<details><summary>Sketch of derivation of Student's t-distribution</summary>
The student's t-distribution is (for simplicity I first subtracted <img src="svgs/07617f9d8fe48b4a7b3f523d6730eef0.svg" align=middle width=9.90492359999999pt height=14.15524440000002pt/> from the datapoints)
<p align="center"><img src="svgs/1ff0fafd24078fcedeca66f0d4ed014d.svg" align=middle width=118.90901714999998pt height=38.958780299999994pt/></p>
where <img src="svgs/148cb16a2bdd7e34afdef24f19394b82.svg" align=middle width=138.51304499999998pt height=26.76175259999998pt/> is the sample variance. To get to <img src="svgs/bb7a14d80e3cf63b2aa80d2c30c1687a.svg" align=middle width=26.99209754999999pt height=24.65753399999998pt/>, we need to go through the following steps:

1. ***Task:*** Compute <img src="svgs/478fa690f2e7213211eba2ab533d9dba.svg" align=middle width=76.03699784999999pt height=24.657735299999988pt/>.
   ***Method 1 (common)***: We typically *assume* that $p(x_i)$ is a normal distribution with variance $\sigma^2$, so that $p(\sum_i x_i / n) = \mathcal{N}(0, \sigma^2 / n)$.

   ***Method 2 (general):*** We can find a more general rule for the distribution of a sum by recognizing that the characteristic function satisfies
   $$
   \phi_{U+V}(k) = \langle \exp(ik(U+V)) \rangle = \langle \exp(ikU) \rangle\langle \exp(ikV) \rangle = \phi_U (k) \phi_V (k),
   $$
   and that multiplication in $k-$space corresponds to convolution in real space, so that $p(z=U+V) = (p(U)*p(V))(z)$. So if we know $p(U),p(V)$, then $p(z)$ can formally straightforwardly be found (although the convolution might be a messy integral to compute).

2. ***Task*:** Compute <img src="svgs/06aa0ddc268a11c1ceba21f3adde7d3a.svg" align=middle width=28.761479999999988pt height=24.65753399999998pt/>. ***Method:***

   1. Compute $p(y=x^2)$. This can be found using the conservation of probability, $|p(y) d y| = p(x)dx$. From this follows that $p(y=x^2) = \frac{1}{\sqrt{2\pi y}}e^{-y/2}$ .
   2. Now that we have $p(y = x^2)$, we need to find $p(\sum_i y_i)$. For this, we use the convolution theorem for summed variables that we found before.
   3. We now need to find $p(s={\sqrt z}^{-1})$ , which can again be found by using conservation of probability.

3. ***Task:*** Compute <img src="svgs/43d4b69e1bfd1527638628c0ef9c7d60.svg" align=middle width=69.94120319999999pt height=24.995338500000003pt/>. ***Method:***

   1. $p(t) = \int ds ~ d\bar x \delta( t- \sqrt n \bar x / s) p(\bar x) p(s)$
   2. Using a variable substitution, we can express the above integral in terms of Gamma functions.

</details>



# What do we do with the distribution of a test statistic?

**Summary: **The distribution of a test statistic can be used to compare data against a null hypothesis.

Whatever the form of the test statistic, let's use <img src="svgs/5b51bd2e6f329245d425b8002d7cf942.svg" align=middle width=12.397274999999992pt height=22.465723500000017pt/> as a catch-all symbol, we have been frequently referring to this distribution <img src="svgs/629b0e5ce695ad24658d4123ddc09f36.svg" align=middle width=46.19302049999999pt height=24.65753399999998pt/> where <img src="svgs/27e556cf3caa0673ac49a8f0de3c73ca.svg" align=middle width=8.17352744999999pt height=22.831056599999986pt/> is some model parameter. Why is this a useful quantity? It allows for us to first propose a *null hypothesis* in the form of a model, and then to compare the data probability, under that model.

When comparing the data against a null hypothesis, the idea in the scientific method of *falsifying* a hypothesis very naturally arises: we first propose a null hypothesis model <img src="svgs/30074edb23bec8e7c47c584ff885e5b5.svg" align=middle width=20.21695004999999pt height=22.465723500000017pt/>, and can then see whether the observed data is (im)probable under that model <img src="svgs/213bcf5df33c9c327c40804fe7250419.svg" align=middle width=59.058355949999985pt height=24.65753399999998pt/>.

## Flow chart of the process of setting up a test procedure

1. Assume a null hypothesis <img src="svgs/30074edb23bec8e7c47c584ff885e5b5.svg" align=middle width=20.21695004999999pt height=22.465723500000017pt/>:
   - $H_0$ refers to some kind of expectation about your data
   - $H_0$ can be fully parametrized, as was the case when we compared data against a Gaussian with known $\mu,\sigma$; or only be partially parametrized, as was the case when we estimated $\sigma$ using $s$; or even be non-parametrized.
   - $H_0$ makes a statement about the value of a statistic, e.g. that the mean is a certain value.
2. Propose a test statistic <img src="svgs/5b51bd2e6f329245d425b8002d7cf942.svg" align=middle width=12.397274999999992pt height=22.465723500000017pt/> that captures whether <img src="svgs/30074edb23bec8e7c47c584ff885e5b5.svg" align=middle width=20.21695004999999pt height=22.465723500000017pt/> is true or not.
3. Compute the distribution of <img src="svgs/5b51bd2e6f329245d425b8002d7cf942.svg" align=middle width=12.397274999999992pt height=22.465723500000017pt/> *under <img src="svgs/30074edb23bec8e7c47c584ff885e5b5.svg" align=middle width=20.21695004999999pt height=22.465723500000017pt/>*, <img src="svgs/41949d22f67aa322c8b718334d05853a.svg" align=middle width=59.058355949999985pt height=24.65753399999998pt/>. Important: in computing <img src="svgs/41949d22f67aa322c8b718334d05853a.svg" align=middle width=59.058355949999985pt height=24.65753399999998pt/>, we assume that the data was generated by the process that is consistent with <img src="svgs/30074edb23bec8e7c47c584ff885e5b5.svg" align=middle width=20.21695004999999pt height=22.465723500000017pt/>.
4. Give your test statistic <img src="svgs/5b51bd2e6f329245d425b8002d7cf942.svg" align=middle width=12.397274999999992pt height=22.465723500000017pt/> and its associated distribution a cool-sounding name, like *The Pirate-Z* and the *Harr-Distribution* <img src="svgs/6d89b651e655c39221cb9d17c46f082f.svg" align=middle width=58.60742579999999pt height=24.65753399999998pt/>.

## Why are there so many test statistics? Why are there so many distributions in hypothesis testing?

As we can see in the above flow-chart, testing different quantities needs different test statistics. Testing for whether the median is different in your data compared to a null model? You need a new test statistic! Testing for whether the variance in your data is different to the null model? You need a new test statistic! Comparing the mean of two samples against *each other*, both with their own sample variances? You need a new test statistic! Additionally, if your null model is not fully parametrized, then you might have to estimate that unknown parameter in your test statistic.

It's easy to see why the number of test statistics will expand to account for all these combinations. For each new test statistic that we propose, we have to compute its distribution under the null model <img src="svgs/41949d22f67aa322c8b718334d05853a.svg" align=middle width=59.058355949999985pt height=24.65753399999998pt/>. In some cases, <img src="svgs/41949d22f67aa322c8b718334d05853a.svg" align=middle width=59.058355949999985pt height=24.65753399999998pt/> might be a known distribution from a different problem, but often it is not. This is one reason why the number of distributions is so large: we have to account for all the possible test statistics that we want to use.

# How do we 'accept' or 'reject' a hypothesis?

**Summary: **We discuss false positives, false negatives, and that there exists are trade-off between these two.

When comparing data to a null model <img src="svgs/30074edb23bec8e7c47c584ff885e5b5.svg" align=middle width=20.21695004999999pt height=22.465723500000017pt/> (which is true or false), we can reject or not reject that hypothesis. Thus, there are four combinations in total of accepting/rejecting a true/false null hypothesis. Amongst these, there are two erroneous conclusions: rejecting a true null hypothesis ('false positive' or 'type 1 error') and falsely accepting the null hypothesis ('false negative' or 'type 2 error').

Let's denote the false positive and false negative errors by respectively <img src="svgs/c745b9b57c145ec5577b82542b2df546.svg" align=middle width=10.57650494999999pt height=14.15524440000002pt/> and <img src="svgs/8217ed3c32a785f0b5aad4055f432ad8.svg" align=middle width=10.16555099999999pt height=22.831056599999986pt/>. The highest value of <img src="svgs/c745b9b57c145ec5577b82542b2df546.svg" align=middle width=10.57650494999999pt height=14.15524440000002pt/> that we're willing to accept is also called the *significance*, and the lower the significance the fewer false positives we make (lower is better, everything else being equal). For some reason that I do not know, statisticians more often use the number <img src="svgs/13741a4267de21d2928d76992e54f9e9.svg" align=middle width=38.475952349999986pt height=22.831056599999986pt/> over <img src="svgs/8217ed3c32a785f0b5aad4055f432ad8.svg" align=middle width=10.16555099999999pt height=22.831056599999986pt/> directly, and they call <img src="svgs/13741a4267de21d2928d76992e54f9e9.svg" align=middle width=38.475952349999986pt height=22.831056599999986pt/> the *statistical size*. When comparing two hypotheses that are mutually exclusive, but when one of them is for sure true, then <img src="svgs/13741a4267de21d2928d76992e54f9e9.svg" align=middle width=38.475952349999986pt height=22.831056599999986pt/> is the *true positive* rate. So statistical power is another word for true positive rate in these cases. That <img src="svgs/13741a4267de21d2928d76992e54f9e9.svg" align=middle width=38.475952349999986pt height=22.831056599999986pt/> is the true positive rate when <img src="svgs/8217ed3c32a785f0b5aad4055f432ad8.svg" align=middle width=10.16555099999999pt height=22.831056599999986pt/> is the false negative rate might not be intuitive, but this can be easily shown, as we do in the next subsection.

## How to get the true positive rate from the false negative rate<a name="false-negative-to-true-positive"></a>

The true positive rate is <img src="svgs/c69b81f9f042dfce610b406a275f1eee.svg" align=middle width=102.226047pt height=31.141535699999984pt/>, where the symbol <img src="svgs/c122693c30c037fc08dc8c1a87be72a3.svg" align=middle width=32.825416799999985pt height=31.141535699999984pt/> refers to 'rejecting the null hypothesis'; and the tilde means that the <img src="svgs/30074edb23bec8e7c47c584ff885e5b5.svg" align=middle width=20.21695004999999pt height=22.465723500000017pt/> is false. The false negative rate is <img src="svgs/58a36bd44509b57b3c79060dbe27f88a.svg" align=middle width=121.7007429pt height=24.65753399999998pt/>. Since we either accept or reject the hypothesis, we have <img src="svgs/aceb457e5a8231eb4ab426fa7ffa4cfe.svg" align=middle width=242.07165674999993pt height=31.141535699999984pt/>, so we find that the true positive rate <img src="svgs/490be82c9eb1ec4558957219050862d7.svg" align=middle width=302.46523890000003pt height=31.141535699999984pt/>.

## There exists a trade-off between the false negative and false positive rate

Ideally, we'd like to make both <img src="svgs/c745b9b57c145ec5577b82542b2df546.svg" align=middle width=10.57650494999999pt height=14.15524440000002pt/> and <img src="svgs/8217ed3c32a785f0b5aad4055f432ad8.svg" align=middle width=10.16555099999999pt height=22.831056599999986pt/> as small as possible. It turns out that this is not always possible: there is a *trade-off* between false positives and false negatives. I do not know how general this statement is, or whether there are cases when there isn't a trade-off, but for any hypothesis test by thresholding the test statistic, this trade-off is inevitable. The relationship between <img src="svgs/a4e80986c12176a9830ef85b8225d816.svg" align=middle width=28.047932549999988pt height=22.831056599999986pt/> for a given model and its data can be visualized in the *receiver operator characteristic* (ROC), which is just a fancy term for a graph with the statistical error rates. The graph below [from Wikipedia](https://commons.wikimedia.org/wiki/File:ROC_curves.svg) illustrates this trade-off and the corresponding ROC curve.

![ROC_curves.svg](ROC_curves.svg.png)

Although there is a trade-off between <img src="svgs/c745b9b57c145ec5577b82542b2df546.svg" align=middle width=10.57650494999999pt height=14.15524440000002pt/> and <img src="svgs/8217ed3c32a785f0b5aad4055f432ad8.svg" align=middle width=10.16555099999999pt height=22.831056599999986pt/> *for a given test*, it is perfectly possible for test procedure A to have its error rates always be smaller than of a different test procedure B (i.e. that <img src="svgs/8873aa70a117c2adee51ba016cdac476.svg" align=middle width=64.14937154999998pt height=17.723762100000005pt/> and <img src="svgs/dbebb6526daa3c7b9c6b2bbb9250cc6d.svg" align=middle width=61.714006199999986pt height=22.831056599999986pt/>). In fact, it turns out that, for a given maximum value of <img src="svgs/c745b9b57c145ec5577b82542b2df546.svg" align=middle width=10.57650494999999pt height=14.15524440000002pt/>, there is a test procedure that unambiguously produces the lowest value of <img src="svgs/8217ed3c32a785f0b5aad4055f432ad8.svg" align=middle width=10.16555099999999pt height=22.831056599999986pt/>. A test that satisfies this condition is called *most powerful*, and for a certain type of hypothesis the likelihood ratio is the test statistic that provides this most powerful test. Thus, **some test statistics are really better than others** That statement is subject of the Neyman-Pearson lemma, which we have reproduced below.

## Why some test statistics are better than others (Neyman-Pearson lemma)

**Summary: **For a given statistical significance <img src="svgs/c745b9b57c145ec5577b82542b2df546.svg" align=middle width=10.57650494999999pt height=14.15524440000002pt/>, different test statistics provide different rates of false negatives. A test that has the lowest rate of false negatives is called *most powerful*. It turns out that for some hypotheses, we can prove that the likelihood ratio provides the most powerful test for every <img src="svgs/c745b9b57c145ec5577b82542b2df546.svg" align=middle width=10.57650494999999pt height=14.15524440000002pt/>.

<details><summary>Proof of the Neyman Pearson Lemma</summary>

We will show that the test statistic
<p align="center"><img src="svgs/83690da5b853066b6a50b98abf85757b.svg" align=middle width=94.792203pt height=38.83491479999999pt/></p>
where <img src="svgs/332cc365a4987aacce0ead01b8bdcc0b.svg" align=middle width=9.39498779999999pt height=14.15524440000002pt/> is data and <img src="svgs/250af282ceb3941baaf0ac3bcf8aa912.svg" align=middle width=24.72611954999999pt height=22.831056599999986pt/> are two possible values of a model parameter (<img src="svgs/1a3151e36f9f52b61f5bf76c08bdae2b.svg" align=middle width=14.269439249999989pt height=22.831056599999986pt/> is the null model value), is the most powerful test statistic for a certain type of hypothesis. The type of hypothesis is one that uses a rejection region, rejecting the hypothesis if <img src="svgs/ddcb483302ed36a59286424aa5e0be17.svg" align=middle width=11.18724254999999pt height=22.465723500000017pt/> lies in a certain region. Concretely, the rejection region is <img src="svgs/f4b80273e968b63356c5f0bfcbc01dd2.svg" align=middle width=138.3944958pt height=24.65753399999998pt/> where <img src="svgs/1d0496971a2775f4887d1df25cea4f7e.svg" align=middle width=8.751954749999989pt height=14.15524440000002pt/> is a number chosen such that <img src="svgs/6fa62954bf0a9f8158528c60ac73bf89.svg" align=middle width=108.29593994999998pt height=24.65753399999998pt/>.

Our task will be to show that <img src="svgs/078cd4bf57ce249803bcd3a065d6d6fa.svg" align=middle width=151.04148179999999pt height=24.65753399999998pt/>, i.e. that the test statistics <img src="svgs/ddcb483302ed36a59286424aa5e0be17.svg" align=middle width=11.18724254999999pt height=22.465723500000017pt/> with associated rejection region <img src="svgs/5a6b3efec910388607b64490a5d84680.svg" align=middle width=34.266361799999984pt height=22.465723500000017pt/> is always more powerful than the other test with region <img src="svgs/1e438235ef9ec72fc51ac5025516017c.svg" align=middle width=12.60847334999999pt height=22.465723500000017pt/>.

For this different test statistic with its own rejection region, we have <img src="svgs/34c3b832e5f48b9fc1fd2f56d387f9d4.svg" align=middle width=258.16211189999996pt height=26.48417309999999pt/>. For this test to have significance level <img src="svgs/c745b9b57c145ec5577b82542b2df546.svg" align=middle width=10.57650494999999pt height=14.15524440000002pt/>, we have <img src="svgs/6adef3d8a6a4a08a422a4b48bf7a9fdc.svg" align=middle width=85.81618154999998pt height=24.65753399999998pt/>. We will now do some manipulations of the intervals in <img src="svgs/136de44a8507aa8c54fffde734160e89.svg" align=middle width=122.59408424999998pt height=24.65753399999998pt/> to make a comparison between the two.

First, we note that, in general
<p align="center"><img src="svgs/32fed603165f3a3cc2337bed6bc9d80c.svg" align=middle width=295.61096564999997pt height=18.7598829pt/></p>

for any regions <img src="svgs/a973e43d3073713c981ad9db64a20a32.svg" align=middle width=30.941755349999987pt height=22.465723500000017pt/> and <img src="svgs/e579f2c669b7b8ac7c607076044f0589.svg" align=middle width=21.26187689999999pt height=27.6567522pt/> is the complement of <img src="svgs/e257acd1ccbe7fcb654708f1a866bfe9.svg" align=middle width=11.027402099999989pt height=22.465723500000017pt/>. We plug this into the definition of the significance level (<img src="svgs/cd769ffad12c1db9eab2fba15ffe49df.svg" align=middle width=183.53560994999998pt height=24.65753399999998pt/>):
<p align="center"><img src="svgs/f96b3e39265c90d28a9f6ccfe00eed45.svg" align=middle width=329.04657225pt height=18.7598829pt/></p>
We now have
<p align="center"><img src="svgs/6a6575a2966a146acd3df9b8df22e086.svg" align=middle width=286.65320145pt height=81.279264pt/></p>
where I plugged in <img src="svgs/6ce2b48c272b9a3000cfb85fa49f135b.svg" align=middle width=41.85682874999999pt height=22.465723500000017pt/> inside the region <img src="svgs/5a6b3efec910388607b64490a5d84680.svg" align=middle width=34.266361799999984pt height=22.465723500000017pt/> so also inside the region <img src="svgs/3abafb5e85bd363a7939e5cff5d1d08a.svg" align=middle width=65.3848833pt height=22.465723500000017pt/>. Thus
<p align="center"><img src="svgs/b6dd6dbef42d64be74da49e2ea842047.svg" align=middle width=415.68973049999994pt height=160.90149735pt/></p>
So <img src="svgs/16a8df7972a372205bd63fbd093583a8.svg" align=middle width=246.3239856pt height=27.6567522pt/>, which by <img src="svgs/70c4c9b9d0b3ff0ac46f10357ad7ce3c.svg" align=middle width=21.00464354999999pt height=24.65753399999998pt/> implies that <img src="svgs/9d71aaf43b1c3c6574e8f88182c9de79.svg" align=middle width=151.04148179999999pt height=24.65753399999998pt/>. We have thus found that the likelihood ratio <img src="svgs/ddcb483302ed36a59286424aa5e0be17.svg" align=middle width=11.18724254999999pt height=22.465723500000017pt/> has, for any choice of the significance level <img src="svgs/c745b9b57c145ec5577b82542b2df546.svg" align=middle width=10.57650494999999pt height=14.15524440000002pt/>, the lowest possible false negative rate <img src="svgs/8217ed3c32a785f0b5aad4055f432ad8.svg" align=middle width=10.16555099999999pt height=22.831056599999986pt/> amongst any possible test statistic we could have chosen.

</details>
