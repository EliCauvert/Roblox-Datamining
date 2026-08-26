local signalsModule = require(script:FindFirstAncestor("Moments").Parent.Signals)
local momentContextModule = require(script.Parent.Parent.MomentContext)
local t = { time = 0, duration = 0, ratio = 0 }

return function()
	-- upvalues: momentContextModule (ref), signalsModule (ref), t (ref)
	local var1 = momentContextModule.useMoment()
	
	return signalsModule.createComputed(function(p1)
		-- upvalues: var1 (ref), t (copy)
		local controller = var1.controller
		
		if controller == nil then
			return t
		end
		local position = controller.getPosition(p1)
		local duration = controller.getState(p1).duration
		
		return if duration <= 0 then t else {
			time = position,
			duration = duration,
			ratio = position / duration
		}
	end)
end