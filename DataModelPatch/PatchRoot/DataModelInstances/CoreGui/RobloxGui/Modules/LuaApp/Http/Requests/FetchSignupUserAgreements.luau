local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local UrlBuilderModule = require(Modules.LuaApp.Http.UrlBuilder)
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local ReportEphemeralCounterModule = require(Modules.LuaApp.Analytics.Events.reportEphemeralCounter)
local UserAgreementsCounterNames = require(CorePackages.Workspace.Packages.UserAgreements).UserAgreementsCounterNames
game:DefineFastInt("LuaFetchUpdatedUserAgreementsErrorsThrottling", 10000)

return function(Callback, p1)
	-- upvalues: UrlBuilderModule (copy), Logging (copy), ReportEphemeralCounterModule (copy), UserAgreementsCounterNames (copy)
	local Web = UrlBuilderModule.fromString("apis:user-agreements/v1/agreements-resolution-signup/Web")
	
	return Callback(Web(), "GET"):andThen(function(Result)
		if Result.responseCode ~= 200 then return end
		return Result.responseBody
	end, function(p2)
		-- upvalues: Logging (upval), Web (copy), ReportEphemeralCounterModule (upval), UserAgreementsCounterNames (upval), p1 (copy)
		Logging.warn(string.format("Url: %s, Status: %s, isJSONValid: %s", Web, tostring(p2.HttpError), (tostring(p2.isJSONValid))))
		ReportEphemeralCounterModule(UserAgreementsCounterNames.FetchAgreementsHttpRequestFailure, 1)
		
		if p1 ~= nil then
			p1.InfluxDb:reportSeries(script.Name, {
				url = Web,
				statusCode = p2.StatusCode,
				errorMessage = p2.Body
			}, game:GetFastInt("LuaFetchUpdatedUserAgreementsErrorsThrottling"))
		end
	end)
end