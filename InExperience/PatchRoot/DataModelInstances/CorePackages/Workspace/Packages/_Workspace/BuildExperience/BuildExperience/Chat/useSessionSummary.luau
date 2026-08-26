local parent = script:FindFirstAncestor("BuildExperience").Parent
local _ = require(parent.DataHydration.CreatorAgentChat)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local parseSessionStreamModule = require(script.Parent.parseSessionStream)

return function(p1)
	-- upvalues: reactModule (ref), signalsReactModule (ref), parseSessionStreamModule (ref)
	local var1 = signalsReactModule.useSignalState(reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref)
		return p1.getMergedHistory(p2)
	end, { p1 }))
	
	return reactModule.useMemo(function()
		-- upvalues: parseSessionStreamModule (copy), var1 (ref), p1 (ref)
		local var2 = parseSessionStreamModule(var1, { sessionId = p1.getCasSessionId() })
		
		return {
			subagentTaskState = var2.subagentTaskState,
			hasPublishedTurn = var2.includesPublishTool
		}
	end, { var1, p1 })
end