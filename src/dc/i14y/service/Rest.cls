Class dc.i14y.service.Rest  Extends (%CSP.REST, Ens.BusinessService)
{

Parameter ADAPTER = "EnsLib.HTTP.InboundAdapter";

Parameter CHARSET = "UTF-8";

Parameter CONTENTTYPE = "application/json";

Parameter HandleCorsRequest = 0;

Parameter CLASSBS = "dc.API";

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
        <Route Url="/echo" Method="POST" Call="ReceiveCommand" />
    </Routes>
}

ClassMethod ReceiveCommand() As %Status
{
    Try {
        Set tMsg = ##class(bugio.edge.message.request.Healer).%New()
        Do tMsg.%JSONImport(%request.Content.Read())
        Set tSC = ##class(Ens.Director).CreateBusinessService(..#CLASSBS, .service)
        If $$$ISERR(tSC) {
            Set %response.Status = 500
            Write {"status": "error", "reason": "Failed to create business service"}.%ToJSON()
            Return $$$OK
        }


        Set %response.Status = ..#HTTP200OK

    } Catch ex {
        Set %response.Status = 500
        Write {"status": "error", "reason": (ex.DisplayString())}.%ToJSON()
    }
    
    Return $$$OK
}
}
