﻿/* Empiria® Land 2015 ****************************************************************************************
*																																																						 *
*	 Solution  : Empiria® Land                                    System   : Land Intranet Application         *
*	 Namespace : Empiria.Web.UI.Workplace                         Assembly : Empiria.Land.Intranet.dll         *
*	 Type      : DefaultMasterPage										            Pattern  : Master Web Page                   *
*	 Date      : 04/Jan/2015                                      Version  : 2.0  License: LICENSE.TXT file    *
*																																																						 *
*  Summary   : Gets user credentials and redirects users to the workplace start page.                        *
*																																																						 *
**************************************************** Copyright © La Vía Óntica SC + Ontica LLC. 1994-2015. **/
using System;

using Empiria.Presentation.Web;
using Empiria.Presentation.Web.Content;

namespace Empiria.Web.UI.Workplace {

  public partial class DefaultMasterPage : MasterWebPage {

    #region Fields

    protected string selectedMenuOption = "menuOption101";
    private MasterPageContent masterPageContent = null;

    #endregion Fields

    #region Protected properties

    protected MasterPageContent MasterPageContent {
      get {
        if (masterPageContent == null) {
          masterPageContent = new MasterPageContent(base.Page);
        }
        return masterPageContent;
      }
    }

    #endregion Protected properties

    #region Protected methods

    protected override void Initialize() {
      if (!String.IsNullOrEmpty(Request.QueryString["dashboardId"])) {
        selectedMenuOption = "menuOption" + Request.QueryString["dashboardId"];
      }
    }

    protected override void LoadMasterPageControls() {

    }

    #endregion Protected methods

  } // class DefaultMasterPage

} // namespace Empiria.Web.UI.Workplace
