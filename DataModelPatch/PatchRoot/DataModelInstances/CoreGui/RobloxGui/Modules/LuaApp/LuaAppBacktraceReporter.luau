local LuaAppBacktraceLoggerModule = require(script.Parent.LuaAppBacktraceLogger)

return (require(game:GetService("CorePackages").Workspace.Packages.ErrorReporters).BacktraceReporter.new({
	httpService = game:GetService("HttpService"),
	token = game:GetFastString("ErrorUploadToBacktraceLuaAppToken"),
	processErrorReportMethod = require(script.Parent.LuaAppErrorReporterUtil).processReport,
	generateLogMethod = function()
		-- upvalues: LuaAppBacktraceLoggerModule (copy)
		return LuaAppBacktraceLoggerModule:generateAppLog()
	end
}))