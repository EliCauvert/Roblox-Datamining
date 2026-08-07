local signalsModule = require(script:FindFirstAncestor("Moments").Parent.Signals)
local momentContextModule = require(script.Parent.Parent.MomentContext)
local t = { time = 0, duration = 0, ratio = 0 }

return function() --[[ line: 20 | named "useMomentProgress" ]]
	-- upvalues: momentContextModule (ref), signalsModule (ref), t (ref)
	local var3 = momentContextModule.useMoment()
	
	return signalsModule.createComputed(function(p0) --[[ line: 23 ]]
		-- upvalues: var3 (ref), t (copy)
		local controller = var3.controller
		
		if controller == nil then
			return t
		end
		local position = controller.getPosition(p0)
		local duration = controller.getState(p0).duration
		
		return if duration <= 0 then t else {
			time = position,
			duration = duration,
			ratio = position / duration
		}
	end)
end