User.create!(name:  "신재훈",
             email: "a@a",
             password:              "tlswogns",
             password_confirmation: "tlswogns")

User.find(1).roles.clear
User.find(1).add_role(:admin)

Book.create!(title: "양철북 1 (세계문학전집 32,1999년 노벨문학상 수상작)",
             image: "bookthumb.phinf.naver.net/cover/000/051/00005174.jpg",
             isbn: "8937460327 9788937460326",
             publisher: "민음사",
             author: "귄터 그라스")

Post.create!(content: "세상에서 가장 훌륭한 문학책입니다. #귄터그라스 #사랑해 #김태영님추천 #사춘기안녕",
             user_id: 1,
             book_id: 1)
             
Book.create!(title: "로마인 이야기 1 (로마는 하루아침에 이루어지지 않았다)",
             image: "bookthumb.phinf.naver.net/cover/001/201/00120146.jpg",
             isbn: "8935610240 9788935610242",
             publisher: "한길사",
             author: "시오노 나나미")

Post.create!(content: "누군가 제대하면 남겨놓은 이 책을 관물대 위에서 발견했다. 이 책 이후로 내게도 교양이란게 조금씩 생겼나봐. 독재자를 찬양하고 중2병 공주마냥 허세가 심한 건 용서가 되지만 위안부에 대해 함부로 주둥아리를 놀린 사실은 당신이 얼마나 공감능력이 떨어지는지 여실히 보여준다. #내가사랑한간결한문체 #시오노나나미 #책좀읽자 #저자가중2병 #위안부망언",
             user_id: 1,
             book_id: 2)
             
Book.create!(title: "깊이에의 강요",
             image: "bookthumb.phinf.naver.net/cover/002/029/00202901.jpg",
             isbn: "8932902771 9788932902777",
             publisher: "열린책들",
             author: "파트리크 쥐스킨트")

Post.create!(content: "어설픈 어른이 동화랑, 시답잖은 희곡에 실망했지만 여기 실린 단편 셋으로 왜 이 사람이 대단한 작가인지 단번에 알아봤다. 짧은 단편이 얼마나 강한 인상을 심어줄 수 있는지 보여주는 훌륭한 작품! #쥐스킨트단편집 #승부는꼭읽어야함",
             user_id: 1,
             book_id: 3)

Book.create!(title: "하얀 전쟁",
             image: "bookthumb.phinf.naver.net/cover/061/093/06109347.jpg",
             isbn: "8992280513 9788992280518",
             publisher: "세경",
             author: "안정효")

Post.create!(content: "절판이후 다시 출간된다는 소식을 들었을 때 얼마나 기뻤는지 모르겠다. 안정효 선생님의 책은 무조건 다 읽을 것! #안정효 #영화는별로",
             user_id: 1,
             book_id: 4)

Book.create!(title: "나의 문화유산답사기 7 (돌하르방 어디 감수광)",
             image: "	bookthumb.phinf.naver.net/cover/069/946/06994663.jpg",
             isbn: "8936472186 9788936472184",
             publisher: "창비",
             author: "유홍준")

Post.create!(content: "아니오! 존경하는 선생님, 제주도 만큼은 이렇게 보는게 아닌 거 같습니다. #그래도성미가든은인정 #여행 #제주여행",
             user_id: 1,
             book_id: 5)

Book.create!(title: "조엘 온 소프트웨어 (유쾌한 오프라인 블로그)",
             image: "bookthumb.phinf.naver.net/cover/015/287/01528741.jpg",
             isbn: "8989975581 9788989975588",
             publisher: "에이콘출판",
             author: "조엘 스폴스키")

Post.create!(content: "이미 다른 서평들을 비롯한 이 책에 쏟아진 찬사들을 읽어보았다면 이 책이 어떤 책인지, 내 지갑 혹은 신용카드에서 돈을 지불할 가치가 있는지 파악이 끝났을 것이라 여겨진다. 아직도 망설이는 이들을 위해 지금부터 이 책을 좀 더 적극적로 읽어볼 것을 권하고 싶다. #박재호 #이해영 #jrogue외에번역불가 #아직도구입안했니",
             user_id: 1,
             book_id: 6)

Book.create!(title: "광기의 산맥에서 (러브크래프트 코드 4)",
             image: "bookthumb.phinf.naver.net/cover/018/760/01876092.jpg",
             isbn: "8949703300 9788949703305",
             publisher: "동서문화사",
             author: "러브크래프트")

Post.create!(content: "2009년에 황금가지에서 나온 책을 구입했어야 했는데 정보가 부족해서 이 책을 구입했네요. 나중에 알아보고 난 뒤에 땅을 쳤습니다. 광기의 산맥을 비롯한 6편의 러브크래프트 단편 모음집입니다. 그런데!! '광기의 산맥' 번역 상태가 가장 좋지 않습니다. #러브크래프트 #그래서다시구입함 #SF #생각보다덜무서움 #리애너메이터가꿀잼",
             user_id: 1,
             book_id: 7)

Book.create!(title: "미래를 만든 GEEKS",
             image: "bookthumb.phinf.naver.net/cover/062/705/06270575.jpg",
             isbn: "8991268730 9788991268739",
             publisher: "인사이트",
             author: "앤디 허츠펠드")

Post.create!(content: "결말이 너무 궁금해서 아무리 오랜 시간이 걸리더라도 한 호흡에 다 읽어버리고 싶은 책이 있는 반면, 너무 재미있어 조금씩 아끼면서 읽고 싶은 책도 있다. 이 책은 전형적인 후자의 책이다. 웹 사이트에 투고한 기사들을 편집한 구성 때문이라고 원인을 단정 짓기는 너무 야박하다. 붉은 취침등 아래에서 간신히 잠든 애들을 확인하고 책을 덮을 때마다 ‘아, 그래도 아직 이만큼 남았네.’ 그 느낌을 감히 새벽에 초소에서 근무를 끝내고 돌아온 신병이 관물대에 숨겨놓은 건빵을 몇 개 집어 먹고 남은 건빵 봉지를 보며 느끼는 만족감에 비교하고 싶다. #Mac개발기 #악마잡스 #애플",
             user_id: 1,
             book_id: 8)

Book.create!(title: "C언어 펀더멘탈",
             image: "bookthumb.phinf.naver.net/cover/045/494/04549448.jpg",
             isbn: "8979145837 9788979145830",
             publisher: "한빛미디어",
             author: "전웅")

Post.create!(content: "카이사르는 '인간은 누구에게나 모든 게 다 보이는 것은 아니다. 많은 사람은 자기가 보고 싶어 하는 것밖에는 보지 않는다.'라는 말을 남겼다. 필자는 이 책을 읽으면서 동시에 hclc에 작가가 포스팅한 글들을 읽으면서 C를 공부했다. 양이 많아서 지루한 감이 없지는 않지만 (그만큼 작가는 hclc에서 굉장히 많은 활동을 했왔다.) 책을 읽으면서 놓쳤던 내용들을 hclc에 올라와 있는 질문/답변에서 또 다시 발견함으로서 중요한 내용을 되새길 수 있는 기회가 되기 때문에 좋은 공부방법이 되었다고 생각한다. 아직까지도 필자에게 C는 어려운 대상이다. 이런 이유로 솔직히 hclc의 기술적인 토론 내용 보다는 서로에 대해 감정이 섞인 공격적인 글들을 더 재미있게 읽었다. 특히 작가가 말이 안통하는 상대의 플레임성 발언에 더 이상 hclc에서의 활동을 관둔다는 선언은 클라이막스가 아니었나 싶다. 물론 작가 자신은 당시에 포스팅했던, 의욕이 넘치던 시절의 불필요하고 까다로운 논쟁들을 부끄럽다고 치부하고 있으나 필자가 책을 다 읽고나서 hclc에서의 논쟁들을 다시한번 살펴본 바, 실재로 잘못 알고 있는 내용을 마치 정답인양 자연스럽게 포스팅하고 있는 사람들이 많다는 것을 깨달을 수 있었다. 대부분의 사람들은 '어설프게 아는 것은 아예 모르는 것보다 위험하다'라는 견해를 가지고 자기 글에 태클을 거는 작가를 곱게 바라보지 못한다. 하지만 문제는 그들이 어설프게 알고 있는 것이 아니라 '거짓말'을 하고 있는데 있다. #전웅 #C #프로그래밍 #C99 #hclc #그립다hclc",
             user_id: 1,
             book_id: 9)

Book.create!(title: "C 프로그래머를 위한 C++",
             image: "bookthumb.phinf.naver.net/cover/000/533/00053397.jpg",
             isbn: "8979140827 9788979140828",
             publisher: "한빛미디어",
             author: "그레고리 새터")

Post.create!(content: "참으로 Oreilly스런 책이라고 할 수 있겠다. C를 충분히 익혔고 잘 활용하는 고급 독자를 대상으로 하고 있다는 점에서부터 특이하다. 이 책은 이런 독자들이 C++의 세계에 처음으로 발을 들여놨을 때 어려워할 만한 개념들을 잘 풀어내어 소개하고 있다. 사실 출판사 입장에서는 좀 더 많은 독자들이 책을 읽을 수 있도록 책의 수준을 되도록 낮추려는 경향이 있다. C++ 입문서 같은 경우에도 프로그래밍을 처음 시작하는 독자들까지 포용하기 위해 ‘C’ + ‘C++’ 형태로 출판되는 것이 일반적이다. 아쉽지만 이런 책을 읽을 때는 C++ 본질적인 내용이 C 입문서에 억지로 껴 맞춰진 듯한 느낌을 지울 수 없다. 그런 점에서 과감하게 기본적인 C의 내용은 잘라내어 독자층을 명확히 한 것은 참 Oreilly 아니랄까봐 혀를 내두르게 한다. #C #C++ #쿡북은아님 #적절한예제 #쉬운코드 #오래전절판",
             user_id: 1,
             book_id: 10)

User.create!(name:  "신해우",
             email: "b@b",
             password:              "tlsgodn",
             password_confirmation: "tlsgodn")

Book.create!(title: "마당을 나온 암탉",
             image: "bookthumb.phinf.naver.net/cover/001/597/00159722.jpg",
             isbn: "8971968710 9788971968710",
             publisher: "사계절",
             author: "황선미")

Post.create!(content: "교과서에도 실리고 애니메이션으로도 만들어진 이야기입니다. 꿈을 이루기 위해서 최선을 다해야겠다는 생각을 하게되었어요. #잎싹 #꿈은이루어진다",
             user_id: 2,
             book_id: 11)

Book.create!(title: "새로 만든 먼나라 이웃나라 6 (온 가족이 함께 떠나는 가장 유익하고 재미있는 세계 역사문화 여행, 이탈리아)",
             image: "bookthumb.phinf.naver.net/cover/069/624/06962481.jpg",
             isbn: "8934958243 9788934958246",
             publisher: "김영사",
             author: "이원복")

Post.create!(content: "이 책을 읽고 로마와 피렌체를 다녀왔어요. 또 아이스크림 먹고 싶어요! #여행 #이탈리아 #로마",
             user_id: 2,
             book_id: 12)

User.create!(name:  "양재원",
             email: "c@c",
             password:              "didwodnjs",
             password_confirmation: "didwodnjs")

Post.create!(content: "신재훈 선생님이 추천해주신 책! 나도 이 책을 읽고 사춘기를 탈출해야겠어요! #귄터그라스 #영화도보고싶다 #좀이상해 #무슨생각으로이런책을쓴거야",
             user_id: 3,
             book_id: 1)

Book.create!(title: "뒤집어지는 영어 (영화로 배우는 영어)",
             image: "bookthumb.phinf.naver.net/cover/030/860/03086097.jpg",
             isbn: "8992280157 9788992280150",
             publisher: "세경",
             author: "안정효")

Post.create!(content: "안정효 선생님 책이라서 구입했어요. 영어 공부에 대해 다시 생각하는 기회를 갖게 되었습니다. 단순히 좋은 발음에만 매달리는 영어 공부가 아니라 어휘를 풍부하게 기초부터 다시 시작하는 영어 공부가 되어야겠습니다. #안정효 #영어공부 #어휘",
             user_id: 3,
             book_id: 13)
             
User.create!(name:  "최다영",
             email: "d@d",
             password:              "chlekdud",
             password_confirmation: "chlekdud")

Book.create!(title: "인조이 프라하 (2018,여행을 즐기는 가장 빠른 방법)",
             image: "bookthumb.phinf.naver.net/cover/137/184/13718492.jpg",
             isbn: "1161653929 9791161653921",
             publisher: "넥서스BOOKS",
             author: "문은정|김지선")

Post.create!(content: "프라하 겨울에 다녀왔는데 너무 좋았어요! #여행 #프라하 #프라하여행",
             user_id: 4,
             book_id: 14)
             