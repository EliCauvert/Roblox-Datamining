local Parent = script:FindFirstAncestor("StreamNotifications").Parent
local PromiseModule = require(Parent.Promise)
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "v2/stream-notifications/get-recent",
	base = require(Parent.Http).Url.NOTIFICATION_URL,
	query = { maxRows = "{maxRows}", startIndex = "{startIndex}" }
})

return function(Callback, p1, p2) --[[ Line: 17 ]]
	-- upvalues: NewResult (copy), PromiseModule (copy)
	return Callback(NewResult({ maxRows = p1 or 10, startIndex = p2 or 0 }), "GET"):andThen(function(Result) --[[ Line: 26 ]]
		-- upvalues: PromiseModule (upval)
		local ResponseBody = Result.responseBody or nil
		
		return if Result.responseCode == 200 and ResponseBody ~= nil then PromiseModule.resolve(ResponseBody) else PromiseModule.reject()
	end, function(p3) --[[ Line: 33 ]]
		-- upvalues: PromiseModule (upval)
		return PromiseModule.reject(p3)
	end)
end