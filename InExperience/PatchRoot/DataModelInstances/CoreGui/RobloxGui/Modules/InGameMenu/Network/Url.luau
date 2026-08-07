local contentProviderService = game:GetService("ContentProvider")

local function parseBaseUrlInformation() --[[ line: 11 ]]
	-- upvalues: contentProviderService (ref)
	local baseUrl = contentProviderService.BaseUrl
	
	if baseUrl:sub(#baseUrl) ~= "/" then
		baseUrl ..= "/"
	end
	local _, var6 = baseUrl:find("://")
	local var7, var8 = baseUrl:find("%.", var6 + 1)
	
	return baseUrl, baseUrl:sub(var6 + 1, var7 - 1), baseUrl:sub(var8 + 1)
end

local function preventTableModification(_, _, _) --[[ line: 33 ]]
	error("Attempt to modify read-only table")
end

local function _(p0) --[[ line: 36 | named "createReadOnlyTable" ]]
	-- upvalues: preventTableModification (ref)
	return setmetatable({}, {
		__metatable = false,
		__index = p0,
		__newindex = preventTableModification
	})
end

local var3, var4, var5 = parseBaseUrlInformation()

return setmetatable({}, {
	__metatable = false,
	__index = {
		DOMAIN = var5,
		PREFIX = var4,
		BASE_URL = var3,
		BASE_URL_SECURE = string.gsub(var3, "http://", "https://"),
		API_URL = string.format("https://api.%s", var5),
		APIS_URL = string.format("https://apis.%s", var5),
		AUTH_URL = string.format("https://auth.%s", var5),
		ACCOUNT_SETTINGS_URL = string.format("https://accountsettings.%s", var5),
		AVATAR_URL = string.format("https://avatar.%s", var5),
		CATALOG_URL = string.format("https://catalog.%s", var5),
		CREATOR_HUB_URL = string.format("https://create.%s", var5),
		GAME_URL = string.format("https://games.%s", var5),
		GAME_ASSET_URL = string.format("https://assetgame.%s", var5),
		CHAT_URL = string.format("https://chat.%sv2", var5),
		FRIEND_URL = string.format("https://friends.%sv1", var5),
		PRESENCE_URL = string.format("https://presence.%sv1", var5),
		NOTIFICATION_URL = string.format("https://notifications.%s", var5),
		REALTIME_URL = string.format("https://realtime.%s", var5),
		WEB_URL = string.format("https://web.%s", var5),
		WWW_URL = string.format("https://www.%s", var5),
		ADS_URL = string.format("https://ads.%s", var5),
		FOLLOWINGS_URL = string.format("https://followings.%s", var5),
		ECONOMY_URL = string.format("https://economy.%s", var5),
		THUMBNAILS_URL = string.format("https://thumbnails.%s", var5),
		BADGES_URL = string.format("https://badges.%s", var5),
		ACCOUNT_SETTINGS = string.format("https://accountsettings.%s", var5),
		PREMIUM_FEATURES = string.format("https://premiumfeatures.%s", var5),
		LOCALE = string.format("https://locale.%s", var5),
		METRICS_URL = string.format("https://metrics.%sv1", var5),
		APIS_RCS_URL = string.format("https://apis.rcs.%s", var5),
		DISCUSSIONS_URL = string.format("https://discussions.%s", var5),
		BLOG_URL = "https://blog.roblox.com/",
		CORP_URL = "https://corp.roblox.com/",
		GAME_I18N_URL = string.format("https://gameinternationalization.%s", var5),
		getUserProfileUrl = function(p1, p2) --[[ line: 117 ]]
			return string.format("%susers/%s/profile", p1.BASE_URL, p2)
		end,
		getUserFriendsUrl = function(p3, p4) --[[ line: 121 ]]
			return string.format("%susers/%s/friends", p3.BASE_URL, p4)
		end,
		getUserInventoryUrl = function(p5, p6) --[[ line: 125 ]]
			return string.format("%susers/%s/inventory", p5.BASE_URL, p6)
		end,
		getPlaceDefaultThumbnailUrl = function(p7, p8, p9, p10) --[[ line: 129 ]]
			return string.format("%sThumbs/Asset.ashx?width=%d&height=%d&assetId=%s&ignorePlaceMediaItems=true", p7.BASE_URL, p9, p10, tostring(p8))
		end,
		isVanitySite = function(p11) --[[ line: 138 ]]
			return p11.PREFIX ~= "www"
		end,
		makeQueryString = function(_, p12) --[[ line: 143 ]]
			local t = {}
			
			for i, v in pairs(p12) do
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