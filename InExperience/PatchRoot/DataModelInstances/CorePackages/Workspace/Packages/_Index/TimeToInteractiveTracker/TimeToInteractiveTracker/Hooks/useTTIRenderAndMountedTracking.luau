local timeToInteractiveTracker = script:FindFirstAncestor("TimeToInteractiveTracker")
local reactModule = require(timeToInteractiveTracker.Parent.React)
local constantsModule = require(timeToInteractiveTracker.Milestones.constants)
local _ = require(timeToInteractiveTracker.Milestones.types)

return function(value)
	-- upvalues: reactModule (ref), constantsModule (ref)
	return function(p1)
		-- upvalues: reactModule (copy), value (ref), constantsModule (copy)
		local var1 = reactModule.useRef(false)
		
		if not var1.current then
			var1.current = true
			value(p1, constantsModule.RenderStarted)
		end
		reactModule.useEffect(function()
			-- upvalues: value (copy), p1 (ref), constantsModule (copy)
			value(p1, constantsModule.SurfaceMounted)
		end, {})
	end
end