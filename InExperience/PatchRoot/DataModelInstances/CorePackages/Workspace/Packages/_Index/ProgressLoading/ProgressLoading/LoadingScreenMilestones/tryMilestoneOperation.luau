local ForwardErrorToScriptContextModule = require(script.Parent.forwardErrorToScriptContext)

local function reportMilestoneError(Err)
	-- upvalues: ForwardErrorToScriptContextModule (copy)
	ForwardErrorToScriptContextModule(debug.traceback(tostring(Err), 2))
end

return function(p1)
	-- upvalues: reportMilestoneError (copy)
	return (xpcall(p1, reportMilestoneError))
end