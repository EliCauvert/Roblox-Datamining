local PrettyPrintModule = require(script.Parent.prettyPrint)
local LoggerMiddlewareModule = { outputFunction = print }

function LoggerMiddlewareModule.middleware(Callback, p1)
	-- upvalues: LoggerMiddlewareModule (copy), PrettyPrintModule (copy)
	return function(p2)
		-- upvalues: Callback (copy), LoggerMiddlewareModule (upval), PrettyPrintModule (upval), p1 (copy)
		local CallbackResult = Callback(p2)
		LoggerMiddlewareModule.outputFunction(("Action dispatched: %s\nState changed to: %s"):format(PrettyPrintModule(p2), PrettyPrintModule(p1:getState())))
		
		return CallbackResult
	end
end

return LoggerMiddlewareModule