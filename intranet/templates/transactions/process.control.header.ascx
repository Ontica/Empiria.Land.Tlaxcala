<thead>
  <%=((Empiria.Presentation.Web.MultiViewDashboard) this.Page).ViewTitle%>
  <tr>
    <th>
			<a href="javascript:sendPageCommand('sortData', 'TransactionUID ASC')">Tr�mite</a> / 
			<a href="javascript:sendPageCommand('sortData', 'DocumentUID DESC')">Documento</a> /
			<a href="javascript:sendPageCommand('sortData', 'TransactionType ASC')">Tipo tr�mite</a> / 
			<a href="javascript:sendPageCommand('sortData', 'DocumentType ASC')">Tipo documento</a> /
			<a href="javascript:sendPageCommand('sortData', 'RecorderOffice ASC')">Distrito</a> /
			<a href="javascript:sendPageCommand('sortData', 'TransactionStatusName ASC')">Estado</a>
		</th>
    <th>
			<a href="javascript:sendPageCommand('sortData', 'RequestedBy ASC')">Nombre</a> / 
		  <a href="javascript:sendPageCommand('sortData', 'DocumentDescriptor ASC')">Instrumento</a> / 
			<a href="javascript:sendPageCommand('sortData', 'ReceiptTotal ASC')">Derechos</a> / 
			<a href="javascript:sendPageCommand('sortData', 'ReceiptNo DESC')">Recibo</a> /
			<a href="javascript:sendPageCommand('sortData', 'PresentationTime ASC')">Presentaci�n</a>
    </th>
    <th>�Qu� debo hacer con el tr�mite?</th>
  </tr>
</thead>
<%# ((Empiria.Presentation.Web.MultiViewDashboard) this.Page).HintContent%>
