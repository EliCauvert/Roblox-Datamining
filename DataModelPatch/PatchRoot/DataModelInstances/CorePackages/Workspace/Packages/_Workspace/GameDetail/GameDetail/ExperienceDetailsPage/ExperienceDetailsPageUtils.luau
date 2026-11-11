local _ = require(script:FindFirstAncestor("GameDetail").Parent.Navigation)

return {
	getFromPropsOrNavigationParams = function(p1, p2)
		local ExtraPropsParam = p1.navigation and p1.navigation.getParam("extraProps")
		
		return p1[p2] or ExtraPropsParam and ExtraPropsParam[p2]
	end,
	getUniverseId = function(p1)
		local ExtraPropsParam = p1.navigation and p1.navigation.getParam("extraProps")
		local UniverseId = p1.universeId or ExtraPropsParam and ExtraPropsParam.universeId
		
		return if UniverseId then UniverseId else p1.navigation and p1.navigation.getParam("detail")
	end,
	getAnalyticsSource = function(p1)
		local ExtraPropsParam = p1.navigation and p1.navigation.getParam("extraProps")
		
		return p1.source or ExtraPropsParam and ExtraPropsParam.source or "None"
	end,
	getTilePositionIndex = function(p1)
		local ExtraPropsParam = p1.navigation and p1.navigation.getParam("extraProps")
		local Index = p1.index or ExtraPropsParam and ExtraPropsParam.index
		
		if type(Index) == "number" then
			return Index
		end
		if type(Index) == "string" then
			local Number: number? = tonumber(Index)
			
			if Number then
				return Number
			end
		end
		return -1
	end,
	getResolvedIdentifier = function(Text, Text1): string
		return Text .. "_" .. Text1
	end
}