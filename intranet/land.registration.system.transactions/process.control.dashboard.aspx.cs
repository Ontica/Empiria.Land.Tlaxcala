﻿/* Empiria Land **********************************************************************************************
*                                                                                                            *
*  Solution  : Empiria Land                                     System   : Land Intranet Application         *
*  Namespace : Empiria.Land.WebApp                              Assembly : Empiria.Land.Intranet.dll         *
*  Type      : TasksDashboard                                   Pattern  : Explorer Web Page                 *
*  Version   : 3.0                                              License  : Please read license.txt file      *
*                                                                                                            *
*  Summary   : Multiview dashboard used for workflow task management.                                        *
*                                                                                                            *
********************************** Copyright(c) 2009-2017. La Vía Óntica SC, Ontica LLC and contributors.  **/
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

using Empiria.Contacts;
using Empiria.Land.Registration.Data;
using Empiria.Land.Registration.Transactions;
using Empiria.Land.Documentation;
using Empiria.Presentation.Web;
using Empiria.Presentation.Web.Content;

namespace Empiria.Land.WebApp {

  #region
  internal enum TabStrip {
     MisTramitesPendientes = 0,
     DocumentosPorEntregar = 1,
     MiTrabajoRealizado = 2,
     RecibirDocumentos = 3,
     VentanillaDeEntregas = 4,
     MesaDeControl = 5,
     MesaDeDigitalizacion = 6,
     BuscarTramites = 7,
  }

  #endregion

  public partial class ProcessControlDashboard : MultiViewDashboard {

    #region Protected methods

    private string selectedComboFromValue = String.Empty;

    protected void Page_Init(object sender, EventArgs e) {
      cboFrom.ViewStateMode = ViewStateMode.Enabled;
      cboFrom.EnableViewState = true;
      cboResponsible.ViewStateMode = ViewStateMode.Enabled;
      cboResponsible.EnableViewState = true;

      selectedComboFromValue = String.IsNullOrEmpty(Request.Form[cboFrom.UniqueID]) ? String.Empty : Request.Form[cboFrom.UniqueID];
    }

    public sealed override Repeater ItemsRepeater {
      get { return this.itemsRepeater; }
    }

    protected sealed override bool ExecutePageCommand() {
      switch (base.CommandName) {
        case "executeControlDeskOperation":
          ExecuteControlDeskOperation();
          base.LoadRepeater();
          return true;
        case "receiveLRSTransaction":
          ReceiveLRSTransaction();
          base.LoadRepeater();
          return true;
        case "takeLRSTransaction":
          TakeLRSTransaction();
          base.LoadRepeater();
          return true;
        case "changeTransactionStatus":
          ChangeTransactionStatus();
          base.LoadRepeater();
          return true;
        case "returnDocumentToMe":
          ReturnDocumentToMe();
          base.LoadRepeater();
          return true;
        case "updateUserInterface":
          base.LoadRepeater();
          return true;
        case "generateImagingControlID":
          GenerateImagingControlID();
          base.LoadRepeater();
          return true;
        case "processsDocumentImages":
          ProcessDocumentImages();
          base.LoadRepeater();
          return true;
        default:
          return false;
      }
    }

    protected sealed override void Initialize() {

    }

    internal bool IsTabStripSelected(TabStrip tabStrip) {
      return (base.SelectedTabStrip == (int) tabStrip);
    }

    protected sealed override DataView LoadDataSource() {
      Contact me = Contact.Parse(ExecutionServer.CurrentUserId);
      string filter = GetFilter();
      const string sort = "";

      if (IsTabStripSelected(TabStrip.MisTramitesPendientes)) {
        if (!ExecutionServer.CurrentPrincipal.IsInRole("LRSTransaction.ReceiveTransaction")) {
          if (filter.Length != 0) {
            filter += " AND ";
          }
          filter += "(TransactionStatus NOT IN ('D','L'))";
          return WorkflowData.GetResponsibleWorkflowInbox(me, WorkflowTaskStatus.Pending, filter, sort);
        } else {
          if (filter.Length != 0) {
            filter += " AND ";
          }
          filter += "((ResponsibleId = " + User.Id.ToString() + ") OR (TransactionStatus = 'Y')) AND (TrackStatus = 'P') AND (TransactionStatus NOT IN ('D','L'))";
          return TransactionData.GetLRSTransactionsForUI(filter, sort);
        }

      } else if (IsTabStripSelected(TabStrip.DocumentosPorEntregar)) {
        return WorkflowData.GetResponsibleWorkflowInbox(me, WorkflowTaskStatus.OnDelivery, filter, sort);

      } else if (IsTabStripSelected(TabStrip.MiTrabajoRealizado)) {
        return WorkflowData.GetResponsibleWorkflowInbox(me, WorkflowTaskStatus.Closed, filter, sort);

      } else if (IsTabStripSelected(TabStrip.RecibirDocumentos)) {
        if (filter.Length != 0) {
          filter += " AND ";
        }
        filter += "NextTransactionStatus NOT IN ('R','C','Q')";  // ,'H'
        if (!String.IsNullOrWhiteSpace(selectedComboFromValue)) {
          return WorkflowData.GetResponsibleWorkflowInbox(Contact.Parse(int.Parse(selectedComboFromValue)),
                                                          WorkflowTaskStatus.OnDelivery, filter, sort);
        }

      } else if (IsTabStripSelected(TabStrip.VentanillaDeEntregas)) {
        if (filter.Length != 0) {
          filter += " AND ";
        }
        filter += "(TransactionStatus IN ('D','L'))";
        return TransactionData.GetLRSTransactionsForUI(filter, sort);

      } else if (IsTabStripSelected(TabStrip.MesaDeControl)) {      // Mesa de control
        //if (filter.Length != 0) {
        //  filter += " AND ";
        //}
        //filter += "(TransactionStatus IN ('H'))";
        return TransactionData.GetLRSTransactionsForUI(filter, sort);

      } else if (IsTabStripSelected(TabStrip.BuscarTramites)) {
        return TransactionData.GetLRSTransactionsForUI(filter, "PresentationTime DESC");

      }
      return new DataView();
    }

    protected sealed override void LoadPageControls() {
      LoadCombos();
      if (txtFromDate.Value == String.Empty) {
        txtFromDate.Value = DateTime.Parse("01/Sep/2017").ToString("dd/MMM/yyyy");
      }
      if (txtToDate.Value == String.Empty) {
        txtToDate.Value = DateTime.Today.ToString("dd/MMM/yyyy");
      }
      cboFrom.Value = selectedComboFromValue;
      if (!IsPostBack) {
        cboStatus.SelectedIndex = 1;
      }
    }

    private void LoadCombos() {
      if (IsTabStripSelected(TabStrip.RecibirDocumentos) && this.cboFrom.Items.Count <= 1) {
        FixedList<Contact> list = WorkflowData.GetContactsWithWorkflowOutboxTasks();
        HtmlSelectContent.LoadCombo(this.cboFrom, list, "Id", "Alias",
                                    "( ¿Quién le está entregando? )", String.Empty, String.Empty);
        cboFrom.Items.Insert(1, new ListItem("Mesa de control", "(TransactionStatus = 'K')"));
        cboFrom.Items.Insert(2, new ListItem("Mesa de digitalización", "(TransactionStatus = 'A')"));
        cboFrom.Items.Insert(3, new ListItem("Ventanilla de entregas", "(TransactionStatus IN ('L', 'D')"));
        cboFrom.Items.Insert(4, String.Empty);
      }
      if (IsTabStripSelected(TabStrip.MesaDeControl) && this.cboResponsible.Items.Count <= 1) {
        DataView view = WorkflowData.GetWorkflowActiveTasksTotals();

        HtmlSelectContent.LoadCombo(this.cboResponsible, view, "ResponsibleId", "Responsible",
                                    "( Todos los responsables )", String.Empty, String.Empty);
      }
    }

    protected string GetLegacyDataViewerUrl() {
      return ConfigurationData.GetString("LegacyDataViewer.Url");
    }

    protected sealed override void SetRepeaterTemplates() {
      if (IsTabStripSelected(TabStrip.MisTramitesPendientes)) {
        Func<DataRowView, string> Id = (x => Convert.ToString(x["ResponsibleId"]));
        itemsRepeater.HeaderTemplate = Page.LoadTemplate("~/templates/transactions/process.control.header.ascx");
        itemsRepeater.ItemTemplate = Page.LoadTemplate("~/templates/transactions/process.control.item.ascx");
        base.ViewColumnsCount = 4;
        base.LoadInboxesInQuickMode = true;

      } else if (IsTabStripSelected(TabStrip.DocumentosPorEntregar)) {
        itemsRepeater.HeaderTemplate = Page.LoadTemplate("~/templates/transactions/process.control.header.ascx");
        itemsRepeater.ItemTemplate = Page.LoadTemplate("~/templates/transactions/process.delivery.item.ascx");
        base.ViewColumnsCount = 4;
        base.LoadInboxesInQuickMode = true;

      } else if (IsTabStripSelected(TabStrip.MiTrabajoRealizado)) {
        itemsRepeater.HeaderTemplate = Page.LoadTemplate("~/templates/transactions/process.control.header.ascx");
        itemsRepeater.ItemTemplate = Page.LoadTemplate("~/templates/transactions/process.close.item.ascx");
        base.ViewColumnsCount = 4;
        base.LoadInboxesInQuickMode = true;

      } else if (IsTabStripSelected(TabStrip.RecibirDocumentos)) {
        itemsRepeater.HeaderTemplate = Page.LoadTemplate("~/templates/transactions/process.control.header.ascx");
        itemsRepeater.ItemTemplate = Page.LoadTemplate("~/templates/transactions/process.receive.item.ascx");
        base.ViewColumnsCount = 4;
        base.LoadInboxesInQuickMode = true;

      } else if (IsTabStripSelected(TabStrip.VentanillaDeEntregas)) {
        itemsRepeater.HeaderTemplate = Page.LoadTemplate("~/templates/transactions/process.control.header.ascx");
        itemsRepeater.ItemTemplate = Page.LoadTemplate("~/templates/transactions/process.control.item.ascx");
        base.ViewColumnsCount = 4;
        base.LoadInboxesInQuickMode = false;

      } else if (IsTabStripSelected(TabStrip.MesaDeControl)) {
        itemsRepeater.HeaderTemplate = Page.LoadTemplate("~/templates/transactions/control.desk.header.ascx");
        itemsRepeater.ItemTemplate = Page.LoadTemplate("~/templates/transactions/control.desk.item.ascx");
        base.ViewColumnsCount = 4;
        base.LoadInboxesInQuickMode = false;

      } else if (IsTabStripSelected(TabStrip.BuscarTramites)) {
        itemsRepeater.HeaderTemplate = Page.LoadTemplate("~/templates/transactions/process.search.header.ascx");
        itemsRepeater.ItemTemplate = Page.LoadTemplate("~/templates/transactions/process.search.item.ascx");
        base.ViewColumnsCount = 5;
        base.LoadInboxesInQuickMode = false;

      } else {
        itemsRepeater.HeaderTemplate = Page.LoadTemplate("~/templates/empty.header.ascx");

      }
    }

    private void ChangeTransactionStatus() {
      LRSTransaction transaction = LRSTransaction.Parse(int.Parse(GetCommandParameter("id")));
      LRSTransactionStatus status = (LRSTransactionStatus) Convert.ToChar(GetCommandParameter("state"));
      string note = GetCommandParameter("notes", false);

      string s = LRSWorkflowRules.ValidateStatusChange(transaction, status);
      if (!String.IsNullOrWhiteSpace(s)) {
        base.SetOKScriptMsg(s);
        return;
      }
      transaction.Workflow.SetNextStatus(status, Person.Empty, note);

      // Don't show status for users in Vetanilla de entregas and
      // next status was delivered or returned.
      if (status != LRSTransactionStatus.Delivered &&
          status != LRSTransactionStatus.Returned && !IsTabStripSelected(TabStrip.VentanillaDeEntregas)) {
        base.SetOKScriptMsg();
      }
      txtSearchExpression.Value = "";
      txtSearchExpression.Focus();
    }

    private void GenerateImagingControlID() {
      int documentId = int.Parse(GetCommandParameter("id"));

      var document = Registration.RecordingDocument.Parse(documentId);
      document.GenerateImagingControlID();

      var onEndLoadScript = String.Format("doOperation('viewDocumentImaging', {0});", documentId);
      base.Master.AppendEndLoadScript(onEndLoadScript);
    }

    private void ProcessDocumentImages() {
      var imageProcessingEngine = ImageProcessingEngine.GetInstance();

      if (imageProcessingEngine.IsRunning) {
        base.SetOKScriptMsg("El procesamiento de imágenes ya se está ejecutando.\\n\\n" +
                            "En breve estarán listos los resultados.");
        txtSearchExpression.Value = "";
        txtSearchExpression.Focus();
        return;
      }
      imageProcessingEngine.Start();
      base.SetOKScriptMsg("El procesamiento de imágenes se ha iniciado.\\n\\n" +
                          "Más tarde estarán listos los resultados.");
      txtSearchExpression.Value = "";
      txtSearchExpression.Focus();
    }

    private void ReceiveLRSTransaction() {
      int transactionId = int.Parse(GetCommandParameter("id"));
      string notes = GetCommandParameter("notes", false);

      LRSTransaction transaction = LRSTransaction.Parse(transactionId);

      string s = LRSWorkflowRules.ValidateStatusChange(transaction, LRSTransactionStatus.Received);

      if (!String.IsNullOrWhiteSpace(s)) {
        base.SetOKScriptMsg(s);
        return;
      }
      transaction.Workflow.Receive(notes);

      base.SetOKScriptMsg();
      txtSearchExpression.Value = "";
      txtSearchExpression.Focus();
    }


    private void ExecuteControlDeskOperation() {
      int transactionId = int.Parse(GetCommandParameter("id"));
      string operation = GetCommandParameter("operation");
      string notes = GetCommandParameter("notes", false);

      LRSTransaction transaction = LRSTransaction.Parse(transactionId);

      switch (operation) {
        case "ReturnToControlDesk":
          transaction.Workflow.ReturnToMe();
          break;
        case "ReceiveInControlDesk":
          transaction.Workflow.Take(notes);
          break;
        case "PullToControlDesk":
          transaction.Workflow.PullToControlDesk(notes);
          break;
      }
      base.SetOKScriptMsg();
      txtSearchExpression.Value = "";
      txtSearchExpression.Focus();
    }

    private void TakeLRSTransaction() {
      int transactionId = int.Parse(GetCommandParameter("id"));
      string notes = GetCommandParameter("notes", false);

      LRSTransaction transaction = LRSTransaction.Parse(transactionId);
      transaction.Workflow.Take(notes);

      base.SetOKScriptMsg();
      txtSearchExpression.Value = "";
      txtSearchExpression.Focus();
    }

    private void ReturnDocumentToMe() {
      int transactionId = int.Parse(GetCommandParameter("id"));

      LRSTransaction transaction = LRSTransaction.Parse(transactionId);
      transaction.Workflow.ReturnToMe();

      base.SetOKScriptMsg("");
      txtSearchExpression.Value = "";
      txtSearchExpression.Focus();
    }

    private string GetFilter() {
      string filter = String.Empty;
      if (cboProcessType.Value.Length != 0) {
        filter = "(TransactionTypeId = " + cboProcessType.Value + ")";
      }
      if (cboStatus.Value.Length != 0 &&
          !IsTabStripSelected(TabStrip.RecibirDocumentos) &&
          !IsTabStripSelected(TabStrip.VentanillaDeEntregas)) {
        if (filter.Length != 0) {
          filter += " AND ";
        }
        filter += cboStatus.Value;
      }
      if (cboRecorderOffice.Value.Length != 0) {
        if (filter.Length != 0) {
          filter += " AND ";
        }
        filter += "(RecorderOfficeId = " + cboRecorderOffice.Value + ")";
      }
      if (cboResponsible.Value.Length != 0 && IsTabStripSelected(TabStrip.MesaDeControl)) {
        if (filter.Length != 0) {
          filter += " AND ";
        }
        filter += "(ResponsibleId = " + cboResponsible.Value + ")";
      }
      if (txtSearchExpression.Value.Length != 0) {
        string parseAndLike = String.Empty;
        if (cboSearch.Value.Length != 0) {
          parseAndLike = SearchExpression.ParseAndLike(cboSearch.Value, txtSearchExpression.Value);
        } else {
          parseAndLike = SearchExpression.ParseAndLike("TransactionKeywords", txtSearchExpression.Value);
        }
        if (parseAndLike.Length != 0) {
          if (filter.Length != 0) {
            filter += " AND ";
          }
          filter += parseAndLike;
        }
      }
      if (cboElapsedTime.Value.Length != 0) {
        if (filter.Length != 0) {
          filter += " AND ";
        }
        filter += cboElapsedTime.Value;
      }
      if (cboDate.Value.Length != 0 && txtFromDate.Value.Length != 0) {
        if (filter.Length != 0) {
          filter += " AND ";
        }
        filter += "([" + cboDate.Value + "] >= '" + EmpiriaString.ToDate(txtFromDate.Value).ToString("yyyy-MM-dd") + "') AND " +
                  "([" + cboDate.Value + "] < '" + EmpiriaString.ToDate(txtToDate.Value).ToString("yyyy-MM-dd 23:59") + "')";
      }
      return filter;
    }

    #endregion Protected methods

  } // class ProcessControlDashboard

} // namespace Empiria.Land.WebApp
