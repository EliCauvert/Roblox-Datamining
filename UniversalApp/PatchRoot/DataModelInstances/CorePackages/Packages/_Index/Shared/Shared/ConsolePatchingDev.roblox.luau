local reactGlobalsModule = require(script.Parent.Parent.ReactGlobals)
local consoleModule = require(script.Parent.console)
local var1 = 0
local var2 = nil
local var3 = nil
local var4 = nil
local var5 = nil
local var6 = nil
local var7 = nil
local var8 = nil

local var9 = function() end

return {
	disabledLog = var9,
	disableLogs = function()
		-- upvalues: reactGlobalsModule (ref), var1 (write), var2 (write), consoleModule (ref), var3 (write), var4 (write), var5 (write), var6 (write), var7 (write), var8 (write), var9 (ref)
		if reactGlobalsModule.__DEV__ then
			if var1 == 0 then
				var2 = consoleModule.log
				var3 = consoleModule.info
				var4 = consoleModule.warn
				var5 = consoleModule.error
				var6 = consoleModule.group
				var7 = consoleModule.groupCollapsed
				var8 = consoleModule.groupEnd
				consoleModule.info = var9
				consoleModule.log = var9
				consoleModule.warn = var9
				consoleModule.error = var9
				consoleModule.group = var9
				consoleModule.groupCollapsed = var9
				consoleModule.groupEnd = var9
			end
			var1 += 1
		end
	end,
	reenableLogs = function()
		-- upvalues: reactGlobalsModule (ref), var1 (write), consoleModule (ref), var2 (write), var3 (write), var4 (write), var5 (write), var6 (write), var7 (write), var8 (write)
		if reactGlobalsModule.__DEV__ then
			var1 -= 1
			
			if var1 == 0 then
				consoleModule.log = var2
				consoleModule.info = var3
				consoleModule.warn = var4
				consoleModule.error = var5
				consoleModule.group = var6
				consoleModule.groupCollapsed = var7
				consoleModule.groupEnd = var8
			end
			if var1 < 0 then
				consoleModule.error("disabledDepth fell below zero. This is a bug in React. Please file an issue.")
			end
		end
	end
}