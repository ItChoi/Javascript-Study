<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인사이드 자바스크립트 3장 - 데이터 타입과 연산자</title>
</head>
<body>





<script type="text/javascript">
//숫자 타입
var intNum = 10;
var floatNum = 0.1;
console.log("intNum::: ", typeof intNum);
console.log("floatNum::: ", typeof floatNum);

// 문자열 타입
var singleQuoteStr = 'single quote string';
var doubleQuoteStr = "double quote string";
var singleChar = 'a';
console.log("singleQuoteStr::: ", typeof singleQuoteStr);
console.log("doubleQuoteStr::: ", typeof doubleQuoteStr);
console.log("singleChar::: ", typeof singleChar);

// 불린 타입
var boolVar = true;
console.log("boolVar::: ", typeof boolVar);

// undefined 타입
var emptyVar;
console.log("emptyVar::: ", typeof emptyVar);

// null 타입
var nullVar = null;
console.log("nullVar::: ", typeof nullVar);

console.log("=========================================================================");
	
// 객체 생성
// 1. Object() 생성자 함수 이용
	var foo1 = new Object();
	
	// foo 객체 프로퍼티 생성
	foo1.name = 'foo1';
	foo1.age = 30;
	foo1.gender = 'male';
	
	console.log("foo1 type of::: ", typeof foo1);
	console.log("foo1::: ", foo1);
	
// 2. 객체 리터럴 방식 이용
	var foo2 = {
		name : 'foo2',
		age : 32,
		gender : 'male'
	};
	console.log("foo2 type of::: ", typeof foo2);
	console.log("foo2::: ", foo2);

// 3. 생성자 함수 이용 (4장에서 살펴봄)
// 객체 프로퍼티 읽기/쓰기/갱신
// - 객체 프로퍼티에 접근하기 위해서 2가지 방식을 사용한다.
	var foo3 = {
		name : 'foo3',
		major : 'computer science'
	};
	
	// 객체 프로퍼티 읽기
	console.log("마침표 표기법 읽기:::: ", foo3.name);
	console.log("대괄호 표기법 읽기:::: ", foo3['name']);
	console.log("마침표 표기법 읽기:::: ", foo3.nickname);
	
	// 객체 프로퍼티 갱신
	foo3.major = 'electronics engineering';
	console.log("마침표 표기법 읽기:::: ", foo3.major);
	console.log("대괄호 표기법 읽기:::: ", foo3['major']);

	// 대괄호 표기법만을 사용해야 할 경우
	foo3['full-name'] = 'foo bar';
	console.log("대괄호 표기법 읽기:::: ", foo3['full-name']);
	console.log("마침표 표기법 읽기:::: ", foo3.full-name);
	console.log("마침표 표기법 읽기:::: ", foo3.full);
	console.log("마침표 표기법 읽기:::: ", foo3.name);
	
	
// for in 문과 객체 프로퍼티 출력
	var foo4 = {
		name : 'foo4',
		age: 21,
		major : 'computer science'
	};
	
	var prop;
	for (prop in foo4) {
		console.log("prop::: ", prop, " / foo4[prop]::: ", foo4[prop]);
	}

	
// 객체 프로퍼티 삭제
	var foo5 = {
		name : 'foo5',
		nickname : 'babo'
	};
	
	console.log("foo5 Nickname::: ", foo5.nickname);
	delete foo5.nickname;
	console.log("foo5 Nickname::: ", foo5.nickname);
	
	delete foo5;
	console.log("foo5 name::: ", foo5.name);
	
	
// 객체 참조
	var objA = {
		val : 40
	};
	
	var objC = {
		val : 50
	};
	
	var objB = objA;
	objB.val = 20;
	
	console.log("objA val::: ", objA.val);
	console.log("objB val::: ", objB.val);
	console.log("objC val::: ", objC.val);

	
// 객체 비교
	var a = 100;
	var b = 100;
	
	var objA = {
			val : 100	
	};
	
	var objB = {
			val : 100	
	};
	
	var objC = objB;
	
	console.log("a == b::: ", a == b);
	console.log("objA == objB::: ", objA == objB);
	console.log("objB == objC::: ", objB == objC);
	
	
// 참조에 의한 함수 호출 방식
	var a = 100;
	var objA = {
		val : 100	
	};
	
	function changeArg(num, obj) {
		num = 200;
		obj.val = 200;
		
		console.log("num1::: ", num);
		console.log("objA.val1::: ", obj.val);
	}
	
	changeArg(a, objA);
	
	console.log("num2::: ", a);
	console.log("obj.val2::: ", objA.val);
	

	
// 배열
// 배열 리터럴을 통한 5가지 원소를 가진 배열 생성
	var colorArr = ['orange', 'yellow', 'blue', 'green', 'red'];
	console.log("colorArr[0]::: ", colorArr[0]);
	console.log("colorArr[1]::: ", colorArr[1]);
	console.log("colorArr[4]::: ", colorArr[4]);

	var testArr = [];
	testArr[8] = 1;
	console.log("testArrLength::: ", testArr.length);

	
// 배열과 객체
	var emptyArray = [];
	var emptyObj = {};
	
	console.dir(emptyArray.__proto__);
	console.dir(emptyArray._proto_);
	console.dir("emptyObj.__proto__::: ", emptyObj.__proto__);
	
	
// 배열의 프로퍼티 동적 생성
	console.log("===================================배열의 프로퍼티 동적 생성====================================");
	var arr = ['zero', 'one', 'two'];
	console.log("arr.length::: ", arr.length);
	
	arr.color = 'blue';
	arr.name = 'number_array';
	console.log("arr.length::: ", arr.length);
	
	arr[3] = 'red';
	console.log("arr.length::: ", arr.length);
	
	console.dir(arr);

	
// splice(start, deleteCount, item...) 메서드
	var arr1 = ['zero', 'one', 'two', 'three'];
	
	delete arr1[2];
	console.log("arr1.length1::: ", arr1.length);
	
	
	arr1.splice(2, 1);
	console.log("arr1::: ", arr1);
	console.log("arr1.length2::: ", arr1.length);

	
// 유사 배열 객체
	var arr = ['bar'];
	
	var obj = {
		name : 'foo',
		length : 1
	};

	arr.push('bazzzz');
	console.log("arr::: ", arr);
	
	// obj.push('bazzzz');
	
	
	Array.prototype.push.apply(obj, ['baz']);
	console.log("obj:::", obj);
	
// 기본 타입과 표준 메서드
	var num = 0.5;
	console.log("num 메서드::: ", num.toExponential(1));
	
	console.log("문자열 charAt::: ", "test".charAt(2));
</script>


</body>
</html>