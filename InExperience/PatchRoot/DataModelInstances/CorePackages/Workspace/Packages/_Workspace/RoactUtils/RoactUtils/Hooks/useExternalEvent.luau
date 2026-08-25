local parent = script:FindFirstAncestor("RoactUtils").Parent
local reactUtilsModule = require(parent.ReactUtils)

if require(parent.SharedFlags).GetFFlagMigrateRoactUtilsToReactUtils() then
	return reactUtilsModule.useEventConnection
end
local reactModule = require(parent.React)

return function(p0, p1)
	-- upvalues: reactModule (ref)
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), p1 (ref)
		if p0 == nil then
			return nil
		end
		local var2 = p0:Connect(p1)
		
		return function()
			-- upvalues: var2 (ref)
			var2:Disconnect()
		end
	end, { p0, p1 })
end