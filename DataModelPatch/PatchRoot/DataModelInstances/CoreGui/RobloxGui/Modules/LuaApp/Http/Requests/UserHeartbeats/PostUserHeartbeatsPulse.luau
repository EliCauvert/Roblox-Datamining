local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local HttpService = game:GetService("HttpService")
local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)

local function _(): number
	return (math.floor(os.time() * 1000))
end

return function(Callback, ActiveState, PageName)
	-- upvalues: UrlModule (copy), HttpService (copy), RbxAnalyticsService (copy)
	return Callback(string.format("%suser-heartbeats-api/pulse", UrlModule.APIS_URL), "POST", {
		postBody = HttpService:JSONEncode({
			clientSideTimestampEpochMs = math.floor(os.time() * 1000),
			locationInfo = {
				universalAppLocationInfo = { activeState = ActiveState, pageName = PageName }
			},
			sessionInfo = { sessionId = RbxAnalyticsService:GetSessionId() }
		})
	})
end