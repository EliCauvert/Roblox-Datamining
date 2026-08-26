local httpService = game:GetService("HttpService")
local LOOK_API_URLModule = require(script:FindFirstAncestor("CatalogNetworking").LOOK_API_URL)

return function(p1, p2)
	-- upvalues: httpService (ref), LOOK_API_URLModule (ref)
	return p1(LOOK_API_URLModule, "POST", { postBody = httpService:JSONEncode({ assets = p2 }) }):andThen(function(p3)
		return p3.responseBody
	end):catch(function(p3)
		warn("[CatalogNetworking] fetchPurchaseDetails failed:", tostring(p3))
		
		return nil
	end)
end