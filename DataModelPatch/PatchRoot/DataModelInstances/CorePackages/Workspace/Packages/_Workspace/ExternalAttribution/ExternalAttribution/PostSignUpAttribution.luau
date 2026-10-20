local HttpService = game:GetService("HttpService")
local ExternalAttribution = script:FindFirstAncestor("ExternalAttribution")
local Parent = ExternalAttribution.Parent
local PromiseModule = require(Parent.Promise)
local Url = require(Parent.Http).Url
local _ = require(Parent.Http)
local _ = require(Parent.AppStartup)
local LinkingProtocol = require(Parent.LinkingProtocol).LinkingProtocol
local Default = require(Parent.LoggingProtocol).default
local UtilsModule = require(ExternalAttribution.Utils)
local TelemetryConfigsModule = require(ExternalAttribution.TelemetryConfigs)
local GetFFlagEnableLuaAppsAppsflyerIdCounterFunction = require(ExternalAttribution.Flags).GetFFlagEnableLuaAppsAppsflyerIdCounter

return {
	attributeV2 = function(Callback, p1)
		-- upvalues: PromiseModule (copy), LinkingProtocol (copy), GetFFlagEnableLuaAppsAppsflyerIdCounterFunction (copy), Default (copy), TelemetryConfigsModule (copy), HttpService (copy), UtilsModule (copy), Url (copy)
		return PromiseModule.new(function(Callback1: () -> ())
			-- upvalues: LinkingProtocol (upval), GetFFlagEnableLuaAppsAppsflyerIdCounterFunction (upval), Default (upval), TelemetryConfigsModule (upval), HttpService (upval), UtilsModule (upval), p1 (copy), Url (upval), Callback (copy)
			local _, AppsflyerId = LinkingProtocol.default:getUID():await()
			
			if GetFFlagEnableLuaAppsAppsflyerIdCounterFunction() then
				Default:logRobloxTelemetryCounter(TelemetryConfigsModule.AppsflyerIdTotalCounter)
				
				if AppsflyerId == nil or AppsflyerId == "" then
					Default:logRobloxTelemetryCounter(TelemetryConfigsModule.AppsflyerIdFailureCounter)
				end
			end
			if AppsflyerId == nil then
				AppsflyerId = ""
			end
			Callback(string.format("%sattribution/v1/events/post-authentication", Url.APIS_URL), "POST", {
				postBody = HttpService:JSONEncode({
					appsflyerId = AppsflyerId,
					eventType = UtilsModule.parseLaunchContextToPostAuthenticationEventType(p1)
				})
			}):await()
			Callback1()
		end)
	end
}