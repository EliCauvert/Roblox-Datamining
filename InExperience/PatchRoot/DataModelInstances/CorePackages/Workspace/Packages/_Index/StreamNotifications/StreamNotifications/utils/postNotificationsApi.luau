local parent = script:FindFirstAncestor("StreamNotifications").Parent
local promiseModule = require(parent.Promise)
local var1 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "v2/stream-notifications/action/{notificationId}/{actionPath}",
	base = require(parent.Http).Url.NOTIFICATION_URL
})

return function(p0, p1, p2) --[[ line: 13 ]]
	-- upvalues: promiseModule (ref), var1 (ref)
	return if p1 == nil or p1 == "" or (p2 == nil or p2 == "") then promiseModule.reject() else p0(var1({ notificationId = p1, actionPath = p2 }), "POST", { postBody = "{}" }):andThen(function(p3) --[[ line: 23 ]]
		-- upvalues: promiseModule (copy)
		return if p3.responseCode == 200 then promiseModule.resolve() else promiseModule.reject()
	end, function(_) --[[ line: 29 ]]
		-- upvalues: promiseModule (copy)
		return promiseModule.reject()
	end)
end