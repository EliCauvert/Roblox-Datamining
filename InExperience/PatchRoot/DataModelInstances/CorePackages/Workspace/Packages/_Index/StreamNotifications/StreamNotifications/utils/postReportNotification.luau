local parent = script:FindFirstAncestor("StreamNotifications").Parent
local promiseModule = require(parent.Promise)
local httpService = game:GetService("HttpService")
local var2 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "notifications/v1/report-notification",
	base = require(parent.Http).Url.APIS_URL
})

return function(p0, p1)
	-- upvalues: promiseModule (ref), var2 (ref), httpService (ref)
	return if p1 == nil or p1 == "" then promiseModule.reject() else p0(var2(), "POST", {
		postBody = httpService:JSONEncode({ notificationId = p1 })
	}):andThen(function(p2)
		-- upvalues: promiseModule (copy)
		return if p2.responseCode == 200 then promiseModule.resolve() else promiseModule.reject()
	end, function(_)
		-- upvalues: promiseModule (copy)
		return promiseModule.reject()
	end)
end