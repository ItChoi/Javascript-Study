<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인사이드 자바스크립트 5장 - 실행 컨텍스트와 클로저</title>
</head>
<body>


<script type="text/javascript">
 // 클로저 예제
function HelloFunc(func) {
	this.greeting = "hello";
}
 
HelloFunc.prototype.call = function(func) {
	func ? func(this.greeting) : this.func(this.greeting);
} 

var userFunc = function(greeting) {
	console.log(greeting);
}

var objHello = new HelloFunc();
objHello.func = userFunc;
objHello.call();

function saySomething(obj, methodName, name) {
	 return (function(greeting) {
		 return obj[methodName](greeting, name);
	 });
}
 
function newObj(obj, name) {
	obj.func = saySomething(this, "who", name);
	return obj;
} 

newObj.prototype.who = function(greeting, name) {
	console.log(greeting + " " + (name || "everyone"));
}

var obj1 = new newObj(objHello, "zzoon");
 
obj1.call();

// 합수의 캡슐화 예제
var buffAr = [
	'I am ',
	'',
	'. I live in ',
	'',
	'. I\'am ',
	'',
	' years old.',
];

function getCompletedStr(name, city, age) {
	buffAr[1] = name;
	buffAr[3] = city;
	buffAr[5] = age;
	
	return buffAr.join(''); // Array.join() -> 배열의 값을 구분자로 구분하여 원하는 문자열로 변환시켜준다.
}

var str = getCompletedStr('zzoon', 'seoul', 16);
console.log(str);

// 위 buffAr은 전역 변수로 설정하여 여러 함수에서의 접근이 가능하여 값이 의도와는 다르게 변경될 수 있다.
// 이러한 충돌 가능성을 대비하여 클로저를 활용할 수 있다.

// 전역 실행 컨텍스트, 실행 컨텍스트의 스코프를 이용하여 
// 즉시 실행 함수에 변수가 할당되어 사용 가능하도록 한다.
// 스코프에는 [0]전역객체 -> [1]익명함수1 변수객체 -> [2]익명함수2 변수객체
var getCompletedStr = (function() {
	var buffAr = [
		'I am ',
		'',
		'. I live in ',
		'',
		'. I\'am ',
		'',
		' years old.',
	];
	
	return (function(name, city, age) {
		buffAr[1] = name;
		buffAr[3] = city;
		buffAr[5] = age;
		
		return buffAr.join('');
	});
})();

var str = getCompletedStr('zzoon', 'seoul', 16);
console.log(str);

// setTimeout()에 지정되는 함수의 사용자 정의
function callLater(obj, a, b) {
	return (function() {
		obj["sum"] = a + b;
		console.log(obj["sum"]);
	});
}

var sumObj = {
	sum : 0
};

var func =   callLater(sumObj, 1, 2);
setTimeout(func, 500);

// 루프 안 클로저 주의
function countSeconds(howMany) {
	for (var i = 1; i <= howMany; i++) {
		setTimeout(function() {
			console.log(i);
		}, i * 1000);
	}
}

countSeconds(3);
</script>


</body>
</html>














