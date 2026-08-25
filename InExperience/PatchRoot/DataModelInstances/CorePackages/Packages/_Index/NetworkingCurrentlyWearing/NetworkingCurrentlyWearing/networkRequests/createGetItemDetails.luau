local dashModule = require(script:FindFirstAncestor("NetworkingCurrentlyWearing").Parent.Dash)
local CATALOG_URLModule = require(script.Parent.Parent.CATALOG_URL)

return function(p0)
	-- upvalues: CATALOG_URLModule (ref), dashModule (ref)
	return p0.roduxNetworking.POST({ Name = "GetItemDetails" }, function(p1, p2)
		-- upvalues: CATALOG_URLModule (copy), dashModule (copy)
		return p1(CATALOG_URLModule):path("v1"):path("catalog"):path("items"):path("details"):body({
			items = dashModule.map(p2, function(p3)
				return { itemType = "Asset", id = p3 }
			end)
		})
	end)
end