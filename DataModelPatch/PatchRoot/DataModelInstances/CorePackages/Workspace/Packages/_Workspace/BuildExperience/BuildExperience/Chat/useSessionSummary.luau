local Parent = script:FindFirstAncestor("BuildExperience").Parent
local _ = require(Parent.DataHydration.CreatorAgentChat)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local ParseSessionStreamModule = require(script.Parent.parseSessionStream)

return function(p1)
	-- upvalues: ReactModule (copy), SignalsReactModule (copy), ParseSessionStreamModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useCallback(function(p2)
		-- upvalues: p1 (copy)
		return p1.getMergedHistory(p2)
	end, { p1 })))
	
	return ReactModule.useMemo(function()
		-- upvalues: ParseSessionStreamModule (upval), UseSignalStateResult (copy), p1 (copy)
		local ParseSessionStreamModuleResult = ParseSessionStreamModule(UseSignalStateResult, { sessionId = p1.getCasSessionId() })
		
		return {
			subagentTaskState = ParseSessionStreamModuleResult.subagentTaskState,
			hasPublishedTurn = ParseSessionStreamModuleResult.includesPublishTool
		}
	end, { UseSignalStateResult, p1 })
end