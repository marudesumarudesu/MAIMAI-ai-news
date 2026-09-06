---
layout: article
title: "Copilot Studioに人間承認｜メール送信・決済前にAIを止める「Human in the Loop」が標準機能へ"
date: 2026-09-01
updated: 2026-09-07
author: "AIエンジニア MAIMAI"
category: "AIニュース"
company: "Microsoft"
source_url: "https://learn.microsoft.com/en-us/power-platform/release-plan/2025wave2/microsoft-copilot-studio/create-perfect-prompt-help-copilot"
official_source: true
importance: 94
affiliate_category: "microsoft-copilot"
---

# Copilot Studioに人間承認｜メール送信・決済前にAIを止める「Human in the Loop」が標準機能へ

## 3行でいうと

- MicrosoftはCopilot Studioで、**特定ツールを実行する直前に人間承認を必須化**できる機能を2026年9月から展開するとしています。
- 承認はツール単位・エージェント単位で設定可能。メール送信、チケット終了、支払い処理など「間違えると現実に被害が出る操作」を止められます。
- 企業AIの設計が「全部自動化」から、**AIに考えさせ、重要操作だけ人間が承認する**方向へ進む象徴的なアップデートです。

## 何が発表された？

Microsoft 365のAI at Work Roadmapに、Copilot Studioの「Enabling makers to require human approval for tool calls」が追加されました。

Roadmap IDは570434。2026年9月1日に追加・更新され、世界向けStandard Multi-Tenant環境で9月からGeneral Availabilityのロールアウト開始予定です。

設定すると、AIエージェントが対象ツールを呼び出す直前に処理を停止し、

- 承認
- そのセッション中は承認
- 拒否

を人間が選べます。

承認依頼はMicrosoft TeamsやMicrosoft 365 Copilotなど、エージェントが使われているチャネル内に表示されます。

## 今までと何が違う？

生成AIチャットの失敗は「変な回答が返る」だけで済みます。しかしエージェントはツールを通じて実際に行動します。

| AIの種類 | 失敗例 |
|---|---|
| チャット | 間違った文章を返す |
| エージェント | 誤った相手へメール送信 |
| エージェント | チケットを誤ってclose |
| エージェント | 誤った支払い処理 |

今回の承認機能は、プロンプトに「必ず確認して」と書くだけではなく、**システム側の決定的なguardrail**として設定できます。

AIが指示を誤解しても、承認が必要なツールは人間を通過しない限り動かない点が重要です。

## これで何ができる？

### 顧客対応
AIが問い合わせ内容を読み、返信文を作成。**Send Emailだけ承認必須**にする。

### 経理
請求内容の確認や入力まではAI。**支払い実行だけ承認**にする。

### ITサポート
AIがチケットを分類・調査し、回答案を作る。**Close Ticketだけ承認**にする。

## 誰に関係ある？

**Copilot Studio利用企業**には直接関係します。

特に金融、医療、公共、法務、顧客対応など、誤操作の影響が大きい業務では重要です。

一般ユーザー向けの目立つ新モデルではありませんが、企業AIの安全設計という意味ではかなり大きい変更です。

## 実際の使い方

Copilot Studioでエージェントへツールを追加し、そのツールごとの設定で人間承認を要求する形になります。

例えば、

- `SearchCustomer` → 自動実行
- `DraftReply` → 自動実行
- `SendEmail` → 承認必須
- `RefundPayment` → 承認必須

という設計です。

この分け方が重要です。すべてを承認必須にすると自動化効果が落ち、すべてを自動にすると事故リスクが高まります。

## 注意点

2026年9月7日時点ではMicrosoftのRoadmap上で**IN DEVELOPMENT / rollout start September 2026**です。すべてのテナントへ即時反映済みとは限りません。

承認機能だけで安全が完成するわけでもありません。誰が承認者か、承認ログをどこへ保存するか、二重承認が必要な金額はいくらか、といった業務ルールが別途必要です。

## MAIMAIの評価

**重要度：94 / 100**

企業導入では、新モデルの性能向上より重要になる場合があります。

AIエージェントの本格普及を止める最大要因の1つは「勝手に何かされたら困る」です。そこへプラットフォーム標準の承認ゲートが入ることで、これまでPoC止まりだった業務を本番へ出しやすくなります。

MAIMAIとしては、AI自動化の基本設計を今後、

**読む・考える・下書きする＝自動  
外部へ送る・削除する・支払う＝承認**

のように分ける方法を推奨します。

## 公式情報

### 一次情報
- https://learn.microsoft.com/en-us/power-platform/release-plan/2025wave2/microsoft-copilot-studio/create-perfect-prompt-help-copilot

Roadmap ID: 570434  
追加日: 2026-09-01  
ロールアウト開始予定: 2026年9月
