﻿<%@ Control Language="C#" AutoEventWireup="false" Inherits="Empiria.Land.WebApp.RecordingPartyViewerControl" CodeFile="recording.party.viewer.control.ascx.cs" %>
<tr>
  <td>
    <table class="editionTable">
    <tr>
      <td class="lastCell">
        <div style="overflow:auto;width:620px;">
          <table class="details" style="width:99%">
            <tr class="detailsHeader">
              <td width="90%">Nombre</td>
              <td>F. Nac / RFC</td>
              <td>Titularidad</td>
              <td>Dominio</td>
            </tr>
            <%=GetAntecedentRecordingActPartiesGrid()%>
          </table>
        </div>
      </td>
    </tr>
    <!--
    <tr>
      <td class="lastCell"><i>Antecedente: <a href="javascript:doOperation('showRecordingActPartyEditor')">Libro XXX, YYY, ZZZZ</a></i></td>
    </tr>
    !-->
    </table>
  </td>
</tr>
