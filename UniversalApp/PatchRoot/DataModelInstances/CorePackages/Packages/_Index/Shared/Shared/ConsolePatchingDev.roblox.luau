local ReactGlobalsModule = require(script.Parent.Parent.ReactGlobals)
local ConsoleModule = require(script.Parent.console)
local Count = 0
local Log = nil
local Info = nil
local Warn = nil
local Error = nil
local Group = nil
local GroupCollapsed = nil
local GroupEnd = nil

local function DisabledLog() end

return {
	disabledLog = DisabledLog,
	disableLogs = function()
		-- upvalues: ReactGlobalsModule (copy), Count (ref), Log (ref), ConsoleModule (copy), Info (ref), Warn (ref), Error (ref), Group (ref), GroupCollapsed (ref), GroupEnd (ref), DisabledLog (copy)
		if ReactGlobalsModule.__DEV__ then
			if Count == 0 then
				Log = ConsoleModule.log
				Info = ConsoleModule.info
				Warn = ConsoleModule.warn
				Error = ConsoleModule.error
				Group = ConsoleModule.group
				GroupCollapsed = ConsoleModule.groupCollapsed
				GroupEnd = ConsoleModule.groupEnd
				ConsoleModule.info = DisabledLog
				ConsoleModule.log = DisabledLog
				ConsoleModule.warn = DisabledLog
				ConsoleModule.error = DisabledLog
				ConsoleModule.group = DisabledLog
				ConsoleModule.groupCollapsed = DisabledLog
				ConsoleModule.groupEnd = DisabledLog
			end
			Count += 1
		end
	end,
	reenableLogs = function()
		-- upvalues: ReactGlobalsModule (copy), Count (ref), ConsoleModule (copy), Log (ref), Info (ref), Warn (ref), Error (ref), Group (ref), GroupCollapsed (ref), GroupEnd (ref)
		if ReactGlobalsModule.__DEV__ then
			Count -= 1
			
			if Count == 0 then
				ConsoleModule.log = Log
				ConsoleModule.info = Info
				ConsoleModule.warn = Warn
				ConsoleModule.error = Error
				ConsoleModule.group = Group
				ConsoleModule.groupCollapsed = GroupCollapsed
				ConsoleModule.groupEnd = GroupEnd
			end
			if Count < 0 then
				ConsoleModule.error("disabledDepth fell below zero. This is a bug in React. Please file an issue.")
			end
		end
	end
}