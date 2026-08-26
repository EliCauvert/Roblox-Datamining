local contentProviderService = game:GetService("ContentProvider")

local function parseBaseUrlInformation()
	-- upvalues: contentProviderService (ref)
	local baseUrl = contentProviderService.BaseUrl
	
	if baseUrl:sub(#baseUrl) ~= "/" then
		baseUrl ..= "/"
	end
	local _, var1 = baseUrl:find("://")
	local var2, var3 = baseUrl:find("%.", var1 + 1)
	
	return baseUrl, baseUrl:sub(var1 + 1, var2 - 1), baseUrl:sub(var3 + 1)
end

local function preventTableModification(_, _, _)
	error("Attempt to modify read-only table")
end

local function _(p1)
	-- upvalues: preventTableModification (ref)
	return setmetatable({}, {
		__metatable = false,
		__index = p1,
		__newindex = preventTableModification
	})
end

local var1, var2, var3 = parseBaseUrlInformation()
local formattedText = string.format("https://api.%s", var3)
local formattedText_1 = string.format("https://apis.%s", var3)
local formattedText_2 = string.format("https://auth.%s", var3)
local formattedText_3 = string.format("https://accountsettings.%s", var3)
local formattedText_4 = string.format("https://avatar.%s", var3)
local formattedText_5 = string.format("https://catalog.%s", var3)
local formattedText_6 = string.format("https://create.%s", var3)
local formattedText_7 = string.format("https://inventory.%s", var3)
local formattedText_8 = string.format("https://chat.%sv2", var3)
local formattedText_9 = string.format("https://friends.%sv1", var3)
local formattedText_10 = string.format("https://users.%sv1", var3)
local formattedText_11 = string.format("https://assetgame.%s", var3)
local formattedText_12 = string.format("https://games.%s", var3)
local formattedText_13 = string.format("https://groups.%s", var3)
local formattedText_14 = string.format("https://notifications.%s", var3)
local formattedText_15 = string.format("https://presence.%sv1", var3)
local formattedText_16 = string.format("https://realtime.%s", var3)
local formattedText_17 = string.format("https://web.%s", var3)
local formattedText_18 = string.format("https://www.%s", var3)
local formattedText_19 = string.format("https://ads.%s", var3)
local formattedText_20 = string.format("https://adconfiguration.%s", var3)
local formattedText_21 = string.format("https://followings.%s", var3)
local formattedText_22 = string.format("https://economy.%s", var3)
local formattedText_23 = string.format("https://thumbnails.%s", var3)
local formattedText_24 = string.format("https://thumbnailsdelivery.%s", var3)
local formattedText_25 = string.format("https://accountsettings.%s", var3)
local formattedText_26 = string.format("https://premiumfeatures.%s", var3)
local formattedText_27 = string.format("https://locale.%s", var3)
local formattedText_28 = string.format("https://badges.%s", var3)
local formattedText_29 = string.format("https://metrics.%sv1", var3)
local formattedText_30 = string.format("https://apis.rcs.%s", var3)
local formattedText_31 = string.format("https://discussions.%s", var3)
local formattedText_32 = string.format("https://contacts.%s", var3)
local formattedText_33 = string.format("https://search.%s", var3)
local formattedText_34 = string.format("https://static.%s", var3)
local formattedText_35 = string.format("https://gamesearchuitreatments.api.%s", var3)
local formattedText_36 = string.format("https://gameinternationalization.%s", var3)
local formattedText_37 = string.format("https://economycreatorstats.%s", var3)
local formattedText_38 = string.format("https://usermoderation.%s", var3)
local replaced = string.gsub(var1, "http://", "https://")
local formattedText_39 = string.format("https://voice.%s", var3)
local formattedText_40 = string.format("https://translations.%s", var3)
local formattedText_41 = string.format("https://twostepverification.%s", var3)
local formattedText_42 = string.format("https://privatemessages.%sv1", var3)
local var4 = formattedText_34

if var3 == "roblox.com/" then
	var4 = string.gsub(var4, var3, "rbxcdn.com/")
end
return setmetatable({}, {
	__metatable = false,
	__index = {
		DOMAIN = var3,
		PREFIX = var2,
		BASE_URL = replaced,
		BASE_URL_SECURE = replaced,
		API_URL = formattedText,
		APIS_URL = formattedText_1,
		AUTH_URL = formattedText_2,
		ACCOUNT_SETTINGS_URL = formattedText_3,
		AVATAR_URL = formattedText_4,
		CATALOG_URL = formattedText_5,
		CREATOR_HUB_URL = formattedText_6,
		INVENTORY_URL = formattedText_7,
		GAME_URL = formattedText_12,
		GAME_ASSET_URL = formattedText_11,
		GROUPS_URL = formattedText_13,
		CHAT_URL = formattedText_8,
		FRIEND_URL = formattedText_9,
		USERS_URL = formattedText_10,
		PRESENCE_URL = formattedText_15,
		NOTIFICATION_URL = formattedText_14,
		REALTIME_URL = formattedText_16,
		WEB_URL = formattedText_17,
		WWW_URL = formattedText_18,
		ADS_URL = formattedText_19,
		AD_CONFIGURATION_URL = formattedText_20,
		SEARCH_URL = formattedText_33,
		GAME_SEARCH_UI_TREATMENTS = formattedText_35,
		GAME_INTERNATIONALIZATION_URL = formattedText_36,
		FOLLOWINGS_URL = formattedText_21,
		ECONOMY_URL = formattedText_22,
		THUMBNAILS_URL = formattedText_23,
		THUMBNAILSDELIVERY_URL = formattedText_24,
		BADGES_URL = formattedText_28,
		ACCOUNT_SETTINGS = formattedText_25,
		PREMIUM_FEATURES = formattedText_26,
		LOCALE = formattedText_27,
		METRICS_URL = formattedText_29,
		APIS_RCS_URL = formattedText_30,
		DISCUSSIONS_URL = formattedText_31,
		CONTACTS_URL = formattedText_32,
		STATIC_URL = formattedText_34,
		STATIC_CDN_URL = var4,
		BLOG_URL = "https://blog.roblox.com/",
		CORP_URL = "https://corp.roblox.com/",
		STORE_URL = "https://www.amazon.com/roblox",
		ECNOMY_CREATOR_STATS = formattedText_37,
		USER_MODERATION_URL = formattedText_38,
		VOICE_URL = formattedText_39,
		TRANSLATIONS_URL = formattedText_40,
		TWOSTEPVERIFICATION_URL = formattedText_41,
		PRIVATEMESSAGES_URL = formattedText_42,
		getUserProfileUrl = function(p1, p2)
			return string.format("%susers/%s/profile", p1.BASE_URL, p2)
		end,
		getUserFriendsUrl = function(p1, p2)
			return string.format("%susers/%s/friends", p1.BASE_URL, p2)
		end,
		getUserInventoryUrl = function(p1, p2)
			return string.format("%susers/%s/inventory", p1.BASE_URL, p2)
		end,
		getPlaceDefaultThumbnailUrl = function(p1, p2, p3, p4)
			return string.format("%sThumbs/Asset.ashx?width=%d&height=%d&assetId=%s&ignorePlaceMediaItems=true", p1.BASE_URL, p3, p4, tostring(p2))
		end,
		isVanitySite = function(p1)
			return p1.PREFIX ~= "www"
		end,
		makeQueryString = function(_, p1)
			local t = {}
			
			for i, v in pairs(p1) do
				if v ~= nil then
					if type(v) ~= "table" then
						table.insert(t, i .. "=" .. tostring(v))
						continue
					end
					for i_1 = 1, #v do
						table.insert(t, i .. "=" .. v[i_1])
					end
				end
			end
			return table.concat(t, "&")
		end,
		stripHttpsAndTrailingSlash = function(p2)
			return string.gsub(string.gsub(p2, "^https://", ""), "/*$", "")
		end
	},
	__newindex = preventTableModification
})