local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local HttpService = game:GetService("HttpService")
local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)

local function _(): number
	return (math.floor(os.time() * 1000))
end

return function(Callback, ActionInfo)
	-- upvalues: UrlModule (copy), HttpService (copy), RbxAnalyticsService (copy)
	return Callback(string.format("%suser-heartbeats-api/action-report", UrlModule.APIS_URL), "POST", {
		postBody = string.gsub(string.gsub(HttpService:JSONEncode({
			actionInfo = ActionInfo,
			clientSideTimestampEpochMs = math.floor(os.time() * 1000),
			sessionInfo = { sessionId = RbxAnalyticsService:GetSessionId() }
		}), "\"loginActionInfo\":%[%]", "\"loginActionInfo\":{}"), "\"logoutActionInfo\":%[%]", "\"logoutActionInfo\":{}")
	})
end