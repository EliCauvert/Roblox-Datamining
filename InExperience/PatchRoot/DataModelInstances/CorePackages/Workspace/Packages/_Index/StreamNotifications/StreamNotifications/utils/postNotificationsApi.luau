local Parent = script:FindFirstAncestor("StreamNotifications").Parent
local PromiseModule = require(Parent.Promise)
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "v2/stream-notifications/action/{notificationId}/{actionPath}",
	base = require(Parent.Http).Url.NOTIFICATION_URL
})

return function(Callback, NotificationId, ActionPath) --[[ Line: 13 ]]
	-- upvalues: PromiseModule (copy), NewResult (copy)
	return if NotificationId == nil or NotificationId == "" or ActionPath == nil or ActionPath == "" then PromiseModule.reject() else Callback(NewResult({ notificationId = NotificationId, actionPath = ActionPath }), "POST", { postBody = "{}" }):andThen(function(Result) --[[ Line: 23 ]]
		-- upvalues: PromiseModule (upval)
		return if Result.responseCode == 200 then PromiseModule.resolve() else PromiseModule.reject()
	end, function(_) --[[ Line: 29 ]]
		-- upvalues: PromiseModule (upval)
		return PromiseModule.reject()
	end)
end