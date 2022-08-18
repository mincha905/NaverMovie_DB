--1조 영화 데이터.sql

--영화등급
create table tblGrade (
        seq number primary key,
        name varchar2(100) not null
);


--영화장르
create table tblGenre (  
        seq number primary key,
        genre varchar2(30) not null
);



--역할(1. 감독 2. 주연 3. 조연)
create table tblRole (
        seq number not null primary key,
        role varchar2(30) not null
        
);


--국가정보
CREATE TABLE tblCountry (
	seq NUMBER NOT NULL primary key,
	name VARCHAR2(30) NOT NULL

); 


--성별
CREATE TABLE tblGender (
	seq NUMBER NOT NULL primary key,
	gender VARCHAR2(30) NOT NULL
); 



--영화정보 테이블

create table tblMovie (
        seq number primary key,
        name varchar2(100) not null,
        dates date not null, 
        time number not null,
        gradeSeq number not null references tblGrade(seq)
);



--영화 평점
create table tblHit (
        mseq number references tblMovie(seq),
        rating number not null check(rating between 0 and 10),
        constraint tblHit_mSeq_pk primary key(mSeq)
);


--나이별 관람객 추이
create table tblAgeStats (
        mseq number not null primary key,
        teens number not null,
        twenties number not null,
        thirties number not null,
        fourties number not null,
        fifties number not null,

        constraint tblAgeStats_fk foreign key(mseq) references tblMovie(seq)
);


--성별 관람객 추이
create table tblGenderStats (
	seq number not null primary key,
	male number not null,
	female number not null,

    constraint tblGenderStats_fk foreign key(seq) references tblMovie(seq)
);


--국가 목록
CREATE TABLE tblClist (
    mSeq NUMBER NOT NULL references tblMovie(seq),
    cSeq NUMBER NOT NULL references tblCountry(seq),

    CONSTRAINT tblClist_seq_pk PRIMARY KEY(cSeq, mSeq)
); 


--전체영화장르

create table tblGlist (
	
	mseq number references tblMovie(seq),
    gseq number references tblMovieGenre(seq),
    constraint tblGlist_gmSeq_pk primary key(gSeq, mSeq)
    
);



--영화 관계자 기본 정보
create table tblInfo (
        seq number primary key,
        name varchar2(100) not null,
        cSeq number null references tblCountry(seq),
        birth date null,
        gSeq number null references tblGender(seq)
);


--전체 영화 관계자 목록
create table tblStaff (
    seq number primary key,
	mSeq number not null references tblMovie(seq),
	rSeq number not null references tblRole(seq),
    iSeq number not null references tblInfo(seq)
);

--시퀀스 객체생성
create sequence staffSeq;


--테스트 select
select * from tblMovie;
select * from tblGrade;
select * from tblGenre;
select * from tblHit;
select * from tblStaff;
select * from tblRole;
select * from tblClist;
select * from tblCountry;
select * from tblGender;
select * from tblInfo;




--데이터 insert

--영화 장르 
INSERT INTO tblGenre VALUES(1, '드라마');
INSERT INTO tblGenre VALUES(2, '판타지');
INSERT INTO tblGenre VALUES(3, '서부');
INSERT INTO tblGenre VALUES(4, '공포');
INSERT INTO tblGenre VALUES(5, '멜로/로맨스');
INSERT INTO tblGenre VALUES(6, '모험');
INSERT INTO tblGenre VALUES(7, '스릴러');
INSERT INTO tblGenre VALUES(8, '느와르');
INSERT INTO tblGenre VALUES(9, '컬트');
INSERT INTO tblGenre VALUES(10, '다큐멘터리');
INSERT INTO tblGenre VALUES(11, '코미디');
INSERT INTO tblGenre VALUES(12, '가족');
INSERT INTO tblGenre VALUES(13, '미스터리');
INSERT INTO tblGenre VALUES(14, '전쟁');
INSERT INTO tblGenre VALUES(15, '애니메이션');
INSERT INTO tblGenre VALUES(16, '범죄');
INSERT INTO tblGenre VALUES(17, '뮤지컬');
INSERT INTO tblGenre VALUES(18, 'SF');
INSERT INTO tblGenre VALUES(19, '액션');
INSERT INTO tblGenre VALUES(20, '무협');
INSERT INTO tblGenre VALUES(21, '에로');
INSERT INTO tblGenre VALUES(22, '서스펜스');
INSERT INTO tblGenre VALUES(23, '서사');
INSERT INTO tblGenre VALUES(24, '블랙코미디');
INSERT INTO tblGenre VALUES(25, '실험');
INSERT INTO tblGenre VALUES(26, '공연실황');

--성별
insert into tblGender values(1, '남자');
insert into tblGender values(2, '여자');


--영화등급
insert into tblGrade values (1, '전체 관람가');
insert into tblGrade values (2, '12세 관람가');
insert into tblGrade values (3, '15세 관람가');
insert into tblGrade values (4, '청소년 관람불가');
insert into tblGrade values (5, '제한상영가');
insert into tblGrade values (6, '등급보류');

select * from tblGrade;

--역할
insert into tblRole values (1, '감독');
insert into tblRole values (2, '주연');
insert into tblRole values (3, '조연');


--국가
INSERT INTO tblCountry VALUES(1, '가봉');
INSERT INTO tblCountry VALUES(2, '그레나다');
INSERT INTO tblCountry VALUES(3, '가나');
INSERT INTO tblCountry VALUES(4, '그린랜드');
INSERT INTO tblCountry VALUES(5, '기니');
INSERT INTO tblCountry VALUES(6, '과델로프');
INSERT INTO tblCountry VALUES(7, '그리스');
INSERT INTO tblCountry VALUES(8, '과테말라');
INSERT INTO tblCountry VALUES(9, '괌');
INSERT INTO tblCountry VALUES(10, '기니비사우');
INSERT INTO tblCountry VALUES(11, '가이아나');
INSERT INTO tblCountry VALUES(12, '국가불명');
INSERT INTO tblCountry VALUES(13, '네덜란드');
INSERT INTO tblCountry VALUES(14, '앤틸리스');
INSERT INTO tblCountry VALUES(15, '남극');
INSERT INTO tblCountry VALUES(16, '나미비아');
INSERT INTO tblCountry VALUES(17, '니제르');
INSERT INTO tblCountry VALUES(18, '노퍽 제도');
INSERT INTO tblCountry VALUES(19, '나이지리아');
INSERT INTO tblCountry VALUES(20, '니카라과');
INSERT INTO tblCountry VALUES(21, '네덜란드');
INSERT INTO tblCountry VALUES(22, '노르웨이');
INSERT INTO tblCountry VALUES(23, '네팔');
INSERT INTO tblCountry VALUES(24, '뉴질랜드');
INSERT INTO tblCountry VALUES(25, '남아프리카');
INSERT INTO tblCountry VALUES(26, '공화국');
INSERT INTO tblCountry VALUES(27, '독일');
INSERT INTO tblCountry VALUES(28, '독일(구 동독)');
INSERT INTO tblCountry VALUES(29, '독일(구 서독)');
INSERT INTO tblCountry VALUES(30, '덴마크');
INSERT INTO tblCountry VALUES(31, '도미니카');
INSERT INTO tblCountry VALUES(32, '도미니카 공화국');
INSERT INTO tblCountry VALUES(33, '대만');
INSERT INTO tblCountry VALUES(34, '구 라오스');
INSERT INTO tblCountry VALUES(35, '레바논');
INSERT INTO tblCountry VALUES(36, '라이베리아');
INSERT INTO tblCountry VALUES(37, '레소토');
INSERT INTO tblCountry VALUES(38, '리투아니아');
INSERT INTO tblCountry VALUES(39, '리투아니아(구 소련)');
INSERT INTO tblCountry VALUES(40, '룩셈부르크');
INSERT INTO tblCountry VALUES(41, '라트비아');
INSERT INTO tblCountry VALUES(42, '라트비아(구 소련)');
INSERT INTO tblCountry VALUES(43, '리비아');
INSERT INTO tblCountry VALUES(44, '아랍');
INSERT INTO tblCountry VALUES(45, '자마힐리아');
INSERT INTO tblCountry VALUES(46, '루마니아');
INSERT INTO tblCountry VALUES(47, '러시아 연방');
INSERT INTO tblCountry VALUES(48, '러시아(구 소련)');
INSERT INTO tblCountry VALUES(49, '모로코');
INSERT INTO tblCountry VALUES(50, '모나코');
INSERT INTO tblCountry VALUES(51, '몰도바');
INSERT INTO tblCountry VALUES(52, '마다가스카르');
INSERT INTO tblCountry VALUES(53, '마샬 제도');
INSERT INTO tblCountry VALUES(54, '마케도니아');
INSERT INTO tblCountry VALUES(55, '말리');
INSERT INTO tblCountry VALUES(56, '미얀마');
INSERT INTO tblCountry VALUES(57, '몽골');
INSERT INTO tblCountry VALUES(58, '마카오');
INSERT INTO tblCountry VALUES(59, '마띠니끄');
INSERT INTO tblCountry VALUES(60, '모리타니');
INSERT INTO tblCountry VALUES(61, '몰타');
INSERT INTO tblCountry VALUES(62, '모리셔스');
INSERT INTO tblCountry VALUES(63, '몰디브');
INSERT INTO tblCountry VALUES(64, '말라위');
INSERT INTO tblCountry VALUES(65, '멕시코');
INSERT INTO tblCountry VALUES(66, '말레이지아');
INSERT INTO tblCountry VALUES(67, '모잠비크');
INSERT INTO tblCountry VALUES(68, '미국');
INSERT INTO tblCountry VALUES(69, '메이요트');
INSERT INTO tblCountry VALUES(70, '보스니아');
INSERT INTO tblCountry VALUES(71, '방글라데시');
INSERT INTO tblCountry VALUES(72, '벨기에');
INSERT INTO tblCountry VALUES(73, '부르키나파소');
INSERT INTO tblCountry VALUES(74, '불가리아');
INSERT INTO tblCountry VALUES(75, '바레인');
INSERT INTO tblCountry VALUES(76, '베닌');
INSERT INTO tblCountry VALUES(77, '버뮤다');
INSERT INTO tblCountry VALUES(78, '브루나이 다루살람');
INSERT INTO tblCountry VALUES(79, '볼리비아');
INSERT INTO tblCountry VALUES(80, '브라질');
INSERT INTO tblCountry VALUES(81, '바하마');
INSERT INTO tblCountry VALUES(82, '부탄');
INSERT INTO tblCountry VALUES(83, '보츠와나');
INSERT INTO tblCountry VALUES(84, '벨라루스');
INSERT INTO tblCountry VALUES(85, '벨라루스(구 소련)');
INSERT INTO tblCountry VALUES(86, '북한');
INSERT INTO tblCountry VALUES(87, '베네수엘라');
INSERT INTO tblCountry VALUES(88, '버진아일랜드');
INSERT INTO tblCountry VALUES(89, '베트남');
INSERT INTO tblCountry VALUES(90, '바누아투');
INSERT INTO tblCountry VALUES(91, '스위스');
INSERT INTO tblCountry VALUES(92, '서 사하라');
INSERT INTO tblCountry VALUES(93, '스페인');
INSERT INTO tblCountry VALUES(94, '스리랑카');
INSERT INTO tblCountry VALUES(95, '사우디아라비아');
INSERT INTO tblCountry VALUES(96, '솔로몬 제도');
INSERT INTO tblCountry VALUES(97, '수단');
INSERT INTO tblCountry VALUES(98, '스웨덴');
INSERT INTO tblCountry VALUES(99, '싱가포르');
INSERT INTO tblCountry VALUES(100, '슬로베니아');
INSERT INTO tblCountry VALUES(101, '슬로바키아');
INSERT INTO tblCountry VALUES(102, '시에라 레온');
INSERT INTO tblCountry VALUES(103, '세네갈');
INSERT INTO tblCountry VALUES(104, '소말리아');
INSERT INTO tblCountry VALUES(105, '수리남');
INSERT INTO tblCountry VALUES(106, '시리아');
INSERT INTO tblCountry VALUES(107, '스와질란드');
INSERT INTO tblCountry VALUES(108, '사모아');
INSERT INTO tblCountry VALUES(109, '앤도라');
INSERT INTO tblCountry VALUES(110, '아랍 에미레이트 연합');
INSERT INTO tblCountry VALUES(111, '아프가니스탄');
INSERT INTO tblCountry VALUES(112, '알바니아');
INSERT INTO tblCountry VALUES(113, '아르메니아');
INSERT INTO tblCountry VALUES(114, '아르메니아(구 소련)');
INSERT INTO tblCountry VALUES(115, '앙골라');
INSERT INTO tblCountry VALUES(116, '아르헨티나');
INSERT INTO tblCountry VALUES(117, '오스트리아');
INSERT INTO tblCountry VALUES(118, '오스트레일리아');
INSERT INTO tblCountry VALUES(119, '아루바');
INSERT INTO tblCountry VALUES(120, '아제르바이잔');
INSERT INTO tblCountry VALUES(121, '알제리');
INSERT INTO tblCountry VALUES(122, '에콰도르');
INSERT INTO tblCountry VALUES(123, '에스토니아');
INSERT INTO tblCountry VALUES(124, '에스토니아(구 소련)');
INSERT INTO tblCountry VALUES(125, '이집트');
INSERT INTO tblCountry VALUES(126, '에티오피아');
INSERT INTO tblCountry VALUES(127, '영국');
INSERT INTO tblCountry VALUES(128, '온두라스');
INSERT INTO tblCountry VALUES(129, '아이티');
INSERT INTO tblCountry VALUES(130, '인도네시아');
INSERT INTO tblCountry VALUES(131, '아일랜드');
INSERT INTO tblCountry VALUES(132, '이스라엘');
INSERT INTO tblCountry VALUES(133, '인도');
INSERT INTO tblCountry VALUES(134, '이라크');
INSERT INTO tblCountry VALUES(135, '이란');
INSERT INTO tblCountry VALUES(136, '아이슬란드');
INSERT INTO tblCountry VALUES(137, '이탈리아');
INSERT INTO tblCountry VALUES(138, '요르단');
INSERT INTO tblCountry VALUES(139, '일본');
INSERT INTO tblCountry VALUES(140, '오만');
INSERT INTO tblCountry VALUES(141, '엘살바도르');
INSERT INTO tblCountry VALUES(142, '우크라이나');
INSERT INTO tblCountry VALUES(143, '우간다');
INSERT INTO tblCountry VALUES(144, '우루과이');
INSERT INTO tblCountry VALUES(145, '우즈베키스탄');
INSERT INTO tblCountry VALUES(146, '예멘');
INSERT INTO tblCountry VALUES(147, '유고슬라비아');
INSERT INTO tblCountry VALUES(148, '중국');
INSERT INTO tblCountry VALUES(149, '조지아');
INSERT INTO tblCountry VALUES(150, '자메이카');
INSERT INTO tblCountry VALUES(151, '잠비아');
INSERT INTO tblCountry VALUES(152, '짐바브웨');
INSERT INTO tblCountry VALUES(153, '칠레');
INSERT INTO tblCountry VALUES(154, '체코');
INSERT INTO tblCountry VALUES(155, '체코(구 체코)');
INSERT INTO tblCountry VALUES(156, '채드');
INSERT INTO tblCountry VALUES(157, '캐나다');
INSERT INTO tblCountry VALUES(158, '콩고 민주 공화국');
INSERT INTO tblCountry VALUES(159, '콩고');
INSERT INTO tblCountry VALUES(160, '코트디부아르');
INSERT INTO tblCountry VALUES(161, '카메룬');
INSERT INTO tblCountry VALUES(162, '콜롬비아');
INSERT INTO tblCountry VALUES(163, '코스타리카');
INSERT INTO tblCountry VALUES(164, '쿠바');
INSERT INTO tblCountry VALUES(165, '카보베르데');
INSERT INTO tblCountry VALUES(166, '키프로스');
INSERT INTO tblCountry VALUES(167, '크로아티아');
INSERT INTO tblCountry VALUES(168, '케냐');
INSERT INTO tblCountry VALUES(169, '키르기스스탄');
INSERT INTO tblCountry VALUES(170, '캄보디아');
INSERT INTO tblCountry VALUES(171, '키리바시');
INSERT INTO tblCountry VALUES(172, '쿠웨이트');
INSERT INTO tblCountry VALUES(173, '카자흐스탄');
INSERT INTO tblCountry VALUES(174, '카자흐스탄(구 소련)');
INSERT INTO tblCountry VALUES(175, '카타르');
INSERT INTO tblCountry VALUES(176, '토고');
INSERT INTO tblCountry VALUES(177, '태국');
INSERT INTO tblCountry VALUES(178, '타지키스탄');
INSERT INTO tblCountry VALUES(179, '투르크메니스탄');
INSERT INTO tblCountry VALUES(180, '튀니지');
INSERT INTO tblCountry VALUES(181, '통가');
INSERT INTO tblCountry VALUES(182, '터키');
INSERT INTO tblCountry VALUES(183, '트리니다드 토바고');
INSERT INTO tblCountry VALUES(184, '탄자니아 합중국');
INSERT INTO tblCountry VALUES(185, '핀란드');
INSERT INTO tblCountry VALUES(186, '피지');
INSERT INTO tblCountry VALUES(187, '페어로우 제도');
INSERT INTO tblCountry VALUES(188, '프랑스');
INSERT INTO tblCountry VALUES(189, '파나마');
INSERT INTO tblCountry VALUES(190, '페루');
INSERT INTO tblCountry VALUES(191, '파푸아 뉴기니');
INSERT INTO tblCountry VALUES(192, '필리핀');
INSERT INTO tblCountry VALUES(193, '파키스탄');
INSERT INTO tblCountry VALUES(194, '폴란드');
INSERT INTO tblCountry VALUES(195, '폴란드(구 오스트리아)');
INSERT INTO tblCountry VALUES(196, '핏케언');
INSERT INTO tblCountry VALUES(197, '푸에르토리코');
INSERT INTO tblCountry VALUES(198, '포르투갈');
INSERT INTO tblCountry VALUES(199, '파라과이');
INSERT INTO tblCountry VALUES(200, '팔레스타인');
INSERT INTO tblCountry VALUES(201, '홍콩');
INSERT INTO tblCountry VALUES(202, '헝가리');
INSERT INTO tblCountry VALUES(203, '한국');
INSERT INTO tblCountry VALUES(204, '헝가리(구 오스트리아)');



-- 영화목록
insert into tblMovie values(1, '클라우스', '2019-11-15', 96, 1);
insert into tblMovie values(2, '그린 북', '2019-01-09', 130, 2);
insert into tblMovie values(3, '가버나움', '2019-01-24', 126, 3);
insert into tblMovie values(4, '밥정', '2020-10-07', 82, 1);
insert into tblMovie values(5, '장민호 드라마 최종회', '2022-01-24', 106, 1);
insert into tblMovie values(6, '디지몬 어드벤처 라스트 에볼루션 : 인연', '2021-02-17', 114, 2);
insert into tblMovie values(7, '베일리 어게인', '2018-11-22', 100, 1);
insert into tblMovie values(8, '원더', '2017-12-27', 113, 1);
insert into tblMovie values(9, '아일라', '2018-06-21', 123, 3);
insert into tblMovie values(10, '극장판 바이올렛 에버가든', '2020-11-12', 140, 1);
insert into tblMovie values(11, '먼 훗날 우리', '2018-04-28', 120, 3);
insert into tblMovie values(12, '당갈', '2018-04-25', 161, 2);
insert into tblMovie values(13, '포드 V 페라리', '2019-12-04', 152, 2);
insert into tblMovie values(14, '주전장', '2019-07-25', 121, 1);
insert into tblMovie values(15, '그대, 고맙소 : 김호중 생애 첫 팬미팅 무비', '2020-09-29', 80, 1);
insert into tblMovie values(16, '쇼생크 탈출', '1995-01-28', 142, 3);
insert into tblMovie values(17, '터미네이터 2:오리지널', '1991-07-06', 137, 3);
insert into tblMovie values(18, '덕구', '2018-04-05', 91, 1);
insert into tblMovie values(19, '클래식', '2003-01-30', 132, 2);
insert into tblMovie values(20, '나 홀로 집에', '1991-07-06', 105, 1);
insert into tblMovie values(21, '라이언 일병 구하기', '1998-09-12', 170, 3);
insert into tblMovie values(22, '월-E', '2008-08-06', 104, 1);
insert into tblMovie values(23, '빽 투 더 퓨쳐', '2015-10-21', 120, 2);
insert into tblMovie values(24, '보헤미안 랩소디', '2018-10-31', 134, 2);
insert into tblMovie values(25, '사운드오브뮤직', '1969-10-29', 172, 1);
insert into tblMovie values(26, '포레스트 검프', '2016-09-07', 142, 2);
insert into tblMovie values(27, '글래디에디터', '2000-06-03', 154, 3);
insert into tblMovie values(28, '타이타닉', '1998-08-20', 194, 3);
insert into tblMovie values(29, '위대한 쇼맨', '2017-12-20', 104, 2);
insert into tblMovie values(30, '인생은 아름다워', '1993-03-06', 116, 1);
insert into tblMovie values(31, '가나의 혼인잔치:언약', '2020-11-26', 73, 1);
insert into tblMovie values(32, '헬프', '2011-11-03', 146, 1);
insert into tblMovie values(33, '살인의 추억', '2003-04-25', 132, 3);
insert into tblMovie values(34, '매트릭스', '1999-05-15', 136, 2);
insert into tblMovie values(35, '센과 치히로의 행방불명', '2002-06-28', 126, 1);
insert into tblMovie values(36, '씽2게더', '2022-10-05', 110, 1);
insert into tblMovie values(37, '토이스토리 3', '2010-08-05', 102, 1);
insert into tblMovie values(38, '캐스트 어웨이', '2001-02-03', 143, 2);
insert into tblMovie values(39, '히든 피겨스', '2017-03-23', 127, 2);
insert into tblMovie values(40, '쉰들러 리스트', '1994-03-05', 196, 3);
insert into tblMovie values(41, '잭 스나이더의 저스티스 리그', '2021-03-18', 242, 2);
insert into tblMovie values(42, '태극권', '1993-11-20', 96, 3);
insert into tblMovie values(43, '집으로..', '2002/04/05', 87, 1);
insert into tblMovie values(44, '반지의 제왕: 왕의 귀환', '2003/12/17', 263, 2);
insert into tblMovie values(45, '헌터 킬러', '2018/12/06', 121, 3);
insert into tblMovie values(46, '죽은 시인의 사회', '1990/05/19', 128, 2);
insert into tblMovie values(47, '어벤져스: 엔드게임', '2019/04/24', 181, 2);
insert into tblMovie values(48, '레옹', '1995/02/18', 132, 4);
insert into tblMovie values(49, '알라딘', '2019/05/23', 128, 1);
insert into tblMovie values(50, '클레멘타인', '2004/05/21', 100, 3);



-- 영화 관계자 목록
insert into tblInfo values(1,	'서지오 파블로스',	null,	null,	null);
insert into tblInfo values(2,	'피터 패럴리',	68,	'1956-12-17',	1);
insert into tblInfo values(3,	'나딘 라바키',	35,	'1974-02-18',	1);
insert into tblInfo values(4,	'박혜령',	203,	null,	2);
insert into tblInfo values(5,	'타구치 토모히사',	139,	null,	1);
insert into tblInfo values(6,	'라세 할스트롬',	98,	'1964-06-02',	1);
insert into tblInfo values(7,	'스티븐 크보스키',	68,	'1970-01-25',	1);
insert into tblInfo values(8,	'잔 울카이',	182,	null,	1);
insert into tblInfo values(9,	'이시다테 타이치',	139,	null,	1);
insert into tblInfo values(10,	'유약영',	148,	'1970-06-01',	2);
insert into tblInfo values(11,	'니테쉬 티와리',	133,	null,	1);
insert into tblInfo values(12,	'제임스 맨골드',	68,	'1963-12-16',	1);
insert into tblInfo values(13,	'미키 데자키',	139,	null,	1);
insert into tblInfo values(14,	'오윤동',	203,	null,	1);
insert into tblInfo values(15,	'프랭크 다라본트',	188,	'1959-01-28',	1);
insert into tblInfo values(16,	'제임스 카메론',	157,	'1959-01-28',	1);
insert into tblInfo values(17,	'방수인',	203,	'1981-11-26',	1);
insert into tblInfo values(18,	'곽재용',	203,	'1959-05-22',	1);
insert into tblInfo values(19,	'크리스 콜럼버스',	68,	'1958-09-10',	1);
insert into tblInfo values(20,	'스티븐 스필버그',	68,	'1946-12-18',	1);
insert into tblInfo values(21,	'앤드류 스탠튼',	null,	'1965-12-03',	1);
insert into tblInfo values(22,	'로버트 저메키스',	68,	null,	1);
insert into tblInfo values(23,	'브라이언 싱어',	68,	'1965-09-17',	1);
insert into tblInfo values(24,	'로버트 와이즈',	68,	'1914-09-10',	1);
insert into tblInfo values(25,	'마이클 그레이시',	null,	null,	null);
insert into tblInfo values(26,	'로베트로 베니니',	137,	'1952-10-27',	1);
insert into tblInfo values(27,	'브렌트 밀러 주니어',	null,	null,	null);
insert into tblInfo values(28,	'테이트 테일러',	68,	'1969-06-03',	1);
insert into tblInfo values(29,	'리틀리 스콧',	127,	'1937-11-30',	1);
insert into tblInfo values(30,	'봉준호',	203,	'1969-09-14',	1);
insert into tblInfo values(31,	'릴리 워쇼스키',	68,	'1967-12-29',	1);
insert into tblInfo values(32,	'미야자키 하야오',	139,	'1941-01-05',	1);
insert into tblInfo values(33,	'가스 제닝스',	null,	null,	1);
insert into tblInfo values(34,	'리 언크리치',	null,	'1967-08-08',	1);
insert into tblInfo values(35,	'데오도르 델피',	null,	null,	1);
insert into tblInfo values(36,	'스티븐 스틸버그',	68,	'1946-12-18',	1);
insert into tblInfo values(37,	'잭 스나이더',	68,	'1966-03-01',	1);
insert into tblInfo values(38,	'원화평',	148,	'1945-01-01',	1);
insert into tblInfo values(39,	'이정향',	203,	'1964-04-13',	2);
insert into tblInfo values(40,	'피터 잭슨',	24,	'1961-10-31',	1);
insert into tblInfo values(41,	'도노반 마시',	68,	null,	1);
insert into tblInfo values(42,	'피터 위어',	118,	'1961-10-31',	1);
insert into tblInfo values(43,	'안소니 루소',	68,	'1970-02-03',	1);
insert into tblInfo values(44,	'조 루소',	68,	'1971-07-08',	1);
insert into tblInfo values(45,	'제이슨 슈왈츠먼',	68,	'1980-06-26',	1);
insert into tblInfo values(46,	'J.K. 시몬즈',	68,	'1955-01-09',	1);
insert into tblInfo values(47,	'라시다 존스',	68,	'1976-02-25',	2);
insert into tblInfo values(48,	'윌 사쏘',	157,	'1975-05-24',	1);
insert into tblInfo values(49,	'비코 모텐슨',	68,	'1958-10-20',	1);
insert into tblInfo values(50,	'마허샬라 알리',	68,	'1974-02-16',	1);
insert into tblInfo values(51,	'린다 카델리니',	68,	'1975-06-25',	2);
insert into tblInfo values(52,	'세바스찬 매니스캘코',	null,	null,	null);
insert into tblInfo values(53,	'요르다노스 시프로우',	null,	null,	2);
insert into tblInfo values(54,	'보르와티프 트레저 반콜',	null,	null,	null);
insert into tblInfo values(55,	'하이타 아이잠',	null,	null,	2);
insert into tblInfo values(56,	'자인 알 라피아',	106,	null,	1);
insert into tblInfo values(57,	'임지호',	203,	null,	1);
insert into tblInfo values(58,	'장민호',	203,	'1977-07-28',	1);
insert into tblInfo values(59,	'하나에 나츠키',	139,	'1991-06-26',	1);
insert into tblInfo values(60,	'호노야 요시마사',	139,	'1982-02-10',	null);
insert into tblInfo values(61,	'사카모토 치카',	139,	'1958-08-17',	2);
insert into tblInfo values(62,	'야마구치 마유미',	139,	'1975-05-12',	null);
insert into tblInfo values(63,	'조시 게드',	68,	'1981-02-23',	1);
insert into tblInfo values(64,	'데니스 궤이드',	68,	'1954-04-09',	1);
insert into tblInfo values(65,	'K.J.아파',	null,	null,	1);
insert into tblInfo values(66,	'브라이스 게이사르',	68,	'2004-12-22',	1);
insert into tblInfo values(67,	'제이톱 트렘블레이',	null,	'2006-10-05',	1);
insert into tblInfo values(68,	'줄리아 로버츠',	68,	'1967-10-28',	2);
insert into tblInfo values(69,	'오웬 윌슨',	68,	'1968-11-18',	1);
insert into tblInfo values(70,	'이자벨라 비도빅',	68,	'2001-05-27',	2);
insert into tblInfo values(71,	'김설',	203,	null,	2);
insert into tblInfo values(72,	'이스마일 하지오글루',	null,	null,	1);
insert into tblInfo values(73,	'셰킨 테킨도르',	182,	'1945-07-16',	1);
insert into tblInfo values(74,	'알리 아타이',	null,	'1976-01-01',	1);
insert into tblInfo values(75,	'뤽 베송',	188,	'1959-03-18',	1);
insert into tblInfo values(76,	'가이 리치',	127,	'1952-09-05',	1);
insert into tblInfo values(77,	'톈좡좡',	148,	null,	1);
insert into tblInfo values(78,	'쑤샤오밍',	null,	null,	2);
insert into tblInfo values(79,	'파티마 사나 셰이크',	null,	null,	null);
insert into tblInfo values(80,	'산야 말호트라',	null,	null,	null);
insert into tblInfo values(81,	'기리시 쿨카니',	null,	null,	1);
insert into tblInfo values(82,	'수하니 바트나가르',	null,	null,	null);
insert into tblInfo values(83,	'장광',	203,	null,	1);
insert into tblInfo values(84,	'손예진',	203,	null,	2);
insert into tblInfo values(85,	'조승우',	203,	null,	1);
insert into tblInfo values(86,	'조인성',	203,	null,	1);
insert into tblInfo values(87,	'서영인',	203,	null,	2);
insert into tblInfo values(88,	'이주은',	203,	null,	2);
insert into tblInfo values(89,	'이시카와 유이',	139,	'1989-05-30',	null);
insert into tblInfo values(90,	'나미카와 다이스케',	139,	'1976-04-02',	1);
insert into tblInfo values(91,	'정백연',	148,	'1989-04-19',	1);
insert into tblInfo values(92,	'주동우',	148,	'1992-01-31',	2);
insert into tblInfo values(93,	'시여비',	148,	'1986-06-05',	null);
insert into tblInfo values(94,	'아미르 칸',	133,	'1965-03-14',	1);
insert into tblInfo values(95,	'사크시 탄와르',	133,	'1973-01-12',	2);
insert into tblInfo values(96,	'자이라 와심',	null,	'2000-10-23',	2);
insert into tblInfo values(97,	'맷 데이먼',	68,	'1970-10-08',	1);
insert into tblInfo values(98,	'크리스찬 베일',	null,	'1974-01-30',	1);
insert into tblInfo values(99,	'케이트리오나 발피',	null,	'1979-10-04',	2);
insert into tblInfo values(100,	'존 번탈',	68,	'1976-09-20',	1);
insert into tblInfo values(101,	'트레이시 레츠',	null,	'1965-07-04',	1);
insert into tblInfo values(102,	'조쉬 루카스',	68,	'1971-06-20',	1);
insert into tblInfo values(103,	'노아 주프',	null,	'2005-02-25',	1);
insert into tblInfo values(104,	'JJ페일드',	null,	'1978-04-01',	1);
insert into tblInfo values(105,	'레이 맥키넌',	null,	'1957-11-15',	1);
insert into tblInfo values(106,	'이안 하딩',	null,	'1986-09-16',	1);
insert into tblInfo values(107,	'조나단 라파글리아',	118,	'1969-08-31',	1);
insert into tblInfo values(108,	'잭 맥멀린',	null,	'1991-02-22',	null);
insert into tblInfo values(109,	'김호중',	203,	'1991-10-02',	1);
insert into tblInfo values(110,	'팀 로빈스',	68,	'1958-10-16',	1);
insert into tblInfo values(111,	'모건 프리먼',	68,	'1937-06-01',	1);
insert into tblInfo values(112,	'밥 건튼',	68,	'1945-11-15',	1);
insert into tblInfo values(113,	'윌리암 새들러',	null,	'1950-04-13',	1);
insert into tblInfo values(114,	'클랜시 브라운',	68,	'1959-01-05',	1);
insert into tblInfo values(115,	'길 벨로우스',	157,	'1967-06-28',	1);
insert into tblInfo values(116,	'마크 롤스톤',	68,	'1956-12-07',	1);
insert into tblInfo values(117,	'아놀드 슈왈제네거',	117,	'1947-07-30',	1);
insert into tblInfo values(118,	'린다 해밀턴',	null,	'1956-09-26',	2);
insert into tblInfo values(119,	'에드워드 펄롱',	68,	'1977-08-02',	2);
insert into tblInfo values(120,	'로버트 패트릭',	68,	'1958-11-05',	1);
insert into tblInfo values(121,	'조 모튼',	68,	'1947-10-18',	1);
insert into tblInfo values(122,	'얼 보엔',	68,	'1945-11-07',	1);
insert into tblInfo values(123,	'이순재',	203,	'1935-10-10',	1);
insert into tblInfo values(124,	'정지훈',	203,	'2007-05-31',	1);
insert into tblInfo values(125,	'성병숙',	203,	'1955-01-20',	2);
insert into tblInfo values(126,	'차순배',	203,	'1972-10-23',	1);
insert into tblInfo values(127,	'박지윤',	203,	'2012-02-27',	2);
insert into tblInfo values(128,	'체리쉬마닝앗',	null,	'1985-02-28',	2);
insert into tblInfo values(129,	'김광식',	203,	'1971-07-30',	1);
insert into tblInfo values(130,	'이기우',	203,	'1981-10-23',	1);
insert into tblInfo values(131,	'양현태',	203,	'1979-06-26',	1);
insert into tblInfo values(132,	'맥컬리 컬킨 ',	68,	'1980-08-26',	1);
insert into tblInfo values(133,	'조 페시 ',	68,	'1943-02-09',	1);
insert into tblInfo values(134,	'다니엘 스턴 ',	null,	'1957-08-28',	1);
insert into tblInfo values(135,	'안델라 고덜즈',	68,	'1977-05-20',	null);
insert into tblInfo values(136,	'톰 행크스',	68,	'1956-07-09',	1);
insert into tblInfo values(137,	'에드워드 번즈',	68,	'1968-01-29',	1);
insert into tblInfo values(138,	'제레미 데이비스',	68,	'1969-10-08',	1);
insert into tblInfo values(139,	'지오바니 리비시',	68,	'1974-12-17',	1);
insert into tblInfo values(140,	'벤 버트',	null,	'1948-07-12',	1);
insert into tblInfo values(141,	'엘리사 나이트',	null,	'1975-04-15',	2);
insert into tblInfo values(142,	'제프 갈린',	68,	'1962-06-05',	1);
insert into tblInfo values(143,	'시고니 위버',	68,	'1949-10-08',	2);
insert into tblInfo values(144,	'마이클 J. 폭스',	157,	'1961-06-09',	1);
insert into tblInfo values(145,	'크리스토퍼 로이드',	68,	'1938-10-22',	1);
insert into tblInfo values(146,	'크리스핀 글로버',	68,	'1964-04-20',	null);
insert into tblInfo values(147,	'마크 맥클루어',	68,	'1967-03-31',	null);
insert into tblInfo values(148,	'라미 말렉',	68,	'1981-05-12',	1);
insert into tblInfo values(149,	'루시 보인턴',	127,	null,	2);
insert into tblInfo values(150,	'귈림 리',	127,	'1983-11-24',	1);
insert into tblInfo values(151,	'조셉 마젤로',	68,	'1983-09-21',	1);
insert into tblInfo values(152,	'쥴리 앤드류스',	127,	'1935-10-01',	2);
insert into tblInfo values(153,	'엘레노 파커',	68,	'1922-06-27',	2);
insert into tblInfo values(154,	'크리스토퍼 플러머',	157,	'1929-12-13',	1);
insert into tblInfo values(155,	'페기우드',	68,	'1892-02-09',	null);
insert into tblInfo values(156,	'로빈 라이트',	68,	'1966-04-08',	2);
insert into tblInfo values(157,	'게리 시나이즈',	68,	'1955-03-17',	1);
insert into tblInfo values(158,	'미켈이 윌리암스',	null,	'1957-03-04',	null);
insert into tblInfo values(159,	'러셀 크로우',	24,	'1964-04-07',	1);
insert into tblInfo values(160,	'호아킨 피닉스',	68,	'1974-10-28',	1);
insert into tblInfo values(161,	'코니 닐슨',	30,	'1956-07-03',	2);
insert into tblInfo values(162,	'올리버 리드',	127,	'1938-02-13',	1);
insert into tblInfo values(163,	'레오나르도 디카프리오',	68,	'1974-11-01',	1);
insert into tblInfo values(164,	'케이트 원슬렛',	127,	'1975-10-05',	2);
insert into tblInfo values(165,	'빌리제인',	68,	'1966-02-24',	2);
insert into tblInfo values(166,	'케시 베이츠',	68,	'1948-06-28',	2);
insert into tblInfo values(167,	'휴잭맨',	118,	'1968-10-12',	1);
insert into tblInfo values(168,	'잭 에프론',	68,	'1987-10-18',	1);
insert into tblInfo values(169,	'미셸 윌리엄스',	68,	'1980-09-09',	2);
insert into tblInfo values(170,	'젠데이아 콜먼',	68,	'1996-09-01',	1);
insert into tblInfo values(171,	'로베르토 베니니',	137,	'1952-10-27',	1);
insert into tblInfo values(172,	'니콜레타 브라스키',	137,	'1960-04-19',	2);
insert into tblInfo values(173,	'조르지오 깐따리니',	137,	'1992-04-12',	null);
insert into tblInfo values(174,	'마리사 파레데스',	93,	'1946-04-23',	2);
insert into tblInfo values(175,	'션 알다란',	null,	null,	1);
insert into tblInfo values(176,	'잭 힙스',	null,	null,	1);
insert into tblInfo values(177,	'젬마 리주토',	null,	null,	2);
insert into tblInfo values(178,	'케빈 헤이어',	null,	null,	1);
insert into tblInfo values(179,	'엠마스톤',	68,	'1988-11-06',	2);
insert into tblInfo values(180,	'비올라 데이비스',	68,	'1965-08-11',	2);
insert into tblInfo values(181,	'옥티비아 스펜서',	68,	'1970-05-25',	2);
insert into tblInfo values(182,	'브라이듯 달라스 하워드',	68,	'1981-03-02',	2);
insert into tblInfo values(183,	'송강호',	203,	'1967-01-17',	1);
insert into tblInfo values(184,	'김상경',	203,	null,	1);
insert into tblInfo values(185,	'김뢰하',	203,	'1965-11-15',	1);
insert into tblInfo values(186,	'송재호',	203,	'1939-03-10',	1);
insert into tblInfo values(187,	'키아누 리브스',	35,	'1964-09-02',	1);
insert into tblInfo values(188,	'로렌스 피시번',	68,	'1961-07-30',	1);
insert into tblInfo values(189,	'캐리 앤 모스',	157,	'1967-08-21',	2);
insert into tblInfo values(190,	'휴고 위빙',	19,	'1960-04-04',	1);
insert into tblInfo values(191,	'히이라기 루미',	139,	'1964-09-02',	2);
insert into tblInfo values(192,	'이리노 미유',	139,	'1988-02-19',	1);
insert into tblInfo values(193,	'나츠키 마리',	139,	'1952-05-02',	2);
insert into tblInfo values(194,	'나이토 타카시',	139,	'1955-05-27',	1);
insert into tblInfo values(195,	'메  맥커너히',	68,	'1969-11-04',	1);
insert into tblInfo values(196,	'리즈 위더스푼',	68,	'1976-03-22',	2);
insert into tblInfo values(197,	'스칼릿 조핸슨',	68,	'1984-11-22',	2);
insert into tblInfo values(198,	'태런 애저튼',	127,	'1989-11-10',	1);
insert into tblInfo values(199,	'팀 알렌',	68,	'1953-06-13',	1);
insert into tblInfo values(200,	'조안 쿠삭',	68,	'1962-10-11',	2);
insert into tblInfo values(201,	'네드 비티',	127,	'1937-07-06',	1);
insert into tblInfo values(202,	'헬렌 헌트',	68,	'1963-06-15',	2);
insert into tblInfo values(203,	'타라지 P.헨슨',	68,	'1970-09-11',	2);
insert into tblInfo values(204,	'옥타비아 스펜서',	68,	'1970-05-25',	2);
insert into tblInfo values(205,	'자넬 모네',	68,	'1985-12-01',	2);
insert into tblInfo values(206,	'케빈 코스트너',	68,	'1955-01-18',	1);
insert into tblInfo values(207,	'닉 서시',	null,	'1959-03-07',	1);
insert into tblInfo values(208,	'리암 니슨',	127,	'1952-06-07',	1);
insert into tblInfo values(209,	'벤 킹슬리',	127,	'1943-12-31',	1);
insert into tblInfo values(210,	'랄프 파인즈',	127,	'1962-12-22',	1);
insert into tblInfo values(211,	'캐롤라인 구덜',	127,	'1959-11-13',	2);
insert into tblInfo values(212,	'벤 애플렉',	68,	'1972-08-15',	1);
insert into tblInfo values(213,	'갤 가돗',	132,	'1985-04-30',	2);
insert into tblInfo values(214,	'제이슨 모모아',	68,	'1979-08-01',	1);
insert into tblInfo values(215,	'이연걸',	148,	'1963-04-26',	1);
insert into tblInfo values(216,	'전소호',	148,	'1963-01-26',	1);
insert into tblInfo values(217,	'원결영',	148,	'1969-09-15',	2);
insert into tblInfo values(218,	'양자경',	148,	'1962-08-06',	2);
insert into tblInfo values(219,	'헨리 카빌',	null,	'1983-05-05',	1);
insert into tblInfo values(220,	'김을분',	203,	null,	2);
insert into tblInfo values(221,	'유승호',	203,	'1993-08-17',	1);
insert into tblInfo values(222,	'일라이저 우드',	68,	'1981-01-28',	1);
insert into tblInfo values(223,	'숀 애스틴',	68,	'1971-02-25',	1);
insert into tblInfo values(224,	'앤디 서키스',	127,	'1964-04-20',	1);
insert into tblInfo values(225,	'이안 맥켈런',	127,	'1939-05-25',	1);
insert into tblInfo values(226,	'제라드 버틀러',	127,	'1969-11-13',	1);
insert into tblInfo values(227,	'커먼',	68,	'1972-03-13',	1);
insert into tblInfo values(228,	'제인 홀츠',	157,	'1987-01-18',	1);
insert into tblInfo values(229,	'게리 올드만',	127,	'1958-03-21',	1);
insert into tblInfo values(230,	'로빈 윌리엄스',	68,	'1951-07-21',	1);
insert into tblInfo values(231,	'에단 호크',	68,	'1970-11-06',	1);
insert into tblInfo values(232,	'로버트 숀 레오나드',	68,	'1969-02-28',	1);
insert into tblInfo values(233,	'조쉬 찰스',	68,	'1971-09-15',	1);
insert into tblInfo values(234,	'로버트 다우니 주니어',	68,	'1965-04-04',	1);
insert into tblInfo values(235,	'크리스 에반스',	68,	'1981-06-13',	1);
insert into tblInfo values(236,	'스칼렛 조한슨',	68,	'1984-11-22',	2);
insert into tblInfo values(237,	'크리스 헴스워스',	118,	'1983-08-11',	1);
insert into tblInfo values(238,	'나탈리 포트만',	132,	'1981-06-09',	2);
insert into tblInfo values(239,	'대니 에일로',	68,	'1933-06-20',	1);
insert into tblInfo values(240,	'메나 마수드',	125,	'1991-09-17',	1);
insert into tblInfo values(241,	'윌 스미스',	68,	'1968-09-25',	1);
insert into tblInfo values(242,	'나오미 스콧',	127,	'1993-05-06',	2);
insert into tblInfo values(243,	'마르완 켄자리',	13,	'1983-01-16',	1);
insert into tblInfo values(244,	'장 르노',	null,	'1948-07-30',	1);
insert into tblInfo values(245,	'이동준',	203,	'1956-10-13',	1);
insert into tblInfo values(246,	'스티브 시걸',	68,	'1952-04-10',	1);
insert into tblInfo values(247,	'김혜리',	203,	null,	2);
insert into tblInfo values(248,	'임혁필',	203,	'1972-03-03',	1);
insert into tblInfo values(249, '김두영', 203, '1952-09-05', 1);


-- 전체 영화 관계자 목록
-- 1 ~ 8
insert into tblStaff values (staffSeq.nextVal, 1, 1, 1);
insert into tblStaff values (staffSeq.nextVal, 1, 2, 45);
insert into tblStaff values (staffSeq.nextVal, 1, 2, 47);
insert into tblStaff  values (staffSeq.nextVal, 1, 3, 48);
insert into tblStaff  values (staffSeq.nextVal, 1, 3, 200);
insert into tblStaff  values (staffSeq.nextVal, 2, 1, 2);
insert into tblStaff  values (staffSeq.nextVal, 2, 2, 50);
insert into tblStaff  values (staffSeq.nextVal, 2, 3, 51);
insert into tblStaff  values (staffSeq.nextVal, 2, 3, 52);
insert into tblStaff  values (staffSeq.nextVal, 3, 1, 3);
insert into tblStaff  values (staffSeq.nextVal, 3, 2, 53);
insert into tblStaff  values (staffSeq.nextVal, 3, 2, 56);
insert into tblStaff  values (staffSeq.nextVal, 3, 3, 3);
insert into tblStaff  values (staffSeq.nextVal, 3, 3, 55);
insert into tblStaff  values (staffSeq.nextVal, 4, 1, 4);
insert into tblStaff  values (staffSeq.nextVal, 4, 2, 57);
insert into tblStaff  values (staffSeq.nextVal, 5, 2, 58);
insert into tblStaff  values (staffSeq.nextVal, 6, 1, 5);
insert into tblStaff  values (staffSeq.nextVal, 6, 2, 61);
insert into tblStaff  values (staffSeq.nextVal, 6, 2, 62);
insert into tblStaff  values (staffSeq.nextVal, 6, 2, 59);
insert into tblStaff  values (staffSeq.nextVal, 7, 1, 6);
insert into tblStaff  values (staffSeq.nextVal, 7, 2, 63);
insert into tblStaff  values (staffSeq.nextVal, 7, 2, 66);
insert into tblStaff  values (staffSeq.nextVal, 8, 1, 7);
insert into tblStaff  values (staffSeq.nextVal, 8, 2, 68);
insert into tblStaff  values (staffSeq.nextVal, 8, 2, 70);
insert into tblStaff  values (staffSeq.nextVal, 8, 2, 69);
insert into tblStaff  values (staffSeq.nextVal, 8, 3, 66);
insert into tblStaff  values (staffSeq.nextVal, 8, 3, 103);

-- 9~16
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 9, 1, 8);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 9, 2, 71);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 9, 2, 72);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 9, 3, 73);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 9, 3, 74);

INSERT INTO tblStaff VALUES (staffSeq.nextVal, 10, 1, 9);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 10, 2, 89);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 10, 2, 90);

INSERT INTO tblStaff VALUES (staffSeq.nextVal, 11, 1, 10);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 11, 2, 91);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 11, 2, 92);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 11, 2, 77);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 11, 3, 78);

INSERT INTO tblStaff VALUES (staffSeq.nextVal, 12, 1, 11);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 12, 2, 94);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 12, 2, 79);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 12, 2, 80);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 12, 3, 95);

INSERT INTO tblStaff VALUES (staffSeq.nextVal, 13, 1, 12);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 13, 2, 97);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 13, 2, 98);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 13, 3, 99);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 13, 3, 100);

INSERT INTO tblStaff VALUES (staffSeq.nextVal, 14, 1, 13);

INSERT INTO tblStaff VALUES (staffSeq.nextVal, 15, 1, 14);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 15, 2, 109);

INSERT INTO tblStaff VALUES (staffSeq.nextVal, 16, 1, 15);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 16, 2, 110);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 16, 2, 111);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 16, 3, 112);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 16, 3, 113);

--17
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 17,1,16);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 17,2,117);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 17,3,118);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 17,3,119);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 17,3,120);



-- 18
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 18,1,17);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 18,2,123);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 18,2,124);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 18,3,125);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 18,3,126);


--19
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 19,1,18);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 19,2,84);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 19,2,85);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 19,3,86);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 19,3,87);


--20
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 20,1,19);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 20,2,132);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 20,2,133);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 20,2,134);


--21
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 21,1,20);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 21,2,136);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 21,2,137);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 21,2,138);


--22
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 22,1,21);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 22,2,140);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 22,2,141);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 22,2,142);



--23
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 23,1,22);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 23,2,144);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 23,2,145);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 23,2,146);



--24
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 24,1,23);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 24,2,148);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 24,2,149);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 24,2,150);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 24,2,151);


--25
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 25,1,25);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 25,2,152);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 25,2,153);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 25,2,154);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 25,2,155);




-- 26
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 26,1,26);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 26,2,151); 
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 26,3,156);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 26,3,157);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 26,3,158);


--27
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 27,1,27);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 27,2,159);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 27,2,160);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 27,2,161);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 27,2,162);


--28
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 28,1,28);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 28,2,163);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 28,2,164);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 28,2,165);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 38,3,166);




--29
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 29,1,29);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 29,2,167);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 29,2,168);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 29,2,169);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 29,3,170);



--30
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 30,1,30);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 30,2,171);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 30,2,172);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 30,3,173);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 30,3,174);


--31
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 31,1,31);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 31,2,175);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 31,2,176);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 31,2,177);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 31,2,178);


--32
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 32,1,32);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 32,2,179);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 32,2,180);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 32,2,181);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 32,2,182);


--33
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 33, 1, 28);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 33, 2, 179);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 33, 2, 180);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 33, 2, 204);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 33, 2, 182);


--34
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 34, 1, 31);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 34, 1, 31);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 34, 2, 188);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 34, 2, 187);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 34, 3, 189);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 34, 3, 190);

--35
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 35, 1, 32);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 35, 2, 191);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 35, 2, 192);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 35, 3, 193);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 35, 3, 194);

--36
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 36, 1, 33);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 36, 2, 195);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 36, 2, 196);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 36, 2, 197);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 36, 2, 198);


--37
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 37, 1, 34);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 37, 2, 136);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 37, 2, 199);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 37, 2, 200);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 37, 3, 201);

--38
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 38, 1, 22);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 38, 2, 136);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 38, 2, 202);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 38, 3, 207);


--39
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 39, 1, 35);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 39, 2, 203);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 39, 2, 204);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 39, 2, 205);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 39, 3, 206);


--40
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 40, 1, 20);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 40, 2, 208);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 40, 3, 209);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 40, 3, 210);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 40, 3, 211);


--41
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 41, 1, 37);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 41, 2, 212);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 41, 2, 213);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 41, 2, 214);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 41, 2, 219);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 41, 3, 37);
INSERT INTO tblStaff VALUES (staffSeq.nextVal, 41, 3, 37);


--42-50
--42
insert into tblStaff values  (staffSeq.nextVal, 42, 1, 38);
insert into tblStaff values  (staffSeq.nextVal, 42, 2, 215);
insert into tblStaff values  (staffSeq.nextVal, 42, 2, 216);
insert into tblStaff values  (staffSeq.nextVal, 42, 2, 217);
insert into tblStaff values  (staffSeq.nextVal, 42, 2, 218);

--43
insert into tblStaff values  (staffSeq.nextVal, 43, 1, 39);
insert into tblStaff values  (staffSeq.nextVal, 43, 2, 220);
insert into tblStaff values  (staffSeq.nextVal, 43, 2, 221);


--44
insert into tblStaff values  (staffSeq.nextVal, 44, 1, 40);
insert into tblStaff values  (staffSeq.nextVal, 44, 2, 222);
insert into tblStaff values  (staffSeq.nextVal, 44, 2, 223);
insert into tblStaff values  (staffSeq.nextVal, 44, 2, 224);
insert into tblStaff values  (staffSeq.nextVal, 44, 2, 225);


--45
insert into tblStaff values  (staffSeq.nextVal, 45, 1, 41);
insert into tblStaff values  (staffSeq.nextVal, 45, 2, 226);
insert into tblStaff values  (staffSeq.nextVal, 45, 3, 227);
insert into tblStaff values  (staffSeq.nextVal, 45, 3, 228);
insert into tblStaff values  (staffSeq.nextVal, 45, 2, 229);

--46
insert into tblStaff values  (staffSeq.nextVal, 46, 1, 42);
insert into tblStaff values  (staffSeq.nextVal, 46, 2, 230);
insert into tblStaff values  (staffSeq.nextVal, 46, 3, 231);
insert into tblStaff values  (staffSeq.nextVal, 46, 3, 232);
insert into tblStaff values  (staffSeq.nextVal, 46, 3, 233);


--47
insert into tblStaff values  (staffSeq.nextVal, 47, 1, 43);
insert into tblStaff values  (staffSeq.nextVal, 47, 1, 44);
insert into tblStaff values  (staffSeq.nextVal, 47, 2, 234);
insert into tblStaff values  (staffSeq.nextVal, 47, 2, 235);
insert into tblStaff values  (staffSeq.nextVal, 47, 2, 236);
insert into tblStaff values  (staffSeq.nextVal, 47, 2, 237);

--48
insert into tblStaff values  (staffSeq.nextVal, 48, 1, 75);
insert into tblStaff values  (staffSeq.nextVal, 48, 2, 244);
insert into tblStaff values  (staffSeq.nextVal, 48, 2, 238);
insert into tblStaff values  (staffSeq.nextVal, 48, 3, 229);
insert into tblStaff values  (staffSeq.nextVal, 48, 3, 239);

--49
insert into tblStaff values  (staffSeq.nextVal, 49, 1, 76);
insert into tblStaff values  (staffSeq.nextVal, 49, 2, 240);
insert into tblStaff values  (staffSeq.nextVal, 49, 2, 241);
insert into tblStaff values  (staffSeq.nextVal, 49, 2, 242);
insert into tblStaff values  (staffSeq.nextVal, 49, 3, 243);


--50
insert into tblStaff values  (staffSeq.nextVal, 50, 1, 249);
insert into tblStaff values  (staffSeq.nextVal, 50, 2, 245);
insert into tblStaff values  (staffSeq.nextVal, 50, 2, 246);
insert into tblStaff values  (staffSeq.nextVal, 50, 3, 247);
insert into tblStaff values  (staffSeq.nextVal, 50, 3, 248);


--나이별 관람객 추이
INSERT INTO tblAgeStats VALUES(2,0,30,29,17,23);
INSERT INTO tblAgeStats VALUES(3,2,37,29,15,17);
INSERT INTO tblAgeStats VALUES(4,5,35,25,15,20);
INSERT INTO tblAgeStats VALUES(5,0,0,11,44,44);
INSERT INTO tblAgeStats VALUES(7,3,48,23,19,7);
INSERT INTO tblAgeStats VALUES(8,2,34,27,29,8);
INSERT INTO tblAgeStats VALUES(9,0,47,27,17,9);
INSERT INTO tblAgeStats VALUES(10,17,56,17,8,2);
INSERT INTO tblAgeStats VALUES(12,6,61,18,8,7);
INSERT INTO tblAgeStats VALUES(13,2,38,34,18,7);
INSERT INTO tblAgeStats VALUES(14,3,33,34,19,11);
INSERT INTO tblAgeStats VALUES(16,0,82,12,6,0);
INSERT INTO tblAgeStats VALUES(17,0,31,31,31,8);
INSERT INTO tblAgeStats VALUES(18,3,47,29,16,5);
INSERT INTO tblAgeStats VALUES(19,7,57,14,21,0);
INSERT INTO tblAgeStats VALUES(23,2,61,18,16,2);
INSERT INTO tblAgeStats VALUES(24,3,40,26,21,10);
INSERT INTO tblAgeStats VALUES(25,10,80,0,10,0);
INSERT INTO tblAgeStats VALUES(26,5,56,27,12,1);
INSERT INTO tblAgeStats VALUES(28,14,59,13,9,5);
INSERT INTO tblAgeStats VALUES(29,6,59,19,11,5);
INSERT INTO tblAgeStats VALUES(30,0,54,21,21,4);
INSERT INTO tblAgeStats VALUES(31,0,17,33,33,17);
INSERT INTO tblAgeStats VALUES(32,18,47,24,6,6);
INSERT INTO tblAgeStats VALUES(34,1,34,39,17,8);
INSERT INTO tblAgeStats VALUES(35,11,60,19,9,1);
INSERT INTO tblAgeStats VALUES(36,2,41,36,15,6);
INSERT INTO tblAgeStats VALUES(39,1,49,26,16,8);
INSERT INTO tblAgeStats VALUES(40,4,45,29,14,8);
INSERT INTO tblAgeStats VALUES(43,0,29,71,0,0);
INSERT INTO tblAgeStats VALUES(44,2,53,31,11,3);
INSERT INTO tblAgeStats VALUES(45,3,32,29,22,15);
INSERT INTO tblAgeStats VALUES(46,8,65,10,12,5);
INSERT INTO tblAgeStats VALUES(47,4,46,29,18,3);
INSERT INTO tblAgeStats VALUES(48,9,73,9,9,0);
INSERT INTO tblAgeStats VALUES(49,3,37,32,23,5);

--성별 관람객 추이
INSERT INTO tblGenderStats VALUES(2, 34, 66);
INSERT INTO tblGenderStats VALUES(3, 33, 67);
INSERT INTO tblGenderStats VALUES(4, 20, 80);
INSERT INTO tblGenderStats VALUES(5, 11, 89);
INSERT INTO tblGenderStats VALUES(7, 32, 68);
INSERT INTO tblGenderStats VALUES(8, 29, 71);
INSERT INTO tblGenderStats VALUES(9, 37, 63);
INSERT INTO tblGenderStats VALUES(10, 68, 32);
INSERT INTO tblGenderStats VALUES(12, 23, 77);
INSERT INTO tblGenderStats VALUES(13, 67, 33);
INSERT INTO tblGenderStats VALUES(14, 40, 60);
INSERT INTO tblGenderStats VALUES(16, 53, 47);
INSERT INTO tblGenderStats VALUES(17, 79, 21);
INSERT INTO tblGenderStats VALUES(18, 36, 64);
INSERT INTO tblGenderStats VALUES(19, 50, 50);
INSERT INTO tblGenderStats VALUES(23, 45, 55);
INSERT INTO tblGenderStats VALUES(24, 43, 57);
INSERT INTO tblGenderStats VALUES(25, 20, 80);
INSERT INTO tblGenderStats VALUES(26, 46, 54);
INSERT INTO tblGenderStats VALUES(28, 61, 39);
INSERT INTO tblGenderStats VALUES(29, 41, 59);
INSERT INTO tblGenderStats VALUES(30, 46, 54);
INSERT INTO tblGenderStats VALUES(31, 67, 33);
INSERT INTO tblGenderStats VALUES(33, 83, 17);
INSERT INTO tblGenderStats VALUES(34, 56, 44);
INSERT INTO tblGenderStats VALUES(35, 32, 68);
INSERT INTO tblGenderStats VALUES(36, 44, 56);
INSERT INTO tblGenderStats VALUES(39, 31, 69);
INSERT INTO tblGenderStats VALUES(40, 41, 59);
INSERT INTO tblGenderStats VALUES(43, 43, 57);
INSERT INTO tblGenderStats VALUES(44, 55, 45);
INSERT INTO tblGenderStats VALUES(45, 83, 17);
INSERT INTO tblGenderStats VALUES(46, 32, 68);
INSERT INTO tblGenderStats VALUES(47, 62, 38);
INSERT INTO tblGenderStats VALUES(48, 36, 64);
INSERT INTO tblGenderStats VALUES(49, 36, 64);

-- 영화 흥행도
INSERT INTO tblHit VALUES(1, 9.81);
INSERT INTO tblHit VALUES(2, 9.60);
INSERT INTO tblHit VALUES(3, 9.59);
INSERT INTO tblHit VALUES(4, 9.56);
INSERT INTO tblHit VALUES(5, 9.55);
INSERT INTO tblHit VALUES(6, 9.54);
INSERT INTO tblHit VALUES(7, 9.53);
INSERT INTO tblHit VALUES(8, 9.53);
INSERT INTO tblHit VALUES(9, 9.52);
INSERT INTO tblHit VALUES(10, 9.51);
INSERT INTO tblHit VALUES(11, 9.49);
INSERT INTO tblHit VALUES(12, 9.49);
INSERT INTO tblHit VALUES(13, 9.48);
INSERT INTO tblHit VALUES(14, 9.46);
INSERT INTO tblHit VALUES(15, 9.46);
INSERT INTO tblHit VALUES(16, 9.46);
INSERT INTO tblHit VALUES(17, 9.45);
INSERT INTO tblHit VALUES(18, 9.44);
INSERT INTO tblHit VALUES(19, 9.44);
INSERT INTO tblHit VALUES(20, 9.43);
INSERT INTO tblHit VALUES(21, 9.43);
INSERT INTO tblHit VALUES(22, 9.42);
INSERT INTO tblHit VALUES(23, 9.42);
INSERT INTO tblHit VALUES(24, 9.42);
INSERT INTO tblHit VALUES(25, 9.42);
INSERT INTO tblHit VALUES(26, 9.42);
INSERT INTO tblHit VALUES(27, 9.41);
INSERT INTO tblHit VALUES(28, 9.41);
INSERT INTO tblHit VALUES(29, 9.41);
INSERT INTO tblHit VALUES(30, 9.41);
INSERT INTO tblHit VALUES(31, 9.40);
INSERT INTO tblHit VALUES(32, 9.41);
INSERT INTO tblHit VALUES(33, 9.42);
INSERT INTO tblHit VALUES(34, 9.40);
INSERT INTO tblHit VALUES(35, 9.39);
INSERT INTO tblHit VALUES(36, 9.39);
INSERT INTO tblHit VALUES(37, 9.40);
INSERT INTO tblHit VALUES(38, 9.40);
INSERT INTO tblHit VALUES(39, 9.40);
INSERT INTO tblHit VALUES(40, 9.39);
INSERT INTO tblHit VALUES(41, 9.38);
INSERT INTO tblHit VALUES(42, 9.38);
INSERT INTO tblHit VALUES(43, 9.39);
INSERT INTO tblHit VALUES(44, 9.38);
INSERT INTO tblHit VALUES(45, 9.38);
INSERT INTO tblHit VALUES(46, 9.38);
INSERT INTO tblHit VALUES(47, 9.38);
INSERT INTO tblHit VALUES(48, 9.38);
INSERT INTO tblHit VALUES(49, 9.38);
INSERT INTO tblHit VALUES(50, 9.38);

--영화별 국가리스트
INSERT INTO tblClist VALUES(1, 93);
INSERT INTO tblClist VALUES(1, 127);
INSERT INTO tblClist VALUES(2, 68);
INSERT INTO tblClist VALUES(3, 35);
INSERT INTO tblClist VALUES(3, 188);
INSERT INTO tblClist VALUES(4, 203);
INSERT INTO tblClist VALUES(5, 203);
INSERT INTO tblClist VALUES(6, 139);
INSERT INTO tblClist VALUES(7, 68);
INSERT INTO tblClist VALUES(8, 68);
INSERT INTO tblClist VALUES(9, 203);
INSERT INTO tblClist VALUES(9, 182);
INSERT INTO tblClist VALUES(10, 139);
INSERT INTO tblClist VALUES(11, 148);
INSERT INTO tblClist VALUES(12, 133);
INSERT INTO tblClist VALUES(13, 68);
INSERT INTO tblClist VALUES(14, 68);
INSERT INTO tblClist VALUES(15, 203);
INSERT INTO tblClist VALUES(16, 68);
INSERT INTO tblClist VALUES(17, 68);
INSERT INTO tblClist VALUES(17, 188);
INSERT INTO tblClist VALUES(18, 203);
INSERT INTO tblClist VALUES(19, 203);
INSERT INTO tblClist VALUES(20, 68);
INSERT INTO tblClist VALUES(21, 68);
INSERT INTO tblClist VALUES(22, 68);
INSERT INTO tblClist VALUES(23, 68);
INSERT INTO tblClist VALUES(24, 68);
INSERT INTO tblClist VALUES(24, 127);
INSERT INTO tblClist VALUES(25, 68);
INSERT INTO tblClist VALUES(26, 68);
INSERT INTO tblClist VALUES(27, 68);
INSERT INTO tblClist VALUES(27, 127);
INSERT INTO tblClist VALUES(28, 68);
INSERT INTO tblClist VALUES(29, 68);
INSERT INTO tblClist VALUES(30, 137);
INSERT INTO tblClist VALUES(31, 68);
INSERT INTO tblClist VALUES(32, 203);
INSERT INTO tblClist VALUES(33, 68);
INSERT INTO tblClist VALUES(34, 68);
INSERT INTO tblClist VALUES(35, 139);
INSERT INTO tblClist VALUES(36, 68);
INSERT INTO tblClist VALUES(37, 68);
INSERT INTO tblClist VALUES(38, 68);
INSERT INTO tblClist VALUES(39, 68);
INSERT INTO tblClist VALUES(40, 68);
INSERT INTO tblClist VALUES(41, 68);
INSERT INTO tblClist VALUES(42, 201);
INSERT INTO tblClist VALUES(43, 203);
INSERT INTO tblClist VALUES(44, 24);
INSERT INTO tblClist VALUES(44, 68);
INSERT INTO tblClist VALUES(45, 68);
INSERT INTO tblClist VALUES(46, 68);
INSERT INTO tblClist VALUES(47, 68);
INSERT INTO tblClist VALUES(48, 188);
INSERT INTO tblClist VALUES(48, 68);
INSERT INTO tblClist VALUES(49, 68);
INSERT INTO tblClist VALUES(50, 203);
INSERT INTO tblClist VALUES(50, 68);