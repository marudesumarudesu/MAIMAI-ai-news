---
title: "Salesforce×Anthropic「Claudeforce」発表｜ClaudeからCRMを直接操作、37の営業スキルとMCP権限設計を実務目線で解説"
date: 2026-08-26
author: "AIエンジニア MAIMAI"
category: "AIニュース"
company: "Anthropic / Salesforce"
source_url: "https://investor.salesforce.com/news/news-details/2026/Salesforce-and-Anthropic-Announce-Claudeforce-The-1-AI-Meets-the-1-AI-CRM/default.aspx"
official_source: true
importance: 93
affiliate_category: "claude"
---

# Salesforce×Anthropic「Claudeforce」発表｜ClaudeからCRMを直接操作、37の営業スキルとMCP権限設計を実務目線で解説

## 3行でいうと

- SalesforceとAnthropicは2026年8月26日、提携拡大策「Claudeforce」を発表しました。最初の製品「Salesforce in Claude」は、**会議準備、案件健全性レビュー、パイプライン確認など37の営業スキル**をClaude内から利用できる仕組みです。
- ClaudeはCRMデータを読むだけでなく、Salesforceの既存ワークフローや業務ルールを通して更新操作まで実行できます。接続基盤にはAIforceとHeadless 360 MCP Serverが使われ、**Salesforce側の本人認証・権限・共有ルールを引き継ぐ**設計です。
- 2026年8月26日時点では一部パイロット顧客向けで、Salesforceは**2026年9月のオープンベータ開始を予定**しています。価格、日本固有の提供条件、正式GA日は公表されていないため、現時点で導入費用を断定することはできません。

## 何が発表された？

SalesforceとAnthropicは2026年8月26日、両社の戦略提携を拡大し、「Claudeforce」を発表しました。

中核になるのが**Salesforce in Claude**です。

従来、Salesforceの情報を使う場合はSalesforceの画面を開き、アカウント、商談、活動履歴、パイプラインなどを個別に確認する操作が中心でした。

Salesforce in Claudeでは、Claude側からSalesforceのデータと業務機能へアクセスします。

発表時点で用意された営業向けスキルは37個です。Salesforceが具体例として公表しているのは、次のような業務です。

- meeting prep：商談前の顧客情報整理
- deal health review：案件の健全性確認
- pipeline review：営業パイプラインの確認
- Salesforceレコードを踏まえた次の行動整理
- CRM情報を基にした営業向けダッシュボード生成
- 権限の範囲内でのSalesforceレコード更新

Salesforceは、これらを一般的なCRM用プロンプトの寄せ集めとして説明しておらず、Claudeの推論、ツール利用、生成UIを前提に共同設計したスキルとしています。

| 項目 | 2026年8月26日時点 |
|---|---|
| Salesforce in Claude | 一部パイロット顧客向け |
| オープンベータ | 2026年9月予定 |
| 初期スキル数 | 37 |
| 追加スキル | 2026年後半から順次予定 |
| 価格 | 未公表 |
| 日本固有の提供条件 | 未公表 |

## 今までと何が違う？

AnthropicとSalesforceは2024年から連携しており、ClaudeモデルをAmazon Bedrock経由でSalesforce側から利用できました。

今回のClaudeforceでは、Claude側からSalesforceのデータ・業務ロジック・更新処理を呼び出せる方向が加わっています。

| 項目 | 2024年の連携 | Claudeforce / Salesforce in Claude |
|---|---|---|
| 主な利用画面 | Salesforce | Claude |
| Claudeの役割 | Salesforce内の基盤モデル | Salesforceデータを読み、業務を進めるエージェント |
| Salesforceデータ参照 | Salesforce内中心 | Claudeから可能 |
| レコード更新 | Salesforce側の機能中心 | Claudeから権限内で実行可能 |
| 営業向け完成スキル | 個別構築中心 | 37スキルを初期提供 |
| 権限管理 | Salesforce | Salesforceの既存権限を継承 |
| 接続基盤 | Bedrock / Salesforce AI基盤 | AIforce、MCP、API、CLI、Headless 360 |

Salesforceは2026年にHeadless 360を進め、Salesforceの業務機能をUIから切り離して、API、MCP tool、CLIから呼び出せる構造を整えています。

Headless 360 MCP Serverは、数千の機能を数千個のMCP toolとしてAIへ直接見せる設計を避け、4つの基本ツールで処理します。

| Tool | 役割 |
|---|---|
| Discover | 利用可能な操作を意味検索 |
| Describe | 操作の仕様・引数・依存関係を確認 |
| Dispatch | 書き込みを含む操作を実行 |
| Dispatch Read Only | 読み取り専用操作を実行 |

Salesforce公式の開発者資料では、Headless 360 MCP Serverは2026年7月からBetaで、開始時点で約100のSkillsを背後に持ち、さらに数千規模へ拡張すると説明されています。

## これで何ができる？

### 1. 商談前の準備をClaudeだけでまとめる

営業担当者がClaudeへ、

> 明日のABC社との商談準備をして。  
> 直近90日の活動履歴、未解決課題、商談金額、ステージ変化、次回更新予定を整理し、確認すべきリスクを5点出して。

と入力します。

Salesforce in Claudeが権限内の顧客情報を参照し、必要情報をまとめます。

### 2. パイプラインの異常案件をまとめて探す

営業責任者が、

> 今四半期の商談で、30日以上ステージが変わっていない案件を抽出。金額1000万円以上を優先し、最終活動日と担当者を付けて。

と指示できます。

CRMの検索条件を毎回手作業で作る代わりに、ClaudeがSalesforceの機能を呼び出して対象案件を探す使い方です。

### 3. CRM更新まで会話から行う

確認後に、

> この3案件の次回フォロー日を来週火曜日に更新して。変更対象を先に一覧表示して、私が確認するまで実行しないで。

といった指示を出せます。

Salesforce in Claudeでは、参照後にSalesforceの業務ルールを通して更新操作へ進めます。

### 4. 個人ごとの営業ダッシュボードを生成する

Salesforceは、Salesforce、Slack、Claudeのコネクタから利用者の業務コンテキストを読み、アカウントやパイプラインを反映した個別ダッシュボードを生成できると説明しています。

## 誰に関係ある？

### 個人ユーザー

一般のClaude利用者への影響は限定的です。

Salesforce契約企業で、会社側がSalesforce in Claudeを有効化した利用者が主な対象です。

### 企業

SalesforceをCRMとして使っている企業には重要です。

特に、営業担当者がCRM入力を後回しにしやすい、商談前に複数画面を行き来している、SalesforceとSlackを併用している、営業責任者がパイプラインレビューに時間を使っている企業では検証価値があります。

### 開発者・Salesforce管理者

Salesforceは、Claudeからの操作でも既存のidentity、permission、sharing rule、validation rule、workflow、governanceを引き継ぐと説明しています。

ただし、元のSalesforce権限が過剰なら、AIもその広い権限を利用できます。

### 日本ユーザー

日本企業でもSalesforceとClaudeを利用している場合は対象になり得ます。

一方、Salesforce公式は価格、日本向け開始日、必要ライセンス構成を発表していません。

2026年9月のオープンベータ予定はグローバル発表に記載されていますが、日本の全テナントで同時に有効化されるとは確認できません。

## 実際の使い方

現時点ではパイロット提供段階のため、一般ユーザーが自分で即時ONにできる状態とは限りません。

導入対象企業では、最初から書き込み権限を広く与えるより、読み取り中心のPoCから始める方が安全です。

> 私が担当している商談だけを対象にしてください。  
> 金額、ステージ、最終活動日、次回予定日を一覧化してください。  
> Salesforceのレコード変更は行わないでください。

次に、更新候補を出す段階へ進めます。

> 30日以上活動のない商談について、次回フォロー日の候補を作ってください。  
> 更新対象のレコードID、現在値、新しい値を表示してください。  
> 私が「実行」と入力するまで書き込みはしないでください。

企業側では、商談準備時間、CRM画面を開く回数、Salesforce入力漏れ件数、AIが誤って選んだレコード数、人間による修正率、1タスク当たりのClaude利用コスト、書き込み操作の承認率を測ると効果を比較しやすくなります。

## 注意点

### オープンベータ開始日は確定公表されていない

Salesforceは「2026年9月にオープンベータ予定」としています。

2026年9月8日時点で、公式発表から一般オープンベータの開始日を確認できません。

「すでに全ユーザーが利用可能」と扱うのは早いです。

### 価格は未公表

Salesforce in Claude単体の価格、必要なSalesforceプラン、Claude側の追加料金は公式発表で確認できません。

### Salesforceの既存権限が安全性の土台になる

Salesforce側で営業担当者に不要な編集権限が付いていれば、その権限内の操作はAIからも利用可能になります。

導入前にField-Level Security、Sharing Rule、Permission Set、管理者権限を監査する必要があります。

### MCP経由の書き込みは承認設計が重要

Headless 360のDispatchは書き込み操作を扱えます。

Salesforceの開発者資料では、ツール実行ごとにユーザー承認を求める設定も案内しています。

顧客情報、契約金額、商談ステージ、ユーザー管理などの変更では、確認なしの自動実行を広げない方が安全です。

### Salesforceの生産性数値は自社集計

Salesforceは、Claudeを使うSlackbotが社内で年間換算810万時間の生産性向上を生み、前四半期比で2倍超になったと説明しています。

この数字はSalesforce自身の社内測定です。他社がClaudeforceを導入した場合の効果を保証する数値ではありません。

## MAIMAIの評価

**重要度：93 / 100**

ここからはMAIMAIの評価です。

### 一般ユーザー：73点

一般のClaudeユーザーがすぐ使える機能ではないため、直接影響は限定的です。

業務SaaSをAI画面から操作する流れが広がれば、仕事用AIの使い方には大きく影響します。

### 企業：98点

企業への重要度は非常に高いと評価します。

Salesforceの価値は顧客データに加え、権限、共有ルール、ワークフロー、承認、入力規則など、企業が長年積み上げた業務ルールにもあります。

Claudeforceでは、その既存資産をClaudeから利用できます。AI導入のたびに業務ロジックをプロンプトへ再実装する必要を減らせるため、本番導入へ進める企業ほど意味があります。

### 日本市場：90点

Salesforceを使う日本企業は多く、営業担当者がCRM入力や商談準備に時間を使う課題も一般的です。

一方、日本での提供条件と価格が未発表なので、現段階ではPoC準備と権限棚卸しまでが現実的です。

### 競争環境：98点

SalesforceはHeadless 360を通じて、自社のデータ・業務ロジック・権限をClaude、ChatGPT、Gemini、Cursorなど複数のAIから使える方向へ開いています。

その上でAnthropicとは37の完成済み営業スキルまで共同開発しました。

AIモデル企業とSaaS企業の競争は、モデル性能、UI、APIに加え、**企業データを安全に読み書きできる完成済み業務スキルの数と品質**にも広がっています。

MAIMAIとしては、Claudeforceを2026年の企業向けAIエージェント市場で重要度の高い発表の1つと評価します。

## 公式情報

### 一次情報

Salesforce / Anthropic共同発表  
https://investor.salesforce.com/news/news-details/2026/Salesforce-and-Anthropic-Announce-Claudeforce-The-1-AI-Meets-the-1-AI-CRM/default.aspx

Salesforce - Headless 360拡張発表  
https://www.salesforce.com/ap/news/press-releases/2026/08/25/salesforce-turns-enterprise-applications-into-enterprise-capabilities/

Salesforce Developers - Headless 360 MCP Server Beta  
https://developer.salesforce.com/blogs/2026/07/announcing-the-headless-360-mcp-server-beta

Salesforce Developers - Headless 360 MCP Server Reference  
https://developer.salesforce.com/docs/platform/hosted-mcp-servers/guide/headless-360-mcp.html

Anthropic - Salesforce partnership（従来連携の確認）  
https://www.anthropic.com/news/salesforce-partnership

### 補足報道

TechTarget  
https://www.techtarget.com/enterprise-software/news/366649762/Salesforce-Anthropic-integration-expanded-begets-Claudeforce

ITmedia エンタープライズ  
https://www.itmedia.co.jp/enterprise/

Reuters Breakingviews  
https://www.reuters.com/commentary/breakingviews/softwares-ai-trade-moves-fear-opportunity-2026-09-01/

※37スキル、提供状況、Headless 360の権限継承などはSalesforce公式情報に基づきます。オープンベータは2026年9月予定ですが、2026年9月8日時点で全ユーザー向け開始日は確認できません。
