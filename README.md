# Random
様々な乱数発生アルゴリズムを実装する。
特に、スレッドセーフかつ、スレッド毎の乱数列において相関が生まれないような生成手法について議論する。

![](https://github.com/LUXOPHIA/Random/raw/master/--------/_SCREENSHOT/Random.gif)

----
* **LCG: Linear congruential generator**
    * [Wikipedia, the free encyclopedia](https://en.wikipedia.org)
        * [Linear congruential generator](https://en.wikipedia.org/wiki/Linear_congruential_generator)
    * [Wikipedia](https://ja.wikipedia.org)
        * [線形合同法](https://ja.wikipedia.org/wiki/線形合同法)
    * [Project Nayuki](https://www.nayuki.io)
        * [Fast skipping in a linear congruential generator](https://www.nayuki.io/page/fast-skipping-in-a-linear-congruential-generator)
    * [nag](https://www.nag.co.uk)
        * [NAG Library Chapter Introduction](https://www.nag.co.uk/numeric/fl/nagdoc_fl23/pdf/G05/g05intro.pdf)
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
* **PCG**
  * [PCG, A Family of Better Random Number Generators | PCG, A Better Random Number Generator](http://www.pcg-random.org)
      * [Download the PCG Library | PCG, A Better Random Number Generator](http://www.pcg-random.org/download.html)
  * [GitHub](https://github.com)
      * [imneme](https://github.com/imneme)
          * [imneme/pcg-c-basic: PCG — Minimal C Implementation](https://github.com/imneme/pcg-c-basic)
          * [imneme/pcg-cpp: PCG — C++ Implementation](https://github.com/imneme/pcg-cpp)
          * [imneme/pcg-c: PCG — C Implementation](https://github.com/imneme/pcg-c)
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


[![Delphi Starter](http://img.en25.com/EloquaImages/clients/Embarcadero/%7B063f1eec-64a6-4c19-840f-9b59d407c914%7D_dx-starter-bn159.png)](https://www.embarcadero.com/jp/products/delphi/starter)
