<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>fastcampus</title>
  <link rel="stylesheet" href="<c:url value='/css/wishlist.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/wishlistmodal.css'/>">

    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>

  <style>


  </style>

</head>
<div id="menu">
  <ul>
    <li id="logo">fastcampus</li>
    <li><a href="<c:url value='/'/>">Home</a></li>
    <li><a href="<c:url value='/board/list'/>">Board</a></li>
    <li><a href="<c:url value='/login/login'/>">login</a></li>
    <li><a href="<c:url value='/register/add'/>">Sign in</a></li>
    <li><a href=""><i class="fas fa-search small"></i></a></li>
  </ul>
</div>
<%--<h1>찜한 상품(${totalCnt}) 찜한 상품은 최대 200개까지 지정됩니다.</h1>--%>
<%--<hr />--%>
<script>
  let msg = "${msg}"
  if(msg=="add") alert("장바구니에 상품이 담겼습니다");
  if(msg=="addmore") alert("장바구니에 상품이 담겼습니다\n이미 담은 상품의 수량을 추가했습니다");
</script>

<div class="title">
  <h2 class="h2">
    찜한 상품(${totalCnt})
  </h2>
  <span class="titlespan">
      찜한 상품은 최대 200개까지 저장됩니다
    </span>
</div>
<c:forEach var="product"  items="${list2}">
  <div class="a">
    <a href="">
      <img src="${product.resv_photo_upload_path}" alt="">
    </a>

    <div class="b">
      <div class="c">
        <a href="">${product.name}</a>
        <div class="d">
                                 <%--   != 대신에 ne도 가능--%>
          <c:if test="${product.dc_rate != 0}">
            <span class="span1">${product.dc_rate}%</span>
          </c:if>
          <span class="span2">${product.prc - (product.prc / 100 * product.dc_rate)}원</span><span class="span3">${product.prc}원</span>
        </div>
      </div>

      <div class="e">
        <button class="css-1h4lltl e4nu7ef3" type="button" width="104" height="36" radius="4" onclick=remove(${product.idx})>삭제</button>
        <button class="css-102v0ri e4nu7ef3" id="show" type="button" width="104" height="36" radius="4" onclick= show('${product.name}',${product.prc})><span class="css-ymwvow e4nu7ef1"><img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzYiIGhlaWdodD0iMzYiIHZpZXdCb3g9IjAgMCAzNiAzNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTM2IDM2SDBWMGgzNnoiLz4KICAgICAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSg1LjE2NCA2LjU0NykiIHN0cm9rZT0iIzVmMDA4MCIgc3Ryb2tlLWxpbmVjYXA9InNxdWFyZSIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIxLjciPgogICAgICAgICAgICA8cGF0aCBkPSJtMjUuNjggMy42Ni0yLjcyIDExLjU3SDcuMzdMNC42NiAzLjY2eiIvPgogICAgICAgICAgICA8Y2lyY2xlIGN4PSIyMC41MiIgY3k9IjIwLjc4IiByPSIyLjE0Ii8+CiAgICAgICAgICAgIDxjaXJjbGUgY3g9IjkuODEiIGN5PSIyMC43OCIgcj0iMi4xNCIvPgogICAgICAgICAgICA8cGF0aCBkPSJNMCAwaDMuOGwxLjc2IDcuNSIvPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+Cg==" alt="" class="css-1m3kac1 e4nu7ef0">담기</span></button>
      </div>
    </div>
  </div>

  </c:forEach>

<div class="background">

    <div class="popup">



        <div class="b1">
            <div id="c2" class="c1">
                <span id="c3">[호텔 컬렉션] 한우만두</span>
            </div>
            <div class="d1">
                <div class="e1">
                    <span class="span11">10%</span><span class="span22">1200원</span><span class="span33">1500원</span>
                </div>
                <div class="f1">
                    <button class="button1" type="button" ></button>
                    <div class="count">
                        1
                    </div>
                    <button class="button2" type="button" width="104" height="36" radius="4"></button>
                </div>
            </div>
        </div>

        <div class="totalprice">
            <div class="total1">
                <p class="total2">
                    합계
                </p>
                <div>
              <span class="price">
                66,000
              </span>
                    <span>
                원
              </span>
                </div>
            </div>
        </div>

        <div id="close" class="btn-container">
            <button class="cancle-btn">
                <span style="font-size: 16px;">취소</span>
            </button>
            <button class="insert-btn">
                <span style="font-size: 16px;">장바구니 담기</span>
            </button>
        </div>



    </div>




</div>




<div style="text-align:center">

  </table>
  <script>

    function remove(prod_idx){
      if(!confirm("정말로 삭제하시겠습니까")) return;
      let form = document.getElementById("form");
      form.setAttribute("action",'<c:url value="/mypage/removeWishlist?prod_idx='+prod_idx+'"/>')
      form.setAttribute("method", "post");
      form.submit();
      <%--location.href='<c:url value="/mypage/removeWishlist?prod_idx='+prod_idx+'"/>'--%>
    }

    function insertCart(prod_idx){
      if(!confirm("정말로 담을건가요?")) return;
      let form = document.getElementById("form");
      form.setAttribute("action",'<c:url value="/mypage/insertCart?prod_idx='+prod_idx+'"/>')
      form.setAttribute("method", "post");
      form.submit();
      <%--location.href='<c:url value="/mypage/wishlistremove?prod_idx='+prod_idx+'"/>'--%>
    }

    function show(productname,productprc) {
        console.log(productname,productprc);
        let name = productname;

        console.log(name);
        console.log(document.getElementById('c2'))
        console.log(document.getElementById('c2').innerHTML)
        document.querySelector(".background").className = "background show";
        document.getElementById('c3').innerHTML = name;


    }

    function close() {
        document.querySelector(".background").className = "background";
    }

    document.querySelector("#show").addEventListener("click", show);
    document.querySelector("#close").addEventListener("click", close);

  </script>
</div>
</body>
</html>