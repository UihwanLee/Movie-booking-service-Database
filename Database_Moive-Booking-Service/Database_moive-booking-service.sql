SET NAMES UTF8;
create database example;
use example;

CREATE TABLE CardPaymentInfo(
CardNumber VARCHAR(8),
Bank VARCHAR(8),
PRIMARY KEY(CardNumber),
Mileage VARCHAR(45) CHECK (Mileage IN ( '-1', '1')),
Discount VARCHAR(45) CHECK (Discount IN ( '-1', '1'))
) DEFAULT CHARSET=utf8;

CREATE TABLE PaymentInfo(
PaymentNumber VARCHAR(30) NOT NULL,
PaymentDate DATE,
AmountPayment INT NOT NULL,
CardNumber VARCHAR(45),
PRIMARY KEY(PaymentNumber),
FOREIGN KEY(CardNumber) REFERENCES CardPaymentInfo(CardNumber),
Coupon VARCHAR(45) CHECK (Coupon IN ( '0', '1'))
) DEFAULT CHARSET=utf8;

CREATE TABLE MemberInfo(
MemberID VARCHAR(45),
Pass_word VARCHAR(45) NOT NULL,
MemberEmail VARCHAR(20),
CardCompany  VARCHAR(45),
MobileCarrier VARCHAR(45) NOT NULL,
PRIMARY KEY(MemberID)
) DEFAULT CHARSET=utf8;

CREATE TABLE CustomerInfo(
CustomerNumber VARCHAR(30) NOT NULL,
CustomerName  VARCHAR(15) NOT NULL,
CustomerBirthday DATE,
CustomerPhoneNum VARCHAR(45),
MemberID VARCHAR(45),
PRIMARY KEY(CustomerNumber),
FOREIGN KEY(MemberID) REFERENCES MemberInfo(MemberID),
BooleanID BOOLEAN CHECK (BooleanID IN  (0, 1))
) DEFAULT CHARSET=utf8;

CREATE TABLE MovieInfo_name(
Moviename VARCHAR(50),
Charactor VARCHAR(100) NOT NULL,
Runtime INT,
Director VARCHAR(45) NOT NULL,
PRIMARY KEY(Moviename)
) DEFAULT CHARSET=utf8;

CREATE TABLE MovieInfo(
Moviename VARCHAR(50),
Genre VARCHAR(30) NOT NULL,
PRIMARY KEY(Moviename, Genre),
FOREIGN KEY(Moviename) REFERENCES MovieInfo_name(Moviename),
movieRank VARCHAR(10) CHECK (movieRank IN ( 'U', 'PG', '12', '15', '18'))
) DEFAULT CHARSET=utf8;

CREATE TABLE CinemaInfo(
CinemaSerialNum VARCHAR(30),
CinemaLocation VARCHAR(20), /*시•도*/
CinemaLocation_city VARCHAR(20) NOT NULL, /*시•군•구*/
CinemaLocation_sub VARCHAR(100) NOT NULL, /*세부주소*/
CinemaName VARCHAR(20),
PRIMARY KEY(CinemaSerialNum)
) DEFAULT CHARSET=utf8;

CREATE TABLE CinemaMovieRelation(
Moviename VARCHAR(50),
CinemaSerialNum VARCHAR(20),
PRIMARY KEY(Moviename,CinemaSerialNum),
FOREIGN KEY(Moviename) REFERENCES MovieInfo(Moviename),
FOREIGN KEY(CinemaSerialNum) REFERENCES CinemaInfo(CinemaSerialNum)
) DEFAULT CHARSET=utf8;

CREATE TABLE TheaterInfo(
TheaterNumber VARCHAR(30),
AmountSeat INT NOT NULL,
ValiableSeat INT NOT NULL,
CinemaSerialNum VARCHAR(20),
PRIMARY KEY(TheaterNumber),
FOREIGN KEY(CinemaSerialNum) REFERENCES CinemaInfo(CinemaSerialNum),
TheaterSort VARCHAR(10) CHECK (TheaterSort IN ( '일반', '3D', '아이맥스'))
) DEFAULT CHARSET=utf8;

CREATE TABLE TicketInfo(
TicketingNumber VARCHAR(30),
SeatNumber VARCHAR(20) NOT NULL,
TicketingDate DATE NOT NULL,
TicketingAmount INT NOT NULL,
CustomerNumber VARCHAR(30),
TheaterNumber VARCHAR(30),
PaymentNumber VARCHAR(30),
PRIMARY KEY(TicketingNumber),
FOREIGN KEY(CustomerNumber) REFERENCES CustomerInfo(CustomerNumber),
FOREIGN KEY(TheaterNumber) REFERENCES TheaterInfo(TheaterNumber),
FOREIGN KEY(PaymentNumber) REFERENCES PaymentInfo(PaymentNumber)
) DEFAULT CHARSET=utf8;


# 카드결제내역 데이터
INSERT INTO CardPaymentInfo VALUES ('00000001', '농협', '1', '1');
INSERT INTO CardPaymentInfo VALUES ('00000002', '신한', '1', '-1');
INSERT INTO CardPaymentInfo VALUES ('00000003', '국민', '-1', '-1');
INSERT INTO CardPaymentInfo VALUES ('00000004', '국민', '1', '1');
INSERT INTO CardPaymentInfo VALUES ('00000005', '카카오뱅크', '1', '-1');
INSERT INTO CardPaymentInfo VALUES ('00000006', '기업', '-1', '1');
INSERT INTO CardPaymentInfo VALUES ('00000007', '신한', '-1', '1');
INSERT INTO CardPaymentInfo VALUES ('00000008', '농협', '1', '1');
INSERT INTO CardPaymentInfo VALUES ('00000009', '카카오뱅크', '1', '-1');
INSERT INTO CardPaymentInfo VALUES ('00000010', '카카오뱅크', '1', '-1');
INSERT INTO CardPaymentInfo VALUES ('00000011', '기업', '1', '1');
INSERT INTO CardPaymentInfo VALUES ('00000012', '농협', '-1', '1');
INSERT INTO CardPaymentInfo VALUES ('00000013', '신한', '1', '-1');
INSERT INTO CardPaymentInfo VALUES ('00000014', '신한', '-1', '-1');
INSERT INTO CardPaymentInfo VALUES ('00000015', '우리', '1', '1');
INSERT INTO CardPaymentInfo VALUES ('00000016', '국민', '1', '1');
INSERT INTO CardPaymentInfo VALUES ('00000017', '카카오뱅크', '1', '-1');
INSERT INTO CardPaymentInfo VALUES ('00000018', '농협', '-1', '1');
INSERT INTO CardPaymentInfo VALUES ('00000019', '우리', '-1', '1');
INSERT INTO CardPaymentInfo VALUES ('00000020', '카카오뱅크', '-1', '-1');

# 결제정보 데이터
INSERT INTO PaymentInfo VALUES ('A011910141', "2019-10-14", 8000, '00000001', '1');
INSERT INTO PaymentInfo VALUES ('A031910072', "2019-10-07", 10000, '00000002', '1');
INSERT INTO PaymentInfo VALUES ('A051910063', "2019-10-06", 10000, '00000003', '1');
INSERT INTO PaymentInfo VALUES ('A051910154', "2019-10-15", 20000, '00000004', '1');
INSERT INTO PaymentInfo VALUES ('A061910185', "2019-10-18", 30000, '00000005', '1');
INSERT INTO PaymentInfo VALUES ('A041909046', "2019-09-04", 24000, '00000006', '1');
INSERT INTO PaymentInfo VALUES ('A031910027', "2019-10-02", 5000, '00000007', '1');
INSERT INTO PaymentInfo VALUES ('A011910058', "2019-10-05", 14000, '00000008', '1');
INSERT INTO PaymentInfo VALUES ('A061910069', "2019-10-06", 20000, '00000009', '1');
INSERT INTO PaymentInfo VALUES ('A0619100710', "2019-10-07", 10000, '00000010', '1');
INSERT INTO PaymentInfo VALUES ('A0419101211', "2019-10-12", 8000, '00000011', '1');
INSERT INTO PaymentInfo VALUES ('A0119101512', "2019-10-15", 8000, '00000012', '1');
INSERT INTO PaymentInfo VALUES ('A0319101813', "2019-10-18", 8500, '00000013', '1');
INSERT INTO PaymentInfo VALUES ('A0319101914', "2019-10-19", 43000, '00000014', '1');
INSERT INTO PaymentInfo VALUES ('A0219101215', "2019-10-12", 50000, '00000015', '1');
INSERT INTO PaymentInfo VALUES ('A0519100516', "2019-10-05", 10000, '00000016', '1');
INSERT INTO PaymentInfo VALUES ('A0619091417', "2019-09-14", 10000, '00000017', '1');
INSERT INTO PaymentInfo VALUES ('A0119090518', "2019-09-05", 8000, '00000018', '1');
INSERT INTO PaymentInfo VALUES ('A0219100519', "2019-10-05", 8000, '00000019', '1');
INSERT INTO PaymentInfo VALUES ('A0619100120', "2019-10-01", 8000, '00000020', '1');

# 회원정보 데이터
INSERT INTO MemberInfo VALUES ('qwdqdq', 'fwfwfw', 'qwdqdq@naver.com', '농협', 'LG U+');
INSERT INTO MemberInfo VALUES ('sqdq', '23tgd', 'sqdq@naver.com', '신한', 'LG U+');
INSERT INTO MemberInfo VALUES ('qeqr', 'fsdfq', 'qeqr@daum.net', '국민', 'KT');
INSERT INTO MemberInfo VALUES ('dqdq', 'fef3445', 'dqdq@gmail.com', '국민', 'SKT');
INSERT INTO MemberInfo VALUES ('gwhhw', 'fewf2', 'gwhhw@naver.com', '카카오뱅크', 'KT');
INSERT INTO MemberInfo VALUES ('vweve', 'f2f2e5', 'vweve@gmail.com', '기업', 'SKT');
INSERT INTO MemberInfo VALUES ('hw334', 'gfhb124', 'hw334@daum.net', '신한', 'LG U+');
INSERT INTO MemberInfo VALUES ('gewew8', 'dgsg34', 'gewew8@gmail.com', '농협', 'KT');
INSERT INTO MemberInfo VALUES ('2gddwf', 'g4t34', '2gddwf@naver.com', '카카오뱅크', 'KT');
INSERT INTO MemberInfo VALUES ('qge0123', 'geg24', 'qge0123@naver.com', '카카오뱅크', 'SKT');
INSERT INTO MemberInfo VALUES ('qggqq', 'gr3ef43', 'qggqq@gmail.com', '기업', 'LG U+');
INSERT INTO MemberInfo VALUES ('axcav', 'btb545', 'axcav@daum.net', '농협', 'SKT');
INSERT INTO MemberInfo VALUES ('dddq13', 'gkoo55', 'dddq13@gmail.com', '신한', 'KT');
INSERT INTO MemberInfo VALUES ('gqegqs2', 'grge5', 'gqegqs2@naver.com', '신한', 'LG U+');
INSERT INTO MemberInfo VALUES ('qgeg3', 'gr3g5', 'qgeg3@naver.com', '우리', 'SKT');
INSERT INTO MemberInfo VALUES ('regegw2', 'fqwg44', 'regegw2@gmail.com', '국민', 'SKT');
INSERT INTO MemberInfo VALUES ('ewfg3', 'g4ggt55', 'ewfg3@daum.net', '카카오뱅크', 'KT');
INSERT INTO MemberInfo VALUES ('3fefwd', 'herh56', '3fefwd@naver.com', '농협', 'KT');
INSERT INTO MemberInfo VALUES ('gwegw', 'hgt555', 'gwegwgmail.com', '우리', 'SKT');
INSERT INTO MemberInfo VALUES ('gweg2', 'sdge43', 'gweg2@naver.com', '카카오뱅크', 'KT');

# 고객정보 데이터
INSERT INTO CustomerInfo VALUES ('190101-AAAX', '오래영', "1997-01-01", '010-1114-1111', 'qwdqdq', 1);
INSERT INTO CustomerInfo VALUES ('130909-AACZ', '김주영', "1997-01-01", '010-1112-1111', 'sqdq', 1);
INSERT INTO CustomerInfo VALUES ('161216-AABC', '이지수', "1997-01-01", '010-1121-1111', 'qeqr', 1);
INSERT INTO CustomerInfo VALUES ('150505-AACC', '이의환', "1997-01-01", '010-1161-1111', 'dqdq', 1);
INSERT INTO CustomerInfo VALUES ('140718-AACX', '홍길동', "1973-05-22", '010-1411-1111', 'gwhhw', 1);
INSERT INTO CustomerInfo VALUES ('150417-AABD', '아무개', "1993-06-12", '010-1611-1111', 'vweve', 1);
INSERT INTO CustomerInfo VALUES ('140306-AACB', '이지영', "1999-08-05", '010-1711-1111', 'hw334', 1);
INSERT INTO CustomerInfo VALUES ('180606-AABZ', '홍세현', "1987-01-15", '010-1211-1111', 'gewew8', 1);
INSERT INTO CustomerInfo VALUES ('170806-ABAC', '유민현', "1937-02-11", '010-1811-1111', '2gddwf', 1);
INSERT INTO CustomerInfo VALUES ('121120-AADV', '김지영', "2002-05-06", '010-1311-1111', 'qge0123', 1);
INSERT INTO CustomerInfo VALUES ('131012-AAEZ', '류현진', "1987-07-17", '010-1611-1111', 'qggqq', 1);
INSERT INTO CustomerInfo VALUES ('160411-AAHY', '고다은', "2000-12-25", '010-4111-1111', 'axcav', 1);
INSERT INTO CustomerInfo VALUES ('150201-AAOF', '김지석', "1992-10-30", '010-5111-1111', 'dddq13', 1);
INSERT INTO CustomerInfo VALUES ('150804-ABAP', '최진수', "1996-06-26", '010-6111-1111', 'gqegqs2', 1);
INSERT INTO CustomerInfo VALUES ('170903-AAAA', '최무현', "1991-04-17", '010-7111-1111', 'qgeg3', 1);
INSERT INTO CustomerInfo VALUES ('190603-AAVA', '김지혁', "1997-03-07", '010-8111-1111', 'regegw2', 1);
INSERT INTO CustomerInfo VALUES ('180326-AAGP', '이동현', "1998-02-16", '010-9111-1111', 'ewfg3', 1);
INSERT INTO CustomerInfo VALUES ('140518-AAIK', '이동현', "1999-11-04", '010-1115-1111', '3fefwd', 1);
INSERT INTO CustomerInfo VALUES ('110629-AABE', '박주영', "1980-06-30", '010-1116-1111', 'gwegw', 1);
INSERT INTO CustomerInfo VALUES ('121011-AAMN', '김고개', "1957-08-15", '010-1117-1111', 'gweg2', 1);

# 영화정보_영화명 데이터
INSERT INTO MovieInfo_name VALUES ('가장보통의연예',  '김래원', 109, '김한결' );
INSERT INTO MovieInfo_name VALUES ('두번할까요', '권상우', 112, '박용집');
INSERT INTO MovieInfo_name VALUES ('말레피센트2', '안젤리나 졸리', 119, '요아킴 뢰닝');
INSERT INTO MovieInfo_name VALUES ('조커', '호아퀸 피닉스', 123, '토드 필립스');
INSERT INTO MovieInfo_name VALUES ('퍼펙트맨', '설경구', 116, '용수');
INSERT INTO MovieInfo_name VALUES ('어벤져스: 엔드게임', '로버트 다우니 주니어', 181, '안소니 루소');
INSERT INTO MovieInfo_name VALUES ('데드풀', '라이언 레이놀즈',  106, '팀밀러');
INSERT INTO MovieInfo_name VALUES ('타짜', '박정민', 139, '최동훈');
INSERT INTO MovieInfo_name VALUES ('좋은 놈, 나쁜놈, 이상한 놈', '송강호',  139, '김지운');
INSERT INTO MovieInfo_name VALUES ('겨울왕국', '이디나 멘젤', 103, '크리스 벅,제니퍼 리');
INSERT INTO MovieInfo_name VALUES ('해리 포터와 죽음의 성물 - 2부', '다니엘 래드클리프', 131, '데이빗 예이츠');
INSERT INTO MovieInfo_name VALUES ('명량', '최민식',  128, '김한민');
INSERT INTO MovieInfo_name VALUES ('아이언맨3', '로버트 다우니 주니어', 129, '세인 블랙');
INSERT INTO MovieInfo_name VALUES ('건축학개론', '엄태웅', 118, '이용주');
INSERT INTO MovieInfo_name VALUES ('아저씨', '원빈', 119, '이정범');
INSERT INTO MovieInfo_name VALUES ('반지의 제왕: 반지 원정대',  '일라이저 우드', 228, '피터 잭슨');
INSERT INTO MovieInfo_name VALUES ('세 얼간이', '아미르 칸', 141, '라지쿠마르 히라니');
INSERT INTO MovieInfo_name VALUES ('범죄와의 전쟁 : 나쁜놈들 전성시대',  '최민식', 133, '윤종빈');
INSERT INTO MovieInfo_name VALUES ('미션 임파셔블 : 고스트 프로토콜', '톰 크루즈', 132, '브래드 버드');
INSERT INTO MovieInfo_name VALUES ('스파이더맨: 파 프롬 홈', '톰 홀랜드', 129, '존 왓츠');

# 영화정보 데이터
INSERT INTO MovieInfo VALUES ('가장보통의연예', '멜로', '15');
INSERT INTO MovieInfo VALUES ('가장보통의연예', '로맨스', '15');
INSERT INTO MovieInfo VALUES ('두번할까요', '코미디,멜로', '15');
INSERT INTO MovieInfo VALUES ('말레피센트2', '판타지','12');
INSERT INTO MovieInfo VALUES ('조커', '스릴러', '15');
INSERT INTO MovieInfo VALUES ('퍼펙트맨', '코미디,드라마', '15');
INSERT INTO MovieInfo VALUES ('어벤져스: 엔드게임', '액션,SF',  '12');
INSERT INTO MovieInfo VALUES ('데드풀', '액션','18');
INSERT INTO MovieInfo VALUES ('타짜','범죄,드라마,코미디', '18');
INSERT INTO MovieInfo VALUES ('좋은 놈, 나쁜놈, 이상한 놈', '액션,코미디,모험', '15');
INSERT INTO MovieInfo VALUES ('겨울왕국', '애니메이션,모험',  'U');
INSERT INTO MovieInfo VALUES ('해리 포터와 죽음의 성물 - 2부',  '모험,판타지', 'U');
INSERT INTO MovieInfo VALUES ('명량', '액션,드라마', '15');
INSERT INTO MovieInfo VALUES ('아이언맨3','SF,액션,모험', '12');
INSERT INTO MovieInfo VALUES ('건축학개론', '멜로','12');
INSERT INTO MovieInfo VALUES ('건축학개론', '로맨스',  '12');
INSERT INTO MovieInfo VALUES ('아저씨',  '액션,범죄,드라마', '18');
INSERT INTO MovieInfo VALUES ('반지의 제왕: 반지 원정대',  '판타지,모험,액션', '12');
INSERT INTO MovieInfo VALUES ('세 얼간이', '코미디',  '12');
INSERT INTO MovieInfo VALUES ('범죄와의 전쟁 : 나쁜놈들 전성시대', '범죄,드라마','18');
INSERT INTO MovieInfo VALUES ('미션 임파셔블 : 고스트 프로토콜',  '액션',  '15');
INSERT INTO MovieInfo VALUES ('스파이더맨: 파 프롬 홈',  129,  '12');

# 극장정보 데이터
INSERT INTO CinemaInfo VALUES ('031-1A', '경기도','시흥시', '마유로418번길 10(정왕동, 롯데시네마)', '강남점');
INSERT INTO CinemaInfo VALUES ('02-2A', '서울특별시','광진구',' 자양동, 227-7', '강변점');
INSERT INTO CinemaInfo VALUES ('02-3A', '서울특별시','강동구',' 성내동, 44-1', '건대입구점');
INSERT INTO CinemaInfo VALUES ('02-4A', '서울특별시','강서구',' 동촌동, 73-1 아름다운아울렛 5층', '구로점');
INSERT INTO CinemaInfo VALUES ('02-1B', '서울특별시','금전구',' 가산동 , 60-8', '대학로점');
INSERT INTO CinemaInfo VALUES ('031-2B', '경기도', '안양시',' 만안구 만안로 244', '동대문점');
INSERT INTO CinemaInfo VALUES ('031-3B', '경기도', '수원시',' 권선구 금곡동', '등촌점');
INSERT INTO CinemaInfo VALUES ('031-1C', '경기도', '안산시',' 상록구 항가울로 422', '명동점');
INSERT INTO CinemaInfo VALUES ('031-2C', '경기도', '광명시',' 일직로 17 롯데프리미엄아울렛', '목동점');
INSERT INTO CinemaInfo VALUES ('031-3C', '경기도', '안양시',' 동안구 흥안대로 519 아이퍼스트타워 ', '미아점');
INSERT INTO CinemaInfo VALUES ('031-1D', '경기도', '화성시', '향남읍 상신하길로298번길 7-2', '불광점');
INSERT INTO CinemaInfo VALUES ('02-1E', '서울특별시','마포구','마포구 양화로 45 메세나폴리스', '상봉점');
INSERT INTO CinemaInfo VALUES ('02-2E', '서울특별시','용산구',' 청파로 74 전자랜드(본관)', '성신여대점');
INSERT INTO CinemaInfo VALUES ('031-3E', '경기도',' 오산시','원동로37번길 46', '송파점');
INSERT INTO CinemaInfo VALUES ('031-4E', '경기도',' 성남시','중원구 성남대로 1136 니즈몰', '수유점');
INSERT INTO CinemaInfo VALUES ('02-1F', '서울특별시','동대문구','동대문구 답십리로 288 아트몰링', '압구정점');
INSERT INTO CinemaInfo VALUES ('02-2F', '서울특별시','노원구','노원구 동일로 1414 롯데백화점', '여의도점');
INSERT INTO CinemaInfo VALUES ('031-3F', '경기도', '안성시',' 공도읍 서동대로 4478', '영등포점');
INSERT INTO CinemaInfo VALUES ('031-1G', '경기도', '남양주시',' 화도읍 경춘로 1992', '중계점');
INSERT INTO CinemaInfo VALUES ('02-1H', '서울특별시', '서산시',' 율지18로 38', '천호점');

# 극장_영화_관계 데이터
INSERT INTO CinemaMovieRelation VALUES ('가장보통의연예', '031-1A');
#INSERT INTO CinemaMovieRelation VALUES ('두번할까요', '02-2A');
INSERT INTO CinemaMovieRelation VALUES ('가장보통의연예', '02-2A');
INSERT INTO CinemaMovieRelation VALUES ('말레피센트2', '02-3A');
INSERT INTO CinemaMovieRelation VALUES ('조커', '02-4A');
#INSERT INTO CinemaMovieRelation VALUES ('퍼펙트맨', '02-1B');
INSERT INTO CinemaMovieRelation VALUES ('조커', '02-1B');
INSERT INTO CinemaMovieRelation VALUES ('어벤져스: 엔드게임', '031-2B');
INSERT INTO CinemaMovieRelation VALUES ('데드풀', '031-3B');
#INSERT INTO CinemaMovieRelation VALUES ('타짜', '031-1C');
INSERT INTO CinemaMovieRelation VALUES ('겨울왕국', '031-1C');
#INSERT INTO CinemaMovieRelation VALUES ('좋은 놈, 나쁜놈, 이상한 놈', '031-2C');
INSERT INTO CinemaMovieRelation VALUES ('겨울왕국', '031-2C');
INSERT INTO CinemaMovieRelation VALUES ('겨울왕국', '031-3C');
INSERT INTO CinemaMovieRelation VALUES ('해리 포터와 죽음의 성물 - 2부', '031-1D');
INSERT INTO CinemaMovieRelation VALUES ('명량', '02-1E');
INSERT INTO CinemaMovieRelation VALUES ('아이언맨3', '02-2E');
#INSERT INTO CinemaMovieRelation VALUES ('건축학개론', '031-3E');
INSERT INTO CinemaMovieRelation VALUES ('아이언맨3', '031-3E');
#INSERT INTO CinemaMovieRelation VALUES ('아저씨', '031-4E');
INSERT INTO CinemaMovieRelation VALUES ('아이언맨3', '031-4E');
#INSERT INTO CinemaMovieRelation VALUES ('반지의 제왕: 반지 원정대', '02-1F');
INSERT INTO CinemaMovieRelation VALUES ('아이언맨3', '02-1F');
INSERT INTO CinemaMovieRelation VALUES ('세 얼간이', '02-2F');
INSERT INTO CinemaMovieRelation VALUES ('범죄와의 전쟁 : 나쁜놈들 전성시대', '031-3F');
INSERT INTO CinemaMovieRelation VALUES ('미션 임파셔블 : 고스트 프로토콜', '031-1G');
INSERT INTO CinemaMovieRelation VALUES ('스파이더맨: 파 프롬 홈', '02-1H');

# 상영관정보 데이터
INSERT INTO TheaterInfo VALUES ('1A-01', 100, 50, '031-1A', '일반');
INSERT INTO TheaterInfo VALUES ('2A-02', 150, 75, '02-2A', '일반');
INSERT INTO TheaterInfo VALUES ('3A-03', 100, 50, '02-3A', '일반');
INSERT INTO TheaterInfo VALUES ('4A-04', 200, 160, '02-4A', '3D');
INSERT INTO TheaterInfo VALUES ('1B-05', 100, 62, '02-1B', '3D');
INSERT INTO TheaterInfo VALUES ('2B-06', 200, 140, '031-2B', '일반');
INSERT INTO TheaterInfo VALUES ('3B-07', 200, 42, '031-3B', '일반');
INSERT INTO TheaterInfo VALUES ('1C-08', 100, 89, '031-1C', '일반');
INSERT INTO TheaterInfo VALUES ('2C-09', 150, 51, '031-2C', '일반');
INSERT INTO TheaterInfo VALUES ('3C-01', 100, 24, '031-3C', '3D');
INSERT INTO TheaterInfo VALUES ('1D-02', 100, 76, '031-1D', '3D');
INSERT INTO TheaterInfo VALUES ('1E-03', 200, 51, '02-1E', '일반');
INSERT INTO TheaterInfo VALUES ('2E-04', 250, 122, '02-2E', '일반');
INSERT INTO TheaterInfo VALUES ('3E-05', 100, 23, '031-3E', '아이맥스');
INSERT INTO TheaterInfo VALUES ('4E-06', 100, 54, '031-4E', '일반');
INSERT INTO TheaterInfo VALUES ('1F-07', 150, 56, '02-1F', '일반');
INSERT INTO TheaterInfo VALUES ('2F-08', 150, 135, '02-2F', '아이맥스');
INSERT INTO TheaterInfo VALUES ('3F-09', 100, 98, '031-3F', '일반');
INSERT INTO TheaterInfo VALUES ('1G-10', 150, 42, '031-1G', '일반');
INSERT INTO TheaterInfo VALUES ('1H-01', 200, 20, '02-1H', '일반');

# 예매표정보 데이터
INSERT INTO TicketInfo VALUES ('031-1A-191014-AAAX', '01A', "2019-10-14", 1, '190101-AAAX', '1A-01', 'A011910141');
INSERT INTO TicketInfo VALUES ('02-2A-191007-AACZ', '02A', "2019-10-07", 1, '130909-AACZ', '2A-02', 'A031910072');
INSERT INTO TicketInfo VALUES ('02-3A-191006-AABC', '03B', "2019-10-06", 1, '161216-AABC', '3A-03', 'A051910063');
INSERT INTO TicketInfo VALUES ('02-4A-191015-AACC', '24L', "2019-10-15", 1, '150505-AACC', '4A-04', 'A051910154');
INSERT INTO TicketInfo VALUES ('02-1B-191018-AACX', '05O', "2019-10-18", 1, '140718-AACX', '1B-05', 'A061910185');
INSERT INTO TicketInfo VALUES ('031-2B-190904-AABD', '07F', "2019-09-04", 1, '150417-AABD', '2B-06', 'A041909046');
INSERT INTO TicketInfo VALUES ('031-3B-191002-AACB', '08G', "2019-10-02", 1, '140306-AACB', '3B-07', 'A031910027');
INSERT INTO TicketInfo VALUES ('031-1C-191005-AABZ', '03G', "2019-10-05", 1, '180606-AABZ', '1C-08', 'A011910058');
INSERT INTO TicketInfo VALUES ('031-2C-191006-ABAC', '11L', "2019-10-06", 1, '170806-ABAC', '2C-09', 'A061910069');
INSERT INTO TicketInfo VALUES ('031-3C-191007-AADV', '21L', "2019-10-07", 1, '121120-AADV', '3C-01', 'A0619100710');
INSERT INTO TicketInfo VALUES ('031-1D-191012-AAEZ', '17D', "2019-10-12", 1, '131012-AAEZ', '1D-02', 'A0419101211');
INSERT INTO TicketInfo VALUES ('02-1E-191015-AAHY', '06A', "2019-10-15", 1, '160411-AAHY', '1E-03', 'A0119101512');
INSERT INTO TicketInfo VALUES ('02-2E-191018-AAOF', '01D', "2019-10-18", 1, '150201-AAOF', '2E-04', 'A0319101813');
INSERT INTO TicketInfo VALUES ('031-3E-191019-ABAP', '03H', "2019-10-19", 1, '150804-ABAP', '3E-05', 'A0319101914');
INSERT INTO TicketInfo VALUES ('031-4E-191012-AAAA', '07H', "2019-10-12", 1, '170903-AAAA', '4E-06', 'A0219101215');
INSERT INTO TicketInfo VALUES ('02-1F-191005-AAVA', '12A', "2019-10-05", 1, '190603-AAVA', '1F-07', 'A0519100516');
INSERT INTO TicketInfo VALUES ('02-2F-190914-AAGP', '15R', "2019-09-14", 1, '180326-AAGP', '2F-08', 'A0619091417');
INSERT INTO TicketInfo VALUES ('031-3F-190905-AAIK', '05R', "2019-09-05", 1, '140518-AAIK', '3F-09', 'A0119090518');
INSERT INTO TicketInfo VALUES ('031-1G-191005-AABE', '22A', "2019-10-05", 1, '110629-AABE', '1G-10', 'A0219100519');
INSERT INTO TicketInfo VALUES ('02-1H-191001-AAMN', '24A', "2019-10-01", 1, '121011-AAMN', '1H-01', 'A0619100120');

# 인덱스 생성
ALTER TABLE Ticketinfo ADD INDEX IDX_TCKDATE (TicketingDate); /* 예매일자를 통해 예매정보 검색하는 단일인덱스 */
ALTER TABLE Paymentinfo ADD INDEX IDX_PAYDATE (PaymentDate);  /* 결제일자를 통해 결제정보 검색하는 단일인덱스 */
ALTER TABLE Customerinfo ADD INDEX IDX_CUSTOMER (CustomerPhoneNum,CustomerName); /* 고객번호->고객이름을 통해 고객데이터 검색하는 결합인덱스 */
ALTER TABLE Memberinfo ADD INDEX IDX_MEMBER (MemberID); /* 멤버ID를 통해 멤버데이터 검색하는 단일인덱스 */
ALTER TABLE Cinemainfo ADD INDEX IDX_CINEMA (CinemaLocation_city); /* (시,도,군) 위치를 통해 극장위치 검색하는 단일인덱스 */

# 뷰 생성

/*업데이트/갱신이 불가한 뷰로 단순 집계/연산/확인을 위한 뷰*/
# 1. 월별 결제매출 집계를 위한 뷰(ex 10월 매출 집계)
CREATE OR REPLACE VIEW CheckPayment AS
SELECT PaymentDate, SUM(AmountPayment)
FROM PaymentInfo USE INDEX(IDX_PAYDATE) WHERE PaymentDate LIKE '2019-10%'
GROUP BY PaymentDate ORDER BY PaymentDate DESC;

# 2. 월별 영화별로 예매개수 집계를 위한 뷰(ex 2019년 10월 영화별 예매개수 집계)
CREATE OR REPLACE VIEW CheckTicketingAmount AS
SELECT TicketingDate, Moviename, SUM(TicketingAmount) FROM TicketInfo USE INDEX(IDX_TCKDATE)
INNER JOIN CinemaMovieRelation
INNER JOIN CinemaInfo
INNER JOIN TheaterInfo
ON TicketInfo.TheaterNumber = TheaterInfo.TheaterNumber
AND TheaterInfo.CinemaSerialNum = CinemaInfo.CinemaSerialNum
AND CinemaInfo.CinemaSerialNum = CinemaMovieRelation.CinemaSerialNum
WHERE TicketingDate LIKE '2019-10%' GROUP BY TicketingDate, Moviename ORDER BY TicketingDate DESC;

# 3. 회원 이벤트 확인을 위한 뷰(ex 생일이 1월달인 회원정보 집계)
CREATE OR REPLACE VIEW CheckMemberInfo AS
SELECT a.CustomerName, a.CustomerBirthday, a.CustomerPhoneNum, b.MemberID 
FROM CustomerInfo AS a, MemberInfo AS b 
WHERE a.MemberID = b.MemberID AND CustomerBirthday LIKE '%01-%';

/*업데이트/갱신이 가능한 뷰로 데이터에 대한 갱신/수정이 빈번하여 만들어진 뷰*/
# 1. 회원 ID/PW 업데이트/수정을 위한 뷰
CREATE OR REPLACE VIEW MemberUpdate AS
SELECT MemberID, Pass_word
FROM MemberInfo USE INDEX(IDX_MEMBER);

# 2. 상영관 좌석 변경/수정을 위한 뷰
CREATE OR REPLACE VIEW SeatUpdate AS
SELECT TicketingNumber, SeatNumber, TheaterNumber
FROM TicketInfo;