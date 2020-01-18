# RORLAB 2

- 레일스가이드 한글화 작업 https://railsguides.kr
- 레일스 튜토리얼 : rTutorials
- 즐겨찾기 URLs : rLinks
- 구인&구직 : rEngineers
- 레일스 개발한 웹사이트 등록소 : rSites
- 레일스용어집 : rGlossary
- 블로그 운영 : rBlog
- 초보자를 위한 실시간 채팅

# rCable 채팅기능 구현하기

ActionCable 기능을 사용하여 주제별 공개채팅 기능을 구현한다.

Rcable 모델

- 채팅방 같은 역할을 한다.

  ```bash
  $ bin/rails g scaffold Rcable name description:text user:references
  ```

Message 모델

- 채팅 메시지를 저장하는 모델

  ```bash
  $ bin/rails g scaffold  Message user:references rcable:references content:text
  ```

### 2020.1.17

- Rcable 수정/삭제 권한 지정
- Rcable : 업로드 파일 전송하기

### 2020.1.18

- Kramdown 라인번호 옵션 설정하는 방법 OK

### 2020.1.19

- 
