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
<br><img src="https://user-images.githubusercontent.com/111429706/185996776-66672996-f873-43b6-8d60-94e358c0a3eb.png" width="580" height="310"/>

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



