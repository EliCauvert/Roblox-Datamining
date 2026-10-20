local CATALOGURLModule = require(script:FindFirstAncestor("CatalogNetworking").CATALOG_URL)

return function(Callback, p1)
	-- upvalues: CATALOGURLModule (copy)
	return Callback(`{CATALOGURLModule}/v1/catalog/items/{p1}/details?itemType=bundle`, "GET", {}):andThen(function(Result)
		-- upvalues: p1 (copy)
		local ResponseBody = Result.responseBody
		
		return if ResponseBody then { id = tostring(p1), owned = ResponseBody.owned == true } else nil
	end):catch(function(Err)
		-- upvalues: p1 (copy)
		warn("[CatalogNetworking] fetchBundleOwnership failed for bundle", p1, ":", (tostring(Err)))
		
		return nil
	end)
end