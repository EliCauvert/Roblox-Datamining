local PageLoggerModule = require(script.Parent.pageLogger)
local ComponentModule = require(script.Parent.component)

return {
	init = function(p1)
		-- upvalues: PageLoggerModule (copy)
		PageLoggerModule:setParent(p1)
	end,
	doSomething = function()
		-- upvalues: PageLoggerModule (copy), ComponentModule (copy)
		PageLoggerModule:info("calling {root} {foo}")
		
		return ComponentModule()
	end
}