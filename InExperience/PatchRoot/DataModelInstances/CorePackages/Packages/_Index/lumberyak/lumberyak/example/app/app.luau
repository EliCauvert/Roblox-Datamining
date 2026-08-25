local appLoggerModule = require(script.Parent.appLogger)
local pageModule = require(script.Parent.Parent.page.page)
appLoggerModule:addSink(require(script.Parent.PrintSink).new(appLoggerModule.Levels.Error))

return function()
	-- upvalues: appLoggerModule (ref), pageModule (ref)
	appLoggerModule:info("calling {root}")
	pageModule.init(appLoggerModule)
	
	return pageModule.doSomething()
end