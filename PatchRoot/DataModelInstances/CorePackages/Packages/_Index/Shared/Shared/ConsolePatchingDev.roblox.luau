-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:19 2026 Pacific Standard Time.

local reactGlobalsModule = require(script.Parent.Parent.ReactGlobals)
local consoleModule = require(script.Parent.console)
local var2 = 0
local var3 = nil
local var4 = nil
local var5 = nil
local var6 = nil
local var7 = nil
local var8 = nil
local var9 = nil

local var10 = function() --[[ line: 34 ]] end

return {
	disabledLog = var10,
	disableLogs = function() --[[ line: 43 ]]
		-- upvalues: reactGlobalsModule (ref), var2 (write), var3 (write), consoleModule (ref), var4 (write), var5 (write), var6 (write), var7 (write), var8 (write), var9 (write), var10 (ref)
		if reactGlobalsModule.__DEV__ then
			if var2 == 0 then
				var3 = consoleModule.log
				var4 = consoleModule.info
				var5 = consoleModule.warn
				var6 = consoleModule.error
				var7 = consoleModule.group
				var8 = consoleModule.groupCollapsed
				var9 = consoleModule.groupEnd
				consoleModule.info = var10
				consoleModule.log = var10
				consoleModule.warn = var10
				consoleModule.error = var10
				consoleModule.group = var10
				consoleModule.groupCollapsed = var10
				consoleModule.groupEnd = var10
			end
			var2 += 1
		end
	end,
	reenableLogs = function() --[[ line: 67 ]]
		-- upvalues: reactGlobalsModule (ref), var2 (write), consoleModule (ref), var3 (write), var4 (write), var5 (write), var6 (write), var7 (write), var8 (write), var9 (write)
		if reactGlobalsModule.__DEV__ then
			var2 -= 1
			
			if var2 == 0 then
				consoleModule.log = var3
				consoleModule.info = var4
				consoleModule.warn = var5
				consoleModule.error = var6
				consoleModule.group = var7
				consoleModule.groupCollapsed = var8
				consoleModule.groupEnd = var9
			end
			if var2 < 0 then
				consoleModule.error("disabledDepth fell below zero. This is a bug in React. Please file an issue.")
			end
		end
	end
}