local TimeToInteractiveTracker = script:FindFirstAncestor("TimeToInteractiveTracker")
local ReactModule = require(TimeToInteractiveTracker.Parent.React)
local ConstantsModule = require(TimeToInteractiveTracker.Milestones.constants)
local _ = require(TimeToInteractiveTracker.Milestones.types)

return function(Callback) --[[ Line: 25 | Named "createUseTTIRenderAndMountedTracking" ]]
	-- upvalues: ReactModule (copy), ConstantsModule (copy)
	return function(p1) --[[ Line: 26 ]]
		-- upvalues: ReactModule (upval), Callback (copy), ConstantsModule (upval)
		local UseRefResult = ReactModule.useRef(false)
		
		if not UseRefResult.current then
			UseRefResult.current = true
			Callback(p1, ConstantsModule.RenderStarted)
		end
		ReactModule.useEffect(function() --[[ Line: 34 ]]
			-- upvalues: Callback (upval), p1 (copy), ConstantsModule (upval)
			Callback(p1, ConstantsModule.SurfaceMounted)
		end, {})
	end
end