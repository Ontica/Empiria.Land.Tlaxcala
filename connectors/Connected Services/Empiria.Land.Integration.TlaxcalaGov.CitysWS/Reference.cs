﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     //
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Empiria.Land.Integration.TlaxcalaGov.CitysWS
{

    [System.CodeDom.Compiler.GeneratedCodeAttribute("dotnet-svcutil", "1.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(Namespace="http://ws.ispac.tdw.ieci/", ConfigurationName= "Empiria.Land.Integration.TlaxcalaGov.CitysWS.RppCertificateEmissionWS")]
    internal interface RppCertificateEmissionWS
    {

        [System.ServiceModel.OperationContractAttribute(Action="http://ws.ispac.tdw.ieci/RppCertificateEmissionWS/receiveCertificateRequest", ReplyAction="http://ws.ispac.tdw.ieci/RppCertificateEmissionWS/receiveCertificateResponse")]
        [System.ServiceModel.XmlSerializerFormatAttribute(Style=System.ServiceModel.OperationFormatStyle.Rpc, SupportFaults=true)]
        [return: System.ServiceModel.MessageParameterAttribute(Name="return")]
        System.Threading.Tasks.Task<int> receiveCertificateAsync(authBean arg0, rppCertificateEmissionCertificateBean arg1);

        [System.ServiceModel.OperationContractAttribute(Action="http://ws.ispac.tdw.ieci/RppCertificateEmissionWS/canSendDocumentRequest", ReplyAction="http://ws.ispac.tdw.ieci/RppCertificateEmissionWS/canSendDocumentResponse")]
        [System.ServiceModel.XmlSerializerFormatAttribute(Style=System.ServiceModel.OperationFormatStyle.Rpc, SupportFaults=true)]
        [return: System.ServiceModel.MessageParameterAttribute(Name="return")]
        System.Threading.Tasks.Task<bool> canSendDocumentAsync(authBean arg0, string arg1);
    }

    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("dotnet-svcutil", "1.0.0.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://ws.ispac.tdw.ieci/")]
    public partial class authBean
    {

        private bool appField;

        private bool appFieldSpecified;

        private int appIdField;

        private bool appIdFieldSpecified;

        private bool citizenField;

        private bool citizenFieldSpecified;

        private string passwordField;

        private bool saveField;

        private bool saveFieldSpecified;

        private string userField;

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=0)]
        public bool app
        {
            get
            {
                return this.appField;
            }
            set
            {
                this.appField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public bool appSpecified
        {
            get
            {
                return this.appFieldSpecified;
            }
            set
            {
                this.appFieldSpecified = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=1)]
        public int appId
        {
            get
            {
                return this.appIdField;
            }
            set
            {
                this.appIdField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public bool appIdSpecified
        {
            get
            {
                return this.appIdFieldSpecified;
            }
            set
            {
                this.appIdFieldSpecified = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=2)]
        public bool citizen
        {
            get
            {
                return this.citizenField;
            }
            set
            {
                this.citizenField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public bool citizenSpecified
        {
            get
            {
                return this.citizenFieldSpecified;
            }
            set
            {
                this.citizenFieldSpecified = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=3)]
        public string password
        {
            get
            {
                return this.passwordField;
            }
            set
            {
                this.passwordField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=4)]
        public bool save
        {
            get
            {
                return this.saveField;
            }
            set
            {
                this.saveField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public bool saveSpecified
        {
            get
            {
                return this.saveFieldSpecified;
            }
            set
            {
                this.saveFieldSpecified = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=5)]
        public string user
        {
            get
            {
                return this.userField;
            }
            set
            {
                this.userField = value;
            }
        }
    }

    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("dotnet-svcutil", "1.0.0.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://ws.ispac.tdw.ieci/")]
    public partial class rppCertificateEmissionCertificateBean
    {

        private byte[] certificateField;

        private int certificateTypeField;

        private bool certificateTypeFieldSpecified;

        private string folioRealField;

        private string motiveField;

        private string referenceField;

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified, DataType="base64Binary", Order=0)]
        public byte[] certificate
        {
            get
            {
                return this.certificateField;
            }
            set
            {
                this.certificateField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=1)]
        public int certificateType
        {
            get
            {
                return this.certificateTypeField;
            }
            set
            {
                this.certificateTypeField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public bool certificateTypeSpecified
        {
            get
            {
                return this.certificateTypeFieldSpecified;
            }
            set
            {
                this.certificateTypeFieldSpecified = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=2)]
        public string folioReal
        {
            get
            {
                return this.folioRealField;
            }
            set
            {
                this.folioRealField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=3)]
        public string motive
        {
            get
            {
                return this.motiveField;
            }
            set
            {
                this.motiveField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=4)]
        public string reference
        {
            get
            {
                return this.referenceField;
            }
            set
            {
                this.referenceField = value;
            }
        }
    }

    [System.CodeDom.Compiler.GeneratedCodeAttribute("dotnet-svcutil", "1.0.0.0")]
    internal interface RppCertificateEmissionWSChannel : RppCertificateEmissionWS, System.ServiceModel.IClientChannel
    {
    }

    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("dotnet-svcutil", "1.0.0.0")]
    internal partial class RppCertificateEmissionWSClient : System.ServiceModel.ClientBase<RppCertificateEmissionWS>, RppCertificateEmissionWS
    {

    /// <summary>
    /// Implement this partial method to configure the service endpoint.
    /// </summary>
    /// <param name="serviceEndpoint">The endpoint to configure</param>
    /// <param name="clientCredentials">The client credentials</param>
    static partial void ConfigureEndpoint(System.ServiceModel.Description.ServiceEndpoint serviceEndpoint, System.ServiceModel.Description.ClientCredentials clientCredentials);

        public RppCertificateEmissionWSClient() :
                base(RppCertificateEmissionWSClient.GetDefaultBinding(), RppCertificateEmissionWSClient.GetDefaultEndpointAddress())
        {
            this.Endpoint.Name = EndpointConfiguration.RppCertificateEmissionWSImplPort.ToString();
            ConfigureEndpoint(this.Endpoint, this.ClientCredentials);
        }

        public RppCertificateEmissionWSClient(EndpointConfiguration endpointConfiguration) :
                base(RppCertificateEmissionWSClient.GetBindingForEndpoint(endpointConfiguration), RppCertificateEmissionWSClient.GetEndpointAddress(endpointConfiguration))
        {
            this.Endpoint.Name = endpointConfiguration.ToString();
            ConfigureEndpoint(this.Endpoint, this.ClientCredentials);
        }

        public RppCertificateEmissionWSClient(EndpointConfiguration endpointConfiguration, string remoteAddress) :
                base(RppCertificateEmissionWSClient.GetBindingForEndpoint(endpointConfiguration), new System.ServiceModel.EndpointAddress(remoteAddress))
        {
            this.Endpoint.Name = endpointConfiguration.ToString();
            ConfigureEndpoint(this.Endpoint, this.ClientCredentials);
        }

        public RppCertificateEmissionWSClient(EndpointConfiguration endpointConfiguration, System.ServiceModel.EndpointAddress remoteAddress) :
                base(RppCertificateEmissionWSClient.GetBindingForEndpoint(endpointConfiguration), remoteAddress)
        {
            this.Endpoint.Name = endpointConfiguration.ToString();
            ConfigureEndpoint(this.Endpoint, this.ClientCredentials);
        }

        public RppCertificateEmissionWSClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) :
                base(binding, remoteAddress)
        {
        }

        public System.Threading.Tasks.Task<int> receiveCertificateAsync(authBean arg0, rppCertificateEmissionCertificateBean arg1)
        {
            return base.Channel.receiveCertificateAsync(arg0, arg1);
        }

        public System.Threading.Tasks.Task<bool> canSendDocumentAsync(authBean arg0, string arg1)
        {
            return base.Channel.canSendDocumentAsync(arg0, arg1);
        }

        public virtual System.Threading.Tasks.Task OpenAsync()
        {
            return System.Threading.Tasks.Task.Factory.FromAsync(((System.ServiceModel.ICommunicationObject)(this)).BeginOpen(null, null), new System.Action<System.IAsyncResult>(((System.ServiceModel.ICommunicationObject)(this)).EndOpen));
        }

        public virtual System.Threading.Tasks.Task CloseAsync()
        {
            return System.Threading.Tasks.Task.Factory.FromAsync(((System.ServiceModel.ICommunicationObject)(this)).BeginClose(null, null), new System.Action<System.IAsyncResult>(((System.ServiceModel.ICommunicationObject)(this)).EndClose));
        }

        private static System.ServiceModel.Channels.Binding GetBindingForEndpoint(EndpointConfiguration endpointConfiguration)
        {
            if ((endpointConfiguration == EndpointConfiguration.RppCertificateEmissionWSImplPort))
            {
                System.ServiceModel.BasicHttpBinding result = new System.ServiceModel.BasicHttpBinding();
                result.MaxBufferSize = int.MaxValue;
                result.ReaderQuotas = System.Xml.XmlDictionaryReaderQuotas.Max;
                result.MaxReceivedMessageSize = int.MaxValue;
                result.AllowCookies = true;
                return result;
            }
            throw new System.InvalidOperationException(string.Format("Could not find endpoint with name \'{0}\'.", endpointConfiguration));
        }

        private static System.ServiceModel.EndpointAddress GetEndpointAddress(EndpointConfiguration endpointConfiguration)
        {
            if ((endpointConfiguration == EndpointConfiguration.RppCertificateEmissionWSImplPort))
            {
                return new System.ServiceModel.EndpointAddress(Empiria.ConfigurationData.GetString("CitysWS.Endpoint"));
            }
            throw new System.InvalidOperationException(string.Format("Could not find endpoint with name \'{0}\'.", endpointConfiguration));
        }

        private static System.ServiceModel.Channels.Binding GetDefaultBinding()
        {
            return RppCertificateEmissionWSClient.GetBindingForEndpoint(EndpointConfiguration.RppCertificateEmissionWSImplPort);
        }

        private static System.ServiceModel.EndpointAddress GetDefaultEndpointAddress()
        {
            return RppCertificateEmissionWSClient.GetEndpointAddress(EndpointConfiguration.RppCertificateEmissionWSImplPort);
        }

        public enum EndpointConfiguration
        {

            RppCertificateEmissionWSImplPort,
        }
    }
}
