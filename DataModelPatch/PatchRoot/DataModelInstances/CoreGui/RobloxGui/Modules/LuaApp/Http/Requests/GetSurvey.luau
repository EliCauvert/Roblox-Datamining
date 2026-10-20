local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)
local HttpService = game:GetService("HttpService")
local CorePackages = game:GetService("CorePackages")
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local PromiseModule = require(CorePackages.Packages.Promise)
local FFlagSurvBloxEventTypeEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSurvBloxEventTypeEnabled

return function(Callback, Input)
	-- upvalues: UrlModule (copy), FFlagSurvBloxEventTypeEnabled (copy), HttpService (copy), PromiseModule (copy), Logging (copy)
	local Formatted = string.format("%sv1/survey", UrlModule.APIS_URL)
	
	if FFlagSurvBloxEventTypeEnabled and Input ~= nil then
		Formatted = string.format("%s?eventType=%s", Formatted, HttpService:UrlEncode(Input))
	end
	return Callback(Formatted, "GET"):andThen(function(Result)
		-- upvalues: PromiseModule (upval)
		return PromiseModule.resolve(Result.responseBody)
	end, function(p1)
		-- upvalues: Logging (upval), PromiseModule (upval)
		Logging.warn(string.format("ResponseCode: %s", (tostring(p1.responseCode))))
		
		return PromiseModule.reject(p1)
	end)
end