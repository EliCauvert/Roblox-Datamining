local Modules = game:GetService("CoreGui").RobloxGui.Modules
local NewResult = require(Modules.LuaApp.Http.UrlBuilder).new({
	path = "developer-subscriptions/v1/subscriptions",
	query = "{userId}&{status}&{includeLookupData}&{cursor|}",
	base = require(Modules.LuaApp.Http.Url).APIS_URL
})

return function(Callback, UserId, Status, Cursor)
	-- upvalues: NewResult (copy)
	return Callback(NewResult({
		includeLookupData = "true",
		userId = UserId,
		status = Status,
		cursor = Cursor
	}), "GET")
end