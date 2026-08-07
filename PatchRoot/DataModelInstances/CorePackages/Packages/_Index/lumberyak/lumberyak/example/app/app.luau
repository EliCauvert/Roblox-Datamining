-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:44 2026 Pacific Standard Time.

local appLoggerModule = require(script.Parent.appLogger)
local pageModule = require(script.Parent.Parent.page.page)
appLoggerModule:addSink(require(script.Parent.PrintSink).new(appLoggerModule.Levels.Error))

return function() --[[ line: 8 ]]
	-- upvalues: appLoggerModule (ref), pageModule (ref)
	appLoggerModule:info("calling {root}")
	pageModule.init(appLoggerModule)
	
	return pageModule.doSomething()
end