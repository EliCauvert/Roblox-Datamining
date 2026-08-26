local parent = script:FindFirstAncestor("Responsive").Parent
local reactModule = require(parent.React)
local roactServiceTagsModule = require(parent.RoactServiceTags)
local useRoactService = require(parent.RobloxAppHooks).useRoactService

return function()
	-- upvalues: useRoactService (ref), roactServiceTagsModule (ref), reactModule (ref)
	local var1 = useRoactService(roactServiceTagsModule.AppUserGameSettings)
	local var2, var3 = reactModule.useState(var1:InFullScreen())
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var1 (ref)
		var3(var1:InFullScreen())
		local fullscreenChangedConnection = var1.FullscreenChanged:Connect(function(p1)
			-- upvalues: var3 (copy)
			var3(p1)
		end)
		
		return function()
			-- upvalues: fullscreenChangedConnection (ref)
			fullscreenChangedConnection:Disconnect()
		end
	end, {})
	
	return var2
end