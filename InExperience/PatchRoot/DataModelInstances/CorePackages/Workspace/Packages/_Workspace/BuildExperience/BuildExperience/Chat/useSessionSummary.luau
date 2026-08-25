local parent = script:FindFirstAncestor("BuildExperience").Parent
local _ = require(parent.DataHydration.CreatorAgentChat)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local parseSessionStreamModule = require(script.Parent.parseSessionStream)

return function(p0)
	-- upvalues: reactModule (ref), signalsReactModule (ref), parseSessionStreamModule (ref)
	local var3 = signalsReactModule.useSignalState(reactModule.useCallback(function(p1)
		-- upvalues: p0 (ref)
		return p0.getMergedHistory(p1)
	end, { p0 }))
	
	return reactModule.useMemo(function()
		-- upvalues: parseSessionStreamModule (copy), var3 (ref), p0 (ref)
		local var4 = parseSessionStreamModule(var3, { sessionId = p0.getCasSessionId() })
		
		return {
			subagentTaskState = var4.subagentTaskState,
			hasPublishedTurn = var4.includesPublishTool
		}
	end, { var3, p0 })
end