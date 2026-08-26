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

return setmetatable({}, {
	__metatable = false,
	__index = {
		DOMAIN = var3,
		PREFIX = var2,
		BASE_URL = var1,
		BASE_URL_SECURE = string.gsub(var1, "http://", "https://"),
		API_URL = string.format("https://api.%s", var3),
		APIS_URL = string.format("https://apis.%s", var3),
		AUTH_URL = string.format("https://auth.%s", var3),
		ACCOUNT_SETTINGS_URL = string.format("https://accountsettings.%s", var3),
		AVATAR_URL = string.format("https://avatar.%s", var3),
		CATALOG_URL = string.format("https://catalog.%s", var3),
		CREATOR_HUB_URL = string.format("https://create.%s", var3),
		GAME_URL = string.format("https://games.%s", var3),
		GAME_ASSET_URL = string.format("https://assetgame.%s", var3),
		CHAT_URL = string.format("https://chat.%sv2", var3),
		FRIEND_URL = string.format("https://friends.%sv1", var3),
		PRESENCE_URL = string.format("https://presence.%sv1", var3),
		NOTIFICATION_URL = string.format("https://notifications.%s", var3),
		REALTIME_URL = string.format("https://realtime.%s", var3),
		WEB_URL = string.format("https://web.%s", var3),
		WWW_URL = string.format("https://www.%s", var3),
		ADS_URL = string.format("https://ads.%s", var3),
		FOLLOWINGS_URL = string.format("https://followings.%s", var3),
		ECONOMY_URL = string.format("https://economy.%s", var3),
		THUMBNAILS_URL = string.format("https://thumbnails.%s", var3),
		BADGES_URL = string.format("https://badges.%s", var3),
		ACCOUNT_SETTINGS = string.format("https://accountsettings.%s", var3),
		PREMIUM_FEATURES = string.format("https://premiumfeatures.%s", var3),
		LOCALE = string.format("https://locale.%s", var3),
		METRICS_URL = string.format("https://metrics.%sv1", var3),
		APIS_RCS_URL = string.format("https://apis.rcs.%s", var3),
		DISCUSSIONS_URL = string.format("https://discussions.%s", var3),
		BLOG_URL = "https://blog.roblox.com/",
		CORP_URL = "https://corp.roblox.com/",
		GAME_I18N_URL = string.format("https://gameinternationalization.%s", var3),
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
		end
	},
	__newindex = preventTableModification
})