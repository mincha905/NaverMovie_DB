## 데이터베이스 조작 프로젝트:video_camera:
네이버 영화 페이지를 이용한 데이터베이스 조작 프로젝트 <br><br><br>

### 1. 데이터 수집

<br><img src="https://user-images.githubusercontent.com/111429706/185992352-20450b28-fcac-435b-93cd-7b9a8878d824.png" width="600" height="310"/>

<br>
 
+ 랭킹 50위 안에 속한 영화들의 정보를 수집한다.
+ 생성할 테이블과 데이터베이스에 저장할 데이터를 선별한다.

<br>
 
### 2. ERD 작성



+ 논리 ERD 작성 후, 물리 ERD 작성을 통해 최종적으로 관리할 데이터를 선택하고 제약사항을 추가한다.
+ 불필요한 중복을 최소화 하기 위해, 정규화 원칙에 따라 겹칠 가능성이 있는 테이블은 따로 추가해 관리하였다.

<br>
 
### 3. 테이블 정의서 및 DDL 작성
<br><img src="https://user-images.githubusercontent.com/111429706/185998976-6c38654c-66fa-49c0-9f04-469bea0a33b3.png" width="560" height="158"/>

+ 테이블 정의서를 작성해 물리 데이터 베이스에 이식할 준비를 한다.

```
create table tblMovie (
    seq number primary key,
    name varchar2(100) not null,
    dates date not null,
    time number not null,
    gradeSeq number not null references tblGrade(seq),
    likes number null,
    summary varchar2(1000) not null
);
```

<br>
 
### 4. DML 작성

+ 최종적으로 Table에 추가할 데이터를 작성한다.

```
insert into tblMovie values(1, '클라우스', '2019-11-15', 96, 1, 3, 5);
insert into tblMovie values(2, '그린 북', '2019-01-09', 130, 2, 4, 4);
insert into tblMovie values(3, '가버나움', '2019-01-24', 126, 3, 2, 6);
insert into tblMovie values(4, '밥정', '2020-10-07', 82, 1, 2, 4);
insert into tblMovie values(5, '장민호 드라마 최종회', '2022-01-24', 106, 1, 5, 2);
insert into tblMovie values(6, '디지몬 어드벤처 라스트 에볼루션 : 인연', '2021-02-17', 114, 2, 3, 2);
insert into tblMovie values(7, '베일리 어게인', '2018-11-22', 100, 1, 1, 2);
```

