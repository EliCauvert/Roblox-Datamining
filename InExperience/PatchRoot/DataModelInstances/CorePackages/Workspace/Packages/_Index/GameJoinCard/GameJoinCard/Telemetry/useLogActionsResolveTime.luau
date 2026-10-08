local parent = script:FindFirstAncestor("GameJoinCard").Parent
local reactModule = require(parent.React)
local fFlagJoinabilityCTARefactor = require(parent.SharedFlags).FFlagJoinabilityCTARefactor
local dataStatus = require(parent.DataHydration).DataStatus
local gameJoinCardTelemetryModule = require(script.Parent.GameJoinCardTelemetry)

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), fFlagJoinabilityCTARefactor (ref), dataStatus (ref), gameJoinCardTelemetryModule (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: fFlagJoinabilityCTARefactor (copy), p2 (ref), var1 (ref), var2 (ref), p1 (ref), dataStatus (copy), gameJoinCardTelemetryModule (copy), p3 (ref)
		if not fFlagJoinabilityCTARefactor or not p2 then
			var1.current = nil
			var2.current = false
			
			return
		elseif p1 == dataStatus.NotReady then
			if var1.current == nil or var2.current then
				var1.current = tick()
				var2.current = false
			end
			return
		elseif var2.current or var1.current == nil then return end
		if p1 == dataStatus.Ready or p1 == dataStatus.Failed then
			var2.current = true
			gameJoinCardTelemetryModule.logActionsResolved((tick() - var1.current) * 1000, p1, p3)
			
			return
		end
	end, { p1, p2, p3 })
end