local CatalogNetworking = script:FindFirstAncestor("CatalogNetworking")
local CryoModule = require(CatalogNetworking.Parent.Cryo)
local CATALOGURLModule = require(CatalogNetworking.CATALOG_URL)

return function(p1)
	-- upvalues: CATALOGURLModule (copy), CryoModule (copy)
	return p1.roduxNetworking.POST({ Name = "GetItemDetails" }, function(Callback, p2)
		-- upvalues: CATALOGURLModule (upval), CryoModule (upval)
		return Callback(CATALOGURLModule):path("v1"):path("catalog"):path("items"):path("details"):body({
			items = CryoModule.List.map(p2, function(p3)
				return { itemType = p3.itemType, id = p3.assetId }
			end)
		})
	end)
end