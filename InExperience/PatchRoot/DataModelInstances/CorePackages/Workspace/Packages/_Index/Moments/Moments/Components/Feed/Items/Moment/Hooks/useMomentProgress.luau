local SignalsModule = require(script:FindFirstAncestor("Moments").Parent.Signals)
local MomentContextModule = require(script.Parent.Parent.MomentContext)
local config = { time = 0, duration = 0, ratio = 0 }

return function() --[[ Line: 20 | Named "useMomentProgress" ]]
	-- upvalues: MomentContextModule (copy), SignalsModule (copy), config (copy)
	local UseMomentResult = MomentContextModule.useMoment()
	
	return (SignalsModule.createComputed(function(p1) --[[ Line: 23 ]]
		-- upvalues: UseMomentResult (copy), config (upval)
		local Controller = UseMomentResult.controller
		
		if Controller == nil then
			return config
		else
			local Position = Controller.getPosition(p1)
			local Duration: number = Controller.getState(p1).duration
			
			return if Duration <= 0 then config else {
				time = Position,
				duration = Duration,
				ratio = Position / Duration
			}
		end
	end))
end