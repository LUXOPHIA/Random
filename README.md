# Random
様々な乱数発生アルゴリズムを実装する。
特に、スレッドセーフかつ、スレッド毎の乱数列において相関が生まれないような生成手法について議論する。

![](https://github.com/LUXOPHIA/Random/raw/master/--------/_SCREENSHOT/Random.gif)

----
## Output Test
In all algorithms, the seed value (state vector) is initialized by consecutive natural numbers starting from 1.

> * **\*p**：Period size
> * **\*b**：Output bit
> * **\*s**：Step size

* [**LCG**](https://github.com/LUXOPHIA/Random/tree/master/--------/_OUTPUT/LCG)
    * [LCG 32p 32b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/LCG/LCG%2032p%2032b.txt).txt
    * [LCG 48p 48b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/LCG/LCG%2048p%2048b.txt).txt
    * [LCG 64p 64b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/LCG/LCG%2064p%2064b.txt).txt
* [**PCG**](https://github.com/LUXOPHIA/Random/tree/master/--------/_OUTPUT/PCG)
    * [PCG 08p 08b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/PCG/PCG%2008p%2008b.txt).txt
    * [PCG 16p 16b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/PCG/PCG%2016p%2016b.txt).txt
    * [PCG 32p 32b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/PCG/PCG%2032p%2032b.txt).txt
    * [PCG 64p 64b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/PCG/PCG%2064p%2064b.txt).txt
* [**SFMT**](https://github.com/LUXOPHIA/Random/tree/master/--------/_OUTPUT/SFMT)
    * [SFMT 000607p 32b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/SFMT/SFMT%20000607p%2032b.txt).txt
    * [SFMT 000607p 64b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/SFMT/SFMT%20000607p%2064b.txt).txt
    * [SFMT 001279p 32b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/SFMT/SFMT%20001279p%2032b.txt).txt
    * [SFMT 001279p 64b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/SFMT/SFMT%20001279p%2064b.txt).txt
    * [SFMT 002281p 32b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/SFMT/SFMT%20002281p%2032b.txt).txt
    * [SFMT 002281p 64b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/SFMT/SFMT%20002281p%2064b.txt).txt
    * [SFMT 004253p 32b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/SFMT/SFMT%20004253p%2032b.txt).txt
    * [SFMT 004253p 64b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/SFMT/SFMT%20004253p%2064b.txt).txt
    * [SFMT 011213p 32b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/SFMT/SFMT%20011213p%2032b.txt).txt
    * [SFMT 011213p 64b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/SFMT/SFMT%20011213p%2064b.txt).txt
    * [SFMT 019937p 32b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/SFMT/SFMT%20019937p%2032b.txt).txt
    * [SFMT 019937p 64b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/SFMT/SFMT%20019937p%2064b.txt).txt
    * [SFMT 044497p 32b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/SFMT/SFMT%20044497p%2032b.txt).txt
    * [SFMT 044497p 64b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/SFMT/SFMT%20044497p%2064b.txt).txt
    * [SFMT 086243p 32b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/SFMT/SFMT%20086243p%2032b.txt).txt
    * [SFMT 086243p 64b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/SFMT/SFMT%20086243p%2064b.txt).txt
    * [SFMT 132049p 32b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/SFMT/SFMT%20132049p%2032b.txt).txt
    * [SFMT 132049p 64b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/SFMT/SFMT%20132049p%2064b.txt).txt
    * [SFMT 216091p 32b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/SFMT/SFMT%20216091p%2032b.txt).txt
    * [SFMT 216091p 64b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/SFMT/SFMT%20216091p%2064b.txt).txt
* [**WELL**](https://github.com/LUXOPHIA/Random/tree/master/--------/_OUTPUT/WELL)
    * [WELL-a 00512p 32b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/WELL/WELL-a%2000512p%2032b.txt).txt
    * [WELL-a 01024p 32b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/WELL/WELL-a%2001024p%2032b.txt).txt
    * [WELL-a 19937p 32b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/WELL/WELL-a%2019937p%2032b.txt).txt
    * [WELL-a 44497p 32b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/WELL/WELL-a%2044497p%2032b.txt).txt
    * [WELL-a_new 19937p 32b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/WELL/WELL-a_new%2019937p%2032b.txt).txt
    * [WELL-a_new 44497p 32b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/WELL/WELL-a_new%2044497p%2032b.txt).txt
    * [WELL-b 44497p 32b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/WELL/WELL-b%2044497p%2032b.txt).txt
    * [WELL-c 19937p 32b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/WELL/WELL-c%2019937p%2032b.txt).txt
* [**Xorshift**](https://github.com/LUXOPHIA/Random/tree/master/--------/_OUTPUT/Xorshift)
    * [Xorshift 032p 32b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/Xorshift/Xorshift%20032p%2032b.txt).txt
    * [Xorshift 064p 32b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/Xorshift/Xorshift%20064p%2032b.txt).txt
    * [Xorshift 064p 64b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/Xorshift/Xorshift%20064p%2064b.txt).txt
    * [Xorshift 096p 32b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/Xorshift/Xorshift%20096p%2032b.txt).txt
    * [Xorshift 128p 32b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/Xorshift/Xorshift%20128p%2032b.txt).txt
* [**xoshiro**](https://github.com/LUXOPHIA/Random/tree/master/--------/_OUTPUT/xoshiro)
    * [xoshiro-p 128p 32b 64s](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/xoshiro/xoshiro-p%20128p%2032b%2064s.txt).txt
    * [xoshiro-p 128p 32b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/xoshiro/xoshiro-p%20128p%2032b.txt).txt
    * [xoshiro-p 256p 64b 128s](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/xoshiro/xoshiro-p%20256p%2064b%20128s.txt).txt
    * [xoshiro-p 256p 64b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/xoshiro/xoshiro-p%20256p%2064b.txt).txt
    * [xoshiro-p 512p 64b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/xoshiro/xoshiro-p%20512p%2064b.txt).txt
    * [xoshiro-ss 128p 32b 64](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/xoshiro/xoshiro-ss%20128p%2032b%2064s.txt).txt
    * [xoshiro-ss 128p 32b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/xoshiro/xoshiro-ss%20128p%2032b.txt).txt
    * [xoshiro-ss 256p 64b 128s](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/xoshiro/xoshiro-ss%20256p%2064b%20128s.txt).txt
    * [xoshiro-ss 256p 64b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/xoshiro/xoshiro-ss%20256p%2064b.txt).txt
    * [xoshiro-ss 512p 64b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/xoshiro/xoshiro-ss%20512p%2064b.txt).txt
    * [**xoroshiro**](https://github.com/LUXOPHIA/Random/tree/master/--------/_OUTPUT/xoshiro/xoroshiro)
        * [xoroshiro-p 128p 64b 64s](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/xoshiro/xoroshiro/xoroshiro-p%20128p%2064b%2064s.txt).txt
        * [xoroshiro-p 128p 64b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/xoshiro/xoroshiro/xoroshiro-p%20128p%2064b.txt).txt
        * [xoroshiro-s 064p 32b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/xoshiro/xoroshiro/xoroshiro-s%20064p%2032b.txt).txt
        * [xoroshiro-s 128p 64b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/xoshiro/xoroshiro/xoroshiro-s%20128p%2064b.txt).txt
        * [xoroshiro-ss 064p 32b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/xoshiro/xoroshiro/xoroshiro-ss%20064p%2032b.txt).txt
        * [xoroshiro-ss 128p 64b 64s](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/xoshiro/xoroshiro/xoroshiro-ss%20128p%2064b%2064s.txt).txt
        * [xoroshiro-ss 128p 64b](https://github.com/LUXOPHIA/Random/blob/master/--------/_OUTPUT/xoshiro/xoroshiro/xoroshiro-ss%20128p%2064b.txt).txt

----
## Reference

* **LCG: Linear congruential generator**
    * [Wikipedia, the free encyclopedia](https://en.wikipedia.org)
        * [Linear congruential generator](https://en.wikipedia.org/wiki/Linear_congruential_generator)
    * [Wikipedia](https://ja.wikipedia.org)
        * [線形合同法](https://ja.wikipedia.org/wiki/線形合同法)
    * [Project Nayuki](https://www.nayuki.io)
        * [Fast skipping in a linear congruential generator](https://www.nayuki.io/page/fast-skipping-in-a-linear-congruential-generator)
    * [nag](https://www.nag.co.uk)
        * [NAG Library Chapter Introduction](https://www.nag.co.uk/numeric/fl/nagdoc_fl23/pdf/G05/g05intro.pdf)
* **PCG**
  * [PCG, A Family of Better Random Number Generators | PCG, A Better Random Number Generator](http://www.pcg-random.org)
      * [Download the PCG Library | PCG, A Better Random Number Generator](http://www.pcg-random.org/download.html)
  * [GitHub](https://github.com)
      * [imneme](https://github.com/imneme)
          * [imneme/pcg-c-basic: PCG — Minimal C Implementation](https://github.com/imneme/pcg-c-basic)
          * [imneme/pcg-cpp: PCG — C++ Implementation](https://github.com/imneme/pcg-cpp)
          * [imneme/pcg-c: PCG — C Implementation](https://github.com/imneme/pcg-c)
* **Mersenne Twister**
    * [Mersenne Twister: A random number generator (since 1997/10)](http://www.math.sci.hiroshima-u.ac.jp/~m-mat/MT/mt.html)
        * [SIMD-oriented Fast Mersenne Twister (SFMT)](http://www.math.sci.hiroshima-u.ac.jp/~m-mat/MT/SFMT/index-jp.html)
            * [SFMT jump function](http://www.math.sci.hiroshima-u.ac.jp/~m-mat/MT/SFMT/JUMP/index-jp.html)
        * [Mersenne Twister for Graphic Processors (MTGP)](http://www.math.sci.hiroshima-u.ac.jp/~m-mat/MT/MTGP/index-jp.html)
        * [Tiny Mersenne Twister (TinyMT)](http://www.math.sci.hiroshima-u.ac.jp/~m-mat/MT/TINYMT/index-jp.html)
    * [Wikipedia, the free encyclopedia](https://en.wikipedia.org)
        * [Mersenne Twister](https://en.wikipedia.org/wiki/Mersenne_Twister)
    * [Wikipedia](https://ja.wikipedia.org)
        * [メルセンヌ・ツイスタ](https://ja.wikipedia.org/wiki/メルセンヌ・ツイスタ)
* **WELL**
    * [Université de Montréal / UdeM](http://www.umontreal.ca)
        * [Accueil - Département d'informatique et de recherche opérationnelle - Université de Montréal](http://diro.umontreal.ca/accueil/)
            * [Francois Panneton, etudiant au Ph.D. en RO](http://www.iro.umontreal.ca/~panneton/)
                * [WELL Random number generator](http://www.iro.umontreal.ca/~panneton/WELLRNG.html)
                    * [Improved Long-Period Generators Based on Linear Recurrences Modulo 2](http://www.iro.umontreal.ca/~lecuyer/myftp/papers/lfsr04.pdf).pdf
    * [Wikipedia, the free encyclopedia](https://en.wikipedia.org)
        * [Well equidistributed long-period linear](https://en.wikipedia.org/wiki/Well_equidistributed_long-period_linear)
    * [立命館大学 - Beyond Borders -](http://www.ritsumei.ac.jp)
        * [原瀬 晋](http://www.ritsumei.ac.jp/~harase/harase_jp.html)
            * [Maximally equidistributed pseudorandom number generators](http://www.ritsumei.ac.jp/~harase/megenerators.html)
* **Xorshift**
    * [Wikipedia, the free encyclopedia](https://en.wikipedia.org)
        * [Xorshift](https://en.wikipedia.org/wiki/Xorshift)
    * [Wikipedia](https://ja.wikipedia.org)
        * [Xorshift](https://ja.wikipedia.org/wiki/Xorshift)
    * [Dipartimento di Informatica 'Giovanni Degli Antoni' - DI | Università degli Studi di Milano](http://www.di.unimi.it/ecm/home)
        * [Sebastiano Vigna](http://vigna.di.unimi.it)
            * [Further scramblings of Marsaglia’s xorshift generators](http://vigna.di.unimi.it/ftp/papers/xorshiftplus.pdf).pdf
            * [An experimental exploration of Marsaglia’s xorshift generators, scrambled](http://vigna.di.unimi.it/ftp/papers/xorshift.pdf).pdf
    * [和田維作のホームページ](http://www001.upp.so-net.ne.jp/isaku/)
        * [良い乱数・悪い乱数](http://www001.upp.so-net.ne.jp/isaku/rand.html)
        * [乱数ライブラリ](http://www001.upp.so-net.ne.jp/isaku/rand2.html)
            * [jump.c : Xorshift で戻ったり一瞬で相対ジャンプできるプログラム](http://www001.upp.so-net.ne.jp/isaku/jump.c.html)
* **xoshiro / xoroshiro**
    * [xoshiro/xoroshiro generators and the PRNG shootout](http://xoshiro.di.unimi.it)
    * [Dipartimento di Informatica 'Giovanni Degli Antoni' - DI | Università degli Studi di Milano](http://www.di.unimi.it/ecm/home)
        * [Sebastiano Vigna](http://vigna.di.unimi.it)
            * [Sebastiano Vigna/Papers](http://vigna.di.unimi.it/papers.php)
                * [Scrambled Linear Pseudorandom Number Generators](http://vigna.di.unimi.it/ftp/papers/ScrambledLinear.pdf).pdf

[![Delphi Starter](https://github.com/delphiusers/FreeDelphi/raw/master/Banner/FreeDelphi-Banner_350x126.png)](https://www.embarcadero.com/jp/products/delphi/starter)
