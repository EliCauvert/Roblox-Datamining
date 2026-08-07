local parent = script:FindFirstAncestor("Responsive").Parent
local reactModule = require(parent.React)
local appCommonLibModule = require(parent.AppCommonLib)

return function() --[[ line: 5 | named "useIsSpatial" ]]
	-- upvalues: reactModule (ref), appCommonLibModule (ref)
	local var2, var3 = reactModule.useState(appCommonLibModule.isSpatial)
	reactModule.useEffect(function() --[[ line: 7 ]]
		-- upvalues: var3 (ref), appCommonLibModule (copy)
		var3(appCommonLibModule.isSpatial())
		local var4 = appCommonLibModule.connectToIsSpatialChanged(function(p0) --[[ line: 9 ]]
			-- upvalues: var3 (copy)
			var3(p0)
		end)
		
		return function() --[[ line: 12 ]]
			-- upvalues: var4 (ref)
			var4:Disconnect()
		end
	end, {})
	
	return var2
end