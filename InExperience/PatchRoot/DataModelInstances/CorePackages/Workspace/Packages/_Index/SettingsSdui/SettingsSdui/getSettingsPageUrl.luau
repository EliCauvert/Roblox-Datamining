local Parent = script:FindFirstAncestor("SettingsSdui").Parent
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "account-management-api/v1/usersettings/menu",
	base = require(Parent.Http).Url.APIS_URL
})

return function() --[[ Line: 12 | Named "getSettingsPageUrl" ]]
	-- upvalues: NewResult (copy)
	return NewResult()
end