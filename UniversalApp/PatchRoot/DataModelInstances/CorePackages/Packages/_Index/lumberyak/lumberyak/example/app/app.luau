local AppLoggerModule = require(script.Parent.appLogger)
local PageModule = require(script.Parent.Parent.page.page)
AppLoggerModule:addSink(require(script.Parent.PrintSink).new(AppLoggerModule.Levels.Error))

return function() --[[ Line: 8 ]]
	-- upvalues: AppLoggerModule (copy), PageModule (copy)
	AppLoggerModule:info("calling {root}")
	PageModule.init(AppLoggerModule)
	
	return PageModule.doSomething()
end