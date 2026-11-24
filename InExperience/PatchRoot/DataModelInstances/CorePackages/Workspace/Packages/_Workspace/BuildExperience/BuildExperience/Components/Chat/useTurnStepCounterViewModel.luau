local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local _ = require(BuildExperience.Chat.chatTypes)
local TurnWorkTelemetryContextModule = require(BuildExperience.Chat.TurnWorkTelemetryContext)
local SummarizeStepsModule = require(BuildExperience.Telemetry.summarizeSteps)
local UseStepRowsFunction = require(script.Parent.useStepRows).useStepRows

return function(p1)
	-- upvalues: ReactModule (copy), TurnWorkTelemetryContextModule (copy), UseStepRowsFunction (copy), SummarizeStepsModule (copy)
	local UseContextResult = ReactModule.useContext(TurnWorkTelemetryContextModule)
	local UseStepRowsResult = UseStepRowsFunction(p1.segment)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: SummarizeStepsModule (upval), UseStepRowsResult (copy)
		return SummarizeStepsModule.summarizeSteps(UseStepRowsResult)
	end, { UseStepRowsResult })
	local Key = p1.segment.key
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseContextResult (copy), Key (copy), UseMemoResult (copy)
		if UseContextResult ~= nil then
			UseContextResult.setSegmentSteps(Key, UseMemoResult)
		end
		return function()
			-- upvalues: UseContextResult (upval), Key (upval)
			if UseContextResult ~= nil then
				UseContextResult.setSegmentSteps(Key, nil)
			end
		end
	end, { UseContextResult, Key, UseMemoResult })
end