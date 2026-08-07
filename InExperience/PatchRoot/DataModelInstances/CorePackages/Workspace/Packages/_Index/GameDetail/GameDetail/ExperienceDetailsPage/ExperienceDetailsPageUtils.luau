local _ = require(script:FindFirstAncestor("GameDetail").Parent.Navigation)

return {
	getFromPropsOrNavigationParams = function(p0, p1) --[[ line: 12 ]]
		local extraProps = p0.navigation and p0.navigation.getParam("extraProps")
		
		return p0[p1] or extraProps and extraProps[p1]
	end,
	getUniverseId = function(p2) --[[ line: 18 ]]
		local extraProps = p2.navigation and p2.navigation.getParam("extraProps")
		local universeId = p2.universeId or extraProps and extraProps.universeId
		
		return universeId or p2.navigation and p2.navigation.getParam("detail")
	end,
	getAnalyticsSource = function(p3) --[[ line: 26 ]]
		local extraProps = p3.navigation and p3.navigation.getParam("extraProps")
		
		return p3.source or extraProps and extraProps.source or "None"
	end,
	getTilePositionIndex = function(p4) --[[ line: 30 ]]
		local extraProps = p4.navigation and p4.navigation.getParam("extraProps")
		local index = p4.index or extraProps and extraProps.index
		
		if type(index) == "number" then
			return index
		elseif type(index) == "string" then
			local var6 = tonumber(index)
			
			return var6 or -1
		end
	end,
	getResolvedIdentifier = function(p5, p6) --[[ line: 45 ]]
		return p5 .. "_" .. p6
	end
}