local CATALOG_URLModule = require(script:FindFirstAncestor("CatalogNetworking").CATALOG_URL)

return function(p1, p2)
	-- upvalues: CATALOG_URLModule (ref)
	return p1(`{CATALOG_URLModule}/v1/catalog/items/{p2}/details?itemType=bundle`, "GET", {}):andThen(function(p3)
		-- upvalues: p2 (ref)
		local responseBody = p3.responseBody
		
		return if responseBody then { id = tostring(p2), owned = responseBody.owned == true } else nil
	end):catch(function(p3)
		-- upvalues: p2 (ref)
		warn("[CatalogNetworking] fetchBundleOwnership failed for bundle", p2, ":", tostring(p3))
		
		return nil
	end)
end