---
title: "MicrosoftがDynamics 365にWEM MCP toolsを追加｜TeamsやOutlookから休暇申請を確認・承認、企業AIの「実行権限」設計が一段進む"
date: 2026-09-03
author: "AIエンジニア MAIMAI"
category: "AIニュース"
company: "Microsoft"
source_url: "https://www.microsoft.com/en-us/dynamics-365/blog/it-professional/2026/09/03/dynamics-365-workforce-engagement-management-mcp-tools/"
official_source: true
importance: 84
affiliate_category: "copilot"
---

# MicrosoftがDynamics 365にWEM MCP toolsを追加｜TeamsやOutlookから休暇申請を確認・承認、企業AIの「実行権限」設計が一段進む

## 3行でいうと

- Microsoftは2026年9月3日、Dynamics 365 Service Agent向けに**Workforce Engagement Management（WEM）のMCP tools V1**を提供開始しました。Teams、Outlook、Copilot上の自然言語から、休暇・シフト関連の申請を検索し、詳細を確認できます。
- V1では`list_wem_requests`、`get_wem_request_details`、`decide_wem_time_off_request`の3ツールを提供。権限がある上司は会話画面から休暇申請を承認・却下でき、その結果がDynamics 365へリアルタイム反映されます。
- 重要なのは権限設計です。**既存のMicrosoft Dataverse RBAC（役割ベースのアクセス制御）をMCP層でも強制**し、本人・上司それぞれが見えるデータと実行できる操作を分けています。

## 何が発表された？

Microsoftは2026年9月3日、Dynamics 365 Customer Service / Contact CenterのWorkforce Engagement Management（WEM）を、MCP経由でAIエージェントから操作できるV1ツール群を公開しました。

MCPはModel Context Protocolの略で、AIモデルやAIエージェントから外部システムの機能を共通形式で呼び出すための仕組みです。

今回のWEM MCP toolsでは、Dynamics 365の勤務管理データをService Agent経由でMicrosoft Teams、Outlook、Copilotなどから自然言語で操作できます。

| MCP tool | できること | 書き込み |
|---|---|---|
| `list_wem_requests` | 休暇、シフト交換、シフト入札の申請一覧を取得 | なし |
| `get_wem_request_details` | 申請内容と勤務スケジュール上の文脈を確認 | なし |
| `decide_wem_time_off_request` | 休暇申請を承認・却下 | あり |

上司は「今週の未処理の休暇申請をすべて表示して」と入力できます。担当者本人なら「私のシフト交換申請は今どうなってる？」と確認できます。

さらに権限を持つ上司は「Casey Chenの7月14日〜16日の休暇申請を承認して」と入力すると、`decide_wem_time_off_request`が呼ばれ、Dynamics 365側の申請レコードに結果が反映されます。

## 今までと何が違う？

WEM自体は2026年6月30日に一般提供されています。従来は休暇申請やシフト状況を確認するためにDynamics 365内の該当画面を開く必要がありました。

今回の変更では、同じ業務データと権限体系を維持したまま、操作入口が会話型AIへ広がりました。

| 項目 | 従来のWEM | WEM MCP tools V1 |
|---|---|---|
| 操作場所 | Dynamics 365画面 | Service Agent、Teams、Outlook、Copilot |
| 申請検索 | 画面で条件指定 | 自然言語 |
| 詳細確認 | レコードを開く | 会話から取得 |
| 休暇承認・却下 | Dynamics画面から操作 | 会話から実行可能 |
| 権限制御 | Dataverse RBAC | Dataverse RBACをMCP層でも強制 |
| 追加コード | 通常不要 | V1ツール有効化はノーコード |

上司は自分のPlanning Group内の申請を確認できますが、一般のカスタマーサービス担当者（CSR）は自分自身の申請しか見られません。

独立系のWindowsForumもV1を整理し、休暇申請の承認・却下は可能である一方、**シフト交換やシフト入札はV1では一覧・詳細確認まで**と指摘しています。将来ロードマップを現行機能と混同しないことが重要です。

## これで何ができる？

### 1. 上司がTeamsから休暇申請を処理する

「来週月曜日の休暇申請を一覧表示して。承認待ちだけ」と入力し、対象を確認後「山田さんの申請を承認」と続ければ、権限確認後にDynamics 365へ反映できます。

### 2. 担当者が自分の申請状況をOutlookから確認する

「先週出したシフト交換申請の状態を教えて」と確認できます。本人には自分のレコードだけが返されるため、同僚の勤務データまで同じ質問で見える設計ではありません。

### 3. 管理者が未処理申請をまとめて確認する

「今週の未処理申請を種類別に出して」と指示し、休暇、シフト交換、シフト入札をまとめて確認できます。

### 4. 今後は勤務表・残休暇・打刻へ拡張予定

MicrosoftはV2で`retrieve-schedule`を追加し、本人の勤務予定や上司のチームカバレッジ確認を計画しています。

V3ではWorkday接続を前提に`get_wem_leave_quota`で休暇残高を取得し、`clock_in_wem_shift`、`clock_out_wem_shift`で出退勤打刻を行う計画です。

**V2・V3はロードマップであり、V1の提供機能ではありません。**

## 誰に関係ある？

### 個人ユーザー

一般のMicrosoft Copilot利用者には直接関係しません。Dynamics 365 Customer Service / Contact CenterのWEMを導入している企業向けです。

### 企業

コンタクトセンター、カスタマーサポート、大規模オペレーションを持つ企業には関係があります。TeamsやOutlook中心で仕事をしており、勤務管理だけDynamics 365へ移動している会社では効果を測りやすいです。

### 開発者・管理者

Dynamics 365 Contact Center admin centerから、セキュリティロール、チーム、パイロットグループ単位でツールを有効化できます。MicrosoftはV1について「No code required」と説明しています。

### 日本ユーザー

日本企業でもDynamics 365 Customer Serviceを利用している場合は検討対象です。ただし公式発表は日本リージョン固有の提供差を詳述していません。自社テナント、ライセンス、管理画面で利用可否を確認する必要があります。

## 実際の使い方

1. Dynamics 365 Contact Center admin centerを開く
2. Service Agent settingsへ移動
3. WEM MCP toolsを有効化
4. セキュリティロール、チーム、またはパイロットグループ単位でアクセス設定
5. Teams、Outlook、CopilotなどのService Agent対応画面から利用

最初は読み取りから始める方が安全です。

> 今週の未処理の休暇申請を表示してください。申請者、対象日、現在の状態だけを一覧にしてください。変更操作は行わないでください。

その後、承認権限を持つ管理者だけに`decide_wem_time_off_request`を解放し、

> 申請内容と勤務状況を表示してください。まだ承認・却下は実行しないでください。

と確認してから書き込みを実行する設計が現実的です。

## 注意点

### V1の範囲を広く解釈しない

V1ではシフト交換やシフト入札の申請を検索・確認できますが、Microsoftが明示している書き込み操作は休暇申請の承認・却下です。

### 既存権限の監査が必要

MCP層でDataverse RBACが強制されても、元の権限設定が過剰なら安全とは言えません。Planning Group閲覧範囲、休暇承認権限、異動・退職者の権限残存を確認する必要があります。

### 自然言語の誤解釈に備える

「山田さんの来週の休暇を承認して」の対象をAIが誤る可能性があります。書き込み前に対象者、対象日、申請IDを再表示する確認フローを設けた方が安全です。

### ライセンス・テナント差を確認する

WEMはDynamics 365 Customer Service Enterprise / Premiumに含まれ、Dynamics 365 Contact Center Voice + Digital SKUでも提供されています。ただしMCP toolsの実際の有効化可否は自社テナントで確認が必要です。

## MAIMAIの評価

**重要度：84 / 100**

### 一般ユーザー：55点

一般のMicrosoft 365利用者への影響は限定的です。

### 企業：94点

企業AIの実装方法として重要です。生成AIを社内情報検索に使うだけでなく、**既存の業務権限を維持したまま実際の業務操作へ接続**しています。

企業エージェントではモデル性能以上に、「誰が何を実行できるか」が事故リスクを左右します。

### 日本市場：80点

Dynamics 365利用企業には直接関係します。Teams中心の業務が多い日本企業では、既存業務システムの操作をTeams内へ持ち込む設計を応用しやすいと考えます。

### 競争環境：91点

MicrosoftはMCPを開発者向けの接続規格だけで終わらせず、Dynamics 365の具体的な業務操作へ組み込み始めています。

今後のAIエージェント競争では、回答品質に加え、**ERP・CRM・勤怠・人事システムを正しい権限で安全に操作できるか**が重要になります。

## 公式情報

### 一次情報

Microsoft Dynamics 365公式ブログ  
https://www.microsoft.com/en-us/dynamics-365/blog/it-professional/2026/09/03/dynamics-365-workforce-engagement-management-mcp-tools/

Microsoft - Workforce engagement management in Dynamics 365  
https://www.microsoft.com/en-us/dynamics-365/blog/it-professional/2026/06/22/workforce-engagement-management-dynamics-3/

### 補足情報

WindowsForum  
https://windowsforum.com/news/dynamics-365-wem-mcp-tools-v1-roadmap-and-setup.444046/

Dynamics User Group  
https://dynamicsusergroup.com/

※V2のschedule visibility、V3のleave balance・clock in/outはMicrosoftが示したロードマップです。2026年9月3日時点のV1提供機能とは分けて記載しています。
