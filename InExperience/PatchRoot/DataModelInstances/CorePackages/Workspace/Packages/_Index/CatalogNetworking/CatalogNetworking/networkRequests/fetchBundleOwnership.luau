local CATALOG_URLModule = require(script:FindFirstAncestor("CatalogNetworking").CATALOG_URL)

return function(p0, p1)
	-- upvalues: CATALOG_URLModule (ref)
	return p0(`{CATALOG_URLModule}/v1/catalog/items/{p1}/details?itemType=bundle`, "GET", {}):andThen(function(p3)
		-- upvalues: p1 (ref)
		local responseBody = p3.responseBody
		
		return if responseBody then { id = tostring(p1), owned = responseBody.owned == true } else nil
	end):catch(function(p2)
		-- upvalues: p1 (ref)
		warn("[CatalogNetworking] fetchBundleOwnership failed for bundle", p1, ":", tostring(p2))
		
		return nil
	end)
end