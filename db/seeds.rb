User.create!(name:  "신재훈",
             email: "a@a",
             password:              "tlswogns",
             password_confirmation: "tlswogns")

User.find(1).roles.clear
User.find(1).add_role(:admin)

Book.create!(title: "양철북. 1",
             thumbnail: "http://t1.daumcdn.net/book/KOR9788937460326",
             isbn: "8937460327 9788937460326",
             publisher: "민음사",
             authors: "귄터 그라스",
             contents: "99년 노벨문학상을 수상한 독일작가의 장편. 3살때 추락사고로 성장이 멈춘 오스카를 주인공으로 나치 점령하에서 2차대전 종전 후에 이르기까지 독일의 역사와 사회상을 촘촘히 그린 작품...",
             url: "http://book.daum.net/detail/book.do?bookid=KOR9788937460326",
             date_time: "1999-10-04",
             translators: "장희창",
             category: "소설")

Post.create!(content: "세상에서 가장 훌륭한 문학책입니다. #귄터그라스 #사랑해 #김태영님_추천 #사춘기_안녕",
             user_id: 1,
             book_id: 1)
             
Book.create!(title: "로마인 이야기 1 (로마는 하루아침에 이루어지지 않았다)",
             thumbnail: "http://t1.daumcdn.net/book/KOR9788935610242",
             isbn: "8935610240 9788935610242",
             publisher: "한길사",
             authors: "시오노 나나미",
             contents: "90년대 역사 분야의 최고 베스트셀러 『로마인 이야기』는 기원전 ８세기께 로마 건국기에서부터 멸망까지 1천여 년의 역사를 다룬다．이탈리아에서 공부를 한 후 현지인과 결혼해 피렌체에...",
             url: "http://book.daum.net/detail/book.do?bookid=KOR9788935610242",
             date_time: "1995-09-01",
             translators: "김석희",
             category: "역사/문화")

Post.create!(content: "누군가 제대하면 남겨놓은 이 책을 관물대 위에서 발견했다. 이 책 이후로 내게도 교양이란게 조금씩 생겼나봐. 독재자를 찬양하고 중2병 공주마냥 허세가 심한 건 용서가 되지만 위안부에 대해 함부로 주둥아리를 놀렸다는 사실에 당신의 공감능력을 의심했다. #위안부망언",
             user_id: 1,
             book_id: 2)

Book.create!(title: "깊이에의 강요",
             thumbnail: "http://t1.daumcdn.net/book/KOR9788932902777",
             isbn: "8932902771 9788932902777",
             publisher: "열린책들",
             authors: "파트리크 쥐스킨트",
             contents: "`깊이가 없다`라는 평론가의 말에 `깊이`가 무엇인지 구현하려다 좌절하여 자살한 젊은 여류화가의 이야기를 비롯해, 체스게임을 통한 승부의 세계를 묘사한 , 한 성공한 보석 세공업자의...",
             url: "http://book.daum.net/detail/book.do?bookid=KOR9788932902777",
             date_time: "2014-07-20",
             translators: "김인순",
             category: "소설")

Post.create!(content: "어설픈 어른이 동화랑, 시답잖은 희곡에 실망했지만 여기 실린 단편 셋으로 왜 이 사람이 대단한 작가인지 단번에 알아봤다. 짧은 단편이 얼마나 강한 인상을 심어줄 수 있는지 보여주는 훌륭한 작품! #쥐스킨트_단편집 #승부는_꼭_읽어야함",
             user_id: 1,
             book_id: 3)

Book.create!(title: "하얀 전쟁",
             thumbnail: "http://t1.daumcdn.net/book/KOR9788992280518",
             isbn: "8992280513 9788992280518",
             publisher: "세경",
             authors: "안정효",
             contents: "『하얀전쟁』은 안정효의 장편소설이다. 월남전쟁 속에서의 극한 상황과 작금의 비대하고 썩은 일상생활의 극명한 대조로서 소설이 진행된다. 무엇보다도 이 소설이 우리를 감동시키는 이유...",
             url: "http://book.daum.net/detail/book.do?bookid=KOR9788992280518",
             date_time: "2009-11-02",
             translators: "",
             category: "소설")

Post.create!(content: "절판이후 다시 출간된다는 소식을 들었을 때 얼마나 기뻤는지 모르겠다. 안정효 선생님의 책은 무조건 다 읽을 것! #안정효 #안성기_주연",
             user_id: 1,
             book_id: 4)

Book.create!(title: "나의 문화유산답사기. 7",
             thumbnail: "http://t1.daumcdn.net/book/KOR9788936472184",
             isbn: "8936472186 9788936472184",
             publisher: "창비",
             authors: "유홍준",
             contents: "예술이 어우러진 기행문학의 백미를 만나다! 답사 신드롬을 불러일으키는 인문서『나의 문화유산답사기. 7 : 돌하르방 어디 감수광』. 1990년대 초중반 전국적인 답사 신드롬을...",
             url: "http://book.daum.net/detail/book.do?bookid=KOR9788936472184",
             date_time: "2012-09-15",
             translators: "",
             category: "역사/문화")

Post.create!(content: "아니오! 존경하는 선생님, 제주도 만큼은 이렇게 보는게 아닌 거 같습니다. #그래도_성미가든은_인정 #여행 #제주여행",
             user_id: 1,
             book_id: 5)

Book.create!(title: "조엘 온 소프트웨어 (유쾌한 오프라인 블로그)",
             thumbnail: "http://t1.daumcdn.net/book/KOR9788989975588",
             isbn: "8989975581 9788989975588",
             publisher: "에이콘출판",
             authors: "Joel Spolsky",
             contents: "소프트웨어 개발내용을 다뤄 개발자들에게 인기가 높은 블로그인 조엘 온 소프트웨어 블러그에 실렸던 기사 중에서 유쾌하고 핵심을 찌르는 베스트 기사만 뽑아내 엮은 책으로, 개발자...",
             url: "http://book.daum.net/detail/book.do?bookid=KOR9788989975588",
             date_time: "2005-04-15",
             translators: "박재호",
             category: "컴퓨터/IT")

Post.create!(content: "이미 다른 서평들을 비롯한 이 책에 쏟아진 찬사들을 읽어보았다면 이 책이 어떤 책인지 파악이 끝났을 것이라 여겨진다. 형님의 베스트셀러 중 하나! #박재호 #이해영 #jrogue_외에_번역불가 #아직도_구입안했니",
             user_id: 1,
             book_id: 6)

Book.create!(title: "광기의 산맥에서 (러브크래프트 코드 4)",
             thumbnail: "http://t1.daumcdn.net/book/KOR9788949703305",
             isbn: "8949703300 9788949703305",
             publisher: "동서문화사",
             authors: "H.P. 러브크래프트,러브크래프트",
             contents: "공포문학의 대가 H.P. 러브크래프트의 단편모음집. <광기의 산맥에서>, <울타르의 고양이> 등 6편의 소설을 수록했다. 그의 소설은 단순한 공포 그 자체가 아니라, 공포란 것이 과연 어디...",
             url: "http://book.daum.net/detail/book.do?bookid=KOR9788949703305",
             date_time: "2005-08-08",
             translators: "정광섭",
             category: "소설")

Post.create!(content: "2009년에 황금가지에서 나온 책을 구입했어야 했는데 정보가 부족해서 이 책을 구입했네요. 나중에 알아보고 난 뒤에 땅을 쳤습니다. 광기의 산맥을 비롯한 6편의 러브크래프트 단편 모음집입니다. 그런데!! '광기의 산맥' 번역 상태가 가장 좋지 않습니다. #러브크래프트 #그래서_다시_구입함 #SF #생각보다_덜_무서움 #오히려_리애너메이터가_꿀잼",
             user_id: 1,
             book_id: 7)

Book.create!(title: "미래를 만든 GEEKS",
             thumbnail: "http://t1.daumcdn.net/book/KOR9788991268739",
             isbn: "8991268730 9788991268739",
             publisher: "인사이트",
             authors: "앤디 허츠펠드",
             contents: "미래를 예측하는 가장 좋은 방법은 미래를 만드는 것이다. 맥을 만든 혁신의 힘을 고스란히 담아낸 『미래를 만든 Greeks』. 누구나 컴퓨터를 쉽게 접하고 사용하는 세상을 꿈꾸고, 그 꿈을...",
             url: "http://book.daum.net/detail/book.do?bookid=KOR9788991268739",
             date_time: "2010-05-06",
             translators: "송우일",
             category: "경제/경영")

Post.create!(content: "잠들기 전, 매일 조금씩 읽은 책을 덮을 때의 느낌을 감히 새벽 초소에서 근무를 끝내고 돌아온 신병이 관물대에 숨겨놓은 건빵을 몇 개 집어 먹고 남은 건빵 봉지를 보며 느끼는 흐뭇함에 비교하고 싶다. #Mac개발기 #악마잡스 #애플",
             user_id: 1,
             book_id: 8)

Book.create!(title: "C언어 펀더멘탈",
             thumbnail: "http://t1.daumcdn.net/book/KOR9788979145830",
             isbn: "8979145837 9788979145830",
             publisher: "한빛미디어",
             authors: "전웅",
             contents: "비유를 통해 어려운 개념을 쉽게 해설한다. 표준 라이브러리를 이용한 작고 기능성있는 순수 창작 예제가 가득하다. ▶ 2003년에 출간된『IT 백두대간 C언어 펀더멘탈』의 재출간판입니다...",
             url: "http://book.daum.net/detail/book.do?bookid=KOR9788979145830",
             date_time: "2008-05-12",
             translators: "",
             category: "컴퓨터/IT")

Post.create!(content: "입만 살아있는 C 전문가들을 압도하는 컴퓨터 과학 지식의 경전 #전웅 #C #프로그래밍 #C99 #hclc #그립다_hclc",
             user_id: 1,
             book_id: 9)

Book.create!(title: "C 프로그래머를 위한 C++",
             thumbnail: "http://t1.daumcdn.net/book/KOR9788979140828",
             isbn: "8979140827 9788979140828",
             publisher: "한빛미디어",
             authors: "그레고리 새터 외",
             contents: "",
             url: "http://book.daum.net/detail/book.do?bookid=KOR9788979140828",
             date_time: "2000-08-28",
             translators: "서정욱",
             category: "컴퓨터/IT")

Post.create!(content: "참으로 Oreilly스런 책이라고 할 수 있겠다. C를 충분히 익혔고 잘 활용하는 고급 독자를 대상으로 하고 있다는 점에서부터 특이하다. 과감하게 기본적인 C의 내용은 잘라내어 독자층을 명확히 한 것은 참 Oreilly 아니랄까봐 혀를 내두르게 한다. #C #C++ #쿡북은_아님 #적절한_예제 #쉬운_코드 #오래전_절판",
             user_id: 1,
             book_id: 10)

User.create!(name:  "신해우",
             email: "b@b",
             password:              "tlsgodn",
             password_confirmation: "tlsgodn")

Book.create!(title: "마당을 나온 암탉",
             thumbnail: "http://t1.daumcdn.net/book/KOR9788971968710",
             isbn: "8971968710 9788971968710",
             publisher: "사계절",
             authors: "황선미",
             contents: "암탉 잎싹의 꿈은 이루어질 수 있을까요? 2017 대한민국 문화예술상을 수상한 황선미의『마당을 나온 암탉』은 알을 품어 병아리의 탄생을 보겠다는 소망을 가지고 양계장을 나온 암탉...",
             url: "http://book.daum.net/detail/book.do?bookid=KOR9788971968710",
             date_time: "2002-04-15",
             translators: "",
             category: "어린이(초등)")

Post.create!(content: "교과서에도 실리고 애니메이션으로도 만들어진 이야기입니다. 꿈을 이루기 위해서 최선을 다해야겠다는 생각을 하게되었어요. #잎싹 #꿈은_이루어진다",
             user_id: 2,
             book_id: 11)

Book.create!(title: "먼나라 이웃나라. 6: 이탈리아",
             thumbnail: "http://t1.daumcdn.net/book/KOR9788934958246",
             isbn: "8934958243 9788934958246",
             publisher: "김영사",
             authors: "이원복",
             contents: "교수와 함께 떠나는 세계 역사 여행『먼나라 이웃나라. 6: 이탈리아』. 보다 화려해진 그림, 1만...새로 그린 스테디셀러《먼나라 이웃나라》의 전면개정판이다. 최신의 세계 판도를 생생...",
             url: "http://book.daum.net/detail/book.do?bookid=KOR9788934958246",
             date_time: "2012-07-26",
             translators: "",
             category: "어린이(초등)")

Post.create!(content: "이 책을 읽고 로마와 피렌체를 다녀왔어요. 또 아이스크림 먹고 싶어요! #여행 #이탈리아 #로마",
             user_id: 2,
             book_id: 12)

User.create!(name:  "양재원",
             email: "c@c",
             password:              "didwodnjs",
             password_confirmation: "didwodnjs")

Post.create!(content: "신재훈 선생님이 추천해주신 책! 나도 이 책을 읽고 사춘기를 탈출해야겠어요! #귄터그라스 #나랑_안맞아 #좀_이상해 #무슨_생각으로_이런_책을_쓴거야",
             user_id: 3,
             book_id: 1)

Book.create!(title: "뒤집어지는 영어",
             thumbnail: "http://t1.daumcdn.net/book/KOR9788992280150",
             isbn: "8992280157 9788992280150",
             publisher: "세경",
             authors: "안정효",
             contents: "《뒤집어지는 영어》에서는 저자가 직접 300여편의 영화를 섭렵하여 얻은 다양한 분야의 어휘와 살아 숨쉬는 생생한 대사를 저자 특유의 맛깔스러운 문체로 풀어내고 있다. 영화속 영어로...",
             url: "http://book.daum.net/detail/book.do?bookid=KOR9788992280150",
             date_time: "2007-09-20",
             translators: "",
             category: "외국어")

Post.create!(content: "안정효 선생님 책이라서 구입했어요. 영어 공부에 대해 다시 생각하는 기회를 갖게 되었습니다. 단순히 좋은 발음에만 매달리는 영어 공부가 아니라 어휘를 풍부하게 기초부터 다시 시작하는 영어 공부가 되어야겠습니다. #안정효 #영어공부 #어휘",
             user_id: 3,
             book_id: 13)
             
User.create!(name:  "최다영",
             email: "d@d",
             password:              "chlekdud",
             password_confirmation: "chlekdud")

Book.create!(title: "인조이 프라하(2018)",
             thumbnail: "http://t1.daumcdn.net/book/image/KOR9791161653921",
             isbn: "1161653929 9791161653921",
             publisher: "넥서스BOOKS",
             authors: "문은정,김지선",
             contents: "전면 개정으로 새롭게 돌아왔다! 거리 곳곳마다 아름다운 이야기가 피어나는 프라하! 요즘 핫한 프라하의 근교 도시 10곳의 여행 정보 업데이트! 깔끔한 편집 구성은 물론 읽는 재미까지...",
             url: "http://book.daum.net/detail/book.do?bookid=KOR9791161653921",
             date_time: "2018-06-25",
             translators: "",
             category: "여행/기행")

Post.create!(content: "프라하 겨울에 다녀왔는데 너무 좋았어요! #여행 #프라하 #프라하여행",
             user_id: 4,
             book_id: 14)
             