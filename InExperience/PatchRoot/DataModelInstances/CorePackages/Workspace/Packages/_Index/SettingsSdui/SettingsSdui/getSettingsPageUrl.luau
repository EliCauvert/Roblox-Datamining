local parent = script:FindFirstAncestor("SettingsSdui").Parent
local var1 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "account-management-api/v1/usersettings/menu",
	base = require(parent.Http).Url.APIS_URL
})

return function()
	-- upvalues: var1 (ref)
	return var1()
end