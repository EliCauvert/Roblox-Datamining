local DashModule = require(script:FindFirstAncestor("NetworkingCurrentlyWearing").Parent.Dash)
local CATALOGURLModule = require(script.Parent.Parent.CATALOG_URL)

return function(p1)
	-- upvalues: CATALOGURLModule (copy), DashModule (copy)
	return p1.roduxNetworking.POST({ Name = "GetItemDetails" }, function(Callback, p2)
		-- upvalues: CATALOGURLModule (upval), DashModule (upval)
		return Callback(CATALOGURLModule):path("v1"):path("catalog"):path("items"):path("details"):body({
			items = DashModule.map(p2, function(Id)
				return { itemType = "Asset", id = Id }
			end)
		})
	end)
end