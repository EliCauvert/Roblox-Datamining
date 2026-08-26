local parent = script:FindFirstAncestor("StreamNotifications").Parent
local promiseModule = require(parent.Promise)
local httpService = game:GetService("HttpService")
local var1 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "notifications/v1/report-notification",
	base = require(parent.Http).Url.APIS_URL
})

return function(p1, p2)
	-- upvalues: promiseModule (ref), var1 (ref), httpService (ref)
	return if p2 == nil or p2 == "" then promiseModule.reject() else p1(var1(), "POST", {
		postBody = httpService:JSONEncode({ notificationId = p2 })
	}):andThen(function(p3)
		-- upvalues: promiseModule (copy)
		return if p3.responseCode == 200 then promiseModule.resolve() else promiseModule.reject()
	end, function(_)
		-- upvalues: promiseModule (copy)
		return promiseModule.reject()
	end)
end