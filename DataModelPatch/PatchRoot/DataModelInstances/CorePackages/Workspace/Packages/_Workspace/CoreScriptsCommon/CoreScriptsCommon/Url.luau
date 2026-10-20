local UrlModule = {}

local function _(Text: string): string
	local _, EndIndex = Text:find("%.")
	local Segment: string = Text:sub(EndIndex + 1)
	
	if Segment:sub(-1) ~= "/" then
		Segment ..= "/"
	end
	return Segment
end

local BaseUrl: string = game:GetService("ContentProvider").BaseUrl
local _, EndIndex = BaseUrl:find("%.")
local Segment: string = BaseUrl:sub(EndIndex + 1)

if Segment:sub(-1) ~= "/" then
	Segment ..= "/"
end
local config = {
	GAME_URL = string.format("https://games.%s", Segment),
	RCS_URL = string.format("https://apis.rcs.%s", Segment),
	APIS_URL = string.format("https://apis.%s", Segment),
	ACCOUNT_SETTINGS_URL = string.format("https://accountsettings.%s", Segment),
	GAME_INTERNATIONALIZATION_URL = string.format("https://gameinternationalization.%s", Segment),
	LOCALE_URL = string.format("https://locale.%s", Segment),
	ROLES_URL = string.format("https://users.%s", Segment),
	CATALOG_URL = string.format("https://catalog.%s", Segment),
	CREATE_URL = string.format("https://create.%s", Segment)
}
setmetatable(UrlModule, {
	__newindex = function(_, _, _) end,
	__index = function(_, p1)
		-- upvalues: config (copy)
		return config[p1]
	end
})

return UrlModule