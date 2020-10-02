# Ruby Word Segmentation

A simple Ruby project for Chinese &amp; Japanese word segmentation

## Installation

```bash
git clone https://github.com/Reoooh/sRWS.git
```

Please make sure the Ruby environment is installed.

## Function & Description

All methods of this word segmentation project are based on the String matching theory [dictionary scheme].

This project can be applied to Chinese and Japanese word segmentation.

### CWS [Chinese Word Segmentation]

**Segmentation algorithm:**
>forward maximum matching method

>backward maximum matching method

>bidirectional maximum matching method 

**Dictionary source:**

The dictionary for Chinese Word Segmentation comes from the open source project [**HanLP**](https://github.com/hankcs/HanLP).

### JWS [Japanese Word Segmentation]

**Segmentation algorithm:**
>forward maximum matching method

**Dictionary source:**

The dictionary for Japanese Word Segmentation is generated by the kernel program. The final dictionary uses most of the variants of verbs and adjectives. Therefore, the number of words in the final dictionary exceeds more than 20 times of the original dictionary.

>`WARNING`: the original dictionary comes from the book "红宝书10000日语单词随身带". The electronic version is manually generated myself. Please make sure you hold this book in any form if you need to use the original dictionary.

## Start

### CWS

You can start like this:

```bash
\WS\CWS
>>ruby Connecter.rb "中文分词测试"
FORWARD: ["中文", "分词", "测试"]
BACKWARD: ["中文", "分词", "测试"]
BIDIRECTIONAL: ["中文", "分词", "测试"]
```

And test the time spent on word segmentation processing.

```bash
\WS\CWS
>>ruby Connectertest.rb "中文分词测试"
FORWARD: ["中文", "分词", "测试"]
Rehearsal ----------------------------------------------
time:        3.469000   0.046000   3.515000 (  3.531568)
------------------------------------- total: 3.515000sec

                 user     system      total        real
time:        3.281000   0.063000   3.344000 (  3.373417)
BACKWARD: ["中文", "分词", "测试"]
Rehearsal ----------------------------------------------
time:        2.719000   0.015000   2.734000 (  2.758816)
------------------------------------- total: 2.734000sec

                 user     system      total        real
time:        2.625000   0.047000   2.672000 (  2.796045)
BIDIRECTIONAL: ["中文", "分词", "测试"]
Rehearsal ----------------------------------------------
time:        5.828000   0.078000   5.906000 (  5.913542)
------------------------------------- total: 5.906000sec

                 user     system      total        real
time:        5.828000   0.093000   5.921000 (  5.946587)

```

### JWS

```bash
\WS\JWS
>>ruby Connecter.rb "日本語言葉区分するテスト"
FORWARD: ["日本語", "言葉", "区分する", "テスト"]
```

```bash
\WS\JWS
>>ruby Connectertest.rb "日本語言葉区分するテスト"
["日本語", "言葉", "区分する", "テスト"]
Rehearsal ----------------------------------------------
time:       32.922000   0.734000  33.656000 ( 33.757088)
------------------------------------ total: 33.656000sec

                 user     system      total        real
time:       37.218000   0.860000  38.078000 ( 39.532077)
```

Actually, the correct Japanese sentences is as follows:

```bash
\WS\JWS
>>ruby Connecter.rb "日本語単語分割テスト"
FORWARD: ["日本語", "単", "語", "分", "割", "テスト"]
```

```bash
\WS\JWS
>>ruby Connectertest.rb "日本語単語分割テスト"
["日本語", "単", "語", "分", "割", "テスト"]
Rehearsal ----------------------------------------------
time:       32.344000   0.563000  32.907000 ( 32.941230)
------------------------------------ total: 32.907000sec

                 user     system      total        real
time:       31.969000   0.984000  32.953000 ( 32.970740)
```

Hence you can find out the flaws in this word segmentation processing project: program cannot recognize words that not included in the dictionary.

## License

*GNU General Public License v3.0*