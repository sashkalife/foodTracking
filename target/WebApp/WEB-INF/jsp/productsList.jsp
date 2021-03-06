<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html><head><title>Enjoy your day</title></head>
<body>
<h1 align="center">Enjoy your day</h1>

<form align="right" name="LogOut" method="GET" action="servlet">
    <input type="hidden" name="command" value="logOut" />
    <input type="submit" value="Log out"/>
</form>

<form align="center" name="addEatenProducts" method="GET" action="servlet">
    <table width="60%" border="0" cellpadding="0" cellspacing="0" align="center">
        <tr colspan="2"  valign="center" align="center">
            <td width="25%">
                <c:if test = "${categoryProducts.id != 1}">
                    <input type="submit" name ="previous category" value="previous category"/>
                </c:if>
            </td>
            <td width="40%"><h4 align="center">Products category - ${categoryProducts.name}</h4></td>
            <td width="25%">
                <c:if test = "${!lastCategory}">
                    <input type="submit" name ="next category" value="next category"/>
                </c:if>

            </td>
        </tr>
        <tr colspan="0"  valign="center" align="center">
            <td width="25%"></td>
            <td width="40%">
                <c:if test="${not empty productsList}">
                    <h4 align="center">Choose product and its number </h4>
                </c:if>
                <c:if test="${empty productsList}">
                    <h4 align="center">Category doesn't have any products</h4>
                </c:if>
            </td>
            <td width="25%"></td>
        </tr>
    </table>
    <c:if test="${not empty errorMessage}">
        <h5 align="center" style="color:#ff0000">${errorMessage}</h5>
    </c:if>
    <table width="90%" border="2" cellpadding="7" cellspacing="0" align="center">
        <tr colspan="2" bgcolor="#D3EDF6" valign="center" align="center">
            <td width="35%">Назва продукту</td>
            <td width="8%">Енергетична цінність</td>
            <td width="8%">білки</td>
            <td width="8%">вуглеводи</td>
            <td width="8%">жири</td>
            <td width="28%">Кількість</td>
        </tr>
    </table>
    <input type="hidden" name="command" value="addAndShowEatenProducts" />
    <input type="hidden" name="categoryId" value=${categoryProducts.id} />
    <input type="hidden" name="pageNumber" value=${pageNumber} />
        <c:forEach var = "products" items = "${productsList}">
            <table width="90%" border="1" cellpadding="7"  align="center">
                <tr colspan="2"  valign="center" align="center">
                    <td width="35%" height="7%">${products.name}</td>
                    <td width="8%" height="3">${products.energyValue}</td>
                    <td width="8%" height="3">${products.proteins}</td>
                    <td width="8%" height="3">${products.carbohydrates}</td>
                    <td width="8%" height="3">${products.fats}</td>
                    <td width="28%" height="7%"> Number :
                        <input type="hidden" name="id" value=${products.id} />
                        <input type="text" value="0" name="number"  required="" />
                    </td>
                </tr>
            </table>
        </c:forEach>
    <table width="90%" border="0" cellpadding="0" cellspacing="0" align="center">
        <tr colspan="2"  valign="center" align="center">
            <td width="40%">
                <c:if test = "${pageNumber >0}">
                    <input align="right" type="submit" name ="previous products" value="previous products"/>
                </c:if>
            </td>
            <td width="30%"><input align="center" type="submit" name ="Add All Products" value="Add All Products"/></td>
            <td width="40%">
                <c:if test = "${!lastPageProd}">
                    <input align="left" type="submit" name ="next products" value="next products"/></td>
                </c:if>

        </tr>
    </table>

</form>


<form align="center" name="AddProduct" method="GET" action="servlet">

    <input type="hidden" name="command" value="addNewProduct" />
    <input type="hidden" name="categoryId" value="${categoryProducts.id}" /><h3 align="center">Add new own product</h3>
    <input type="hidden" name="pageNumber" value="pageNumber" />
    <c:if test="${not empty errorMessageAdd}">
        <h5 style="color:#ff0000">${errorMessageAdd}</h5>
    </c:if>

    Name: <input type="text" name="name" value="" required=""/>
    Energy value <input type="number" name="energyValue" step="0.001" value="" required=""/>
    Proteins <input type="text" name="proteins" step="0.001" value="" required=""/>

    Carbohydrates <input type="text" name="carbohydrates" step="0.001" value="" required=""/>

    Fats <input type="text" name="fats" step="0.001" value="" required=""/>

<!--    <select name="Dimension3">
        <option value="gramm">gramm</option>
        <option selected value="kcal">kcal</option>
    </select> -->

    <input type="submit" value="Create product"/>
</form>

</body></html>