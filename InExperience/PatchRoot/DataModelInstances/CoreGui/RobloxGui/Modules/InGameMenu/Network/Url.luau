local ContentProvider = game:GetService("ContentProvider")

local function preventTableModification(_, _, _) --[[ Line: 33 ]]
	error("Attempt to modify read-only table")
end

local function _(p1) --[[ Line: 36 | Named "createReadOnlyTable" ]]
	-- upvalues: preventTableModification (copy)
	return (setmetatable({}, {
		__metatable = false,
		__index = p1,
		__newindex = preventTableModification
	}))
end

local Text, v1, v2 = (function() --[[ Line: 11 | Named "parseBaseUrlInformation" ]]
	-- upvalues: ContentProvider (copy)
	local BaseUrl = ContentProvider.BaseUrl
	
	if BaseUrl:sub(#BaseUrl) ~= "/" then
		BaseUrl ..= "/"
	end
	local _, EndIndex = BaseUrl:find("://")
	local StartIndex, EndIndex1 = BaseUrl:find("%.", EndIndex + 1)
	
	return BaseUrl, BaseUrl:sub(EndIndex + 1, StartIndex - 1), (BaseUrl:sub(EndIndex1 + 1))
end)()

return (setmetatable({}, {
	__metatable = false,
	__index = {
		DOMAIN = v2,
		PREFIX = v1,
		BASE_URL = Text,
		BASE_URL_SECURE = string.gsub(Text, "http://", "https://"),
		API_URL = string.format("https://api.%s", v2),
		APIS_URL = string.format("https://apis.%s", v2),
		AUTH_URL = string.format("https://auth.%s", v2),
		ACCOUNT_SETTINGS_URL = string.format("https://accountsettings.%s", v2),
		AVATAR_URL = string.format("https://avatar.%s", v2),
		CATALOG_URL = string.format("https://catalog.%s", v2),
		CREATOR_HUB_URL = string.format("https://create.%s", v2),
		GAME_URL = string.format("https://games.%s", v2),
		GAME_ASSET_URL = string.format("https://assetgame.%s", v2),
		CHAT_URL = string.format("https://chat.%sv2", v2),
		FRIEND_URL = string.format("https://friends.%sv1", v2),
		PRESENCE_URL = string.format("https://presence.%sv1", v2),
		NOTIFICATION_URL = string.format("https://notifications.%s", v2),
		REALTIME_URL = string.format("https://realtime.%s", v2),
		WEB_URL = string.format("https://web.%s", v2),
		WWW_URL = string.format("https://www.%s", v2),
		ADS_URL = string.format("https://ads.%s", v2),
		FOLLOWINGS_URL = string.format("https://followings.%s", v2),
		ECONOMY_URL = string.format("https://economy.%s", v2),
		THUMBNAILS_URL = string.format("https://thumbnails.%s", v2),
		BADGES_URL = string.format("https://badges.%s", v2),
		ACCOUNT_SETTINGS = string.format("https://accountsettings.%s", v2),
		PREMIUM_FEATURES = string.format("https://premiumfeatures.%s", v2),
		LOCALE = string.format("https://locale.%s", v2),
		METRICS_URL = string.format("https://metrics.%sv1", v2),
		APIS_RCS_URL = string.format("https://apis.rcs.%s", v2),
		DISCUSSIONS_URL = string.format("https://discussions.%s", v2),
		BLOG_URL = "https://blog.roblox.com/",
		CORP_URL = "https://corp.roblox.com/",
		GAME_I18N_URL = string.format("https://gameinternationalization.%s", v2),
		getUserProfileUrl = function(p1, p2): string --[[ Line: 117 ]]
			return string.format("%susers/%s/profile", p1.BASE_URL, p2)
		end,
		getUserFriendsUrl = function(p1, p2): string --[[ Line: 121 ]]
			return string.format("%susers/%s/friends", p1.BASE_URL, p2)
		end,
		getUserInventoryUrl = function(p1, p2): string --[[ Line: 125 ]]
			return string.format("%susers/%s/inventory", p1.BASE_URL, p2)
		end,
		getPlaceDefaultThumbnailUrl = function(p1, p2, p3, p4): string --[[ Line: 129 ]]
			return string.format("%sThumbs/Asset.ashx?width=%d&height=%d&assetId=%s&ignorePlaceMediaItems=true", p1.BASE_URL, p3, p4, (tostring(p2)))
		end,
		isVanitySite = function(p1): boolean --[[ Line: 138 ]]
			return p1.PREFIX ~= "www"
		end,
		makeQueryString = function(_, List): string --[[ Line: 143 ]]
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
		end
	},
	__newindex = preventTableModification
}))