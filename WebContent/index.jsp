<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <style>
        *{
            margin : 0;
            padding : 0;
            box-sizing : content-box;
        }

        td{
            text-align: center;
        }
        span{
            font-size : x-large;
        }
    </style>
</head>
<body>
<h1>조 이름과 6개 숫자 입력</h1>
	<form name="mainForm" method="post" action="${root }/lotto">
	<input type="hidden" name="action" value="regist" />
    <table>
        <tr>
            <td colspan="3"><label for="team">팀이름:</label></td>
            <td colspan="3"><input type="text" id="team" name="team" size="100" style="width: 70%;"></td>
        </tr>
        <tr>
            <th><label for="num1">숫자 1:</label></th>
            <th><label for="num2">숫자 2:</label></th>
            <th><label for="num3">숫자 3:</label></th>
            <th><label for="num4">숫자 4:</label></th>
            <th><label for="num5">숫자 5:</label></th>
            <th><label for="num6">숫자 6:</label></th>
        </tr>
        <tr>
            <td><input type="range" id="num1" name="num1" min="1" max="45"></td>
            <td><input type="range" id="num2" name="num2" min="1" max="45"></td>
            <td><input type="range" id="num3" name="num3" min="1" max="45"></td>
            <td><input type="range" id="num4" name="num4" min="1" max="45"></td>
            <td><input type="range" id="num5" name="num5" min="1" max="45"></td>
            <td><input type="range" id="num6" name="num6" min="1" max="45"></td>
        </tr>
        <tr>
            <td><span id="rangeValue1"></span></td>
            <td><span id="rangeValue2"></span></td>
            <td><span id="rangeValue3"></span></td>
            <td><span id="rangeValue4"></span></td>
            <td><span id="rangeValue5"></span></td>
            <td><span id="rangeValue6"></span></td>
        </tr>
    </table>
    <button type="button" onclick="checkDupl()">전송</button>
	</form>
	
	<div id="linkDiv" style="display: none;">
	    <a href="${root}/lotto?action=result">결과로</a>
	    <a href="${root}/lotto?action=clear&key=dlrjtdmschrlghkfldzmdlqslek">초기화</a>
	</div>
<br/>
<script>
    for(let i = 1 ; i <= 6 ; ++i){
        // 첫 번째 range input 태그에 대한 이벤트 핸들러 함수
        document.getElementById("num"+i).addEventListener("input", function() {
            document.getElementById("rangeValue" + i).innerHTML = this.value;
        });
    }

    function checkDupl(){
        let nums = [];
        nums.push(document.getElementById("num1").value)
        nums.push(document.getElementById("num2").value)
        nums.push(document.getElementById("num3").value)
        nums.push(document.getElementById("num4").value)
        nums.push(document.getElementById("num5").value)
        nums.push(document.getElementById("num6").value)

        // 중복 체크
        let isDuplicate = nums.some(function(num, index) {
            return nums.indexOf(num) !== index;
        });

        if (isDuplicate) {
            alert("중복된 숫자가 있습니다.");
        } else {
        	document.mainForm.submit();
        }
    }
    console.log(location.hostname)
    if(location.hostname === 'localhost') {
    	console.log(1)
    	document.getElementById("linkDiv").style.display = "block";
    }
    //중복값 체크
</script>
</body>
</html>
<%--
  Created by IntelliJ IDEA.
  User: SSAFY
  Date: 2023-03-31
  Time: 오후 3:24
  To change this template use File | Settings | File Templates.
--%>