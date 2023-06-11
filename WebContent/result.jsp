<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="lotto.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <style>
      * {
        padding: 0;
        margin: 0;
      }
      body {
        font-size: 2rem;
      }
      .container {
        height: 100vh;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
      }
      table {
        table-layout: fixed;
        width: 800px;
        border: 1px solid #345;
      }
      td {
        text-align: center;
        padding: 10px;
        border: 1px solid #345;
      }
      td:first-child {
        background: black;
        color: white;
      }
      td.choice {
        background: rgb(201, 24, 177);
        color: white;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <div class="lotto-area">
        <h2 class="title">로또게임</h2>
        <div class="lotto border border-secondary border-5 bg-warning">
          <span id="lottoSpan1" class="lotto__ball">1</span>
          <span id="lottoSpan2" class="lotto__ball">2</span>
          <span id="lottoSpan3" class="lotto__ball">3</span>
          <span id="lottoSpan4" class="lotto__ball">4</span>
          <span id="lottoSpan5" class="lotto__ball">5</span>
          <span id="lottoSpan6" class="lotto__ball">6</span>
        </div>
        <div class="text-center m-5">
          <button id="lottoBtn">추첨시작</button>
        </div>
      </div>
	
      <table id="lottoTbl">
      <c:forEach var="data" items="${list}">
        <tr>
          <td>${data.team}</td>
          <td>${data.num1}</td>
          <td>${data.num2}</td>
          <td>${data.num3}</td>
          <td>${data.num4}</td>
          <td>${data.num5}</td>
          <td>${data.num6}</td>
          <td>0</td>
        </tr>
      </c:forEach>
      </table>
    </div>
    <script src="lotto.js"></script>
  </body>
</html>
