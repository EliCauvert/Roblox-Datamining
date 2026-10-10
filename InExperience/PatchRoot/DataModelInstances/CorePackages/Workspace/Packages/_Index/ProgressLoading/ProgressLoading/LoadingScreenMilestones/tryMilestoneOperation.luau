local forwardErrorToScriptContextModule = require(script.Parent.forwardErrorToScriptContext)

local function reportMilestoneError(p1)
	-- upvalues: forwardErrorToScriptContextModule (ref)
	forwardErrorToScriptContextModule(debug.traceback(tostring(p1), 2))
end

return function(p1)
	-- upvalues: reportMilestoneError (ref)
	return xpcall(p1, reportMilestoneError)
end