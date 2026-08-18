local catalogNetworking = script:FindFirstAncestor("CatalogNetworking")
local cryoModule = require(catalogNetworking.Parent.Cryo)
local CATALOG_URLModule = require(catalogNetworking.CATALOG_URL)

return function(p0) --[[ line: 12 ]]
	-- upvalues: CATALOG_URLModule (ref), cryoModule (ref)
	return p0.roduxNetworking.POST({ Name = "GetItemDetails" }, function(p1, p2) --[[ line: 17 ]]
		-- upvalues: CATALOG_URLModule (copy), cryoModule (copy)
		return p1(CATALOG_URLModule):path("v1"):path("catalog"):path("items"):path("details"):body({
			items = cryoModule.List.map(p2, function(p3) --[[ line: 19 ]]
				return { itemType = p3.itemType, id = p3.assetId }
			end)
		})
	end)
end