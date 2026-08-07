local parent = script:FindFirstAncestor("Responsive").Parent
local reactModule = require(parent.React)
local roactServiceTagsModule = require(parent.RoactServiceTags)
local useRoactService = require(parent.RobloxAppHooks).useRoactService

return function() --[[ line: 6 | named "useIsInFullScreen" ]]
	-- upvalues: useRoactService (ref), roactServiceTagsModule (ref), reactModule (ref)
	local var2 = useRoactService(roactServiceTagsModule.AppUserGameSettings)
	local var3, var4 = reactModule.useState(var2:InFullScreen())
	reactModule.useEffect(function() --[[ line: 10 ]]
		-- upvalues: var4 (ref), var2 (ref)
		var4(var2:InFullScreen())
		local fullscreenChangedConnection = var2.FullscreenChanged:Connect(function(p0) --[[ line: 12 ]]
			-- upvalues: var4 (copy)
			var4(p0)
		end)
		
		return function() --[[ line: 16 ]]
			-- upvalues: fullscreenChangedConnection (ref)
			fullscreenChangedConnection:Disconnect()
		end
	end, {})
	
	return var3
end