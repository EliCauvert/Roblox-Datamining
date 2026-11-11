local LogTree = require(game:GetService("CorePackages").Workspace.Packages.AppDebug).LogTree
local LuaAppBacktraceLoggerModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.LuaAppBacktraceLogger)
local LogTreeMaxLogsToBacktrace = game:DefineFastInt("LogTreeMaxLogsToBacktrace", 1000)
local BacktraceLogTags = game:DefineFastString("BacktraceLogTags", "")
local Count = 0

local function logToBacktrace(_, p1, p2)
	-- upvalues: Count (ref), LogTreeMaxLogsToBacktrace (copy), LuaAppBacktraceLoggerModule (copy), LogTree (copy)
	Count += 1
	
	if LogTreeMaxLogsToBacktrace >= Count then
		LuaAppBacktraceLoggerModule:addLumberyakLog((LogTree.formatLog(p1, p2, true)))
		
		return
	end
	if LogTreeMaxLogsToBacktrace > 0 and Count == LogTreeMaxLogsToBacktrace + 1 then
		LuaAppBacktraceLoggerModule:addLumberyakLog(string.format("[Log limit reached: %d]", LogTreeMaxLogsToBacktrace))
	end
end

LogTree.setLogTags(game:DefineFastString("DebugLogTags", ""), LogTree.logToConsole)
LogTree.setLogTags(BacktraceLogTags, logToBacktrace)

return {}