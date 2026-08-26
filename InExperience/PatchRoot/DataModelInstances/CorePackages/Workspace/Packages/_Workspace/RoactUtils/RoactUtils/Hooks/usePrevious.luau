local parent = script:FindFirstAncestor("RoactUtils").Parent
local reactUtilsModule = require(parent.ReactUtils)

if require(parent.SharedFlags).GetFFlagMigrateRoactUtilsToReactUtils() then
	return reactUtilsModule.usePrevious
end
local reactModule = require(parent.React)

return function(p1)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), p1 (ref)
		var1.current = p1
	end)
	
	return var1.current
end