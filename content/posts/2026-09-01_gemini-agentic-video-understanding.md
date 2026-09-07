---
title: "Geminiの動画解析が「全部見る」方式から進化｜Agentic Video Understandingでトークン最大88%削減、長尺動画AIのコスト構造が変わる"
date: 2026-09-01
author: "AIエンジニア MAIMAI"
category: "AIニュース"
company: "Google / Google DeepMind"
source_url: "https://blog.google/innovation-and-ai/models-and-research/gemini-models/introducing-agentic-video-in-gemini/"
official_source: true
importance: 94
affiliate_category: "gemini"
---

# Geminiの動画解析が「全部見る」方式から進化｜Agentic Video Understandingでトークン最大88%削減、長尺動画AIのコスト構造が変わる

## 3行でいうと

- Googleは2026年9月1日、Geminiの動画解析に**Agentic Video Understanding**を追加しました。質問に応じて「どこを見るか」「映像・音声・文字起こしのどれを使うか」をAI自身が選ぶ方式です。
- Googleの評価では、長尺動画で**トークン消費を最大88%削減、解析コストを最大66%削減、品質を最大7%向上**。追加機能料金はなく、通常のGemini APIトークン料金で利用できます。
- 会議録画、監視映像、研修動画、製造現場動画などをAIで検索・解析する際のコストに直結します。短い動画では従来のStatic処理が向く場合もあり、用途で使い分ける必要があります。

## 何が発表された？

Google DeepMindは2026年9月1日、Gemini APIの動画理解機能に「Agentic Video Understanding」を追加しました。

従来の動画解析は、動画から一定間隔でフレームを抜き出し、その情報をまとめてAIへ渡す方式が基本でした。Geminiではデフォルトで1秒あたり1枚、つまり1 FPSで映像を読み込みます。

この方法はシンプルですが、90分の講義や数時間の監視映像でも、質問に関係のない部分まで読み込むため、長尺になるほど入力トークンと料金が膨らみます。

Agentic Video Understandingでは、Geminiが質問内容を見て、どの時間帯を調べるか、何FPSで細かく確認するか、映像フレーム・音声・文字起こしのどれを使うかを動的に選びます。

Googleの9月1日の発表では、Gemini 3.7 Flash、3.6 Flash、3.5 Flash-Liteで提供開始。現在の公式開発者ドキュメントでは、**Gemini 3.8 Flashも対応モデル**として掲載されています。

利用場所はGemini API、Google AI Studio、Gemini Enterprise Agent Platformです。アップロードした動画だけでなく、公開YouTube URLも入力できます。

## 今までと何が違う？

| 項目 | Static処理 | Agentic Video Understanding |
|---|---|---|
| 動画の読み方 | 固定FPSで全体を読む | AIが必要部分を探して読む |
| デフォルトFPS | 1 FPS | 動的に変更 |
| 長尺動画 | トークンが増えやすい | 必要部分だけ読み込める |
| 1秒未満の変化 | 見逃す場合がある | 必要箇所を高FPSで再確認可能 |
| 音声・文字起こし | 一括処理 | 質問に応じて選択 |
| 向く用途 | 短い動画、全体確認 | 長尺動画、特定場面検索 |
| 追加機能料金 | なし | なし |

Googleの評価では、Agentic方式によって**トークン消費が最大88%減少、解析コストが最大66%低下、品質が最大7%向上**しています。

ここで重要なのは「最大」という表現です。すべての動画・質問で88%減るわけではありません。

効果が大きいのは、10分の解説動画、90分の講義、数時間の録画など、動画全体のうち必要な情報が一部分しかないケースです。

例えば「90分の講義を全部要約して」は全体を広く確認する必要があります。一方で「料金プランの説明が始まる時間だけ教えて」は、ごく一部を探せば済みます。後者の方がAgentic方式のメリットが出やすいです。

## これで何ができる？

### 1. 数時間の会議から特定の発言だけ探す

例えば3時間の会議録画に対して、

> 値上げについて議論した箇所をすべて特定し、発言者・時刻・結論をまとめてください。

と質問できます。文字起こしから候補箇所を探し、必要な前後だけ映像・音声で確認する処理が可能になります。

### 2. 製造現場・監視映像から異常を探す

Googleは「anomaly detection（異常検知）」を代表用途として挙げています。

> この2時間のライン映像で、製品がコンベアから落下した場面を探してください。

といった質問に対し、怪しい時間帯だけフレームレートを上げて確認できます。

### 3. スポーツや作業動画の回数を数える

Googleは「counting action & object」にも利用できるとしています。

> このトレーニング動画で正しいフォームのスクワットは何回ありますか？

といった用途です。動きが速い場面では高いFPSへ切り替えて確認できます。

### 4. 動画編集の特定カットを探す

1秒未満の場面変化を見つけられるため、

> 商品が画面中央に完全に表示された最初のフレームを探して。

といった動画編集支援にも使えます。

## 誰に関係ある？

### 個人ユーザー

現時点では主に開発者向けAPI機能です。

Googleは、今後GeminiアプリのFlash・Flash-Lite利用者にも展開し、数か月以内にYouTubeの「Ask YouTube」にも利用するとしています。

### 企業

動画データを大量に持つ企業には重要です。

対象になりやすいのは、コールセンターの画面録画、営業会議、オンライン研修、店舗カメラ、製造ライン、建設現場、スポーツ映像、動画メディアです。

動画AIはテキストAIより入力情報量が大きいため、トークン削減率がそのまま運用費へ効きやすい領域です。

### 開発者

現在の公式ドキュメントでは、Gemini 3.8 Flash、3.7 Flash、3.6 Flash、3.5 Flash-Liteで利用できます。

API入力の動画オブジェクトに、

```text
"processing": "agentic"
```

を追加するのが基本です。

### 日本ユーザー

日本からGemini APIを利用する開発者にも関係します。

また、将来的にGeminiアプリとAsk YouTubeへ入る予定が公式に示されているため、日本語動画の検索・要約体験にも影響する可能性があります。

## 実際の使い方

Pythonでは、アップロード済み動画に対して次のように設定します。

```python
from google import genai

client = genai.Client()

interaction = client.interactions.create(
    model="gemini-3.8-flash",
    input=[
        {
            "type": "video",
            "uri": video_file.uri,
            "mime_type": video_file.mime_type,
            "processing": "agentic"
        },
        {
            "type": "text",
            "text": "価格について議論している場面をすべて探し、時刻と結論をまとめてください。"
        }
    ]
)

print(interaction.output_text)
```

Googleは長尺動画や「特定の瞬間を探す質問」ではAgenticを基本候補として案内しています。

一方、5分未満の短い動画で低遅延を重視する場合や、動画全体を一定精度でフレーム単位に確認したい場合はStaticが適しています。

同じリクエストの中で、長尺動画はAgentic、短い動画はStaticという混在も可能です。

## 注意点

### 88%削減は保証値ではない

88%、66%、7%はGoogleの評価で確認された最大値です。動画内容、長さ、質問内容によって効果は変わります。

企業導入では、自社動画を使って1質問あたりトークン、料金、正答率、回答時間をStaticとAgenticで比較する必要があります。

### Agenticは必ず速いわけではない

AIが動画内を検索し、必要な部分を再度読み込むため、複雑な長尺動画では処理時間が長くなる場合があります。

Googleも、長い動画や複雑なプロンプトではstreamingまたはbackground executionの利用を案内しています。

### 短い動画ではStaticが合理的な場合がある

Googleの公式ドキュメントでは、5分未満で遅延を重視する用途や、全体にわたるフレーム精度が必要な場合はStaticを選択肢としています。

### YouTube URLには制限がある

Gemini APIから直接YouTube URLを渡す機能はPreviewです。

無料枠では1日8時間までのYouTube動画という制限があり、公開動画のみ利用可能です。Privateや限定公開動画は対象外です。

## MAIMAIの評価

**重要度：94 / 100**

### 一般ユーザー：88点

現状はAPI中心なので即時の影響は限定的です。ただしGeminiアプリとAsk YouTubeへの展開予定があるため、一般ユーザー向け動画検索にも直結します。

### 企業：97点

企業への価値はかなり高いです。

文章やCSVは比較的安くAIへ入力できますが、動画は情報量が大きく、長時間データをそのまま処理すると費用が急増します。

必要な部分だけを見る設計がAPI側に入ったことで、動画AIをPoCから常時運用へ移しやすくなります。

### 日本市場：92点

日本企業には、会議録画、店舗、防犯、製造、建設、教育といった動画データが大量にあります。

日本で生成AI導入というと文章・社内文書検索に偏りがちですが、映像データを業務改善へ使う市場は今後広がる余地があります。

### 競争環境：96点

注目点はモデルサイズではありません。

AIが入力を全部読む設計から、**必要な情報を自分で探して取得する設計**が動画にも広がっています。

長いコンテキストを持つだけでは、入力するたびに処理コストがかかります。必要部分を探索するエージェント型処理は、モデル性能と同じくらい「AIを安く運用する技術」として重要です。

MAIMAIとしては、長尺動画を扱う企業はStaticとAgenticのA/Bテストを早めに行う価値があると評価します。

## 公式情報

### 一次情報

Google / Google DeepMind公式発表  
https://blog.google/innovation-and-ai/models-and-research/gemini-models/introducing-agentic-video-in-gemini/

Gemini API公式ドキュメント - Video understanding  
https://ai.google.dev/gemini-api/docs/video-understanding

Gemini Enterprise Agent Platform公式ドキュメント  
https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/capabilities/video-understanding

Google AI Studio - Agentic Video Understanding  
https://aistudio.google.com/learn/agentic-video-understanding-with-gemini

### 補足報道

Impress Watch  
https://www.watch.impress.co.jp/docs/news/2137587.html

GIGAZINE  
https://gigazine.net/news/20260902-gemini-agentic-video/

※最大88%のトークン削減、最大66%のコスト削減、最大7%の品質向上はGoogle自身の評価値です。すべての動画・業務で同じ改善率になることを保証するものではありません。
