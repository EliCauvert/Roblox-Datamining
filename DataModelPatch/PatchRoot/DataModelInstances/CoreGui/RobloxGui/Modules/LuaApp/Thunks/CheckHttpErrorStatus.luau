local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local TelemetryService = game:GetService("TelemetryService")
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(Modules.LuaApp.Promise)
local StatusCodes = require(CorePackages.Workspace.Packages.Http).StatusCodes
local LogoutUserOnUnauthorizedModule = require(Modules.LuaApp.Thunks.LogoutUserOnUnauthorized)
local UserModerationCheckModule = require(Modules.LuaApp.Thunks.Moderation.UserModerationCheck)
local Logger = require(CorePackages.Workspace.Packages.Loggers).Logger
local TelemetryConfigs = require(CorePackages.Workspace.Packages.AuthAnalytics).TelemetryConfigs
local AuthAnalyticsModule = require(CorePackages.Workspace.Packages.AuthAnalytics)
local AuthClientErrorFunction = AuthAnalyticsModule.Events.authClientError
local AuthOperationTimingFunction = AuthAnalyticsModule.Events.authOperationTiming
local AuthPageloadFunction = AuthAnalyticsModule.Events.authPageload
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)
local WebViewStateTracker = require(CorePackages.Workspace.Packages.WebViewUtils).WebViewStateTracker
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local GetFFlagTriggerLogoutOnAuthErrorCodeFunction = SharedFlagsModule.GetFFlagTriggerLogoutOnAuthErrorCode
local GetFStringAuthenticationErrorCodeFunction = SharedFlagsModule.GetFStringAuthenticationErrorCode
local GetFStringAuthenticationErrorCodeAlternativeFunction = SharedFlagsModule.GetFStringAuthenticationErrorCodeAlternative
local FFlagEnableWebViewStateTracker = SharedFlagsModule.FFlagEnableWebViewStateTracker
local RemoveHttpErrorLog2 = game:DefineFastFlag("RemoveHttpErrorLog2", false)
local Enable401LogoutGracePeriod = game:DefineFastFlag("Enable401LogoutGracePeriod", false)
local EnableWebViewOpenDurationCap = game:DefineFastFlag("EnableWebViewOpenDurationCap", false)
local WebViewOpenDurationCapSeconds = game:DefineFastInt("WebViewOpenDurationCapSeconds", 0)
local WebViewLastClosedDurationSeconds = game:DefineFastInt("WebViewLastClosedDurationSeconds", 1)
local Emit401WebViewDiagnostics = game:DefineFastFlag("Emit401WebViewDiagnostics", false)

return function(p1, p2, p3, p4)
	-- upvalues: PromiseModule (copy), RemoveHttpErrorLog2 (copy), Logger (copy), Logging (copy), StatusCodes (copy), UserModerationCheckModule (copy), HttpService (copy), TelemetryService (copy), TelemetryConfigs (copy), AuthClientErrorFunction (copy), EventStreamConstantsModule (copy), FFlagEnableWebViewStateTracker (copy), WebViewStateTracker (copy), EnableWebViewOpenDurationCap (copy), WebViewOpenDurationCapSeconds (copy), WebViewLastClosedDurationSeconds (copy), Emit401WebViewDiagnostics (copy), AuthOperationTimingFunction (copy), Enable401LogoutGracePeriod (copy), AuthPageloadFunction (copy), GetFFlagTriggerLogoutOnAuthErrorCodeFunction (copy), GetFStringAuthenticationErrorCodeFunction (copy), GetFStringAuthenticationErrorCodeAlternativeFunction (copy), LogoutUserOnUnauthorizedModule (copy)
	return function(p5)
		-- upvalues: p3 (copy), PromiseModule (upval), RemoveHttpErrorLog2 (upval), Logger (upval), p2 (copy), Logging (upval), StatusCodes (upval), UserModerationCheckModule (upval), p1 (copy), HttpService (upval), TelemetryService (upval), TelemetryConfigs (upval), AuthClientErrorFunction (upval), EventStreamConstantsModule (upval), FFlagEnableWebViewStateTracker (upval), WebViewStateTracker (upval), EnableWebViewOpenDurationCap (upval), WebViewOpenDurationCapSeconds (upval), WebViewLastClosedDurationSeconds (upval), Emit401WebViewDiagnostics (upval), AuthOperationTimingFunction (upval), Enable401LogoutGracePeriod (upval), AuthPageloadFunction (upval), GetFFlagTriggerLogoutOnAuthErrorCodeFunction (upval), GetFStringAuthenticationErrorCodeFunction (upval), GetFStringAuthenticationErrorCodeAlternativeFunction (upval), LogoutUserOnUnauthorizedModule (upval), p4 (copy)
		if p3 == nil then
			return PromiseModule.resolve()
		end
		if RemoveHttpErrorLog2 then
			Logger:debug("HTTP error url:`" .. tostring(p2) .. "`")
			Logger:debug("HTTP error code:`" .. tostring(p3.StatusCode) .. "`")
			Logger:debug("HTTP error body:`" .. tostring(p3.Body) .. "`")
		else
			Logging.warn("HTTP error url:`" .. tostring(p2) .. "`")
			Logging.warn("HTTP error code:`" .. tostring(p3.StatusCode) .. "`")
			Logging.warn("HTTP error body:`" .. tostring(p3.Body) .. "`")
		end
		if p3.StatusCode == StatusCodes.FORBIDDEN then
			p5:dispatch(UserModerationCheckModule(p1, p3))
		elseif p3.StatusCode == StatusCodes.UNAUTHORIZED then
			local Code = "empty"
			local Subcode = "empty"
			local Success, Result = pcall(function()
				-- upvalues: HttpService (upval), p3 (upval)
				return HttpService:JSONDecode(p3.Body)
			end)
			
			if Success and Result.errors and Result.errors[1] then
				local Error = Result.errors[1]
				
				if Error.code ~= nil then
					Code = tostring(Error.code)
				end
				if Error.subcode ~= nil then
					Subcode = tostring(Error.subcode)
				end
			end
			TelemetryService:LogCounter(TelemetryConfigs.UnauthorizedErrorTelemetryConfig, { customFields = { code = Code, subcode = Subcode } }, 1)
			AuthClientErrorFunction(EventStreamConstantsModule.Context.UnauthorizedError, Subcode, p2, Code)
			
			if FFlagEnableWebViewStateTracker then
				local IsOpenNoLongerThan = WebViewStateTracker.isOpenNoLongerThan(EnableWebViewOpenDurationCap, WebViewOpenDurationCapSeconds)
				local WasClosedWithinResult = WebViewStateTracker.wasClosedWithin(WebViewLastClosedDurationSeconds)
				
				if Emit401WebViewDiagnostics then
					local Diagnostic401WebviewOpen = nil
					local OpenDuration = nil
					if IsOpenNoLongerThan then
						Diagnostic401WebviewOpen = EventStreamConstantsModule.State.Diagnostic401WebviewOpen
						OpenDuration = WebViewStateTracker.getOpenDuration()
					elseif WasClosedWithinResult then
						Diagnostic401WebviewOpen = EventStreamConstantsModule.State.Diagnostic401WebviewRecentlyClosed
						OpenDuration = WebViewStateTracker.wasLastClosed()
					elseif WebViewStateTracker.wasLastClosed() >= 0 then
						Diagnostic401WebviewOpen = EventStreamConstantsModule.State.Diagnostic401WebviewClosedExpired
						OpenDuration = WebViewStateTracker.wasLastClosed()
					else
						Diagnostic401WebviewOpen = EventStreamConstantsModule.State.Diagnostic401WebviewNeverOpened
						OpenDuration = -1
					end
					AuthOperationTimingFunction(EventStreamConstantsModule.Context.InvoluntaryLogoutGracePeriod, OpenDuration, Diagnostic401WebviewOpen)
				end
				if Enable401LogoutGracePeriod and (IsOpenNoLongerThan or WasClosedWithinResult) then
					AuthPageloadFunction(EventStreamConstantsModule.Context.InvoluntaryLogoutGracePeriod, EventStreamConstantsModule.State.GracePeriodApplied)
					
					return PromiseModule.reject(p3)
				end
				if IsOpenNoLongerThan and (EnableWebViewOpenDurationCap and WebViewOpenDurationCapSeconds < WebViewStateTracker.getOpenDuration()) then
					AuthOperationTimingFunction(EventStreamConstantsModule.Context.InvoluntaryLogoutGracePeriod, WebViewStateTracker.getOpenDuration(), EventStreamConstantsModule.State.GracePeriodExceeded)
				elseif not WasClosedWithinResult then
					AuthOperationTimingFunction(EventStreamConstantsModule.Context.InvoluntaryLogoutGracePeriod, WebViewStateTracker.wasLastClosed(), EventStreamConstantsModule.State.WebViewLastClosed)
				end
			end
			if GetFFlagTriggerLogoutOnAuthErrorCodeFunction() and (Code == GetFStringAuthenticationErrorCodeFunction() or Code == GetFStringAuthenticationErrorCodeAlternativeFunction()) then
				p5:dispatch(LogoutUserOnUnauthorizedModule(p1, p4, p2))
			elseif not GetFFlagTriggerLogoutOnAuthErrorCodeFunction() then
				p5:dispatch(LogoutUserOnUnauthorizedModule(p1, p4, p2))
			end
		end
		return PromiseModule.reject(p3)
	end
end