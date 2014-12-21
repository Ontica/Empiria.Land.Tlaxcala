﻿/* Empiria® Land 2015 ****************************************************************************************
*																																																						 *
*	 Solution  : Empiria® Land                                    System   : Land Intranet Application         *
*	 Namespace : Empiria.Web.UI                                   Assembly : Empiria.Land.Intranet.dll         *
*	 Type      : LogonPage										                    Pattern  : Logon Web Page                    *
*	 Date      : 04/Jan/2015                                      Version  : 2.0  License: LICENSE.TXT file    *
*																																																						 *
*  Summary   : Gets user credentials and redirects users to the workplace start page.                        *
*																																																						 *
**************************************************** Copyright © La Vía Óntica SC + Ontica LLC. 2009-2015. **/
using System;

using Empiria.Presentation.Web.Controllers;
using Empiria.Security;

namespace Empiria.Web.UI {

  public partial class LogonPage : System.Web.UI.Page {

    #region Fields

    private FormsLogonController controller = new FormsLogonController();
    protected string clientScriptCode = String.Empty;

    #endregion Fields

    #region Public properties

    public FormsLogonController Controller {
      get { return controller; }
    }

    #endregion Public properties

    #region Event handlers

    protected void Page_Load(object sender, System.EventArgs e) {
      if (!IsPostBack) {
        SetDefaultValues();
      } else {
        if (String.IsNullOrEmpty(txtUserId.Value)) {
          clientScriptCode = "alert('Para efectuar esta operación requiero el identificador de usuario.');";
          return;
        }
        if (String.IsNullOrEmpty(txtPassword.Value)) {
          clientScriptCode = "alert('Para efectuar esta operación requiero la contraseña de acceso al sistema.');";
          return;
        }
        if (!TryLogon(txtUserId.Value, txtPassword.Value)) {
          SetDefaultValues();
          txtPassword.Value = String.Empty;
        }
      }
    }

    #endregion Event handlers

    #region Private methods

    private bool TryLogon(string userName, string password) {
      const string clientAppKey = "vQNLXJeCoRPOtINfussrnSabsNs5jaOCRpdEYg5aXIOehqiBIARTgPUwtbrA940Q";

      userName = userName.Trim();
      password = password.Trim();

      userName = Cryptographer.Encrypt(EncryptionMode.EntropyKey, userName, Session.SessionID);
      password = Cryptographer.Encrypt(EncryptionMode.EntropyKey, password, Session.SessionID);

      return this.Controller.Logon(clientAppKey, userName, password, 1);
    }

    private void SetDefaultValues() {
      string lastUserName = this.Controller.GetLastAuthenticatedUserName();

      if (!IsPostBack) {
        txtUserId.Value = lastUserName;
      }
      txtAccessCode.Value = "ABCDEFG";
    }

    protected string GetDevelopmentCode() {
      if (Request.Url.ToString().StartsWith("http://jmcota/empiria.land/tlaxcala/intranet/")) {
        return "getElement('txtPassword').value = 's3cur1ty'";
      } else {
        return String.Empty;
      }
    }

    #endregion Private methods

  } // class LogonPage

} // namespace Empiria.Web.UI
