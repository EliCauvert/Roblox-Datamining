local catalogNetworking = script:FindFirstAncestor("CatalogNetworking")
local cryoModule = require(catalogNetworking.Parent.Cryo)
local CATALOG_URLModule = require(catalogNetworking.CATALOG_URL)

return function(p1)
	-- upvalues: CATALOG_URLModule (ref), cryoModule (ref)
	return p1.roduxNetworking.POST("GetItemDetails", function(p2, p3)
		-- upvalues: CATALOG_URLModule (copy), cryoModule (copy)
		return p2(CATALOG_URLModule):path("v1"):path("catalog"):path("items"):path("details"):body({
			items = cryoModule.List.map(p3, function(p4)
				return { itemType = p4.itemType, id = p4.assetId }
			end)
		})
	end)
end