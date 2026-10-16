local Parent = script:FindFirstAncestor("StreamNotifications").Parent
local PromiseModule = require(Parent.Promise)
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "v2/stream-notifications/clear-unread",
	base = require(Parent.Http).Url.NOTIFICATION_URL
})

return function(Callback) --[[ Line: 13 ]]
	-- upvalues: NewResult (copy), PromiseModule (copy)
	return Callback(NewResult(), "POST", { postBody = "{}" }):andThen(function(Result) --[[ Line: 16 ]]
		-- upvalues: PromiseModule (upval)
		return if Result.responseCode == 200 then PromiseModule.resolve() else PromiseModule.reject()
	end, function(p1) --[[ Line: 22 ]]
		-- upvalues: PromiseModule (upval)
		return PromiseModule.reject(p1)
	end)
end