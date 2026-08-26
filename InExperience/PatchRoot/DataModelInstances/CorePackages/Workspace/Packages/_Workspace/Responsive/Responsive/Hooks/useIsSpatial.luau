local parent = script:FindFirstAncestor("Responsive").Parent
local reactModule = require(parent.React)
local appCommonLibModule = require(parent.AppCommonLib)

return function()
	-- upvalues: reactModule (ref), appCommonLibModule (ref)
	local var1, var2 = reactModule.useState(appCommonLibModule.isSpatial)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), appCommonLibModule (copy)
		var2(appCommonLibModule.isSpatial())
		local var3 = appCommonLibModule.connectToIsSpatialChanged(function(p1)
			-- upvalues: var2 (copy)
			var2(p1)
		end)
		
		return function()
			-- upvalues: var3 (ref)
			var3:Disconnect()
		end
	end, {})
	
	return var1
end