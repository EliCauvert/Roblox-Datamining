local pageLoggerModule = require(script.Parent.pageLogger)
local componentModule = require(script.Parent.component)

return {
	init = function(p0)
		-- upvalues: pageLoggerModule (ref)
		pageLoggerModule:setParent(p0)
	end,
	doSomething = function()
		-- upvalues: pageLoggerModule (ref), componentModule (ref)
		pageLoggerModule:info("calling {root} {foo}")
		
		return componentModule()
	end
}