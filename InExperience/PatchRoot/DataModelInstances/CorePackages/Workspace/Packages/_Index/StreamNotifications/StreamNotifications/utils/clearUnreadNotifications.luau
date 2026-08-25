local parent = script:FindFirstAncestor("StreamNotifications").Parent
local promiseModule = require(parent.Promise)
local var1 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "v2/stream-notifications/clear-unread",
	base = require(parent.Http).Url.NOTIFICATION_URL
})

return function(p0)
	-- upvalues: var1 (ref), promiseModule (ref)
	return p0(var1(), "POST", { postBody = "{}" }):andThen(function(p1)
		-- upvalues: promiseModule (copy)
		return if p1.responseCode == 200 then promiseModule.resolve() else promiseModule.reject()
	end, function(p2)
		-- upvalues: promiseModule (copy)
		return promiseModule.reject(p2)
	end)
end