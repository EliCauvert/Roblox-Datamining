local Parent = script:FindFirstAncestor("SettingsSdui").Parent
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "account-management-api/v1/usersettings/menu",
	base = require(Parent.Http).Url.APIS_URL
})

return function()
	-- upvalues: NewResult (copy)
	return NewResult()
end