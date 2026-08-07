local pageLoggerModule = require(script.Parent.pageLogger)
local componentModule = require(script.Parent.component)

return {
	init = function(p0) --[[ line: 6 ]]
		-- upvalues: pageLoggerModule (ref)
		pageLoggerModule:setParent(p0)
	end,
	doSomething = function() --[[ line: 9 ]]
		-- upvalues: pageLoggerModule (ref), componentModule (ref)
		pageLoggerModule:info("calling {root} {foo}")
		
		return componentModule()
	end
}