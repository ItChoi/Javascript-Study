# ES6
- ES6 브라우저 호환성
- ES6 문법 비교

### 1. ES6 브라우저 호환성
- ECMAScript 호환성 체크 사이트 (참조 1)
- ES6 호환 사용
  - 크롬, 사파리, 파이어 폭스 등 에버그린 브라우저(사용자 업데이트 없이 자동 최선 업데이트를 수행하는 모던 브라우저)는 대부분의 ES6을 호환하고 있지만 IE의 경우 
  - babel, traceur, shim, ...등을 이용
    - babel
      - 트랜스 컴파일러 역할
        - 같은 레벨의 다른 언어로 변환
        - 프로그램의 소스 코드를 다른 언어로 변환하는 특수한 유형의 컴파일러.
        - 이전 버전의 프로그래밍 언어로 작성된 프로그램을 처리하여 동일한 언어의 최신 버전으로 변환하는 데 사용할 수도 있습니다.
      - 바벨을 사용하여 IE8까지 ES6 문법을 그대로 사용 가능
      - 언어 설계의 차이로 ES5를 ES6으로 전부 커버는 불가능
      - 실제 배포는 ES5 파일
  
### 2. ES6 문법 비교
- ES6 추가 문법
  - let과 const
    - let은 blcok-level scope
    - let은 중복 선언 불가, 값 변경 가능
    - const는 선언과 동시에 초기화를 해주어야 하며 값 변경 불가능
    ```javascript
    let a = "123";
    let a = "12345"; // x
    a = "12345"; // o

    const b; // x;
    const b = "123"; // o
    const b = "12345"; // x
    b = "12345678"; // x
    ```  
    <br/><br/>
  - Arrow Functions(화살표)
    - 람다 표현식을 더욱 간결하게 해주는 문법 추가
    - => (화살표)함수는 익명 함수이며 this의 값을 현재 문맥에 바인딩
    ```javascript
    // ES5 
    var _this = this;
    $('.btn').click(function() {
        _this.sendData();
    });
    
    // ES6 
    $('.btn').click(() => {
        this.sendData();
    });    
    ```     
    <br/><br/>

  - 클래스
    - ES6에는 class 키워드 추가되어 ES5의 prototype 기반 상속 보다 명확하게 class 정의 가능 (getter / setter / static 키워드 / super())
    - 호이스팅 지원 X
  <br/><br/>

  - for of문
    - 기존 for in문
      - object 루프를 위해 많이 사용
      - prototype chain도 순회
      - 순서가 무작위
      - 객체의 프로퍼티를 가져온다.
    - for of문
      - 배열 데이터 제어를 위한 루프문
      - 배열 요소들만 루프에 포함
      - 배열의 값을 가져온다.
      <br/><br/>

  - module import
    ```javascript
    // ES5 
    var React = require('react');
    var Router = require('react-router');

    var Route = Router.Route;
    var DefaultRoute = Router.DefaultRoute;
    var NotFoundRoute = Router.NotFoundRoute;
    
    // ES6 
    import React from 'react';
    import {Route, DefaultRoute, NotFoundRoute} from 'react-router';
    ```  
    <br/><br/>

  - 디폴트 파라미터 핸들링
    ```javascript
    function f (x, y = 7, z = 42) {
        return x + y + z
    }
    console.log(f(1));

    function f (x, y, ...a) {
        console.log(a);
        return (x + y) * a.length
    }
    console.log(f(1, 2, "hello", true, 7));
    ```
    <br/></br>

  - Template Literals
    ```javascript
    var customer = { name: "Foo" }
    var card = { amount: 7, product: "Bar", unitprice: 42 }
    var message = `Hello ${customer.name},
    want to buy ${card.amount} ${card.product} for
    a total of ${card.amount * card.unitprice} bucks?`
    ```

  - Enhanced Object Properties
    ```javascript
    var x = 0, y = 0
    obj = { x, y }

    ```
    <br/><br/>

  - Generator
    ```javascript
    function* myGen() {
      yield 1;
      yield 2;
      yield 3;
      return 4;
    }
    const myItr = myGen();
    console.log(myItr.next());  // {value:1, done:false}
    console.log(myItr.next());  // {value:2, done:false}
    console.log(myItr.next());  // {value:3, done:false}
    console.log(myItr.next());  // {value:4, done:true}
    ```
    <br/><br/>

  - formatting
    - number formatting
    ```javascript
    var l10nEN = new Intl.NumberFormat("en-US")
    var l10nDE = new Intl.NumberFormat("de-DE")
    l10nEN.format(1234567.89) === "1,234,567.89"
    l10nDE.format(1234567.89) === "1.234.567,89"
    ```

    - Date/Time formatting
    ```javascript
    var l10nEN = new Intl.DateTimeFormat("en-US")
    var l10nDE = new Intl.DateTimeFormat("de-DE")
    l10nEN.format(new Date("2015-01-02")) === "1/2/2015"
    l10nDE.format(new Date("2015-01-02")) === "2.1.2015"
    ```

### 참조
1. [http://kangax.github.io/compat-table/es6/](http://kangax.github.io/compat-table/es6/ "ECMAScript 브라우저 호환 체크")
2. [https://www.computerhope.com/jargon/t/transcompiler.htm](https://www.computerhope.com/jargon/t/transcompiler.htm "트랜스 컴파일러 설명")
3. [http://es6-features.org/#Lexicalthis](http://es6-features.org/#Lexicalthis "ES5와 ES6 비교")