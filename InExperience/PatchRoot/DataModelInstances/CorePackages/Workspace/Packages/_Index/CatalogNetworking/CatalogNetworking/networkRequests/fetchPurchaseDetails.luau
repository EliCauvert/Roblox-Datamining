local HttpService = game:GetService("HttpService")
local LOOKAPIURLModule = require(script:FindFirstAncestor("CatalogNetworking").LOOK_API_URL)

return function(Callback, Assets) --[[ Line: 7 | Named "fetchPurchaseDetails" ]]
	-- upvalues: HttpService (copy), LOOKAPIURLModule (copy)
	return Callback(LOOKAPIURLModule, "POST", { postBody = HttpService:JSONEncode({ assets = Assets }) }):andThen(function(Result) --[[ Line: 10 ]]
		return Result.responseBody
	end):catch(function(Err) --[[ Line: 13 ]]
		warn("[CatalogNetworking] fetchPurchaseDetails failed:", (tostring(Err)))
		
		return nil
	end)
end