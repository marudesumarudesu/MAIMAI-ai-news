---
title: "Gemini 3.8 Flash登場｜3.7と同価格でコーディング・AIエージェント性能を強化。APIと日本ユーザーへの影響"
date: 2026-09-02
author: "AIエンジニア MAIMAI"
category: "AIニュース"
company: "Google / Google DeepMind"
source_url: "https://blog.google/innovation-and-ai/models-and-research/gemini-models/3-8-flash-and-3-8-flash-cyber/"
official_source: true
importance: 96
affiliate_category: "gemini"
---

# Gemini 3.8 Flash登場｜3.7と同価格でコーディング・AIエージェント性能を強化。APIと日本ユーザーへの影響

## 3行でいうと

- Googleは2026年9月2日、**Gemini 3.8 Flash**を正式公開しました。3週間前の3.7 Flashから、ソフトウェア開発、AIエージェント、複数工程の推論を強化しています。
- APIは**1,048,576トークンのコンテキスト、最大65,536トークン出力**。導入価格は**入力0.75ドル・出力3.75ドル/100万トークン**で、Googleは3.7 Flashと同価格と説明しています。
- ただし3.8は3.7より多くのトークンを使う傾向があり、**1トークン単価が同じでも1タスクあたりの実コストが上がる場合があります**。企業導入ではここが重要です。

## 何が発表された？

GoogleとGoogle DeepMindは2026年9月2日、Gemini 3.8シリーズとして2つのモデルを発表しました。

1つ目が一般開発者・企業・有料Geminiユーザー向けの**Gemini 3.8 Flash**。  
2つ目がサイバー防御向けの**Gemini 3.8 Flash Cyber**です。

3.8 FlashはすでにGA、つまり試験版ではなく一般提供段階に入っています。開発者はGoogle AI StudioやGemini API、企業はGemini Enterpriseで利用できます。一般ユーザー向けにはGoogle AI ProとUltra契約者のGeminiアプリ、Google検索のAI Mode、Google Sheetsなどで利用可能とGoogleが案内しています。

主要仕様は次の通りです。

| 項目 | Gemini 3.8 Flash |
|---|---:|
| モデルID | `gemini-3.8-flash` |
| 提供段階 | GA |
| 入力 | テキスト・画像・音声・動画 |
| 出力 | テキスト |
| コンテキスト長 | 1,048,576 tokens |
| 最大出力 | 65,536 tokens |
| thinking level | LOW / MEDIUM / HIGH |
| 標準設定 | MEDIUM |

「コンテキスト長」とは、AIが1回の処理で参照できる情報量です。約100万トークンあるため、長いコードベース、大量文書、長時間動画などをまとめて扱う用途に向きます。

## 今までと何が違う？

3.8 Flashは、3.7 Flashの速度・価格帯を維持しながら、特にコーディングとAIエージェント性能を引き上げたモデルです。

Google Cloudの公式開発者ガイドでは、3.7 Flashとの比較が公開されています。

| ベンチマーク | 3.8 Flash | 3.7 Flash | 何を見ている？ |
|---|---:|---:|---|
| Terminal-bench 2.1 | **90.8%** | 81.6% | ターミナルを使う実務的なエージェント作業 |
| SWE-Bench Pro | **61.6%** | 60.4% | 実際のソフトウェア修正 |
| SWE-Atlas | **51.9%** | 48.0% | コード修正・開発能力 |
| τ³-bench Banking | **38.1%** | 30.9% | 銀行業務の複数工程タスク |
| CharXiv | **86.2%** | 84.5% | 図表を含むマルチモーダル理解 |
| HLE | 45.4% | **45.7%** | 非常に難しい幅広い知識・推論 |

ここで重要なのは、すべての評価が上がっているわけではないことです。Humanity's Last Examでは3.7 Flashをわずかに下回っています。

3.8 Flashは、**実務的なエージェント・コード作業へ重点を置いて改善されたモデル**と見るのが適切です。

Google自身も、3.8 Flashは3.7 Flashより精度と信頼性が高い一方、**より多くのトークンを消費する**と開発者向け資料で明記しています。計算効率を最優先する場合は3.7 Flashを検討するよう案内しています。

### API価格

Googleの発表時点の導入価格は次の通りです。

| 項目 | 導入価格 |
|---|---:|
| 入力 | $0.75 / 100万tokens |
| 出力 | $3.75 / 100万tokens |

この導入価格は**2026年12月31日まで**。2027年1月1日以降は、Google公式発表では**入力1.50ドル・出力7.50ドル/100万tokens**へ移行予定です。

そのため、2026年中の価格だけを前提に長期システムの採算を組むのは危険です。

## これで何ができる？

### 1. 大きなコードベースの修正

例えば、

「この決済システム全体を確認し、リトライ時に二重課金が起きる競合状態を調査。問題を再現するテストを書き、必要な修正まで行う」

のように、調査→修正→検証を連続して進める用途です。

Terminal-bench 2.1が81.6%から90.8%へ上がっているため、Googleが3.8で最も力を入れている領域の1つと判断できます。

### 2. 社内AIエージェント

例えば顧客対応なら、

- 顧客情報を検索
- 過去の問い合わせを読む
- 契約条件を確認
- 回答案を作る
- 必要なシステムを呼び出す

といった複数工程を1つのAIへ持たせる設計です。

銀行業務を模したτ³-bench Bankingが30.9%から38.1%へ改善しているのも、こうした複数工程業務への強化を示しています。

### 3. 長い動画・大量資料の分析

3.8 Flashはテキストだけでなく画像・音声・動画を入力できます。

100万トークン級のコンテキストを使い、長時間動画について、

「不具合が映っている箇所だけ探す」
「講義1時間分から試験範囲を抽出する」
「会議動画から意思決定と担当者をまとめる」

といった処理ができます。

## 誰に関係ある？

### 個人ユーザー

Google AI Pro・Ultraを使っている人には直接関係します。

Geminiアプリだけでなく、Google検索のAI ModeやGoogle Sheetsでも3.8 Flashが使われるため、ユーザーがモデル名を意識しなくても恩恵を受ける場面があります。

### 企業

影響が大きいのは、Gemini APIやGemini EnterpriseでAIエージェントを構築している企業です。

同じAPI単価でコード・エージェント性能が上がる一方、1タスクあたりのトークン消費が増える可能性があるため、**モデル単価だけでなく「仕事1件を完了する総コスト」**を測る必要があります。

### 開発者

3.7 Flashから移行する場合、モデルIDを`gemini-3.8-flash`へ変更するだけでは不十分な場合があります。

3.8では`thinking_level`のLOW・MEDIUM・HIGHを利用します。`MINIMAL`は非対応です。

また、古い`temperature`、`top_k`、`top_p`など一部パラメータは無視されるか、非対応パラメータはエラーになります。

### 日本ユーザー

Googleの公式発表では3.8 FlashはGoogle AI Pro・Ultraユーザー向けにGeminiアプリ等で提供されています。日本向けGemini自体が提供されているため、日本ユーザーにとっても重要度は高いです。

ただし、機能ごとの地域・アカウント差は残るため、特定機能が自分のアカウントに表示されるかは実際の画面で確認が必要です。

## 実際の使い方

### Geminiアプリ

Google AI ProまたはUltraを利用している場合、対応画面で3.8 Flashを選択または自動利用できます。

まず試すなら、3.8の強みが出やすい複数工程の指示が適しています。

例：

> 添付した売上CSVと営業会議の議事録を確認してください。  
> 1. 売上が前年同期比で悪化した商品を特定  
> 2. 議事録から原因候補を抽出  
> 3. 数字で確認できる事実と担当者の発言を分ける  
> 4. 次回会議で確認すべき点を5つ提示  
> 推測した内容には「推測」と明記してください。

### API

モデルIDは以下です。

```text
gemini-3.8-flash
```

thinking levelは、用途に応じて変えます。

- **LOW**：速度重視、簡単な抽出・検索
- **MEDIUM**：通常の業務、標準設定
- **HIGH**：複雑な推論、大規模コード、長時間動画

3.8はトークン消費が増えやすいため、すべてHIGHにする設計は避けた方がコスト管理しやすくなります。

## 注意点

### 同じ単価でも総額は同じとは限らない

Googleは3.8 Flashについて、3.7より高精度だがトークン消費が多いと説明しています。

モデル比較では「100万トークンいくら」だけを見るのでは不十分です。

### 2027年から価格変更予定

導入価格は2026年12月31日までです。

長期運用する企業は、2027年1月1日以降の入力1.50ドル・出力7.50ドルという公式予定価格も含めて試算する必要があります。

### Cyber版は一般利用できない

Gemini 3.8 Flash Cyberは、脆弱性発見・修正に特化したモデルです。

GoogleはCWE-Benchで47.2%のpass@1、Chromeでは大規模商用モデルより2.6倍多い正しいパッチを生成したと説明しています。

ただしCyber版は、政府機関、重要インフラ事業者、主要ソフトウェア保守者などの信頼された防御側へFairwind Programを通じて限定提供されています。

一般のGemini Pro/Ultraユーザーが自由にCyber版を使えるわけではありません。

## MAIMAIの評価

**重要度：96 / 100**

ここからはMAIMAIの評価です。

### 一般ユーザー：90点

Pro・Ultra契約者は追加契約なしで高性能なFlashモデルを利用できるため価値があります。ただし日常的な質問だけなら3.7との差を体感しにくい場合があります。

### 企業：97点

AIエージェントを業務へ入れる企業には重要です。

価格据え置きでTerminal-benchや銀行業務型エージェント評価が上がった点は魅力的です。一方、Google自身がトークン消費増を明示しているため、導入評価は**成功率 × 1タスク総コスト**で行うべきです。

### 日本市場：94点

GeminiはGoogle Workspaceとの接続が強く、日本企業がすでにGmail、Drive、Sheetsを使っている場合、既存業務へ入りやすいです。

### 競争環境：98点

6週間で3回目のFlash更新という異例の速度です。

Googleは低価格・高速なFlashをエージェント用途へ強化しています。企業AIでは、十分に強く、安く、速く、何百万回も回せるモデルが採用される場面も多いです。

MAIMAIとしては、3.8 Flashは2026年の企業AIにおける重要モデルの1つと評価します。ただし3.7から無条件で全処理を移行せず、同じ社内タスクで成功率・処理時間・消費トークンを比較してから切り替えるのが合理的です。

## 公式情報

### 一次情報

Google公式発表  
https://blog.google/innovation-and-ai/models-and-research/gemini-models/3-8-flash-and-3-8-flash-cyber/

Google AI for Developers - Gemini 3.8 Flash  
https://ai.google.dev/gemini-api/docs/latest-model

Google Cloud - Gemini 3.8 Flash Developer Guide  
https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/guides/gemini-3-8-flash

Google DeepMind - Gemini 3.8 Flash Model Card  
https://deepmind.google/models/model-cards/gemini-3-8-flash/

### 補足報道

The Verge  
https://www.theverge.com/ai-artificial-intelligence/988742/google-gemini-3-8-flash

VentureBeat  
https://venturebeat.com/security/googles-gemini-3-8-flash-is-built-for-agents-while-its-cyber-twin-hunts-vulnerabilities

※性能数値はGoogle公式評価を含みます。ベンチマークの数字が、そのまま全企業・全業務での成功率を保証するものではありません。
