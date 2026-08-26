local httpService = game:GetService("HttpService")
local CATALOG_URLModule = require(script:FindFirstAncestor("CatalogNetworking").CATALOG_URL)

return function(p1, p2)
	-- upvalues: httpService (ref), CATALOG_URLModule (ref)
	return p1(`{CATALOG_URLModule}/v1/catalog/items/details`, "POST", { postBody = httpService:JSONEncode({ items = p2 }) }):andThen(function(p3)
		return p3.responseBody
	end):catch(function(p3)
		warn("[CatalogNetworking] fetchItemDetails failed:", tostring(p3))
		
		return nil
	end)
end