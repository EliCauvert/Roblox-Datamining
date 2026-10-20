local Parent = script:FindFirstAncestor("GameJoinCard").Parent
local ReactModule = require(Parent.React)
local FFlagJoinabilityCTARefactor = require(Parent.SharedFlags).FFlagJoinabilityCTARefactor
local DataStatus = require(Parent.DataHydration).DataStatus
local GameJoinCardTelemetryModule = require(script.Parent.GameJoinCardTelemetry)

return function(Failed, p1, p2)
	-- upvalues: ReactModule (copy), FFlagJoinabilityCTARefactor (copy), DataStatus (copy), GameJoinCardTelemetryModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: FFlagJoinabilityCTARefactor (upval), p1 (copy), UseRefResult (copy), UseRefResult1 (copy), Failed (copy), DataStatus (upval), GameJoinCardTelemetryModule (upval), p2 (copy)
		if not FFlagJoinabilityCTARefactor or not p1 then
			UseRefResult.current = nil
			UseRefResult1.current = false
			
			return
		end
		if Failed == DataStatus.NotReady then
			if UseRefResult.current == nil or UseRefResult1.current then
				UseRefResult.current = tick()
				UseRefResult1.current = false
			end
			return
		elseif UseRefResult1.current or UseRefResult.current == nil then return end
		if Failed == DataStatus.Ready or Failed == DataStatus.Failed then
			UseRefResult1.current = true
			GameJoinCardTelemetryModule.logActionsResolved((tick() - UseRefResult.current) * 1000, Failed, p2)
			
			return
		end
	end, { Failed, p1, p2 })
end