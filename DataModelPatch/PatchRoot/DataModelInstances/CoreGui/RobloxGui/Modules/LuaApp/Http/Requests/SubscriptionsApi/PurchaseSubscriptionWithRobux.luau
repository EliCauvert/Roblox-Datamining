local HttpService = game:GetService("HttpService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UrlModule = require(Modules.LuaApp.Http.Url)
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)
local TModule = require(game:GetService("CorePackages").Packages.t)
local TupleResult = TModule.tuple(TModule.callback, TModule.string)

return function(Callback, p1, PriceInRobux)
	-- upvalues: ArgCheckModule (copy), TupleResult (copy), UrlModule (copy), HttpService (copy)
	ArgCheckModule.assert(TupleResult(Callback, p1, PriceInRobux))
	
	return Callback(string.format("%sv1/subscriptions/purchase-with-robux/%s", UrlModule.APIS_URL, p1), "POST", {
		postBody = HttpService:JSONEncode({ priceInRobux = PriceInRobux })
	})
end