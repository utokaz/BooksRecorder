//
//  Book.swift
//  BooksMakeYouYou
//
//  Created by uto kazuori on 2020/08/20.
//  Copyright © 2020 uto kazuori. All rights reserved.
//

import Foundation

struct BooksSearchResponse: Codable {
    let items: [Item]
}

struct Item: Codable {
    let id: String
    let volumeInfo: VolumeInfo
}

struct VolumeInfo: Codable {
    let title: String?
    let authors: [String]?
    let publisher: String?
    let description: String?
    let imageLinks: ImageLinks?
}

struct ImageLinks: Codable {
    let smallThumbnail: String?
    let thumbnail: String?
}

extension BooksSearchResponse {
    static var exampleJson: String {
        return """
        {
        "kind": "books#volumes",
        "totalItems": 1989,
        "items": [
        {
        "kind": "books#volume",
        "id": "U4vuDwAAQBAJ",
        "etag": "JVkNU8g7J0o",
        "selfLink": "https://www.googleapis.com/books/v1/volumes/U4vuDwAAQBAJ",
        "volumeInfo": {
        "title": "桂歌丸　正調まくら語り　芸に厳しく、お客にやさしく",
        "authors": [
        "桂歌丸"
        ],
        "publisher": "竹書房",
        "publishedDate": "2020-07-02",
        "description": "内容紹介 本書を読むと、あの素晴らしい歌丸師匠の「楷書の芸」が、あなたの心の中で蘇ります。 ぜひ、僕の大好きなお爺さんの口調を思い出してください。 まえがき・あとがき～六代目三遊亭円楽～ 「大喜利の歌丸で、噺家人生を終えたくない」 晩年の歌丸師匠の言葉です。 若くして国民的人気の演芸テレビ番組『笑点』に出演し、50年の長きに渡って回答者、司会者の立場で番組を支えてきた歌丸師匠ですが、番組内の『大喜利』のコーナーの知名度や人気に甘んじることなく、古典落語と高座に真摯に向き合った人生でした。 古典落語という話芸は、江戸時代の社会・生活の教養がないと楽しめない一面がある“とっつきにくい話芸”です。 古典落語への導入部である歌丸師匠のまくらは、自分の暮らしの中の滑稽なエピソード、誰もが知っている世相の話題への見識から、本編の古典落語に観客を分かりやすく誘う見事な話芸で、縦横無尽に現代と古典の世界をごく自然いつなげ合わせていたまくらでした。 本書は、桂歌丸師が35年の長きに渡って出演した「にっかん飛切落語会」の高座から厳選したまくらを収録しました。 観客に分かりやすく、己の芸に厳しく、古典落語を磨き上げて行った歌丸落語の神髄がここにございます。 平成四年という年は、たかが運送屋一軒の為に(……笑)、なんか日本中が滅茶苦茶になっちゃうような世の中でございました。 金丸信氏は、目の手術をなすったそうですな(……笑)。 やっぱり目が悪いくらいですから、世間が見えなかったんでございますな(拍手)。 でも、大変に良いことを教えてくださいました。 五億の不正をしようと思ったら、二十万で済む時代だそうですね。 あの勘定でいきますと、五千万円の不正は、二万円で済む訳でございます(笑)。 今、一所懸命、二万円を貯めているところでございます(笑)。 一九九二年十二月十五日 イイノホール にっかん飛切落語会 第二〇七夜 『引っ越しの夢』のまくらより",
        "industryIdentifiers": [
        {
        "type": "OTHER",
        "identifier": "PKEY:BT000075973700100101900209"
        }
        ],
        "readingModes": {
        "text": true,
        "image": true
        },
        "pageCount": 256,
        "printType": "BOOK",
        "categories": [
        "Crafts & Hobbies"
        ],
        "maturityRating": "NOT_MATURE",
        "allowAnonLogging": false,
        "contentVersion": "1.1.1.0.preview.3",
        "panelizationSummary": {
        "containsEpubBubbles": false,
        "containsImageBubbles": false
        },
        "imageLinks": {
        "smallThumbnail": "http://books.google.com/books/content?id=U4vuDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
        "thumbnail": "http://books.google.com/books/content?id=U4vuDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
        },
        "language": "ja",
        "previewLink": "http://books.google.co.jp/books?id=U4vuDwAAQBAJ&printsec=frontcover&dq=%E6%AD%8C%E4%B8%B8&hl=&cd=1&source=gbs_api",
        "infoLink": "https://play.google.com/store/books/details?id=U4vuDwAAQBAJ&source=gbs_api",
        "canonicalVolumeLink": "https://play.google.com/store/books/details?id=U4vuDwAAQBAJ"
        },
        "saleInfo": {
        "country": "JP",
        "saleability": "FOR_SALE",
        "isEbook": true,
        "listPrice": {
        "amount": 880,
        "currencyCode": "JPY"
        },
        "retailPrice": {
        "amount": 792,
        "currencyCode": "JPY"
        },
        "buyLink": "https://play.google.com/store/books/details?id=U4vuDwAAQBAJ&rdid=book-U4vuDwAAQBAJ&rdot=1&source=gbs_api",
        "offers": [
        {
        "finskyOfferType": 1,
        "listPrice": {
        "amountInMicros": 880000000,
        "currencyCode": "JPY"
        },
        "retailPrice": {
        "amountInMicros": 792000000,
        "currencyCode": "JPY"
        }
        }
        ]
        },
        "accessInfo": {
        "country": "JP",
        "viewability": "PARTIAL",
        "embeddable": true,
        "publicDomain": false,
        "textToSpeechPermission": "ALLOWED",
        "epub": {
        "isAvailable": true,
        "acsTokenLink": "http://books.google.co.jp/books/download/%E6%A1%82%E6%AD%8C%E4%B8%B8_%E6%AD%A3%E8%AA%BF%E3%81%BE%E3%81%8F%E3%82%89%E8%AA%9E%E3%82%8A_%E8%8A%B8%E3%81%AB-sample-epub.acsm?id=U4vuDwAAQBAJ&format=epub&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api"
        },
        "pdf": {
        "isAvailable": true,
        "acsTokenLink": "http://books.google.co.jp/books/download/%E6%A1%82%E6%AD%8C%E4%B8%B8_%E6%AD%A3%E8%AA%BF%E3%81%BE%E3%81%8F%E3%82%89%E8%AA%9E%E3%82%8A_%E8%8A%B8%E3%81%AB-sample-pdf.acsm?id=U4vuDwAAQBAJ&format=pdf&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api"
        },
        "webReaderLink": "http://play.google.com/books/reader?id=U4vuDwAAQBAJ&hl=&printsec=frontcover&source=gbs_api",
        "accessViewStatus": "SAMPLE",
        "quoteSharingAllowed": false
        },
        "searchInfo": {
        "textSnippet": "内容紹介 本書を読むと、あの素晴らしい歌丸師匠の「楷書の芸」が、あなたの心の中で蘇ります。 ぜひ、僕の大好きなお爺さんの口調を思い出してください。 ..."
        }
        },
        {
        "kind": "books#volume",
        "id": "cTtmDwAAQBAJ",
        "etag": "XK5Lz3qwfHM",
        "selfLink": "https://www.googleapis.com/books/v1/volumes/cTtmDwAAQBAJ",
        "volumeInfo": {
        "title": "師匠　歌丸　背中を追い続けた三十二年",
        "authors": [
        "桂歌助"
        ],
        "publisher": "イースト・プレス",
        "publishedDate": "2018-07-24",
        "description": "「ほめる人は敵と思え、叱る人は味方と思え」と、 こんなに叱ってきたのに、なかなか成長してくれない弟子なんです――桂歌丸 初の直弟子が描く師匠と歩んだ落語家人生。 師匠としての桂歌丸の姿が、いまはじめて明かされる。 一九八五年、東京理科大生の無口な男がなぜか落語家を志し、桂歌丸の門を叩いた。 けっして弟子を褒めない歌丸だったが、その陰では無限の愛情を持って弟子を支えていた。 不器用な弟子はそれに気がつかず、ついには「クビだ」と怒らせてしまうが……？ 数々のしくじりを重ね、悪戦苦闘しながらも、師匠を追い続けた日々。弟子と師匠の三十二年を赤裸々に語る。",
        "industryIdentifiers": [
        {
        "type": "OTHER",
        "identifier": "PKEY:BT000053693200100101900209"
        }
        ],
        "readingModes": {
        "text": true,
        "image": true
        },
        "printType": "BOOK",
        "categories": [
        "Biography & Autobiography"
        ],
        "maturityRating": "NOT_MATURE",
        "allowAnonLogging": false,
        "contentVersion": "1.1.2.0.preview.3",
        "panelizationSummary": {
        "containsEpubBubbles": false,
        "containsImageBubbles": false
        },
        "imageLinks": {
        "smallThumbnail": "http://books.google.com/books/content?id=cTtmDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
        "thumbnail": "http://books.google.com/books/content?id=cTtmDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
        },
        "language": "ja",
        "previewLink": "http://books.google.co.jp/books?id=cTtmDwAAQBAJ&pg=PA84&dq=%E6%AD%8C%E4%B8%B8&hl=&cd=2&source=gbs_api",
        "infoLink": "https://play.google.com/store/books/details?id=cTtmDwAAQBAJ&source=gbs_api",
        "canonicalVolumeLink": "https://play.google.com/store/books/details?id=cTtmDwAAQBAJ"
        },
        "saleInfo": {
        "country": "JP",
        "saleability": "FOR_SALE",
        "isEbook": true,
        "listPrice": {
        "amount": 1485,
        "currencyCode": "JPY"
        },
        "retailPrice": {
        "amount": 1336,
        "currencyCode": "JPY"
        },
        "buyLink": "https://play.google.com/store/books/details?id=cTtmDwAAQBAJ&rdid=book-cTtmDwAAQBAJ&rdot=1&source=gbs_api",
        "offers": [
        {
        "finskyOfferType": 1,
        "listPrice": {
        "amountInMicros": 1485000000,
        "currencyCode": "JPY"
        },
        "retailPrice": {
        "amountInMicros": 1336000000,
        "currencyCode": "JPY"
        }
        }
        ]
        },
        "accessInfo": {
        "country": "JP",
        "viewability": "PARTIAL",
        "embeddable": true,
        "publicDomain": false,
        "textToSpeechPermission": "ALLOWED",
        "epub": {
        "isAvailable": true,
        "acsTokenLink": "http://books.google.co.jp/books/download/%E5%B8%AB%E5%8C%A0_%E6%AD%8C%E4%B8%B8_%E8%83%8C%E4%B8%AD%E3%82%92%E8%BF%BD%E3%81%84%E7%B6%9A%E3%81%91%E3%81%9F-sample-epub.acsm?id=cTtmDwAAQBAJ&format=epub&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api"
        },
        "pdf": {
        "isAvailable": true,
        "acsTokenLink": "http://books.google.co.jp/books/download/%E5%B8%AB%E5%8C%A0_%E6%AD%8C%E4%B8%B8_%E8%83%8C%E4%B8%AD%E3%82%92%E8%BF%BD%E3%81%84%E7%B6%9A%E3%81%91%E3%81%9F-sample-pdf.acsm?id=cTtmDwAAQBAJ&format=pdf&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api"
        },
        "webReaderLink": "http://play.google.com/books/reader?id=cTtmDwAAQBAJ&hl=&printsec=frontcover&source=gbs_api",
        "accessViewStatus": "SAMPLE",
        "quoteSharingAllowed": false
        },
        "searchInfo": {
        "textSnippet": "よ"
        }
        },
        {
        "kind": "books#volume",
        "id": "gYyfDwAAQBAJ",
        "etag": "E5Cd0BH0B54",
        "selfLink": "https://www.googleapis.com/books/v1/volumes/gYyfDwAAQBAJ",
        "volumeInfo": {
        "title": "桂歌丸 口伝　圓朝怪談噺",
        "authors": [
        "三遊亭圓朝"
        ],
        "publisher": "竹書房",
        "publishedDate": "2019-07-02",
        "description": "内容紹介 桂歌丸入魂の圓朝怪談!落語三遊亭派宗家の全面協力による口演の口伝書! 三遊亭圓朝とは、幕末から明治期に活躍した江戸・東京落語界の大名跡。 「芝浜(異説あり)」「牡丹灯籠」「鰍沢」「真景累ヶ淵」など、数多くの名作落語を創作した圓朝は、言文一致の創始者となって、二葉亭四迷等に影響を与える。 現の日本語の祖とも云われる。 「真景累ヶ淵」は圓朝の代表作であるが、現存する速記本は新聞連載のスタイルで編集された一大長編小説で、現在まで落語家の口伝によって伝承されている落語の内容とは異なる部分が多い。 本書は、晩年に「圓朝怪談」の口演に心血を注いだ桂歌丸師匠の口演を元に、三代目落語三遊派宗家・藤浦敦氏の手によって落語本として構成されている。 圓朝怪談の代表作『真景累ヶ淵』(歌丸口伝版全七席)に加え、こちらも名作怪談の『江島屋怪談』(歌丸口伝版全一席)を収録。 著者について 三遊亭圓朝 1839-1900 江戸・東京落語の三遊派の大名跡。落語中興の祖、落語の神様とも云われる。二葉亭四迷が『浮雲』を書く際に圓朝の落語口演速記を参考にしたとされ、明治の言文一致運動に大きな影響を及ぼした。現代の日本語の祖である。作品に、『芝浜』等の人情噺から、『死神』『牡丹灯籠』『真景累ヶ淵』などの現代に伝わる怪談を数多く拵えた。",
        "industryIdentifiers": [
        {
        "type": "OTHER",
        "identifier": "PKEY:BT000062384600100101900209"
        }
        ],
        "readingModes": {
        "text": true,
        "image": true
        },
        "pageCount": 256,
        "printType": "BOOK",
        "categories": [
        "Crafts & Hobbies"
        ],
        "maturityRating": "NOT_MATURE",
        "allowAnonLogging": false,
        "contentVersion": "1.1.1.0.preview.3",
        "panelizationSummary": {
        "containsEpubBubbles": false,
        "containsImageBubbles": false
        },
        "imageLinks": {
        "smallThumbnail": "http://books.google.com/books/content?id=gYyfDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
        "thumbnail": "http://books.google.com/books/content?id=gYyfDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
        },
        "language": "ja",
        "previewLink": "http://books.google.co.jp/books?id=gYyfDwAAQBAJ&pg=PR7&dq=%E6%AD%8C%E4%B8%B8&hl=&cd=3&source=gbs_api",
        "infoLink": "https://play.google.com/store/books/details?id=gYyfDwAAQBAJ&source=gbs_api",
        "canonicalVolumeLink": "https://play.google.com/store/books/details?id=gYyfDwAAQBAJ"
        },
        "saleInfo": {
        "country": "JP",
        "saleability": "FOR_SALE",
        "isEbook": true,
        "listPrice": {
        "amount": 2420,
        "currencyCode": "JPY"
        },
        "retailPrice": {
        "amount": 2178,
        "currencyCode": "JPY"
        },
        "buyLink": "https://play.google.com/store/books/details?id=gYyfDwAAQBAJ&rdid=book-gYyfDwAAQBAJ&rdot=1&source=gbs_api",
        "offers": [
        {
        "finskyOfferType": 1,
        "listPrice": {
        "amountInMicros": 2420000000,
        "currencyCode": "JPY"
        },
        "retailPrice": {
        "amountInMicros": 2178000000,
        "currencyCode": "JPY"
        }
        }
        ]
        },
        "accessInfo": {
        "country": "JP",
        "viewability": "PARTIAL",
        "embeddable": true,
        "publicDomain": false,
        "textToSpeechPermission": "ALLOWED",
        "epub": {
        "isAvailable": true,
        "acsTokenLink": "http://books.google.co.jp/books/download/%E6%A1%82%E6%AD%8C%E4%B8%B8_%E5%8F%A3%E4%BC%9D_%E5%9C%93%E6%9C%9D%E6%80%AA%E8%AB%87%E5%99%BA-sample-epub.acsm?id=gYyfDwAAQBAJ&format=epub&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api"
        },
        "pdf": {
        "isAvailable": true,
        "acsTokenLink": "http://books.google.co.jp/books/download/%E6%A1%82%E6%AD%8C%E4%B8%B8_%E5%8F%A3%E4%BC%9D_%E5%9C%93%E6%9C%9D%E6%80%AA%E8%AB%87%E5%99%BA-sample-pdf.acsm?id=gYyfDwAAQBAJ&format=pdf&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api"
        },
        "webReaderLink": "http://play.google.com/books/reader?id=gYyfDwAAQBAJ&hl=&printsec=frontcover&source=gbs_api",
        "accessViewStatus": "SAMPLE",
        "quoteSharingAllowed": false
        },
        "searchInfo": {
        "textSnippet": "差別を助⻑する意図を以て使用された表現ではないこと、また、古典落語の"
        }
        },
        {
        "kind": "books#volume",
        "id": "DOwoDwAAQBAJ",
        "etag": "autciNSE7nU",
        "selfLink": "https://www.googleapis.com/books/v1/volumes/DOwoDwAAQBAJ",
        "volumeInfo": {
        "title": "忍者歌丸前編",
        "authors": [
        "かわのいちろう"
        ],
        "publisher": "電書バト",
        "publishedDate": "2017-06-08",
        "description": "忍術の極意を和歌という形で伝えた「忍歌」。その忍歌を心に刻み戦国の世を生き抜く忍者「歌丸」の物語。 武田信玄配下の忍者「歌丸」は敵将上杉謙信との激しい諜報戦の只中にあった。そんな非情な忍びの世界に身を置きながらも、身重の妻「おみつ」と愛を育み生きていたが、ある日忍び里が何者かに襲撃され、「おみつ」がさらわれてしまう。 現存する忍術文書に基づいたリアル忍者のサバイバルを描いた前編。",
        "industryIdentifiers": [
        {
        "type": "OTHER",
        "identifier": "PKEY:BT000044796900100101900209"
        }
        ],
        "readingModes": {
        "text": true,
        "image": true
        },
        "pageCount": 210,
        "printType": "BOOK",
        "categories": [
        "Comics & Graphic Novels"
        ],
        "maturityRating": "NOT_MATURE",
        "allowAnonLogging": true,
        "contentVersion": "1.1.1.0.preview.3",
        "panelizationSummary": {
        "containsEpubBubbles": true,
        "containsImageBubbles": true,
        "epubBubbleVersion": "c26367f969674e2f_A",
        "imageBubbleVersion": "c26367f969674e2f_A"
        },
        "imageLinks": {
        "smallThumbnail": "http://books.google.com/books/content?id=DOwoDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
        "thumbnail": "http://books.google.com/books/content?id=DOwoDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
        },
        "language": "ja",
        "previewLink": "http://books.google.co.jp/books?id=DOwoDwAAQBAJ&pg=PT1&dq=%E6%AD%8C%E4%B8%B8&hl=&cd=4&source=gbs_api",
        "infoLink": "https://play.google.com/store/books/details?id=DOwoDwAAQBAJ&source=gbs_api",
        "canonicalVolumeLink": "https://play.google.com/store/books/details?id=DOwoDwAAQBAJ",
        "seriesInfo": {
        "kind": "books#volume_series_info",
        "bookDisplayNumber": "1",
        "volumeSeries": [
        {
        "seriesId": "E134GgAAABDqRM",
        "seriesBookType": "ISSUE",
        "orderNumber": 1
        }
        ]
        }
        },
        "saleInfo": {
        "country": "JP",
        "saleability": "FOR_SALE",
        "isEbook": true,
        "listPrice": {
        "amount": 220,
        "currencyCode": "JPY"
        },
        "retailPrice": {
        "amount": 198,
        "currencyCode": "JPY"
        },
        "buyLink": "https://play.google.com/store/books/details?id=DOwoDwAAQBAJ&rdid=book-DOwoDwAAQBAJ&rdot=1&source=gbs_api",
        "offers": [
        {
        "finskyOfferType": 1,
        "listPrice": {
        "amountInMicros": 220000000,
        "currencyCode": "JPY"
        },
        "retailPrice": {
        "amountInMicros": 198000000,
        "currencyCode": "JPY"
        }
        }
        ]
        },
        "accessInfo": {
        "country": "JP",
        "viewability": "PARTIAL",
        "embeddable": true,
        "publicDomain": false,
        "textToSpeechPermission": "ALLOWED",
        "epub": {
        "isAvailable": true,
        "acsTokenLink": "http://books.google.co.jp/books/download/%E5%BF%8D%E8%80%85%E6%AD%8C%E4%B8%B8%E5%89%8D%E7%B7%A8-sample-epub.acsm?id=DOwoDwAAQBAJ&format=epub&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api"
        },
        "pdf": {
        "isAvailable": true,
        "acsTokenLink": "http://books.google.co.jp/books/download/%E5%BF%8D%E8%80%85%E6%AD%8C%E4%B8%B8%E5%89%8D%E7%B7%A8-sample-pdf.acsm?id=DOwoDwAAQBAJ&format=pdf&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api"
        },
        "webReaderLink": "http://play.google.com/books/reader?id=DOwoDwAAQBAJ&hl=&printsec=frontcover&source=gbs_api",
        "accessViewStatus": "SAMPLE",
        "quoteSharingAllowed": false
        }
        },
        {
        "kind": "books#volume",
        "id": "EOwoDwAAQBAJ",
        "etag": "93BkmWgAgMY",
        "selfLink": "https://www.googleapis.com/books/v1/volumes/EOwoDwAAQBAJ",
        "volumeInfo": {
        "title": "忍者歌丸後編",
        "authors": [
        "かわのいちろう"
        ],
        "publisher": "電書バト",
        "publishedDate": "2017-06-08",
        "description": "忍術の極意を和歌という形で伝えた「忍歌」。その忍歌を心に刻み戦国の世を生き抜く忍者「歌丸」の物語。 忍び里を襲撃し身重の妻「おみつ」をさらった相手が徳川家康配下の忍将「服部半蔵」だとわかった歌丸は奪還に向かうが、その先にはあの織田信長を巻き込む伊賀者との壮絶な闘いが待っていた。 現存する忍術文書に基づいたリアル忍者のサバイバルを描いた後編。",
        "industryIdentifiers": [
        {
        "type": "OTHER",
        "identifier": "PKEY:BT000044796900200201900209"
        }
        ],
        "readingModes": {
        "text": true,
        "image": true
        },
        "pageCount": 202,
        "printType": "BOOK",
        "categories": [
        "Comics & Graphic Novels"
        ],
        "maturityRating": "NOT_MATURE",
        "allowAnonLogging": false,
        "contentVersion": "1.1.1.0.preview.3",
        "panelizationSummary": {
        "containsEpubBubbles": true,
        "containsImageBubbles": true,
        "epubBubbleVersion": "d09797d12883a459_A",
        "imageBubbleVersion": "d09797d12883a459_A"
        },
        "imageLinks": {
        "smallThumbnail": "http://books.google.com/books/content?id=EOwoDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
        "thumbnail": "http://books.google.com/books/content?id=EOwoDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
        },
        "language": "ja",
        "previewLink": "http://books.google.co.jp/books?id=EOwoDwAAQBAJ&pg=PT55&dq=%E6%AD%8C%E4%B8%B8&hl=&cd=5&source=gbs_api",
        "infoLink": "https://play.google.com/store/books/details?id=EOwoDwAAQBAJ&source=gbs_api",
        "canonicalVolumeLink": "https://play.google.com/store/books/details?id=EOwoDwAAQBAJ",
        "seriesInfo": {
        "kind": "books#volume_series_info",
        "bookDisplayNumber": "2",
        "volumeSeries": [
        {
        "seriesId": "E134GgAAABDqRM",
        "seriesBookType": "ISSUE",
        "orderNumber": 2
        }
        ]
        }
        },
        "saleInfo": {
        "country": "JP",
        "saleability": "FOR_SALE",
        "isEbook": true,
        "listPrice": {
        "amount": 220,
        "currencyCode": "JPY"
        },
        "retailPrice": {
        "amount": 198,
        "currencyCode": "JPY"
        },
        "buyLink": "https://play.google.com/store/books/details?id=EOwoDwAAQBAJ&rdid=book-EOwoDwAAQBAJ&rdot=1&source=gbs_api",
        "offers": [
        {
        "finskyOfferType": 1,
        "listPrice": {
        "amountInMicros": 220000000,
        "currencyCode": "JPY"
        },
        "retailPrice": {
        "amountInMicros": 198000000,
        "currencyCode": "JPY"
        }
        }
        ]
        },
        "accessInfo": {
        "country": "JP",
        "viewability": "PARTIAL",
        "embeddable": true,
        "publicDomain": false,
        "textToSpeechPermission": "ALLOWED",
        "epub": {
        "isAvailable": true,
        "acsTokenLink": "http://books.google.co.jp/books/download/%E5%BF%8D%E8%80%85%E6%AD%8C%E4%B8%B8%E5%BE%8C%E7%B7%A8-sample-epub.acsm?id=EOwoDwAAQBAJ&format=epub&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api"
        },
        "pdf": {
        "isAvailable": true,
        "acsTokenLink": "http://books.google.co.jp/books/download/%E5%BF%8D%E8%80%85%E6%AD%8C%E4%B8%B8%E5%BE%8C%E7%B7%A8-sample-pdf.acsm?id=EOwoDwAAQBAJ&format=pdf&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api"
        },
        "webReaderLink": "http://play.google.com/books/reader?id=EOwoDwAAQBAJ&hl=&printsec=frontcover&source=gbs_api",
        "accessViewStatus": "SAMPLE",
        "quoteSharingAllowed": false
        }
        },
        {
        "kind": "books#volume",
        "id": "76DzAAAACAAJ",
        "etag": "DyuXr63Pb7k",
        "selfLink": "https://www.googleapis.com/books/v1/volumes/76DzAAAACAAJ",
        "volumeInfo": {
        "title": "極上歌丸ばなし",
        "authors": [
        "桂歌丸"
        ],
        "publishedDate": "2006-06",
        "description": "笑いにこだわる職人芸、艶のある細やかな話芸、「笑点」大喜利の神様。生まれ育った横浜・真金町から新作派の闘将五代目今輔に入門。波乱の落語家人生、やがて掴んだ「笑点」レギュラーの座―。埋もれた古典の復活に賭ける円熟、桂歌丸初の自伝、芸の暦。",
        "industryIdentifiers": [
        {
        "type": "ISBN_10",
        "identifier": "4901174215"
        },
        {
        "type": "ISBN_13",
        "identifier": "9784901174213"
        }
        ],
        "readingModes": {
        "text": false,
        "image": false
        },
        "pageCount": 252,
        "printType": "BOOK",
        "categories": [
        "Comedians"
        ],
        "maturityRating": "NOT_MATURE",
        "allowAnonLogging": false,
        "contentVersion": "preview-1.0.0",
        "imageLinks": {
        "smallThumbnail": "http://books.google.com/books/content?id=76DzAAAACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api",
        "thumbnail": "http://books.google.com/books/content?id=76DzAAAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api"
        },
        "language": "ja",
        "previewLink": "http://books.google.co.jp/books?id=76DzAAAACAAJ&dq=%E6%AD%8C%E4%B8%B8&hl=&cd=6&source=gbs_api",
        "infoLink": "http://books.google.co.jp/books?id=76DzAAAACAAJ&dq=%E6%AD%8C%E4%B8%B8&hl=&source=gbs_api",
        "canonicalVolumeLink": "https://books.google.com/books/about/%E6%A5%B5%E4%B8%8A%E6%AD%8C%E4%B8%B8%E3%81%B0%E3%81%AA%E3%81%97.html?hl=&id=76DzAAAACAAJ"
        },
        "saleInfo": {
        "country": "JP",
        "saleability": "NOT_FOR_SALE",
        "isEbook": false
        },
        "accessInfo": {
        "country": "JP",
        "viewability": "NO_PAGES",
        "embeddable": false,
        "publicDomain": false,
        "textToSpeechPermission": "ALLOWED",
        "epub": {
        "isAvailable": false
        },
        "pdf": {
        "isAvailable": false
        },
        "webReaderLink": "http://play.google.com/books/reader?id=76DzAAAACAAJ&hl=&printsec=frontcover&source=gbs_api",
        "accessViewStatus": "NONE",
        "quoteSharingAllowed": false
        },
        "searchInfo": {
        "textSnippet": "笑いにこだわる職人芸、艶のある細やかな話芸、「笑点」大喜利の神様。生まれ育った横浜・真金町から新作派の闘将五代目今輔に入門。波乱の落語家人生、やがて掴んだ「笑点 ..."
        }
        },
        {
        "kind": "books#volume",
        "id": "EuikvwEACAAJ",
        "etag": "N9nPhdbJMPw",
        "selfLink": "https://www.googleapis.com/books/v1/volumes/EuikvwEACAAJ",
        "volumeInfo": {
        "title": "桂歌丸大喜利人生",
        "subtitle": "笑点メンバーが語る不屈の芸人魂",
        "authors": [
        "日本テレビ",
        "日本テレビホールディングス=",
        "日本テレビ放送網=",
        "NTV="
        ],
        "publishedDate": "2018-12",
        "description": "お題:歌丸師匠はどんな人物だった?『笑点』の仲間たちが語り尽くす、一途な落語家の芸、そして生きざま。",
        "industryIdentifiers": [
        {
        "type": "ISBN_10",
        "identifier": "4835639014"
        },
        {
        "type": "ISBN_13",
        "identifier": "9784835639017"
        }
        ],
        "readingModes": {
        "text": false,
        "image": false
        },
        "pageCount": 200,
        "printType": "BOOK",
        "maturityRating": "NOT_MATURE",
        "allowAnonLogging": false,
        "contentVersion": "preview-1.0.0",
        "panelizationSummary": {
        "containsEpubBubbles": false,
        "containsImageBubbles": false
        },
        "imageLinks": {
        "smallThumbnail": "http://books.google.com/books/content?id=EuikvwEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api",
        "thumbnail": "http://books.google.com/books/content?id=EuikvwEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api"
        },
        "language": "ja",
        "previewLink": "http://books.google.co.jp/books?id=EuikvwEACAAJ&dq=%E6%AD%8C%E4%B8%B8&hl=&cd=7&source=gbs_api",
        "infoLink": "http://books.google.co.jp/books?id=EuikvwEACAAJ&dq=%E6%AD%8C%E4%B8%B8&hl=&source=gbs_api",
        "canonicalVolumeLink": "https://books.google.com/books/about/%E6%A1%82%E6%AD%8C%E4%B8%B8%E5%A4%A7%E5%96%9C%E5%88%A9%E4%BA%BA%E7%94%9F.html?hl=&id=EuikvwEACAAJ"
        },
        "saleInfo": {
        "country": "JP",
        "saleability": "NOT_FOR_SALE",
        "isEbook": false
        },
        "accessInfo": {
        "country": "JP",
        "viewability": "NO_PAGES",
        "embeddable": false,
        "publicDomain": false,
        "textToSpeechPermission": "ALLOWED",
        "epub": {
        "isAvailable": false
        },
        "pdf": {
        "isAvailable": false
        },
        "webReaderLink": "http://play.google.com/books/reader?id=EuikvwEACAAJ&hl=&printsec=frontcover&source=gbs_api",
        "accessViewStatus": "NONE",
        "quoteSharingAllowed": false
        },
        "searchInfo": {
        "textSnippet": "お題:歌丸師匠はどんな人物だった?『笑点』の仲間たちが語り尽くす、一途な落語家の芸、そして生きざま。"
        }
        },
        {
        "kind": "books#volume",
        "id": "fLGrcQAACAAJ",
        "etag": "rmSH6uMSy+o",
        "selfLink": "https://www.googleapis.com/books/v1/volumes/fLGrcQAACAAJ",
        "volumeInfo": {
        "title": "座布団一枚!",
        "subtitle": "桂歌丸のわが落語人生",
        "authors": [
        "桂歌丸"
        ],
        "publishedDate": "2010-09",
        "description": "人気番組『笑点』の五代目司会者にして、落語芸術協会会長でもある落語家・桂歌丸の一代記。古典落語の名手が語る、噺家人生六〇年の苦労や思い出。昭和の名人と呼ばれた師匠方直伝の教えや、奥深い芸論と至言の数々。『笑点』の知られざる裏話も披露。",
        "industryIdentifiers": [
        {
        "type": "ISBN_10",
        "identifier": "4093881383"
        },
        {
        "type": "ISBN_13",
        "identifier": "9784093881388"
        }
        ],
        "readingModes": {
        "text": false,
        "image": false
        },
        "pageCount": 191,
        "printType": "BOOK",
        "maturityRating": "NOT_MATURE",
        "allowAnonLogging": false,
        "contentVersion": "preview-1.0.0",
        "imageLinks": {
        "smallThumbnail": "http://books.google.com/books/content?id=fLGrcQAACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api",
        "thumbnail": "http://books.google.com/books/content?id=fLGrcQAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api"
        },
        "language": "ja",
        "previewLink": "http://books.google.co.jp/books?id=fLGrcQAACAAJ&dq=%E6%AD%8C%E4%B8%B8&hl=&cd=8&source=gbs_api",
        "infoLink": "http://books.google.co.jp/books?id=fLGrcQAACAAJ&dq=%E6%AD%8C%E4%B8%B8&hl=&source=gbs_api",
        "canonicalVolumeLink": "https://books.google.com/books/about/%E5%BA%A7%E5%B8%83%E5%9B%A3%E4%B8%80%E6%9E%9A.html?hl=&id=fLGrcQAACAAJ"
        },
        "saleInfo": {
        "country": "JP",
        "saleability": "NOT_FOR_SALE",
        "isEbook": false
        },
        "accessInfo": {
        "country": "JP",
        "viewability": "NO_PAGES",
        "embeddable": false,
        "publicDomain": false,
        "textToSpeechPermission": "ALLOWED",
        "epub": {
        "isAvailable": false
        },
        "pdf": {
        "isAvailable": false
        },
        "webReaderLink": "http://play.google.com/books/reader?id=fLGrcQAACAAJ&hl=&printsec=frontcover&source=gbs_api",
        "accessViewStatus": "NONE",
        "quoteSharingAllowed": false
        },
        "searchInfo": {
        "textSnippet": "人気番組『笑点』の五代目司会者にして、落語芸術協会会長でもある落語家・桂歌丸の一代記。古典落語の名手が語る、噺家人生六〇年の苦労や思い出。昭和の名人と呼ばれた師 ..."
        }
        },
        {
        "kind": "books#volume",
        "id": "ArNrugEACAAJ",
        "etag": "3jsv5W7RDp4",
        "selfLink": "https://www.googleapis.com/books/v1/volumes/ArNrugEACAAJ",
        "volumeInfo": {
        "title": "歌丸不死鳥ひとり語り",
        "authors": [
        "桂歌丸"
        ],
        "publishedDate": "2018-08",
        "description": "噺を残すのは、噺家の使命。あたしたちの代で噺の数を減らしたら先人に申し訳ない―。小学四年生で噺家になると決心、「笑点」出演で一躍人気者になるとともに、古典落語の掘り起こしに取り組み続けた生涯をたどる、粋なひとり語り。持ちネタの舞台裏を語る「あたしのネタ帳」と口演速記『ねずみ』も収録。",
        "industryIdentifiers": [
        {
        "type": "ISBN_10",
        "identifier": "4122066220"
        },
        {
        "type": "ISBN_13",
        "identifier": "9784122066229"
        }
        ],
        "readingModes": {
        "text": false,
        "image": false
        },
        "pageCount": 248,
        "printType": "BOOK",
        "maturityRating": "NOT_MATURE",
        "allowAnonLogging": false,
        "contentVersion": "preview-1.0.0",
        "panelizationSummary": {
        "containsEpubBubbles": false,
        "containsImageBubbles": false
        },
        "imageLinks": {
        "smallThumbnail": "http://books.google.com/books/content?id=ArNrugEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api",
        "thumbnail": "http://books.google.com/books/content?id=ArNrugEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api"
        },
        "language": "ja",
        "previewLink": "http://books.google.co.jp/books?id=ArNrugEACAAJ&dq=%E6%AD%8C%E4%B8%B8&hl=&cd=9&source=gbs_api",
        "infoLink": "http://books.google.co.jp/books?id=ArNrugEACAAJ&dq=%E6%AD%8C%E4%B8%B8&hl=&source=gbs_api",
        "canonicalVolumeLink": "https://books.google.com/books/about/%E6%AD%8C%E4%B8%B8%E4%B8%8D%E6%AD%BB%E9%B3%A5%E3%81%B2%E3%81%A8%E3%82%8A%E8%AA%9E%E3%82%8A.html?hl=&id=ArNrugEACAAJ"
        },
        "saleInfo": {
        "country": "JP",
        "saleability": "NOT_FOR_SALE",
        "isEbook": false
        },
        "accessInfo": {
        "country": "JP",
        "viewability": "NO_PAGES",
        "embeddable": false,
        "publicDomain": false,
        "textToSpeechPermission": "ALLOWED",
        "epub": {
        "isAvailable": false
        },
        "pdf": {
        "isAvailable": false
        },
        "webReaderLink": "http://play.google.com/books/reader?id=ArNrugEACAAJ&hl=&printsec=frontcover&source=gbs_api",
        "accessViewStatus": "NONE",
        "quoteSharingAllowed": false
        },
        "searchInfo": {
        "textSnippet": "噺を残すのは、噺家の使命。あたしたちの代で噺の数を減らしたら先人に申し訳ない―。小学四年生で噺家になると決心、「笑点」出演で一躍人気者になるとともに、古典落語の ..."
        }
        },
        {
        "kind": "books#volume",
        "id": "5bhCuAEACAAJ",
        "etag": "jeAX+aPTXek",
        "selfLink": "https://www.googleapis.com/books/v1/volumes/5bhCuAEACAAJ",
        "volumeInfo": {
        "title": "芸は人なり、人生は笑いあり",
        "subtitle": "歌丸ばなし",
        "authors": [
        "桂歌丸"
        ],
        "publishedDate": "2018-06",
        "description": "「これは我々落語家のバイブル。生き様と心",
        "industryIdentifiers": [
        {
        "type": "ISBN_10",
        "identifier": "4591159221"
        },
        {
        "type": "ISBN_13",
        "identifier": "9784591159224"
        }
        ],
        "readingModes": {
        "text": false,
        "image": false
        },
        "pageCount": 246,
        "printType": "BOOK",
        "maturityRating": "NOT_MATURE",
        "allowAnonLogging": false,
        "contentVersion": "preview-1.0.0",
        "panelizationSummary": {
        "containsEpubBubbles": false,
        "containsImageBubbles": false
        },
        "imageLinks": {
        "smallThumbnail": "http://books.google.com/books/content?id=5bhCuAEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api",
        "thumbnail": "http://books.google.com/books/content?id=5bhCuAEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api"
        },
        "language": "ja",
        "previewLink": "http://books.google.co.jp/books?id=5bhCuAEACAAJ&dq=%E6%AD%8C%E4%B8%B8&hl=&cd=10&source=gbs_api",
        "infoLink": "http://books.google.co.jp/books?id=5bhCuAEACAAJ&dq=%E6%AD%8C%E4%B8%B8&hl=&source=gbs_api",
        "canonicalVolumeLink": "https://books.google.com/books/about/%E8%8A%B8%E3%81%AF%E4%BA%BA%E3%81%AA%E3%82%8A_%E4%BA%BA%E7%94%9F%E3%81%AF%E7%AC%91%E3%81%84%E3%81%82%E3%82%8A.html?hl=&id=5bhCuAEACAAJ"
        },
        "saleInfo": {
        "country": "JP",
        "saleability": "NOT_FOR_SALE",
        "isEbook": false
        },
        "accessInfo": {
        "country": "JP",
        "viewability": "NO_PAGES",
        "embeddable": false,
        "publicDomain": false,
        "textToSpeechPermission": "ALLOWED",
        "epub": {
        "isAvailable": false
        },
        "pdf": {
        "isAvailable": false
        },
        "webReaderLink": "http://play.google.com/books/reader?id=5bhCuAEACAAJ&hl=&printsec=frontcover&source=gbs_api",
        "accessViewStatus": "NONE",
        "quoteSharingAllowed": false
        },
        "searchInfo": {
        "textSnippet": "「後生鰻」「中村仲蔵」「ねずみ」など磨きをかけた演目全8席。"
        }
        }
        ]
        }
        """
    }
}
