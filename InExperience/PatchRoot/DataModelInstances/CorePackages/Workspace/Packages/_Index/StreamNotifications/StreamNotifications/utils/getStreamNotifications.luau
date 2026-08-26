local parent = script:FindFirstAncestor("StreamNotifications").Parent
local promiseModule = require(parent.Promise)
local var1 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "v2/stream-notifications/get-recent",
	base = require(parent.Http).Url.NOTIFICATION_URL,
	query = { maxRows = "{maxRows}", startIndex = "{startIndex}" }
})

return function(p1, p2, p3)
	-- upvalues: var1 (ref), promiseModule (ref)
	return p1(var1({ maxRows = p2 or 10, startIndex = p3 or 0 }), "GET"):andThen(function(p4)
		-- upvalues: promiseModule (copy)
		local responseBody = p4.responseBody or nil
		
		return if p4.responseCode == 200 and responseBody ~= nil then promiseModule.resolve(responseBody) else promiseModule.reject()
	end, function(p4)
		-- upvalues: promiseModule (copy)
		return promiseModule.reject(p4)
	end)
end