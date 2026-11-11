local HttpService = game:GetService("HttpService")
local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)

return function(Callback, Data, Data1)
	-- upvalues: UrlModule (copy), HttpService (copy)
	return Callback(string.format("%sabuse-reporting/v1/safety-event", UrlModule.APIS_URL), "POST", {
		postBody = HttpService:JSONEncode({
			safetyEvent = {
				eventTime = DateTime.now().UnixTimestampMillis,
				idempotencyKey = "subscriptions/" .. Data .. "/" .. Data1,
				tags = {
					SUBMITTER_USER_ID = { valueList = { { data = Data1 } } },
					ENTRY_POINT = { valueList = { { data = "luaApp" } } },
					REPORTED_ABUSE_CATEGORY = { valueList = { { data = "ABUSE_CATEGORY_OTHER" } } },
					REPORTED_ABUSE_VECTOR = { valueList = { { data = "subscriptions" } } },
					REPORTER_COMMENT = { valueList = { { data = "" } } },
					REPORT_TARGET_ASSET_ID = { valueList = { { data = "0" } } },
					REPORT_TARGET_SUBSCRIPTION_TARGET_KEY = { valueList = { { data = Data } } }
				}
			}
		})
	})
end