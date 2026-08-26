local parent = script:FindFirstAncestor("RoactUtils").Parent
local reactUtilsModule = require(parent.ReactUtils)

if require(parent.SharedFlags).GetFFlagMigrateRoactUtilsToReactUtils() then
	return reactUtilsModule.useEventConnection
end
local reactModule = require(parent.React)

return function(p1, p2)
	-- upvalues: reactModule (ref)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), p2 (ref)
		if p1 == nil then
			return nil
		end
		local var1 = p1:Connect(p2)
		
		return function()
			-- upvalues: var1 (ref)
			var1:Disconnect()
		end
	end, { p1, p2 })
end