local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local _ = require(BuildExperience.Chat.chatTypes)
local TurnWorkTelemetryContextModule = require(BuildExperience.Chat.TurnWorkTelemetryContext)
local UseStepRowsFunction = require(script.Parent.useStepRows).useStepRows

return function(p1)
	-- upvalues: ReactModule (copy), TurnWorkTelemetryContextModule (copy), UseStepRowsFunction (copy)
	local UseContextResult = ReactModule.useContext(TurnWorkTelemetryContextModule)
	local Count = #UseStepRowsFunction(p1.segment)
	local Key = p1.segment.key
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseContextResult (copy), Key (copy), Count (copy)
		if UseContextResult ~= nil then
			UseContextResult.setSegmentStepCount(Key, Count)
		end
		return function()
			-- upvalues: UseContextResult (upval), Key (upval)
			if UseContextResult ~= nil then
				UseContextResult.setSegmentStepCount(Key, nil)
			end
		end
	end, { UseContextResult, Key, Count })
end