---
layout: article
title: "Claude Fable 5.1登場｜長時間エージェントとコーディング強化、cache read 75%値下げの意味"
date: 2026-09-01
updated: 2026-09-07
author: "AIエンジニア MAIMAI"
category: "AIニュース"
company: "Anthropic"
source_url: "https://www.anthropic.com/claude/fable"
official_source: true
importance: 97
affiliate_category: "claude"
---

# Claude Fable 5.1登場｜長時間エージェントとコーディング強化、cache read 75%値下げの意味

## 3行でいうと

- Anthropicは2026年9月1日、Claude Fable 5.1と制限付きのMythos 5.1を発表。Fable 5.1は一般向けの最上位クラスとして、長時間のコード・調査・知識仕事を強化しました。
- AnthropicはFable 5.1の**cache readをFable 5比75%値下げ**し、典型的な処理で約25%、エージェント型では最大約45%の実質コスト低下を説明しています。
- 性能向上だけでなく、長時間エージェントのコストを下げたことが重要です。AIへ数時間〜数日の仕事を任せるほど、同じ文脈を何度も読むcache料金が効いてきます。

## 何が発表された？

Anthropicは9月1日、Claude Fable 5.1とClaude Mythos 5.1を公開しました。

Fable 5.1は一般のPro、Max、Team、EnterpriseやAPIなどで利用するモデル。Mythos 5.1はサイバーセキュリティ・生命科学など特に高能力が問題になり得る分野向けで、vetted organizations、つまり審査された組織にアクセスが限定されています。

Fable系の狙いは、数時間〜数日にまたがるコード修正、リサーチ、資料分析などです。

## 今までと何が違う？

Anthropicの公表では、Fable 5.1はFable 5からコーディング、研究、長時間タスクの性能を改善しています。

特に実務上大きいのはcache readです。

AIエージェントが長いコードベースや大量資料を何度も参照すると、毎回全文を新規入力として処理するのは高コストです。prompt cachingは一度読んだ文脈を再利用し、その読み直し部分を安くする仕組みです。

Fable 5.1はそのcache readをFable 5より75%下げたとAnthropicが説明しています。

| 観点 | Fable 5 | Fable 5.1 |
|---|---|---|
| 位置づけ | 長時間の知識・コード作業 | 同用途をさらに強化 |
| cache read | 基準 | 75%低下 |
| 長時間エージェント | 強い | コスト効率も改善 |
| 安全設計 | 高能力領域を監視 | 誤検知低減も進める |

## これで何ができる？

### 大規模リポジトリの修正
「原因調査→修正→テスト→レビュー」まで一連で渡す仕事。

### 複数資料からの調査
PDFの表・チャート・図を含め、資料群から比較レポートを作る仕事。

### 長時間エージェント
Claude Codeなどで、短い1回の質問ではなく、複数ステージの仕事を続けさせる用途です。

## 誰に関係ある？

**開発者**：Claude Codeを使っている人には直接影響します。長いコード文脈の再利用コストが下がる意味が大きいです。

**企業**：大規模文書・社内ナレッジ・エージェントを扱うほどcache read削減の恩恵が出やすくなります。

**一般ユーザー**：短い文章作成だけなら差を感じにくい可能性があります。

**規制産業**：Anthropicは同日にEnterprise Frontier Safeguardsも発表し、顧客側クラウドでデータを保持しつつ不正利用を監視する仕組みを準備しています。

## 実際の使い方

Claude Codeなら、工程を細切れにせず次のように完成条件を指定します。

「このリポジトリの決済処理を調査し、二重課金につながる競合状態がないか確認。再現テストを作成し、必要なら修正して全テストを実行。最後に変更箇所、リスク、未確認点をまとめてください。」

資料分析なら、

「添付PDF5本の図表も含めて読み、各社の売上構成・利益率・会社計画の違いを比較。引用ページを付けてください。」

という使い方です。

## 注意点

高性能モデルほど安全監視も強くなります。サイバー・生物分野では一部リクエストが別モデルへfallbackされる場合があります。

企業データでは保持ポリシーも重要です。AnthropicはFable系で安全監視のため30日保持を導入してきましたが、EFSでは顧客管理クラウドに保持する設計を段階提供するとしています。

## MAIMAIの評価

**重要度：97 / 100**

Fable 5.1のポイントは「モデルが賢くなった」だけならなく、**長時間エージェントを経済的に回しやすくしたこと**です。

これから企業がAIを使うとき、1回答の単価より「1つの仕事を完了する総コスト」が重要になります。cache readの75%低下は、この総コストに直接効く変更です。

Claude Codeを中心に使う開発者や、数十万〜数百万token規模の資料を扱う業務では特に注目価値があります。

## 公式情報

### 一次情報
- https://www.anthropic.com/claude/fable
- https://support.claude.com/en/articles/12138966-release-notes
- https://www.anthropic.com/news/enterprise-frontier-safeguards
- https://www.anthropic.com/system-cards

### 補足
- https://indianexpress.com/article/technology/artificial-intelligence/anthropics-fable-5-1-coding-and-research-10861090/

※ベンチマークやコスト削減率の一部はAnthropic自身の測定・説明に基づきます。
