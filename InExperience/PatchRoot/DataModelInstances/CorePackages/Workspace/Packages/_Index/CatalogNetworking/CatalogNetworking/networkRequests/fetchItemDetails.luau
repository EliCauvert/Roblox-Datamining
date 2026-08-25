local httpService = game:GetService("HttpService")
local CATALOG_URLModule = require(script:FindFirstAncestor("CatalogNetworking").CATALOG_URL)

return function(p0, p1)
	-- upvalues: httpService (ref), CATALOG_URLModule (ref)
	return p0(`{CATALOG_URLModule}/v1/catalog/items/details`, "POST", { postBody = httpService:JSONEncode({ items = p1 }) }):andThen(function(p3)
		return p3.responseBody
	end):catch(function(p2)
		warn("[CatalogNetworking] fetchItemDetails failed:", tostring(p2))
		
		return nil
	end)
end