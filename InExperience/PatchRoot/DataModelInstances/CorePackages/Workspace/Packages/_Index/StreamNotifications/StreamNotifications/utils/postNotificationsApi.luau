local parent = script:FindFirstAncestor("StreamNotifications").Parent
local promiseModule = require(parent.Promise)
local var1 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "v2/stream-notifications/action/{notificationId}/{actionPath}",
	base = require(parent.Http).Url.NOTIFICATION_URL
})

return function(p1, p2, p3)
	-- upvalues: promiseModule (ref), var1 (ref)
	return if p2 == nil or p2 == "" or (p3 == nil or p3 == "") then promiseModule.reject() else p1(var1({ notificationId = p2, actionPath = p3 }), "POST", { postBody = "{}" }):andThen(function(p4)
		-- upvalues: promiseModule (copy)
		return if p4.responseCode == 200 then promiseModule.resolve() else promiseModule.reject()
	end, function(_)
		-- upvalues: promiseModule (copy)
		return promiseModule.reject()
	end)
end