local timeToInteractiveTracker = script:FindFirstAncestor("TimeToInteractiveTracker")
local reactModule = require(timeToInteractiveTracker.Parent.React)
local constantsModule = require(timeToInteractiveTracker.Milestones.constants)
local _ = require(timeToInteractiveTracker.Milestones.types)

return function(value) --[[ line: 25 | named "createUseTTIRenderAndMountedTracking" ]]
	-- upvalues: reactModule (ref), constantsModule (ref)
	return function(p0) --[[ line: 26 ]]
		-- upvalues: reactModule (copy), value (ref), constantsModule (copy)
		local var3 = reactModule.useRef(false)
		
		if not var3.current then
			var3.current = true
			value(p0, constantsModule.RenderStarted)
		end
		reactModule.useEffect(function() --[[ line: 34 ]]
			-- upvalues: value (copy), p0 (ref), constantsModule (copy)
			value(p0, constantsModule.SurfaceMounted)
		end, {})
	end
end