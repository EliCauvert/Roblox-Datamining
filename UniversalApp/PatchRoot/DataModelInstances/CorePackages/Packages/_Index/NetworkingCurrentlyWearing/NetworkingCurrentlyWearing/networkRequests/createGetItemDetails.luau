local dashModule = require(script:FindFirstAncestor("NetworkingCurrentlyWearing").Parent.Dash)
local CATALOG_URLModule = require(script.Parent.Parent.CATALOG_URL)

return function(p1)
	-- upvalues: CATALOG_URLModule (ref), dashModule (ref)
	return p1.roduxNetworking.POST({ Name = "GetItemDetails" }, function(p2, p3)
		-- upvalues: CATALOG_URLModule (copy), dashModule (copy)
		return p2(CATALOG_URLModule):path("v1"):path("catalog"):path("items"):path("details"):body({
			items = dashModule.map(p3, function(p4)
				return { itemType = "Asset", id = p4 }
			end)
		})
	end)
end