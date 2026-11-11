local Parent = script:FindFirstAncestor("StreamNotifications").Parent
local PromiseModule = require(Parent.Promise)
local HttpService = game:GetService("HttpService")
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "notifications/v1/report-notification",
	base = require(Parent.Http).Url.APIS_URL
})

return function(Callback, NotificationId)
	-- upvalues: PromiseModule (copy), NewResult (copy), HttpService (copy)
	return if NotificationId == nil or NotificationId == "" then PromiseModule.reject() else Callback(NewResult(), "POST", {
		postBody = HttpService:JSONEncode({ notificationId = NotificationId })
	}):andThen(function(Result)
		-- upvalues: PromiseModule (upval)
		return if Result.responseCode == 200 then PromiseModule.resolve() else PromiseModule.reject()
	end, function(_)
		-- upvalues: PromiseModule (upval)
		return PromiseModule.reject()
	end)
end