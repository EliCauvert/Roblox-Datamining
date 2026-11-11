local HttpService = game:GetService("HttpService")
local CATALOGURLModule = require(script:FindFirstAncestor("CatalogNetworking").CATALOG_URL)

return function(Callback, Items)
	-- upvalues: HttpService (copy), CATALOGURLModule (copy)
	return Callback(`{CATALOGURLModule}/v1/catalog/items/details`, "POST", { postBody = HttpService:JSONEncode({ items = Items }) }):andThen(function(Result)
		return Result.responseBody
	end):catch(function(Err)
		warn("[CatalogNetworking] fetchItemDetails failed:", (tostring(Err)))
		
		return nil
	end)
end