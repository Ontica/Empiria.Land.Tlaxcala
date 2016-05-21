﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Empiria.Land.WebApp.RecordingSeal" CodeFile="recording.seal.aspx.cs" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
  <title>&nbsp;</title>
  <meta http-equiv="Expires" content="-1" />
  <meta http-equiv="Pragma" content="no-cache" />
  <link href="../themes/default/css/official.document.css" type="text/css" rel="stylesheet" />
  </head>
  <body>
    <table>
      <tr>
        <td>
          <img class="logo" src="../themes/default/customer/government.seal.png" style="height:84pt" alt="" title="" />
        </td>
        <td style="text-align:center;width:95%">
	        <h3>DIRECCIÓN DE NOTARÍAS Y REGISTROS PÚBLICOS</h3>
          <h4>GOBIERNO DEL ESTADO DE TLAXCALA</h4>
          <% if (!document.IsHistoricDocument) { %>
          <h2 style="padding-top:0">SELLO REGISTRAL</h2>
          <% } else { %>
          <h2 style="padding-top:0">SELLO REGISTRAL DE PARTIDA HISTÓRICA</h2>
          <% } %>
          <h5><%=document.UID%></h5>
        </td>
      </tr>
    </table>
    <div class="certificate-text">
      <p>
        <%=GetPrelationText()%>
      </p>
      <p>
        <%=base.GetRecordingActsText()%>
      </p>
      <p style="text-align:justify;font-size:9pt">
        <%=GetDocumentDescriptionText()%>
      </p>
      <p>
        <%=GetPaymentText()%>
      </p>
      <p>
        <%=GetRecordingPlaceAndDate()%>
      </p>
    </div>
    <div class="footNotes">
      <table >
        <% if (!document.IsHistoricDocument) { %>
        <tr>
          <td colspan="3" style="text-align:center;font-size:10pt" >
            <br /><br />
            <b><%=GetRecordingSignerName()%></b>
            <br />
            <%=GetRecordingSignerPosition()%>
            <br />&nbsp;
          </td>
        </tr>
        <% } %>
        <tr>
          <td><b>Sello digital:</b><br />
            <%=Empiria.EmpiriaString.DivideLongString(GetDigitalSeal(), 64, "&#8203;")%>
            <br />
            <%=GetRecordingOfficialsInitials()%>
          </td>
          <td style="text-wrap:none">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
          <td>
            <img alt="" title="" src="../user.controls/barcode.aspx?data=<%=document.UID%>" />
            <br />
            <span><%=document.UID%> <%=transaction.IsReentry ? "&nbsp; <b>(Reingreso)</b>" : "" %></span>
          </td>
        </tr>
      </table>
    </div>
  </body>
</html>
