local dashModule = require(script:FindFirstAncestor("NetworkingCurrentlyWearing").Parent.Dash)
local CATALOG_URLModule = require(script.Parent.Parent.CATALOG_URL)

return function(p0) --[[ line: 11 ]]
	-- upvalues: CATALOG_URLModule (ref), dashModule (ref)
	return p0.roduxNetworking.POST({ Name = "GetItemDetails" }, function(p1, p2) --[[ line: 14 ]]
		-- upvalues: CATALOG_URLModule (copy), dashModule (copy)
		return p1(CATALOG_URLModule):path("v1"):path("catalog"):path("items"):path("details"):body({
			items = dashModule.map(p2, function(p3) --[[ line: 16 ]]
				return { itemType = "Asset", id = p3 }
			end)
		})
	end)
end