<%@ Page language="c#" Inherits="Empiria.Land.WebApp.LRSTransactionEditor" Codebehind="transaction.editor.aspx.cs"
    ClassName="Empiria.Land.WebApp.LRSTransactionEditorASP" EnableViewState="true"
    EnableSessionState="true" Async="true" %>
<%@ OutputCache Location="None" NoStore="true" %>
<%@ Register tagprefix="empiriaControl"
             tagname="LRSRecordingActSelectorControl"
             src="../land.registration.system.controls/recording.act.selector.control.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es-mx">
<head id="Head1" runat="server">
<title><%=GetTitle()%></title>
<meta http-equiv="Expires" content="-1" /><meta http-equiv="Pragma" content="no-cache" />
<link href="../themes/default/css/secondary.master.page.css" type="text/css" rel="stylesheet" />
<link href="../themes/default/css/editor.css" type="text/css" rel="stylesheet" />
  <script type="text/javascript" src="../scripts/empiria.ajax.js"></script>
  <script type="text/javascript" src="../scripts/empiria.general.js"></script>
  <script type="text/javascript" src="../scripts/empiria.secondary.master.page.js"></script>
  <script type="text/javascript" src="../scripts/empiria.validation.js"></script>
</head>
<body>
<form id="aspnetForm" method="post" runat="server">
<div>
<input type="hidden" name="hdnPageCommand" id="hdnPageCommand" runat="server" />
</div>
<div id="divCanvas">
  <div id="divHeader">
    <span class="appTitle">
      <%=GetTitle()%>
    </span>
    <span class="rightItem" style="padding-top:16px">
      <%=GetRightTitle()%>
    </span>
  </div>
  <div id="divBody">
    <div id="divContent">
  <table class="tabStrip">
    <tr>
      <td id="tabStripItem_0" class="tabOn" onmouseover="doCommand('onMouseOverTabStripCmd', this);" onmouseout="doCommand('onMouseOutTabStripCmd', this);"  onclick="doCommand('onClickTabStripCmd', this);" title="">Informaci�n del tr�mite y conceptos</td>
      <td id="tabStripItem_1" class="tabOff" onmouseover="doCommand('onMouseOverTabStripCmd', this);" onmouseout="doCommand('onMouseOutTabStripCmd', this);" onclick="doCommand('onClickTabStripCmd', this);" title="">Inscripci�n de documentos</td>
      <td id="tabStripItem_2" class="tabOff" onmouseover="doCommand('onMouseOverTabStripCmd', this);" onmouseout="doCommand('onMouseOutTabStripCmd', this);" onclick="doCommand('onClickTabStripCmd', this);" title="">Emisi�n de certificados</td>
      <td id="tabStripItem_3" class="tabOff" onmouseover="doCommand('onMouseOverTabStripCmd', this);" onmouseout="doCommand('onMouseOutTabStripCmd', this);" onclick="doCommand('onClickTabStripCmd', this);" title="">Historia del tr�mite</td>
      <td class="lastCell" colspan="1" rowspan="1"><a id="top" />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
    </tr>
  </table>
  <table id="tabStripItemView_0" class="editionTable" style="display:inline">
    <tr>
      <td class="subTitle">Informaci�n del interesado, n�mero de tr�mite y tipo de documento</td>
    </tr>
    <tr>
    <td>
      <table id="transactionEditor0" class="editionTable">
        <tr>
          <td><b>Interesado:</b></td>
          <td colspan="3">
            <input id='txtRequestedBy' type="text" class="textBox" style="width:504px;" title="" runat="server" />
            <input type="hidden" id="txtTransactionKey" runat="server" />
          </td>
          <td class="lastCell" valign="top">
            <% if (base.IsEditable() || base.IsStorable()) { %>
              <input id="cmdSaveTransaction" class="button" type="button" value="Crear la solicitud"
                     onclick="doOperation('saveTransaction')" style="height:28px;width:110px" runat="server" />
              <br />
            <% } %>
          </td>
        </tr>
        <tr>
          <td>RFC para facturaci�n:</td>
          <td colspan="4" class="lastCell">
            <input id='txtRFC' type="text" class="textBox" style="width:186px;" title="" maxlength="15" runat="server" />

            <% if (transaction.IsNew || base.IsEditable() || base.IsStorable()) { %>
            <input class="button" type="button" value="Usar RFC gen�rico"
                   onclick="doOperation('setDefaultRFC')" style="vertical-align:middle;height:26px;width:130px" />
            <% } %>
          </td>
        </tr>
        <tr>
          <td>Tipo de documento:</td>
          <td colspan="4" class="lastCell">
            <select id="cboDocumentType" class="selectBox" style="width:186px" onchange="return updateUserInterface(this);" runat="server">
              <option value="">( Seleccionar )</option>
            </select>
            No. Instrumento:
            <input id='txtDocumentNumber' type="text" class="textBox" style="width:220px;" title="" maxlength="128" runat="server" />
          </td>
        </tr>
        <tr>
          <td>Tramitado por:</td>
          <td colspan="4" class="lastCell">
            <select id="cboManagementAgency" class="selectBox" style="width:286px" runat='server'>
              <option value="-1" title="oPrivateContract">No determinado</option>
            </select>
            Mesa origen:
            <select id="cboRecorderOffice" class="selectBox" style="width:150px" onchange="return updateUserInterface(this);" runat="server">				
              <option value="-1">No determinado</option>
     	        <option value="101">Hidalgo</option>
	            <option value="102">Cuauht�moc</option>
	            <option value="103">Ju�rez</option>
	            <option value="104">Lardiz�bal y Uribe</option>
	            <option value="105">Morelos</option>
	            <option value="106">Ocampo</option>
	            <option value="107">Xicoht�ncatl</option>
	            <option value="108">Zaragoza</option>
	            <option value=""> </option>
	            <option value="146">Archivo General de Notar�as</option>
	            <option value="145">Oficial�a de partes</option>
	            <option value="147">Oficina del C. Director</option>
	            <option value="154">Jur�dico</option>
              <option value="99">Mesa tr�mites CITyS</option>
	            <option value=""> </option>
	            <option value="139">Asoc civiles y cr�ditos particulares (Rosario)</option>
              <option value="142">Avisos preventivos (Gregoria)</option>
	            <option value="138">Cert. de hipotecas (Lupita)</option>
	            <option value="135">Certificados (Lety Palacios)</option>
              <option value="137">Comercio (Laura)</option>
              <option value="134">Copias certificadas</option>
              <option value="141">Cr�ditos (Javier Ceballos)</option>
              <option value="140">Embargos (Alejandra)</option>
              <option value="144">Infonavit (Rub�n)</option>
              <option value="143">Procede (Tere Rold�n)</option>
	            <option value="133">Secci�n 4ta</option>
	            <option value="136">Secci�n 5ta</option>
            </select>
         </td>
        </tr>
      </table>
    </td>
  </tr>

<tr>
  <td class="subTitle">Folio real involucrado en el tr�mite</td>
</tr>
<tr>
  <td>
    <table class="editionTable">
      <tr>
        <td>Folio real base:</td>
          <td>
            <input id='txtBaseResourceUID' type="text" class="textBox" style="width:170px;" title="" maxlength="20" runat="server" />
            <img src="../themes/default/buttons/search.gif" alt="" title="Busca un n�mero de instrumento"
                 style="margin-left:-8px" onclick="doOperation('lookupBaseResource')" />
              <span id='divSelectedResource' style="display:none">
                <a href="javascript:doOperation('viewBaseResource', oBaseResource.Id)">Consultar historia</a>
                &nbsp; | &nbsp;
                <a href="javascript:doOperation('unselectBaseResource')">Borrar</a>
              </span>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          </td>
          <td class="lastCell">
            <label>
                <input type="checkbox" id="chkNoBaseResource" onclick="return noBaseResourceCheckBoxSelected()"; />
                  Es un tr�mite sobre una propiedad SIN folio real asignado<br />&nbsp; &nbsp; &nbsp; &nbsp;o involucra a m�s de un predio base.
            </label>
          </td>
      </tr>
     </table>
  </td>
</tr>
<tr>
  <td class="subTitle">Actos jur�dicos y conceptos involucrados en el tr�mite</td>
</tr>
<!--Inicio editor de pago de derechos!-->
<tr>
  <td>
    <table class="editionTable">
      <tr>
        <td colspan="8" class="lastCell">
          <div style="overflow:auto;width:772px;">
            <table class="details" style="width:99%">
              <tr class="detailsHeader">
                <td>#</td>
                <td style="width:240px;white-space:nowrap">Concepto</td>
                <td align='right'>V.Operaci�n</td>
                <td>Fundamento</td>
                <td align='right'>Derechos</td>
                <td align='right'>Cotejo</td>
                <td align='right'>For�neo</td>
                <td align='right'>Subtotal</td>
                <td align='right'>Dcto</td>
                <td align='right'>Total</td>
                <td>&nbsp;</td>
              </tr>
              <%=base.GetRecordingActs()%>
            </table>
          </div>
        </td>
      </tr>
      <tr id="divConceptsEditor" style='display:<%=base.CanAppendItems() && base.transaction.Items.Count == 0 ? "inline": "none"%>'>
        <td colspan="8" class="lastCell" style="width:99%">
          <table>
           <tr>
            <td>Tipo:</td>
              <td>
                <select id="cboRecordingActTypeCategory" class="selectBox" style="width:160px" onchange="return updateUserInterface(this);" runat="server">
                  <option value="1070">Traslativo de dominio</option>
                  <option value="1071">Limitaciones</option>
                  <option value="1072">Modificaciones</option>
                  <option value="1073">Anotaciones</option>
                  <option value="1074">Informativos</option>
                  <option value="1075">Cancelaciones</option>
                  <option value="1076">Notar�as</option>
                </select>
              </td>
              <td colspan="4">Acto jur�dico:
                &nbsp;
                <select id="cboRecordingActType" class="selectBox" style="width:335px" onchange="return updateUserInterface(this);" runat="server">
                  <option value="">( Seleccionar acto jur�dico )</option>
                </select>
              </td>
              <td class="lastCell">
                <input class="button" type="button" value="Agregar" onclick="doOperation('appendRecordingAct')" style="width:70px" runat="server" />
              </td>
            </tr>
            <tr>
              <td>Fundamento:</td>
              <td>
                <select id="cboLawArticle" class="selectBox" style="width:160px" onchange="return updateUserInterface(this);" runat="server">
                  <option value="">( Fundamento )</option>
                </select>
              </td>
              <td>Valor de la operaci�n:</td>
              <td>
              $<input id='txtOperationValue' type="text" class="textBox" onkeypress="return positiveKeyFilter(this);" style="width:71px;" title="" maxlength="8" runat="server" /></td>
              <td>Derechos de registro:</td>
              <td>
              $<input id='txtRecordingRightsFee' type="text" class="textBox" onkeypress="return positiveKeyFilter(this);" style="width:71px;" title="" maxlength="8" runat="server" /></td>
            </tr>
            <tr>
              <td>Cotejo:</td>
              <td>
                $<input id='txtSheetsRevisionFee' type="text" class="textBox" onkeypress="return positiveKeyFilter(this);" style="width:64px;" title="" maxlength="8" runat="server" />
                &nbsp;
                Fojas: <input id='txtSheetsCount' type="text" class="textBox" onkeypress="return positiveKeyFilter(this);" style="width:28px;" title="" maxlength="3" runat="server" />
              </td>
              <td>T�mite for�neo:</td>
              <td>$<input id='txtForeignRecordFee' type="text" class="textBox" onkeypress="return positiveKeyFilter(this);" style="width:71px;" title="" maxlength="8" runat="server" /></td>
              <td><b>Subtotal:</b></td>
              <td>$<input id='txtSubtotal' disabled="disabled" type="text" class="textBox" onkeypress="return positiveKeyFilter(this);" style="width:71px;" title="" maxlength="8" runat="server" /></td>
            </tr>
            <tr>
              <td>Tipo de descuento:</td>
              <td>
                <select id="cboAuthorizationType" class="selectBox" style="width:160px" onchange="return updateUserInterface(this);" runat="server">
                  <option value="">( Seleccionar )</option>
                </select>
              </td>
              <td>Clave de autorizaci�n:</td>
              <td><input id='txtDiscountAuthorization' type="text" class="textBox" style="width:76px;" title="" maxlength="8" runat="server" /></td>
              <td>Descuento:</td>
              <td>$<input id='txtDiscount' type="text" class="textBox" onkeypress="return positiveKeyFilter(this);" style="width:71px;" title="" maxlength="8" runat="server" /></td>
            </tr>
            <tr>
              <td colspan="4">&nbsp;</td>
              <td><b>TOTAL:</b></td>
              <td>$<input id='txtTotal' disabled="disabled" type="text" class="textBox" onkeypress="return positiveKeyFilter(this);" style="width:71px;" title="" maxlength="8" runat="server" /></td>
            </tr>
          </table>
        </td>
       </tr>
    </table>
  </td>
</tr>
<!--Fin editor de pago de derechos!-->
<tr style='display:<%=base.CanReceivePayment() ? "inline" : "none" %>'>
  <td class="subTitle">Recibo de pago y validaci�n del pago de derechos</td>
</tr>
<tr style='display:<%=base.CanReceivePayment() ? "inline" : "none" %>'>
  <td>
    <table class="editionTable">
      <tr>
        <td>Recibo de pago:</td>
        <td>
          <input id='txtReceiptNumber' type="text" class="textBox" onkeypress="return positiveKeyFilter(this);"
                 style="width:86px;" title="" maxlength="9" runat="server" />
        </td>
        <td>
        Importe:
        </td>
        <td valign="bottom">
          <b>$</b>&nbsp;<input id='txtReceiptTotal' type="text" class="textBox" onkeypress="return positiveKeyFilter(this);"
                         style="width:84px;" title="" maxlength="14" runat="server" />
        </td>
        <td class="lastCell">
          <input class="button" type="button" value="Validar pago" onclick="doOperation('validatePayment')"
                 style="top:15px;height:26px;width:84px" disabled="disabled" />
          <input class="button" type="button" value="Guardar pago" onclick="doOperation('appendPayment')"
                 style="top:15px;height:26px;width:84px" />
          <input class="button" type="button" value="Guardar pago y recibir" onclick="doOperation('appendPaymentAndReceive')"
                 style="top:15px;height:26px;width:124px" />
        </td>
      </tr>
      <% if (!base.transaction.PaymentOrderData.IsEmptyInstance) { %>
      <tr>
        <td colspan="5">L�nea de captura: <b><%=base.transaction.PaymentOrderData.RouteNumber%></b></td>
      </tr>
      <% } %>
    </table>
  </td>
</tr>
  <tr>
    <td class="subTitle">&nbsp;</td>
  </tr>
  <tr>
    <td>
      <table id="transactionEditor1" class="editionTable">
        <tr>
          <td>&nbsp;</td>
          <td nowrap="nowrap">
            <% if (!transaction.IsNew) { %>
              <input class="button" type="button" value="Crear nuevo" onclick="doOperation('createNew')" style="height:28px;width:92px" runat="server" />
              &nbsp; &nbsp;
              <input id="copyFromLastTransaction" class="button" type="button" value="Crear una copia" onclick="doOperation('copyFromMyLastTransaction')" style="height:28px;width:92px" runat="server" />
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              <% if (base.ShowPrintPaymentOrderButton) { %>
                <input class="button" type="button" value="Orden de pago" onclick="doOperation('printOrderPayment')" style="height:28px;width:90px" runat="server" />
              <% } %>
              <% if (base.ShowTransactionVoucher) { %>
                <img src="../themes/default/bullets/pixel.gif" width="40px" height="1px" alt='' />
                <input id="button" class="button" type="button" value="Boleta de Recepci�n" onclick="doOperation('printTransactionReceipt')" style="height:28px;width:110px" runat="server" />
              <% } %>
            <% } else { %>
              <img src="../themes/default/bullets/pixel.gif" width="200px" height="1px" alt='' />
            <% } %>
          </td>
          <td nowrap="nowrap" width="280px">
            <% if (base.IsReadyForReception()) { %>
            <input id="cmdSaveAndReceive" class="button" type="button" value="Recibir tr�mite" onclick="doOperation('saveAndReceive')" style="height:30px;width:100px" runat="server" />
            <% } %>
            <% if (transaction.Workflow.IsReadyForReentry) { %>
            <input class="button" type="button" value="Reingresar tr�mite" onclick="doOperation('reentryTransaction')" style="height:28px;width:120px" runat="server" />
            <% } %>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          </td>
          <td class="lastCell"></td>
        </tr>
      </table>
    </td>
  </tr>
</table>

    <table id="tabStripItemView_1" class="editionTable" style="display:none">
      <tr>
        <td class="lastCell">
          <iframe id="ifraRecordingEditor" style="z-index:99;left:0;top:0;"
                  marginheight="0" marginwidth="0" frameborder="0" scrolling="no"
                  src="../workplace/empty.page.aspx" width="90%" height="4000px" visible="true" >
          </iframe>
        </td>
      </tr>
    </table>

    <table id="tabStripItemView_2" class="editionTable" style="display:none">
      <tr>
        <td class="subTitle">Certificados emitidos</td>
      </tr>
      <tr>
        <td>
          <div style="overflow:auto;width:100%;">
            <table class="details" style="width:97%">
              <tr class="detailsHeader">
                <td>#Certificado</td>
                <td>Tipo de certificado</td>
                <td>Predio</td>
                <td>Interesado</td>
                <td>Elaborado por</td>
                <td>Fecha</td>
                <td>Estado</td>
                <td width="40%">�Qu� debo hacer?</td>
              </tr>
              <%=GetCertificates()%>
            </table>
          </div>
          <div style="text-align: right">
            <% if (!transaction.IsNew && base.CanCreateCertificate()) { %>
              <br />
              <input class="button" type="button" value="Crear certificado manualmente" onclick="doOperation('createNewCertificate')" style="height:28px;width:178px" />
              &nbsp; &nbsp;
              <input class="button" type="button" value="Refrescar" onclick="doOperation('refreshCertificates')" style="height:28px;width:92px" />
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <% } else if (transaction.IsExternalTransaction && transaction.GetIssuedCertificates().Count == 1 && transaction.Workflow.CurrentStatus == Empiria.Land.Registration.Transactions.LRSTransactionStatus.Revision) { %>
              <br />
              <input class="button" type="button" value="Enviar certificado a CITYS" onclick="doOperation('sendCertificateToCITYS')" style="height:28px;width:144px" />
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <% } %>
          </div>
        </td>
      </tr>

      <% if (!transaction.IsNew && base.CanCreateCertificate() && base.AutoCreateCertificateEnabled) { %>
      <tr>
        <td class="subtitle"><b>Generaci�n de certificados</b></td>
      </tr>
      <tr>
        <td>
           <table class="editionTable">
              <tr valign="top">
                <td>Tipo de certificado:</td>
                <td class="lastCell" valign="top">
                  <select id="cboCertificateType" class="selectBox" style="width:210px" onchange="return updateUserInterface(this);" runat="server">
                    <option value=""> (Seleccionar el tipo de certificado )</option>
                    <option value="gravamen">Libertad de gravamen / Gravamen</option>
                    <option value="inscripci�n">Certificado de inscripci�n</option>
                    <option value="no-propiedad">Certificado de NO propiedad</option>
                  </select>
                  &nbsp; &nbsp; &nbsp; &nbsp;
                  <input class="button" type="button" value="Generar certificado" onclick="doOperation('autoCreateCertificate')" style="height:28px;width:142px" />
                </td>
              </tr>
             <tr id='divCertificatePropertyUID' style="display:none">
              <td>
                Folio real:
              </td>
              <td class="lastCell">
                <input id='txtCertificatePropertyUID' type="text" class="textBox"
                        style="width:202px;" title="" maxlength="20" runat="server" />
              </td>
             </tr>
             <tr id='divCertificateOwnerName' style="display:none">
              <td>
                Nombre:
              </td>
              <td class="lastCell">
                <input id='txtCertificateOwnerName' type="text" class="textBox"
                        style="width:600px;" title="" maxlength="200" runat="server" />
              </td>
             </tr>
            </table>
        </td>
      </tr>
      <% } %>
    </table>

    <table id="tabStripItemView_3" class="editionTable" style="display:none">
      <tr>
        <td class="subTitle">Historia del tr�mite</td>
      </tr>
      <tr>
        <td>
          <div style="overflow:auto;width:100%;">
            <table class="details" style="width:97%">
              <tr class="detailsHeader">
                <td>Tipo de movimiento</td>
                <td>Responsable</td>
                <td>Recibido</td>
                <td>Terminado</td>
                <td>Entregado</td>
                <td>Trabajo</td>
                <td>Estado</td>
                <td width="40%">Observaciones</td>
              </tr>
              <%=GetTransactionTrack()%>
            </table>
          </div>
          <br />
          <br />
          <% if (transaction.Workflow.CurrentStatus == Empiria.Land.Registration.Transactions.LRSTransactionStatus.Deleted) { %>
          <input id="cmdUndelete" class="button" type="button" value="Reactivar" onclick="doOperation('undelete')" style="height:28px;width:110px" runat="server" />
          <% } %>
        </td>
      </tr>
    </table>
  </div>
 </div> <!-- end divBody !-->
<div id="divBottomToolbar" style="display:none">
 </div> <!-- end divBottomToolbar !-->
</div> <!-- end divCanvas !-->
</form>
</body>
  <script type="text/javascript">
  /* <![CDATA[ */

  var gCertificatesServerURL = "<%=base.GetCertificatesSystemUrl()%>";

  function doPageCommand(commandName, commandArguments) {
    switch (commandName) {
      default:
        return false;
    }
  }

  function doOperation(command) {
    var success = false;

    if (gbSended) {
      return;
    }
    switch (command) {
      case 'redirectThis':
        success = true;
        break;
      case 'saveTransaction':
        return saveTransaction();
      case 'setDefaultRFC':
        return setDefaultRFC();
      case 'saveAndReceive':
        return saveAndReceiveTransaction();
      case 'reentryTransaction':
        return reentryTransaction();
      case 'createCopy':
        return createCopy();
      case 'lookupBaseResource':
        return lookupBaseResource();

      case 'appendRecordingAct':
        return appendRecordingAct();
      case 'deleteRecordingAct':
        return deleteRecordingAct(arguments[1]);
      case 'savePayment':
        return savePayment();
      case 'cancelTransaction':
        success = true;
        break;
      case 'createNew':
        return createNew();
      case 'showRecordingActSelectorControl':
        return showRecordingActSelectorControl();
      case 'printOrderPayment':
        sendPageCommand('printOrderPayment');
        gbSended = true;
        return;
      case 'printTransactionReceipt':
        sendPageCommand('printTransactionReceipt');
        gbSended = true;
        return;
      case 'searchCadastralNumber':
        alert("La b�squeda de claves catastrales no est� disponible en este momento.");
        return;
      case 'searchGeographicalItems':
        return searchGeographicalItems();
      case 'setNoNumberLabel':
        getElement("txtExternalNumber").value = "S/N";
        return;
      case 'closeWindow':
        window.parent.execScript("doOperation('refreshRecording')");
        return;
      case 'appendGeographicalItem':
        return appendGeographicalItem();
      case 'undelete':
        sendPageCommand("undeleteTransaction");
        return;
      case "showConceptsEditor":
        showConceptsEditor();
        return;
      case "appendPayment":
        appendPayment();
        return;
      case "appendPaymentAndReceive":
        appendPaymentAndReceive();
        return;
      case "autoCreateCertificate":
        autoCreateCertificate();
        return;
      case "createNewCertificate":
        createNewCertificate();
        return;
      case "viewCertificate":
        viewCertificate(arguments[1]);
        return;
      case "editCertificate":
        editCertificate(arguments[1]);
        return;
      case "deleteCertificate":
        deleteCertificate(arguments[1]);
        return;
      case "openCertificate":
        openCertificate(arguments[1]);
        return;
      case "sendCertificateToCITYS":
        sendCertificateToCITYS();
        return;
      default:
        alert("La operaci�n '" + command + "' no ha sido definida en el programa.");
        return;
    }
    if (success) {
      sendPageCommand(command);
      gbSended = true;
    }
  }

  function noBaseResourceCheckBoxSelected() {
    if (getElement('chkNoBaseResource').checked) {
      getElement('txtBaseResourceUID').disabled = true;
      getElement('divSelectedResource').style.display = 'none';
    } else {
      getElement('txtBaseResourceUID').disabled = false;
      getElement('divSelectedResource').style.display = 'none';
    }
  }

  var oBaseResource = null;
  function lookupBaseResource() {
    if (getElement("txtBaseResourceUID").value.length == 0) {
      alert("Requiero se proporcione el folio real para poder hacer la b�squeda.");
      return;
    }

    var url = "../ajax/land.registration.system.data.aspx";
    url += "?commandName=lookupResource";
    url += "&resourceUID=" + getElement("txtBaseResourceUID").value;

    olookupResource = invokeAjaxGetJsonObject(url);

    if (olookupResource.Id == -1) {
      _selectedResource = null;
      alert("No existe ning�n predio o asociaci�n con el folio real proporcionado.");
      getElement('divSelectedResource').style.display = 'none';
      getElement("txtBaseResourceUID").readOnly = false;
      getElement("chkNoBaseResource").disabled = false;
      return false;
    } else {
      _selectedResource = olookupResource.Id;
      alert("Folio real encontrado.");
      getElement('divSelectedResource').style.display = 'inline';
      getElement("txtBaseResourceUID").readOnly = true;
      getElement("chkNoBaseResource").disabled = true;
      return true;
    }
  }

  function autoCreateCertificate() {
    var certificateType = getElement('cboCertificateType').value;
    if (certificateType == "") {
      alert("Requiero se seleccione el tipo de certificado que se desea generar.");
      return;
    }
    if (certificateType == "gravamen" || certificateType == "inscripci�n") {
      if (getElement('txtCertificatePropertyUID').value == '') {
        alert("Requiero se proporcione el folio real del predio sobre el que se generar� el certificado.");
        return;
      }
      if (getElement('txtCertificatePropertyUID').value.length != 19) {
        alert("El folio real tiene un formato que no reconozco.");
        return;
      }
    }
    if (certificateType == "no-propiedad") {
      if (getElement('txtCertificateOwnerName').value == '') {
        alert("Requiero se proporcione el nombre de la persona f�sica o moral sobre la que se generar� el certificado.");
        return;
      }
      if (getElement('txtCertificateOwnerName').value.length <= 10) {
        alert("El nombre de la persona tiene una longitud demasiado corta.");
        return;
      }
    }
    var sMsg = "Generar certificado.\n\n";

    sMsg += "Tipo de certificado: " + getComboOptionText(getElement('cboCertificateType')) + "\n";
    sMsg += "Folio real: " + getElement('txtCertificatePropertyUID').value + "\n\n";
    sMsg += "Nombre: " + getElement('txtCertificateOwnerName').value + "\n\n";
    sMsg += "�Genero el certificado con la informaci�n proporcionada?";

    if (confirm(sMsg)) {
      sendPageCommand("autoCreateCertificate");
      gbSended = true;
    }
  }

  function setAutocreateCertificateControls() {
    var certificateType = getElement('cboCertificateType').value;
    if (certificateType == "gravamen" || certificateType == "inscripci�n") {
      getElement('divCertificatePropertyUID').style.display = 'inline';
      getElement('divCertificateOwnerName').style.display = 'none';
    } else if (certificateType == "no-propiedad") {
      getElement('divCertificatePropertyUID').style.display = 'none';
      getElement('divCertificateOwnerName').style.display = 'inline';
    } else {
      getElement('divCertificatePropertyUID').style.display = 'none';
      getElement('divCertificateOwnerName').style.display = 'none';
    }
  }

<% if (!transaction.IsNew && base.CanCreateCertificate() && base.AutoCreateCertificateEnabled) { %>
  addEvent(getElement("txtCertificatePropertyUID"), 'keypress', upperCaseKeyFilter);
  addEvent(getElement("txtCertificateOwnerName"), 'keypress', upperCaseKeyFilter);
<% } %>

  function createNewCertificate() {
    var url = gCertificatesServerURL + "certificados.html?" +
             "transactionUID=<%=transaction.UID%>&sessionToken=<%=Empiria.ExecutionServer.CurrentSessionToken%>";

    createNewWindow(url);
  }

  function viewCertificate(certificateId) {
    var url = "../land.registration.system/certificate.aspx?certificateId=" + certificateId;

    createNewWindow(url);
  }

  function editCertificate(certificateUID) {
    var url = gCertificatesServerURL + "editar.html?" +
              "transactionUID=<%=transaction.UID%>&certificateUID=" + certificateUID +
              "&sessionToken=<%=Empiria.ExecutionServer.CurrentSessionToken%>";

    createNewWindow(url);
  }

  function deleteCertificate(certificateUID) {
    alert("Eliminar certificados todav�a no est� disponible.");
    return;
  }

  function openCertificate(certificateUID) {
    alert("Reabrir certificados todav�a no est� disponible.");
    return;
  }

  function sendCertificateToCITYS() {
    var sMsg = "Enviar certificado al sistema CITYS.\n\n";

    sMsg += "�Env�o el certificado al sistema CITYS?";

    if (confirm(sMsg)) {
      sendPageCommand("sendCertificateToCITYS");
      gbSended = true;
    }
  }


  function appendPayment() {
    if (!validatePayment()) {
      return;
    }
    var sMsg = "Agregar recibo de pago al tr�mite.\n\n";

    sMsg += "N�mero de tr�mite:\t" + getElement('txtTransactionKey').value + "\n";
    sMsg += "Interesado: " + getElement('txtRequestedBy').value + "\n";
    sMsg += "RFC:\t" + getElement('txtRFC').value + "\n\n";

    sMsg += "Recibo de pago:\t" + getElement('txtReceiptNumber').value + "\n";
    sMsg += "Pago de derechos:\t" + formatAsCurrency(getElement('txtReceiptTotal').value) + "\n\n";

    sMsg += "�Agrego el pago a este tr�mite?";

    if (confirm(sMsg)) {
      sendPageCommand("appendPayment");
      gbSended = true;
    }
  }

  function appendPaymentAndReceive() {
    if (!validatePayment()) {
      return;
    }
    var sMsg = "Agregar recibo de pago y recibir el tr�mite.\n\n";

    sMsg += "N�mero de tr�mite:\t" + getElement('txtTransactionKey').value + "\n";
    sMsg += "Interesado: " + getElement('txtRequestedBy').value + "\n";
    sMsg += "RFC:\t" + getElement('txtRFC').value + "\n\n";

    sMsg += "Recibo de pago:\t" + getElement('txtReceiptNumber').value + "\n";
    sMsg += "Pago de derechos:\t" + formatAsCurrency(getElement('txtReceiptTotal').value) + "\n\n";

    sMsg += "�Agrego el pago y recibo este tr�mite ?";

    if (confirm(sMsg)) {
      sendPageCommand("appendPaymentAndReceive");
      gbSended = true;
    }
  }

  function validatePayment() {
    if (isEmpty(getElement('txtReceiptNumber'))) {
      alert("Requiero se proporcione el n�mero del recibo de pago para este tr�mite.");
      return false;
    }
    if (isEmpty(getElement('txtReceiptTotal'))) {
      alert("Requiero se ingrese el importe del recibo de pago.");
      return false;
    }
    if (convertToNumber(getElement('txtReceiptTotal').value) != <%=transaction.Items.TotalFee.Total%>) {
      alert("El total del recibo no coincide con el importe correcto del pago de derechos.");
      return false;
    }
    return true;
  }

  function showConceptsEditor() {
    if (getElement('divConceptsEditor').style.display == "inline") {
      getElement('divConceptsEditor').style.display = 'none';
    } else {
      getElement('divConceptsEditor').style.display = 'inline';
    }
  }


  function reentryTransaction() {
    var sMsg = "Reingreso de tr�mites.\n\n";

    sMsg += "Esta operaci�n reinigresar� este tr�mite y lo enviar� al distrito o mesa de trabajo correspondiente.\n\n";
    sMsg += "�Reingreso este tr�mite";
    if (confirm(sMsg)) {
      sendPageCommand("reentryTransaction");
    }
  }

  function deleteRecordingAct(transactionActId) {
    var sMsg = "Eliminaci�n de actos jur�dicos y conceptos de pago.\n\n";

    sMsg += "Esta operaci�n eliminar� el siguiente elemento de la lista de actos jur�dicos:\n\n";
    sMsg += "Acto:\n";
    sMsg += "Total\n\n";
    sMsg += "�Elimino el acto jur�dico de la lista?";

    if (confirm(sMsg)) {
      sendPageCommand("deleteRecordingAct", "id=" + transactionActId);
      gbSended = true;
    }
  }

  function createNew() {
    //window_onunload();
    window.location.replace("transaction.editor.aspx?id=0&typeId=<%=base.transaction.TransactionType.Id%>");
  }

  function printOrderPayment() {
    var url = "payment.order.aspx?id=<%=base.transaction.Id%>";

    createNewWindow(url);
  }

  function printTransactionReceipt() {
    var url = "transaction.receipt.aspx?id=<%=base.transaction.Id%>";

    createNewWindow(url);
  }

  function saveTransaction() {
    if (!doValidation("saveTransaction")) {
      return;
    }
    if (!doSendMsg("saveTransaction")) {
      return;
    }
    sendPageCommand("saveTransaction");
    gbSended = true;
  }

  function saveAndReceiveTransaction() {
    if (!doValidation("saveAndReceiveTransaction")) {
      return;
    }
    if (!doSendMsg("saveAndReceiveTransacion")) {
      return;
    }
    sendPageCommand("saveAndReceiveTransaction");
    gbSended = true;
  }

  function appendRecordingAct() {
    if (!doValidateRecordingAct()) {
      return;
    }
    var sMsg = getComboOptionText(getElement('cboRecordingActType')) + "\n\n";

    sMsg += "Fundamento:\t\t" + getComboOptionText(getElement('cboLawArticle')) + "\n\n";
    sMsg += "Valor de la operaci�n:\t" + formatAsCurrency(getElement('txtOperationValue').value) + "\n\n";
    sMsg += "Derechos registrales:\t\t" + formatAsCurrency(getElement('txtRecordingRightsFee').value) + "\n";

    if (convertToNumber(getElement('txtSheetsRevisionFee').value) != 0) {
      sMsg += "Cotejo:\t\t\t" + formatAsCurrency(getElement('txtSheetsRevisionFee').value) + "\n";
    }
    if (convertToNumber(getElement('txtForeignRecordFee').value) != 0) {
      sMsg += "For�neo:\t\t\t" + formatAsCurrency(getElement('txtForeignRecordFee').value) + "\n";
    }
    sMsg += "\n";
    if (convertToNumber(getElement('txtDiscount').value) == 0) {
      sMsg += "Total:\t\t\t" + formatAsCurrency(getTotal()) + "\n";
    } else {
      sMsg += "Subtotal:\t\t\t" + formatAsCurrency(getSubTotal()) + "\n";
      sMsg += "Descuento:\t\t" + formatAsCurrency(getElement('txtDiscount').value) + "\n";
      sMsg += "Total:\t\t\t" + formatAsCurrency(getTotal()) + "\n";
    }
    sMsg += "\n";
    sMsg += "�Agrego el acto jur�dico y la informaci�n del pago de derechos?";
    if (confirm(sMsg)) {
      sendPageCommand("appendRecordingAct");
      gbSended = true;
    }
  }

  function doValidateRecordingAct() {
    if (getElement('cboRecordingActType').value.length == 0) {
      alert("Requiero se proporcione el acto jur�dico.");
      return false;
    }
    if (getElement('cboLawArticle').value.length == 0) {
      alert("Requiero se proporcione el fundamento del cobro.");
      return false;
    }
    if (!validateQuantity(getElement('txtOperationValue'), "Valor de la operaci�n")) {
      return false;
    }
    if (!validateQuantity(getElement('txtRecordingRightsFee'), "Derechos de registro")) {
      return false;
    }
    if (!validateQuantity(getElement('txtSheetsRevisionFee'), "Cotejo")) {
      return false;
    }
    if (!validateQuantity(getElement('txtForeignRecordFee'), "Tr�mite for�neo")) {
      return false;
    }
    if (!validateQuantity(getElement('txtDiscount'), "Descuento")) {
      return false;
    }
    getElement('txtSubtotal').value = getSubTotal();
    getElement('txtTotal').value = getTotal();

    if (convertToNumber(getElement('txtTotal').value) < 0) {
      alert("El importe total del acto no puede ser menor que cero.");
      return false;
    }
    return true;
  }

  function getSubTotal() {
    var subtotal = Number();

    subtotal = 0;

    subtotal += convertToNumber(getElement('txtRecordingRightsFee').value);
    subtotal += convertToNumber(getElement('txtSheetsRevisionFee').value);
    subtotal += convertToNumber(getElement('txtForeignRecordFee').value);

    return subtotal;
  }

  function getTotal() {
    return getSubTotal() - convertToNumber(getElement('txtDiscount').value);
  }

  function validateQuantity(oElement, elementName) {
   if (oElement.value.length == 0) {
      oElement.value = "0.00";
      return true;
    }
    if (!isNumeric(oElement)) {
      alert("No reconozco el importe de " + elementName + ".");
      return false;
    }
    if (convertToNumber(oElement.value) < 0) {
      alert("El importe de " + elementName + " debe ser mayor o igual a cero.");
      return false;
    }
    return true;
  }

  function doSendMsg(command) {
    var sMsg = "";

    sMsg  = "N�mero de tr�mite:\t" + getElement('txtTransactionKey').value + "\n";
    sMsg += "Tipo de documento:\t" + getComboOptionText(getElement('cboDocumentType')) + "\n";
    sMsg += "N�m instrumento:\t" + getElement('txtDocumentNumber').value + "\n\n";

    if (command == "saveTransaction") {
    <% if (base.transaction.IsNew) { %>
    sMsg = "Crear una nueva solicitud de tr�mite.\n\n" + sMsg;
    sMsg += "�Creo este nuevo tr�mite con la informaci�n proporcionada?";
    <% } else { %>
    sMsg = "Modificar la solicitud de tr�mite " + getElement('txtTransactionKey').value + ".\n\n" + sMsg;
    sMsg += "�Modifico la informaci�n de este tr�mite?";
    <% } %>
    } else if (command == "saveAndReceiveTransacion") {
      <% if (base.transaction.IsNew) { %>
      sMsg += "Pago de derechos:\t" + formatAsCurrency(getElement('txtReceiptTotal').value) + "\n\n";
      sMsg += "Interesado: " + getElement('txtRequestedBy').value + "\n";
      sMsg += "RFC:\t" + getElement('txtRFC').value + "\n\n";


      sMsg = "Crear y recibir una nueva solicitud de tr�mite.\n\n" + sMsg;
      sMsg += "�Creo este nuevo tr�mite y lo marco como recibido?";
    <% } else { %>
    sMsg += "Pago de derechos:\t" + formatAsCurrency(getElement('txtReceiptTotal').value) + "\n\n";
    sMsg += "Interesado: " + getElement('txtRequestedBy').value + "\n\n";
    sMsg = "Recibir la solicitud de tr�mite " + getElement('txtTransactionKey').value + ".\n\n" + sMsg;
    sMsg += "�Recibo este tr�mite?";
    <% } %>
    }

    return confirm(sMsg);
  }

  function createCopy() {
    alert("create Copy")
  }

  function updateUserInterface(oControl) {
    if (oControl == null) {
      return;
    }
    if (oControl == getElement("cboRecordingActTypeCategory")) {
      resetRecordingsTypesCombo();
    } else if (oControl == getElement("cboRecordingActType")) {
      resetLawArticlesCombo();
    <% if (!transaction.IsNew && base.CanCreateCertificate() && base.AutoCreateCertificateEnabled) { %>
    } else if (oControl == getElement("cboCertificateType")) {
      setAutocreateCertificateControls();
    <% } %>
    }
  }

  function resetRecordingsTypesCombo() {
    var url = "../ajax/land.registration.system.data.aspx";
    url += "?commandName=getRecordingTypesStringArrayCmd";
    url += "&recordingActTypeCategoryId=" + getElement("cboRecordingActTypeCategory").value;

    invokeAjaxComboItemsLoader(url, getElement("cboRecordingActType"));

    resetLawArticlesCombo();
  }

  function resetLawArticlesCombo() {
    var url = "../ajax/land.registration.system.data.aspx";
    url += "?commandName=getLawArticlesStringArrayCmd";
    url += "&recordingActTypeId=" + getElement("cboRecordingActType").value;
    invokeAjaxComboItemsLoader(url, getElement("cboLawArticle"));
  }

  function setDefaultRFC() {
    getElement('txtRFC').value = 'XAXX010101000';
  }

  function doValidation(command) {
    var sMsg = "";
    var oPayment = getElement('txtReceiptTotal');

    if (isEmpty(getElement('txtRequestedBy'))) {
      alert("Requiero se proporcione el nombre del interesado.");
      return false;
    }
    if (isEmpty(getElement('txtRFC'))) {
      alert("Requiero se proporcione el RFC de facturaci�n.");
      return false;
    }
    if (!isTaxKey(getElement('txtRFC'))) {
      alert("El RFC para facturaci�n tiene un formato que no reconozco.");
      return false;
    }
    if (isEmpty(getElement('cboDocumentType'))) {
      alert("Requiero se proporcione el tipo de documento que se desea inscribir.");
      return false;
    }
    if (isEmpty(getElement('cboManagementAgency'))) {
      alert("Requiero conocer la notar�a o agencia que tramita.");
      return false;
    }
    if (command == 'saveAndReceiveTransaction') {
      <% if (!base.transaction.Workflow.IsEmptyItemsTransaction) { %>
      if (isEmpty(getElement('txtReceiptNumber'))) {
        alert("Requiero se proporcione el n�mero del recibo emitido para este tr�mite.");
        return false;
      }
      <% } %>
    }
    return true;
  }

  function window_onload() {
    setWorkplace();
    <% if (base.ShowDocumentsEditor()) { %>
     getElement('ifraRecordingEditor').src = "../land.registration.system/recording.editor.aspx?transactionId=<%=transaction.Id%>";
    <% } else { %>
     getElement('ifraRecordingEditor').src = "../workplace/empty.page.aspx";
    <% } %>
    <%=base.OnloadScript()%>
  }

  function setWorkplace2() {
    resizeWorkplace2();
    setObjectEvents();
    window.defaultStatus = '';
  }

  function resizeWorkplace2() {

  }

  function window_onscroll() {

  }

  function ifraRecordingEditor_onresize() {
    var oFrame = getElement("ifraRecordingEditor");
    var oBody = oFrame.document.body;

    var newHeight = oBody.scrollHeight + oBody.clientHeight;

    oFrame.style.height = oBody.scrollHeight + (oBody.offsetHeight - oBody.clientHeight) + 400;
    oFrame.style.width = oBody.scrollWidth + (oBody.offsetWidth - oBody.clientWidth);
    //alert(oFrame.style.height);
  }

  function window_onresize() {
    ifraRecordingEditor_onresize();
    window_onscroll();
  }

  addEvent(window, 'load', window_onload);
  addEvent(window, 'resize', window_onresize);
  addEvent(getElement("ifraRecordingEditor"), 'resize', ifraRecordingEditor_onresize);
  addEvent(getElement("txtRequestedBy"), 'keypress', upperCaseKeyFilter);
  addEvent(getElement("txtRFC"), 'keypress', taxKeyFilter);
  addEvent(getElement("txtDocumentNumber"), 'keypress', upperCaseKeyFilter);
  addEvent(getElement("txtDiscountAuthorization"), 'keypress', upperCaseKeyFilter);
  addEvent(getElement("txtBaseResourceUID"), 'keypress', upperCaseKeyFilter);

  /* ]]> */
  </script>
</html>
