local ContentProvider = game:GetService("ContentProvider")

local function preventTableModification(_, _, _)
	error("Attempt to modify read-only table")
end

local function _(p1)
	-- upvalues: preventTableModification (copy)
	return (setmetatable({}, {
		__metatable = false,
		__index = p1,
		__newindex = preventTableModification
	}))
end

local Text1, v1, Pattern = (function()
	-- upvalues: ContentProvider (copy)
	local BaseUrl = ContentProvider.BaseUrl
	
	if BaseUrl:sub(#BaseUrl) ~= "/" then
		BaseUrl ..= "/"
	end
	local _, EndIndex = BaseUrl:find("://")
	local StartIndex, EndIndex1 = BaseUrl:find("%.", EndIndex + 1)
	
	return BaseUrl, BaseUrl:sub(EndIndex + 1, StartIndex - 1), (BaseUrl:sub(EndIndex1 + 1))
end)()
local Formatted = string.format("https://api.%s", Pattern)
local Formatted1 = string.format("https://apis.%s", Pattern)
local Formatted2 = string.format("https://auth.%s", Pattern)
local Formatted3 = string.format("https://accountsettings.%s", Pattern)
local Formatted4 = string.format("https://avatar.%s", Pattern)
local Formatted5 = string.format("https://catalog.%s", Pattern)
local Formatted6 = string.format("https://create.%s", Pattern)
local Formatted7 = string.format("https://inventory.%s", Pattern)
local Formatted8 = string.format("https://chat.%sv2", Pattern)
local Formatted9 = string.format("https://friends.%sv1", Pattern)
local Formatted10 = string.format("https://users.%sv1", Pattern)
local Formatted11 = string.format("https://assetgame.%s", Pattern)
local Formatted12 = string.format("https://games.%s", Pattern)
local Formatted13 = string.format("https://groups.%s", Pattern)
local Formatted14 = string.format("https://notifications.%s", Pattern)
local Formatted15 = string.format("https://presence.%sv1", Pattern)
local Formatted16 = string.format("https://realtime.%s", Pattern)
local Formatted17 = string.format("https://web.%s", Pattern)
local Formatted18 = string.format("https://www.%s", Pattern)
local Formatted19 = string.format("https://ads.%s", Pattern)
local Formatted20 = string.format("https://adconfiguration.%s", Pattern)
local Formatted21 = string.format("https://followings.%s", Pattern)
local Formatted22 = string.format("https://economy.%s", Pattern)
local Formatted23 = string.format("https://thumbnails.%s", Pattern)
local Formatted24 = string.format("https://thumbnailsdelivery.%s", Pattern)
local Formatted25 = string.format("https://accountsettings.%s", Pattern)
local Formatted26 = string.format("https://premiumfeatures.%s", Pattern)
local Formatted27 = string.format("https://locale.%s", Pattern)
local Formatted28 = string.format("https://badges.%s", Pattern)
local Formatted29 = string.format("https://metrics.%sv1", Pattern)
local Formatted30 = string.format("https://apis.rcs.%s", Pattern)
local Formatted31 = string.format("https://discussions.%s", Pattern)
local Formatted32 = string.format("https://contacts.%s", Pattern)
local Formatted33 = string.format("https://search.%s", Pattern)
local Formatted34 = string.format("https://static.%s", Pattern)
local Formatted35 = string.format("https://gamesearchuitreatments.api.%s", Pattern)
local Formatted36 = string.format("https://gameinternationalization.%s", Pattern)
local Formatted37 = string.format("https://economycreatorstats.%s", Pattern)
local Formatted38 = string.format("https://usermoderation.%s", Pattern)
local Replaced = string.gsub(Text1, "http://", "https://")
local Formatted39 = string.format("https://voice.%s", Pattern)
local Formatted40 = string.format("https://translations.%s", Pattern)
local Formatted41 = string.format("https://twostepverification.%s", Pattern)
local Formatted42 = string.format("https://privatemessages.%sv1", Pattern)
local Text: string = Formatted34

if Pattern == "roblox.com/" then
	Text = string.gsub(Text, Pattern, "rbxcdn.com/")
end
return (setmetatable({}, {
	__metatable = false,
	__index = {
		DOMAIN = Pattern,
		PREFIX = v1,
		BASE_URL = Replaced,
		BASE_URL_SECURE = Replaced,
		API_URL = Formatted,
		APIS_URL = Formatted1,
		AUTH_URL = Formatted2,
		ACCOUNT_SETTINGS_URL = Formatted3,
		AVATAR_URL = Formatted4,
		CATALOG_URL = Formatted5,
		CREATOR_HUB_URL = Formatted6,
		INVENTORY_URL = Formatted7,
		GAME_URL = Formatted12,
		GAME_ASSET_URL = Formatted11,
		GROUPS_URL = Formatted13,
		CHAT_URL = Formatted8,
		FRIEND_URL = Formatted9,
		USERS_URL = Formatted10,
		PRESENCE_URL = Formatted15,
		NOTIFICATION_URL = Formatted14,
		REALTIME_URL = Formatted16,
		WEB_URL = Formatted17,
		WWW_URL = Formatted18,
		ADS_URL = Formatted19,
		AD_CONFIGURATION_URL = Formatted20,
		SEARCH_URL = Formatted33,
		GAME_SEARCH_UI_TREATMENTS = Formatted35,
		GAME_INTERNATIONALIZATION_URL = Formatted36,
		FOLLOWINGS_URL = Formatted21,
		ECONOMY_URL = Formatted22,
		THUMBNAILS_URL = Formatted23,
		THUMBNAILSDELIVERY_URL = Formatted24,
		BADGES_URL = Formatted28,
		ACCOUNT_SETTINGS = Formatted25,
		PREMIUM_FEATURES = Formatted26,
		LOCALE = Formatted27,
		METRICS_URL = Formatted29,
		APIS_RCS_URL = Formatted30,
		DISCUSSIONS_URL = Formatted31,
		CONTACTS_URL = Formatted32,
		STATIC_URL = Formatted34,
		STATIC_CDN_URL = Text,
		BLOG_URL = "https://blog.roblox.com/",
		CORP_URL = "https://corp.roblox.com/",
		STORE_URL = "https://www.amazon.com/roblox",
		ECNOMY_CREATOR_STATS = Formatted37,
		USER_MODERATION_URL = Formatted38,
		VOICE_URL = Formatted39,
		TRANSLATIONS_URL = Formatted40,
		TWOSTEPVERIFICATION_URL = Formatted41,
		PRIVATEMESSAGES_URL = Formatted42,
		getUserProfileUrl = function(p1, p2): string
			return string.format("%susers/%s/profile", p1.BASE_URL, p2)
		end,
		getUserFriendsUrl = function(p1, p2): string
			return string.format("%susers/%s/friends", p1.BASE_URL, p2)
		end,
		getUserInventoryUrl = function(p1, p2): string
			return string.format("%susers/%s/inventory", p1.BASE_URL, p2)
		end,
		getPlaceDefaultThumbnailUrl = function(p1, p2, p3, p4): string
			return string.format("%sThumbs/Asset.ashx?width=%d&height=%d&assetId=%s&ignorePlaceMediaItems=true", p1.BASE_URL, p3, p4, (tostring(p2)))
		end,
		isVanitySite = function(p1): boolean
			return p1.PREFIX ~= "www"
		end,
		makeQueryString = function(_, List): string
			local List1 = {}
			
			for i, value in pairs(List) do
				if value ~= nil then
					if type(value) == "table" then
						for i1 = 1, #value do
							table.insert(List1, i .. "=" .. value[i1])
						end
					else
						table.insert(List1, i .. "=" .. tostring(value))
					end
				end
			end
			return table.concat(List1, "&")
		end,
		stripHttpsAndTrailingSlash = function(Text: string): string
			return (string.gsub(string.gsub(Text, "^https://", ""), "/*$", ""))
		end
	},
	__newindex = preventTableModification
}))