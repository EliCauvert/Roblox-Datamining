local parent = script:FindFirstAncestor("RoactUtils").Parent
local reactUtilsModule = require(parent.ReactUtils)

if require(parent.SharedFlags).GetFFlagMigrateRoactUtilsToReactUtils() then
	return reactUtilsModule.usePrevious
end
local reactModule = require(parent.React)

return function(p0) --[[ line: 16 | named "usePrevious" ]]
	-- upvalues: reactModule (ref)
	local var2 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 18 ]]
		-- upvalues: var2 (ref), p0 (ref)
		var2.current = p0
	end)
	
	return var2.current
end