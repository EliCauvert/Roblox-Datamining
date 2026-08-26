local _ = require(script:FindFirstAncestor("GameDetail").Parent.Navigation)

return {
	getFromPropsOrNavigationParams = function(p1, p2)
		local extraProps = p1.navigation and p1.navigation.getParam("extraProps")
		
		return p1[p2] or extraProps and extraProps[p2]
	end,
	getUniverseId = function(p1)
		local extraProps = p1.navigation and p1.navigation.getParam("extraProps")
		local universeId = p1.universeId or extraProps and extraProps.universeId
		
		return universeId or p1.navigation and p1.navigation.getParam("detail")
	end,
	getAnalyticsSource = function(p1)
		local extraProps = p1.navigation and p1.navigation.getParam("extraProps")
		
		return p1.source or extraProps and extraProps.source or "None"
	end,
	getTilePositionIndex = function(p1)
		local extraProps = p1.navigation and p1.navigation.getParam("extraProps")
		local index = p1.index or extraProps and extraProps.index
		
		if type(index) == "number" then
			return index
		elseif type(index) == "string" then
			local var1 = tonumber(index)
			
			return var1 or -1
		end
	end,
	getResolvedIdentifier = function(p1, p2)
		return p1 .. "_" .. p6
	end
}