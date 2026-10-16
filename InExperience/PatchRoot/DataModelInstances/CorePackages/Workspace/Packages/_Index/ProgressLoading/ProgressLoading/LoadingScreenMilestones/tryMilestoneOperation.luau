local ForwardErrorToScriptContextModule = require(script.Parent.forwardErrorToScriptContext)

local function reportMilestoneError(Err) --[[ Line: 3 ]]
	-- upvalues: ForwardErrorToScriptContextModule (copy)
	ForwardErrorToScriptContextModule(debug.traceback(tostring(Err), 2))
end

return function(p1) --[[ Line: 7 | Named "tryMilestoneOperation" ]]
	-- upvalues: reportMilestoneError (copy)
	return (xpcall(p1, reportMilestoneError))
end