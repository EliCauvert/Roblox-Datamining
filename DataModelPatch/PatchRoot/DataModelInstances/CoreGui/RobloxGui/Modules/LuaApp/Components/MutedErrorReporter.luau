local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local LuaErrorReporterModule = require(Modules.Common.LuaErrorReporter)
local LuaErrorSeverityModule = require(Modules.Common.LuaErrorSeverity)
local LuaAppSentryReporterModule = require(Modules.LuaApp.LuaAppSentryReporter)
local LuaAppBacktraceReporterModule = require(Modules.LuaApp.LuaAppBacktraceReporter)
local LuaAppEventsModule = require(Modules.LuaApp.LuaAppEvents)
local GetIsClientEnrolledInBacktraceRolloutModule = require(Modules.LuaApp.Flags.GetIsClientEnrolledInBacktraceRollout)
local IsRandomValueBelow = math.random(1, 100) <= math.clamp(game:DefineFastInt("EnableSentryUADebugRolloutPercentage", 0), 0, 100)
local MutedErrorReporter = require(CorePackages.Packages.Roact).Component:extend("MutedErrorReporter")
local FFlagDisableGoogleAnalyticsErrorReporting = require(CorePackages.Workspace.Packages.SharedFlags).FFlagDisableGoogleAnalyticsErrorReporting

function MutedErrorReporter.init(p1)
	-- upvalues: GetIsClientEnrolledInBacktraceRolloutModule (copy), LuaAppBacktraceReporterModule (copy), IsRandomValueBelow (copy), LuaAppSentryReporterModule (copy), LuaErrorReporterModule (copy), LuaAppEventsModule (copy), LuaErrorSeverityModule (copy), FFlagDisableGoogleAnalyticsErrorReporting (copy)
	local AppName = p1.props.appName
	p1.errorReporter = LuaErrorReporterModule.new(LuaAppEventsModule.ReportMutedError, nil, if GetIsClientEnrolledInBacktraceRolloutModule() then LuaAppBacktraceReporterModule else nil, LuaErrorSeverityModule.DEBUG, if IsRandomValueBelow then LuaAppSentryReporterModule else nil)
	p1.errorReporter:setCurrentApp(AppName)
	
	if not FFlagDisableGoogleAnalyticsErrorReporting then
		p1.errorReporter:startQueueTimers()
	end
end

function MutedErrorReporter:render()
	return nil
end

function MutedErrorReporter.willUnmount(p1)
	-- upvalues: FFlagDisableGoogleAnalyticsErrorReporting (copy)
	if not FFlagDisableGoogleAnalyticsErrorReporting then
		p1.errorReporter:stopQueueTimers()
	end
end

return MutedErrorReporter