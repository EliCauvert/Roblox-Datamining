local Parent = script:FindFirstAncestor("RoactUtils").Parent
local ReactUtilsModule = require(Parent.ReactUtils)

if require(Parent.SharedFlags).GetFFlagMigrateRoactUtilsToReactUtils() then
	return ReactUtilsModule.usePrevious
else
	local ReactModule = require(Parent.React)
	
	return function(Current)
		-- upvalues: ReactModule (copy)
		local UseRefResult = ReactModule.useRef(nil)
		ReactModule.useEffect(function()
			-- upvalues: UseRefResult (copy), Current (copy)
			UseRefResult.current = Current
		end)
		
		return UseRefResult.current
	end
end