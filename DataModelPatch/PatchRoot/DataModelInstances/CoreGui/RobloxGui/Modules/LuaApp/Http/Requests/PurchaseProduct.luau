local HttpService = game:GetService("HttpService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UrlModule = require(Modules.LuaApp.Http.Url)
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)
local TModule = require(game:GetService("CorePackages").Packages.t)
local TupleResult = TModule.tuple(TModule.callback, TModule.integer, require(Modules.LuaApp.Types.EconomyTypes).PurchaseDetail)

return function(Callback, p1, Input)
	-- upvalues: ArgCheckModule (copy), TupleResult (copy), UrlModule (copy), HttpService (copy)
	ArgCheckModule.assert(TupleResult(Callback, p1, Input))
	
	return Callback(("%sv1/purchases/products/%i"):format(UrlModule.ECONOMY_URL, p1), "POST", { postBody = HttpService:JSONEncode(Input) })
end