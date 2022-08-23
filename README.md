## 데이터베이스 조작 프로젝트:video_camera:
네이버 영화 페이지에서 필요한 데이터를 저장하기 위한 테이블을 설계, 생성, 조작하는 프로젝트입니다. <br> <br>

### 사용 툴
Database : Oracle <br>
Tool : eXERD, DBeaver, Google Docs

--------------------------

<br>

### 1. 데이터 수집

<br><img src="https://user-images.githubusercontent.com/111429706/185992352-20450b28-fcac-435b-93cd-7b9a8878d824.png" width="600" height="310"/>

<br>
 
+ 랭킹 50위 안에 속한 영화들의 정보를 수집한다.
+ 생성할 테이블과 데이터베이스에 저장할 데이터를 선별한다.

<br> <br>
 
### 2. ERD 작성

<br><img src="https://user-images.githubusercontent.com/111429706/186000209-e1b2b04d-3f77-45b5-9304-0d3b74418d16.png" width="750" height="410"/>

+ 논리 ERD 작성 후, 실제로 테이블 생성 시 사용될 물리 ERD를 작성한다.
+ 각 테이블의 컬럼이 원자값을 가질 수 있도록 테이블을 분리해 관리하였다.
+ N:N 관계를 가질 수 정보는 연결 정보를 저장할 테이블을 별도로 생성한다. (e.g. 장르, 국가 테이블)
+ 복합키를 사용하는 대신, 각 테이블마다 기본키인 번호(seq) 컬럼을 두어 다른 테이블에서 참조하도록 했다.



<br> <br>
 
### 3. 테이블 정의서 및 DDL 작성

#### ✔ 테이블 정의서

<br><img src="https://user-images.githubusercontent.com/111429706/185998976-6c38654c-66fa-49c0-9f04-469bea0a33b3.png" width="560" height="158"/>

+ 테이블 정의서를 작성해 물리 데이터 베이스에 이식할 준비를 한다. <br>

#### ✔ DDL

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

+ 제약사항 설정 시 constraint 키워드를 사용하지 않고 컬럼에서 설정해주었다.

<br> <br>
 
### 4. DML 작성

+ 최종적으로 Table에 추가할 데이터를 작성한다.
+ seq.nextval을 사용해 일련번호를 계산하지 않고 데이터를 삽입할 수 있었다.

```
insert into tblMovie values(seq.nextval, '클라우스', '2019-11-15', 96, 1, 3, null);
insert into tblMovie values(seq.nextval, '그린 북', '2019-01-09', 130, 2, 4, 4);
insert into tblMovie values(seq.nextval, '가버나움', '2019-01-24', 126, 3, 2, 6);
insert into tblMovie values(seq.nextval, '밥정', '2020-10-07', 82, 1, 2, 4);
insert into tblMovie values(seq.nextval, '장민호 드라마 최종회', '2022-01-24', 106, 1, null, 2);
insert into tblMovie values(seq.nextval, '디지몬 어드벤처 라스트 에볼루션 : 인연', '2021-02-17', 114, 2, 3, 2);
insert into tblMovie values(seq.nextval, '베일리 어게인', '2018-11-22', 100, 1, null, null);
```

<br> <br> <br>

### 피드백


