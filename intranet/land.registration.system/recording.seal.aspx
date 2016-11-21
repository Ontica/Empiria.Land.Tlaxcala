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
          <% if (!document.IsClosed) { %>
          <h2 class="warning" style="padding-top:0">ESTE DOCUMENTO NO HA SIDO CERRADO</h2>
          <% } else if (!document.IsHistoricDocument) { %>
          <h2 style="padding-top:0">SELLO REGISTRAL</h2>
          <% } else { %>
          <h2 style="padding-top:0">SELLO REGISTRAL DE PARTIDA HISTÓRICA</h2>
          <% } %>
          <h5><%=document.UID%></h5>
          <% if (transaction.IsReentry) { %>
            <h5><b>(Reingreso)</b></h5>
          <% } %>
        </td>
      </tr>
    </table>

    <table>
      <tr>
        <td style="vertical-align:top">
          <img style="margin-left:8pt" alt="" title="" src="../user.controls/barcode.aspx?data=<%=document.UID%>&vertical=true&show-text=true&height=32" />
        </td>
        <td>
          <div class="document-text">
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
        </td>
      </tr>
    </table>
    <div class="footNotes">
      <table >
        <% if (!document.IsClosed) { %>
        <tr>
          <td colspan="3" style="text-align:center;font-size:10pt" >
            <br /><br />
            <b class="warning">*** ESTE DOCUMENTO AUN NO HA SIDO CERRADO. ***</b>
            <br />&nbsp;
          </td>
        </tr>
        <% } else if (!document.IsHistoricDocument) { %>
        <tr>
          <td colspan="3" style="text-align:center;font-size:11pt" >
            <br /><br /><br />
            <b><%=GetRecordingSignerName()%></b>
            <br />
            <%=GetRecordingSignerPosition()%>
            <br />&nbsp;
          </td>
          <td style="text-wrap:none">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
        </tr>
        <% } %>
        <tr>
          <td style="vertical-align:top;width:100px">
            <img style="margin-left:-12pt;margin-top:-12pt" alt="" title="" src="../user.controls/qrcode.aspx?size=120&data=http://registropublico.tlaxcala.gob.mx/consultas/?type=document%26uid=<%=document.UID%>%26hash=<%=document.QRCodeSecurityHash()%>" />
            <div style="margin-top:-12pt;font-size:7pt;white-space:nowrap">
              Valide este documento<br />
              <b><%=document.UID%></b>
            </div>
          </td>
          <td style="vertical-align:top;width:90%;white-space:nowrap">
            <b>Código de verificación:</b>
            <br />
            &nbsp; &nbsp;<%=base.document.QRCodeSecurityHash()%>
            <br />
            <b>Sello digital:</b>
            <br />
            <% if (!document.IsClosed) { %>
            <span class="warning">** ESTE DOCUMENTO NO ES OFICIAL **</span>
            <% } else { %>
            &nbsp; &nbsp;<%=base.GetDigitalSeal().Substring(0, 64)%>
            <% } %>
            <br />
            <b>Firma digital:</b>
            <br />
            &nbsp; &nbsp;Documento firmado de forma autógrafa.
            <br />
            <b>Registró:</b> <%=GetRecordingOfficialsInitials()%>
            <br />
            <div style="font-size:7pt;margin-top:4pt;text-align:left;">
              Verifique la <u>autenticidad</u> de este documento y el estado de su predio. Para ello lea los códigos QR con su<br />
              celular o dispositivo móvil, o visite nuestro sitio <b>http://registropublico.tlaxcala.gob.mx</b>.
            </div>
          </td>
          <td style="vertical-align:top">
            <% if (!base.UniqueInvolvedResource.IsEmptyInstance && document.IsClosed) { %>
            <img style="margin-right:-12pt;margin-left:-12pt;margin-top:-12pt" alt="" title="" src="../user.controls/qrcode.aspx?size=120&data=http://registropublico.tlaxcala.gob.mx/consultas/?type=resource%26uid=<%=base.UniqueInvolvedResource.UID%>%26hash=<%=base.UniqueInvolvedResource.QRCodeSecurityHash()%>" />
            <div style="margin-top:-12pt;font-size:7pt;white-space:nowrap">
              Consultar folio real/predio<br />
              <b><%=base.UniqueInvolvedResource.UID%></b>
            </div>
            <% } %>
          </td>
        </tr>
      </table>

    </div>

  </body>
</html>
