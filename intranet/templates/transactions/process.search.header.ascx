<thead>
  <%=((Empiria.Presentation.Web.MultiViewDashboard) this.Page).ViewTitle%>
  <tr>
    <th>
			<a href="javascript:sendPageCommand('sortData', 'TransactionUID ASC')">Tr�mite</a> / 
			<a href="javascript:sendPageCommand('sortData', 'DocumentUID DESC')">Documento</a> /
			<a href="javascript:sendPageCommand('sortData', 'TransactionType DESC')">Tipo tr�mite</a> / 
			<a href="javascript:sendPageCommand('sortData', 'RecorderOffice DESC')">Distrito</a> /
			<a href="javascript:sendPageCommand('sortData', 'TransactionStatusName DESC')">Estado</a>
		</th>
    <th>
			<a href="javascript:sendPageCommand('sortData', 'RequestedBy ASC')">Nombre</a> / 
			<a href="javascript:sendPageCommand('sortData', 'DocumentNumber DESC')">Instrumento</a> / 
			<a href="javascript:sendPageCommand('sortData', 'ReceiptTotal DESC')">Derechos</a> / 
			<a href="javascript:sendPageCommand('sortData', 'ReceiptNumber DESC')">Recibo</a> /
			<a href="javascript:sendPageCommand('sortData', 'PresentationTime DESC')">Present</a>
    </th>
    <th>
			<a href="javascript:sendPageCommand('sortData', 'Agency ASC')">Tramit�</a> / 
			<a href="javascript:sendPageCommand('sortData', 'WorkingTime DESC')">Tiempo</a> / 
			<a href="javascript:sendPageCommand('sortData', 'TotalTime DESC')">Dur</a> / 
			<a href="javascript:sendPageCommand('sortData', 'ComplexityIndex DESC')">Cj</a> / 
      			<a href="javascript:sendPageCommand('sortData', 'LastReentryTime DESC')">F.Reing</a>
    </th>
    <th>
			<a href="javascript:sendPageCommand('sortData', 'ToContact ASC')">Lo tiene</a> / 
			<a href="javascript:sendPageCommand('sortData', 'TrackTime DESC')">Recibido</a> / 
			<a href="javascript:sendPageCommand('sortData', 'FromContact DESC')">Entreg�</a>
    </th>
  </tr>
</thead>
<%# ((Empiria.Presentation.Web.MultiViewDashboard) this.Page).HintContent%>
