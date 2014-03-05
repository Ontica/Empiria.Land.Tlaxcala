﻿/* Empiria® Land 2014 ****************************************************************************************
*																																																						 *
*	 Solution  : Empiria® Land                                    System   : Land Intranet Application         *
*	 Namespace : Empiria.Web.UI.Security                          Assembly : Empiria.Land.Intranet.dll         *
*	 Type      : ChangePassword                                   Pattern  : MasterPage View		               *
*	 Date      : 28/Mar/2014                                      Version  : 1.5  License: CC BY-NC-SA 4.0     *
*																																																						 *
*  Summary   : Allows change the current user password.                                                      *
*																																																						 *
**************************************************** Copyright © La Vía Óntica SC + Ontica LLC. 1994-2014. **/
using System;

using Empiria.Presentation.Web;

namespace Empiria.Web.UI.Security {

  public partial class UserEditor : WebPage {

    #region Fields

    protected Empiria.Security.EmpiriaUser user = null;
    protected string grdEntitiesContents = String.Empty;
    protected bool canEditEntitiesGroup = false;
    protected string onDeleteButtonAttrs = String.Empty;
    protected string onChangesButtonAttrs = String.Empty;
    protected string btnAcceptChangesText = String.Empty;
    protected string btnApplyChangesText = String.Empty;
    protected string hdnEntitiesGroupsToInclude = String.Empty;

    #endregion Fields

    protected void Page_Load(object sender, EventArgs e) {
      Initialize();
      if (!IsPostBack) {
        LoadObject();
      } else {
        ExecuteCommand();
      }
    }

    private void Initialize() {
      int userId = int.Parse(Request.QueryString["id"]);
      if (userId == 0) {
        user = new Empiria.Security.EmpiriaUser();
      } else {
        user = Empiria.Security.EmpiriaUser.Parse(userId);
      }
      if (userId == 0) {
        base.Title = "Agregar Usuario";
      } else {
        base.Title = "Editor de Usuarios";
      }
      SetEditorButtons();
    }

    private void ExecuteCommand() {
      string commandName = Request.Form["hdnEmpiriaPageCommandName"];
      string commandArgs = Request.Form["hdnEmpiriaPageCommandArguments"];

      switch (commandName) {
        case "acceptChangesCmd":
          if (ValidateObject()) {
            SaveObject();
            base.RefreshParent = true;
            base.CloseWindow = true;
          }
          break;
        case "applyChangesCmd":
          if (ValidateObject()) {
            SaveObject();
            Response.Redirect(Request.Url.PathAndQuery.Replace("id=0", "id=" + user.Id), true);
          }
          break;
        case "cancelEditionCmd":
          base.CloseWindow = true;
          break;
        case "printObjectCmd":
          break;
        case "deleteObjectCmd":
          DeleteObject();
          base.RefreshParent = true;
          base.CloseWindow = true;
          break;
        default:
          break;
      }
    }

    private void LoadObject() {
      txtDisplayName.Value = user.UserName;
      txtObservations.Value = String.Empty;
      txtUserName.Value = user.UserName;
      chkIsActive.Checked = user.IsActive;
      if (user.IsSystemUser) {
        txtDisplayName.Disabled = true;
        txtObservations.Disabled = true;
        txtEmail.Disabled = true;
        txtUserName.Disabled = true;
        txtNewPassword.Disabled = true;
        txtNewPassword2.Disabled = true;
        chkIsActive.Disabled = true;
      } else {
        SetFocus(this.txtUserName);
      }
      canEditEntitiesGroup = false; //GetCanEditEntitiesGroupFlag(PagaTodo.Rules.EntityGroup.GetTypeInfo().Id);
      grdEntitiesContents = String.Empty; //GetEntitiesGridContents();
      SetDeleteScript();
    }

    private void SetDeleteScript() {
      string script = String.Empty;

      script = "var sMsg = '';\n";
      script += "sMsg = 'Esta operación eliminará en forma definitiva la cuenta de usuario \\n';\n";
      script += "sMsg += '" + user.UserName + ".\\n\\n';\n";
      script += "sMsg += '¿Procedo con la eliminación de la cuenta de usuario?';\n";
      script += "return confirm(sMsg);\n";

      base.Master.SetDeleteScript(script);
    }

    private bool ValidateObject() {
      if (user.IsSystemUser) {
        return false;
      }
      txtDisplayName.Value = EmpiriaString.TrimAll(txtDisplayName.Value);
      txtObservations.Value = EmpiriaString.TrimAll(txtObservations.Value);
      txtUserName.Value = EmpiriaString.TrimAll(txtUserName.Value);
      txtNewPassword.Value = EmpiriaString.TrimAll(txtNewPassword.Value);
      txtNewPassword2.Value = EmpiriaString.TrimAll(txtNewPassword2.Value);
      if (txtDisplayName.Value.Length < 6) {
        base.Master.SetOKScriptMsg("El nombre del usuario no puede ser menor de seis caracteres.");
        SetFocus(this.txtDisplayName);
        return false;
      }
      if (txtUserName.Value.Length < 6) {
        base.Master.SetOKScriptMsg("El identificador de usuario no puede ser menor de seis caracteres.");
        SetFocus(this.txtUserName);
        return false;
      }
      if (AlreadyExistsUserName(txtDisplayName.Value)) {
        base.Master.SetOKScriptMsg("Ya existe otro usuario con el mismo nombre de usuario.");
        SetFocus(this.txtDisplayName);
        return false;
      }
      if (AlreadyExistsUserId(txtUserName.Value)) {
        base.Master.SetOKScriptMsg("Ya existe otro usuario con el mismo identificador de usuario.");
        SetFocus(this.txtUserName);
        return false;
      }
      if (1 <= txtNewPassword.Value.Length && txtNewPassword.Value.Length < 8) {
        base.Master.SetOKScriptMsg("La nueva contraseña no puede ser menor de ocho caracteres.");
        SetFocus(this.txtNewPassword);
        return false;
      }
      if (txtNewPassword.Value != txtNewPassword2.Value) {
        base.Master.SetOKScriptMsg("La nueva contraseña y su confirmación no coinciden.");
        SetFocus(this.txtNewPassword);
        return false;
      }
      if (txtUserName.Value != user.UserName && txtNewPassword.Value.Length == 0) {
        base.Master.SetOKScriptMsg("Al cambiar el identificador del usuario, también debe modificarse la contraseña de acceso.");
        SetFocus(this.txtNewPassword);
        return false;
      }
      return true;
    }

    private string GetGridColumn(string columnData, string attributes) {
      string xhtml = "<td {COLUMN.ATTRIBUTES}>{COLUMN.DATA}</td>";

      xhtml = xhtml.Replace("{COLUMN.ATTRIBUTES}", attributes);

      return xhtml.Replace("{COLUMN.DATA}", columnData);
    }

    private void SaveObject() {
      Empiria.Security.IEmpiriaPrincipal principal = Empiria.ExecutionServer.CurrentPrincipal;

      bool isForAppend = user.IsNew;
      user.UserName = txtUserName.Value;
      user.UITheme = "default";
      if (txtNewPassword.Value.Length != 0) {
        user.SetPassword(txtNewPassword.Value, user.UserName);
      }
      user.IsActive = chkIsActive.Checked;
      //user.Save();
    }

    private void DeleteObject() {

    }

    private void SetEditorButtons() {
      Empiria.Security.IEmpiriaPrincipal principal = Empiria.ExecutionServer.CurrentPrincipal;

      btnAcceptChangesText = "Aceptar";
      btnApplyChangesText = "Aplicar";

      if (user.IsNew || user.IsSystemUser) {
        ///onDeleteButtonAttrs = "disabled='disabled'";
      } else if (!principal.CanExecute(user.ObjectTypeInfo.Id, 'D', user.Id)) {
        //onDeleteButtonAttrs = "disabled='disabled'";
      }
      if (user.IsNew && (!principal.CanExecute(user.ObjectTypeInfo.Id, 'A'))) {
        //onChangesButtonAttrs = "disabled='disabled' tabIndex='-1'";
      } else if (!user.IsNew && !principal.CanExecute(user.ObjectTypeInfo.Id, 'U', user.Id)) {
        //onChangesButtonAttrs = "disabled='disabled' tabIndex='-1'";
      }
    }

    private bool AlreadyExistsUserName(string userName) {
      string filter = "([EOSObjects].[DisplayName] = '" + userName + "')";
      filter += " AND ([EOSObjects].[ObjectId] <> " + user.Id + ")";

      return false;
      //ObjectSearcher searcher = new ObjectSearcher("ObjectType.RolePlayer.SecurityRolePlayer.User", filter, false);
      //return (searcher.FindOne() != null);
    }

    private bool AlreadyExistsUserId(string userId) {
      return false;
      //int objectTypeId = ObjectTypeInfo.Parse("ObjectType.RolePlayer.SecurityRolePlayer.User").Id;

      //DataTable table = DataReader.GetDataTable(DataOperation.Parse("qryObjectsWithAttributeValue",
      //                                          objectTypeId, 207, userId));

      //if (table.Rows.Count == 0) {
      //  return false;
      //} else if (table.Rows.Count != 1) {
      //  return true;
      //} else if (table.Rows.Count == 1) {
      //  if ((int) table.Rows[0]["ObjectId"] == user.Id) {
      //    return false;
      //  } else {
      //    return true;
      //  }
      //} else {
      //  return true;
      //}
    }

    private string GetEntitiesGroupsValues() {
      string controlValue = Request.Form["grdMembersIds"];
      string[] controlValues = Request.Form.GetValues("grdMembersIds");
      string valuesString = String.Empty;

      if (controlValues == null || controlValues.Length == 0) {
        return String.Empty;
      }
      for (int i = 0; i < controlValues.Length; i++) {
        if (String.IsNullOrEmpty(controlValue) || controlValue == "off") {
          // no-op
        } else {
          if (valuesString.Length == 0) {
            valuesString = controlValues[i];
          } else {
            valuesString += "|" + controlValues[i];
          }
        } // if
      } // for
      return valuesString;
    }

    private bool GetCanEditEntitiesGroupFlag(int typeId) {
      if (ExecutionServer.CurrentPrincipal.CanExecute(typeId, 'A')) {
        return true;
      } else {
        return false;
      }
    }

  } // class UserEditor

} // namespace Empiria.Web.UI.Storage