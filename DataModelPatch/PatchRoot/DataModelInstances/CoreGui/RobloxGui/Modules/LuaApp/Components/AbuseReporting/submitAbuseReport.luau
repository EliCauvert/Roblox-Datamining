local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local HttpRequestModule = require(CorePackages.Packages.HttpRequest)
local RoduxNetworkingModule = require(CorePackages.Packages.RoduxNetworking)
local ConstructAbuseReportTagsModule = require(Modules.LuaApp.Components.AbuseReporting.constructAbuseReportTags)
local _ = require(Modules.LuaApp.Components.AbuseReporting.ReportTypes)
local _ = require(Modules.LuaApp.Components.AbuseReporting.Constants)

return function(p1, p2, p3, p4)
	-- upvalues: HttpRequestModule (copy), RoduxNetworkingModule (copy), ConstructAbuseReportTagsModule (copy)
	local ConfigResult = RoduxNetworkingModule.config({
		keyPath = "AbuseReporting",
		networkImpl = HttpRequestModule.config({
			maxWaitTime = 3,
			requestFunction = HttpRequestModule.requestFunctions.HttpRbxApi,
			maxRetryCount = game:DefineFastInt("SubmitAbuseReportHttpRetryCount", 2)
		})
	})
	local config = {
		safetyEvent = { tags = ConstructAbuseReportTagsModule(p1, p3, p4) }
	}
	
	return ConfigResult.POST("SubmitAbuseReport", function(Callback, _)
		-- upvalues: p2 (copy), config (copy)
		return Callback(p2):body(config)
	end).API()
end