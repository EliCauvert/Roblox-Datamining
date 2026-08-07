local parent = script:FindFirstAncestor("StreamNotifications").Parent
local promiseModule = require(parent.Promise)
local var1 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "v2/stream-notifications/get-recent",
	base = require(parent.Http).Url.NOTIFICATION_URL,
	query = { maxRows = "{maxRows}", startIndex = "{startIndex}" }
})

return function(p0, p1, p2) --[[ line: 17 ]]
	-- upvalues: var1 (ref), promiseModule (ref)
	return p0(var1({ maxRows = p1 or 10, startIndex = p2 or 0 }), "GET"):andThen(function(p3) --[[ line: 26 ]]
		-- upvalues: promiseModule (copy)
		local responseBody = p3.responseBody or nil
		
		return if p3.responseCode == 200 and responseBody ~= nil then promiseModule.resolve(responseBody) else promiseModule.reject()
	end, function(p4) --[[ line: 33 ]]
		-- upvalues: promiseModule (copy)
		return promiseModule.reject(p4)
	end)
end