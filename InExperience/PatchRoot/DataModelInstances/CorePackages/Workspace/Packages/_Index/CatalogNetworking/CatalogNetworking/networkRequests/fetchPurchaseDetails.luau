local httpService = game:GetService("HttpService")
local LOOK_API_URLModule = require(script:FindFirstAncestor("CatalogNetworking").LOOK_API_URL)

return function(p0, p1) --[[ line: 7 | named "fetchPurchaseDetails" ]]
	-- upvalues: httpService (ref), LOOK_API_URLModule (ref)
	return p0(LOOK_API_URLModule, "POST", { postBody = httpService:JSONEncode({ assets = p1 }) }):andThen(function(p3) --[[ line: 10 ]]
		return p3.responseBody
	end):catch(function(p2) --[[ line: 13 ]]
		warn("[CatalogNetworking] fetchPurchaseDetails failed:", tostring(p2))
		
		return nil
	end)
end