local t = {}

local function _(p0)
	local _, var4 = p0:find("%.")
	local var5 = p0:sub(var4 + 1)
	
	if var5:sub(-1) ~= "/" then
		var5 ..= "/"
	end
	return var5
end

local baseUrl = game:GetService("ContentProvider").BaseUrl
local _, var1 = baseUrl:find("%.")
local var2 = baseUrl:sub(var1 + 1)

if var2:sub(-1) ~= "/" then
	var2 ..= "/"
end
local t_1 = {
	GAME_URL = string.format("https://games.%s", var2),
	RCS_URL = string.format("https://apis.rcs.%s", var2),
	APIS_URL = string.format("https://apis.%s", var2),
	ACCOUNT_SETTINGS_URL = string.format("https://accountsettings.%s", var2),
	GAME_INTERNATIONALIZATION_URL = string.format("https://gameinternationalization.%s", var2),
	LOCALE_URL = string.format("https://locale.%s", var2),
	ROLES_URL = string.format("https://users.%s", var2),
	CATALOG_URL = string.format("https://catalog.%s", var2),
	CREATE_URL = string.format("https://create.%s", var2)
}
setmetatable(t, {
	__newindex = function(_, _, _) end,
	__index = function(_, p1)
		-- upvalues: t_1 (ref)
		return t_1[p1]
	end
})

return t