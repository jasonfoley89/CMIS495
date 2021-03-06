<%-- Set session-scoped variable to track the view user is coming from.
     This is used by the language mechanism in the Controller so that
     users view the same page when switching between English and Russian. --%>
<c:set var="view" value="/checkout" scope="session"/>


<%-- Add Russian field validation messages if 'ru' is the chosen locale --%>
<c:choose>
    <%-- When 'language' session attribute hasn't been set, check browser's preferred locale --%>
    <c:when test="${empty language}">
        <c:if test="${pageContext.request.locale.language eq 'ru'}">

        </c:if>
    </c:when>
    <%-- Otherwise, check 'language' session attribute --%>
    <c:otherwise>
        <c:if test="${sessionScope['javax.servlet.jsp.jstl.fmt.locale.session'] eq 'ru'}">

        </c:if>
    </c:otherwise>
</c:choose>

<script type="text/javascript">

    $(document).ready(function() {
        $("#checkoutForm").validate({
            rules: {
                name: "required",
                address: {
                    required: true
                },
                phone: {
                    required: true,
                    number: true,
                    minlength: 9
                },
                email: {
                    required: true,
                    email: true
                },
                creditcard: {
                    required: true,
                    creditcard: true
                }
            }
        });
    });
</script>


<%-- HTML markup starts below --%>

<div id="singleColumn">

    <h2><fmt:message key="checkout"/></h2>

    <p><fmt:message key="checkoutText"/></p>

    <c:if test="${!empty orderFailureFlag}">
        <p class="error"><fmt:message key="orderFailureError"/></p>
    </c:if>

    <form id="checkoutForm" action="<c:url value='purchase'/>" method="post">
        <table id="checkoutTable">
            <c:if test="${!empty validationErrorFlag}">
                <tr>
                    <td colspan="2" style="text-align:left">
                        <span class="error smallText"><fmt:message key="validationErrorMessage"/>

                            <c:if test="${!empty nameError}">
                                <br><span class="indent"><fmt:message key="nameError"/></span>
                            </c:if>
                            <c:if test="${!empty addressError}">
                                <br><span class="indent"><fmt:message key="addressError"/></span>
                            </c:if>
                            <c:if test="${!empty cityError}">
                                <br><span class="indent"><fmt:message key="cityError"/></span>
                            </c:if>
                            <c:if test="${!empty stateRegionError}">
                                <br><span class="indent"><fmt:message key="stateRegionError"/></span>
                            </c:if>
                            <c:if test="${!empty countryError}">
                                <br><span class="indent"><fmt:message key="countryError"/></span>
                            </c:if>
                            <c:if test="${!empty zipCodeError}">
                                <br><span class="indent"><fmt:message key="zipCodeError"/></span>
                            </c:if>
                            <c:if test="${!empty ccError}">
                                <br><span class="indent"><fmt:message key="ccError"/></span>
                            </c:if>
                            <c:if test="${!empty phoneError}">
                                <br><span class="indent"><fmt:message key="phoneError"/></span>
                            </c:if>
                            <c:if test="${!empty emailError}">
                                <br><span class="indent"><fmt:message key="emailError"/></span>
                            </c:if>

                        </span>
                    </td>
                </tr>
            </c:if>
            <tr>
                <td><label for="name"><fmt:message key="customerName"/>:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="45"
                           id="name"
                           name="name"
                           value="${param.name}">
                </td>
            </tr>
            <tr>
                <td><label for="address"><fmt:message key="address"/>:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="45"
                           id="address"
                           name="address"
                           value="${param.address}">  
                </td>
            </tr>
            <tr>
                <td><label for="city"><fmt:message key="city"/>:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="45"
                           id="city"
                           name="city"
                           value="${param.city}">  
                </td>
            </tr>
            <tr>
                <td><label for="stateRegion"><fmt:message key="stateRegion"/>:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="45"
                           id="stateRegion"
                           name="stateRegion"
                           value="${param.stateRegion}">  
                </td>
            </tr>
            <tr>
                <td><label for="country"><fmt:message key="country"/>:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="45"
                           id="country"
                           name="country"
                           value="${param.country}">  
                </td>
            </tr>
            <tr>
                <td><label for="zip"><fmt:message key="zip"/>:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="45"
                           id="zip"
                           name="zip"
                           value="${param.zip}">  
                </td>
            </tr>  
            <tr>
                <td><label for="phone"><fmt:message key="phone"/>:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="16"
                           id="phone"
                           name="phone"
                           value="${param.phone}">
                </td>
            </tr>
            <tr>
                <td><label for="email"><fmt:message key="email"/>:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="45"
                           id="email"
                           name="email"
                           value="${param.email}">
                </td>
            </tr>

            <tr>
                <td><label for="creditcard"><fmt:message key="creditCard"/>:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="19"
                           id="creditcard"
                           name="creditcard"
                           class="creditcard"
                           value="${param.creditcard}">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="<fmt:message key='submit'/>">
                </td>
            </tr>


        </table>
    </form>

    <div id="infoBox">

        <ul>
            <li><fmt:message key="nextDayGuarantee"/></li>
            <li><fmt:message key="deliveryFee1"/>
                <fmt:formatNumber type="currency" currencySymbol="$ " value="${initParam.tax}"/>
                <fmt:message key="deliveryFee2"/></li>
        </ul>

        <table id="priceBox">
            <tr>
                <td><fmt:message key="subtotal"/>:</td>
                <td class="checkoutPriceColumn">
                    <fmt:formatNumber type="currency" currencySymbol="$ " value="${cart.subtotal}"/></td>
            </tr>
            <tr>
                <td><fmt:message key="tax"/>:</td>
                <td class="checkoutPriceColumn">
                    <fmt:formatNumber type="currency" currencySymbol="$ " value="${initParam.tax}"/></td>
            </tr>
            <tr>
                <td class="total"><fmt:message key="total"/>:</td>
                <td class="total checkoutPriceColumn">
                    <fmt:formatNumber type="currency" currencySymbol="$ " value="${cart.total}"/></td>
            </tr>
        </table>
    </div>
</div>