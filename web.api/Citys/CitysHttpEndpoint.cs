﻿/* Empiria Extensions Framework ******************************************************************************
*                                                                                                            *
*  Solution  : Empiria Extensions Framework                   System   : Empiria Web API Services            *
*  Namespace : Empiria.WebApi                                 Assembly : Empiria.WebApi.dll                  *
*  Type      : HttpEndpoint                                   Pattern  : General Object                      *
*  Version   : 1.1                                            License  : Please read license.txt file        *
*                                                                                                            *
*  Summary   : Describes an Http endpoint used to invoke a web API from a client app.                        *
*                                                                                                            *
************************* Copyright(c) La Vía Óntica SC, Ontica LLC and contributors. All rights reserved. **/
using System;

namespace Empiria.Land.WebApi.Citys {

  /// <summary>Describes an Http endpoint used to invoke a web API from a client app.</summary>
  public class CitysHttpEndpoint : GeneralObject {

    #region Constructors and parsers

    private CitysHttpEndpoint() {
      // Required by Empiria Framework.
    }

    /// <summary>Parses an Http endpoint given its numerical id.</summary>
    static public CitysHttpEndpoint Parse(int id) {
      return BaseObject.ParseId<CitysHttpEndpoint>(id);
    }

    /// <summary>Gets the full list of available Http API endpoints.</summary>
    static public FixedList<CitysHttpEndpoint> GetList() {
      return GeneralObject.GetList<CitysHttpEndpoint>();
    }

    #endregion Constructors and parsers

    #region Properties

    /// <summary>Unique ID string for the Http Endpoint.</summary>
    public override string UID {
      get {
        return base.NamedKey;
      }
    }


    /// <summary>The Http realtive endpoint URL that provides the service.</summary>
    [DataField(ExtensionDataFieldName + ".url")]
    public string Url {
      get;
      private set;
    }


    /// <summary>Description of the service provided by the endpoint.</summary>
    public string Description {
      get {
        return base.Name;
      }
    }


    /// <summary>HTTP method used to invoke the call.
    /// Posible return values are GET, POST, PUT, PATCH or DELETE.</summary>
    [DataField(ExtensionDataFieldName + ".method", Default = "GET")]
    public string Method {
      get;
      private set;
    }


    /// <summary>Optional name of the Type that performs the service.
    /// Returns an empty string if the endpoint is not linked to any Type.</summary>
    [DataField(ExtensionDataFieldName + ".typeName")]
    public string TypeName {
      get;
      private set;
    }


    /// <summary>Name of the related type operation
    /// If the property TypeName has no value, then this property returns an empty string too.</summary>
    [DataField(ExtensionDataFieldName + ".typeOperation")]
    public string TypeOperation {
      get;
      private set;
    }

    #endregion Properties

  } // class HttpEndpoint

} // namespace Empiria.WebApi
