local HttpService = game:GetService("HttpService")
local LOOKAPIURLModule = require(script:FindFirstAncestor("CatalogNetworking").LOOK_API_URL)

return function(Callback, Assets)
	-- upvalues: HttpService (copy), LOOKAPIURLModule (copy)
	return Callback(LOOKAPIURLModule, "POST", { postBody = HttpService:JSONEncode({ assets = Assets }) }):andThen(function(Result)
		return Result.responseBody
	end):catch(function(Err)
		warn("[CatalogNetworking] fetchPurchaseDetails failed:", (tostring(Err)))
		
		return nil
	end)
end