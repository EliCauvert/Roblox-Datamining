local replaced = string.gsub(string.gsub(string.gsub(game:GetService("ContentProvider").BaseUrl, ".*://", ""), "/.*", ""), "^www%.", "")
local t = {
	new = function(p0, p1)
		-- upvalues: replaced (write)
		assert(type(p0) == "string", "UrlBase.new: `name` should be a string")
		
		if p1 == nil then
			p1 = {}
		end
		if type(p1) == "number" or type(p1) == "string" then
			p1 = { version = p1 }
		end
		assert(type(p1) == "table", "UrlBase.new: `params` should be a table")
		local proto = p1.proto
		local version = p1.version
		local path = p1.path
		
		if proto == nil then
			proto = if p1.secure == false then "http" else "https"
		end
		local var3 = proto
		
		if #proto > 0 then
			var3 ..= "://"
		end
		var3 ..= p0
		
		if #p0 > 0 then
			var3 ..= "."
		end
		var3 ..= replaced
		
		if version ~= nil and #tostring(version) > 0 then
			var3 ..= "/v" .. tostring(version)
		end
		if path ~= nil and #path > 0 then
			var3 ..= "/" .. path
		end
		return var3
	end
}
local var2 = string.sub(replaced, -6) == "qq.com"
t.API = t.new("api")
t.APIS = t.new("apis")
t.APIS_RBXCDN = "https://apis.rbxcdn.com"
t.AUTH = t.new("auth")
t.CHAT = t.new("chat")
t.CREATE = t.new("create")
t.FRIENDS = t.new("friends", 1)
t.ASSETGAME = t.new("assetgame")
t.GAMES = t.new("games", 1)
t.NOTIFICATION = t.new("notification", 2)
t.NOTIFICATIONS = t.new("notifications", 2)
t.PRESENCE = t.new("presence", 1)
t.REALTIME = t.new("realtime")
t.WEB = t.new("web")
t.WWW = t.new("www")
t.ADS = t.new("ads", 1)
t.ADCONFIGURATION = t.new("adconfiguration", 2)
t.FOLLOWINGS = t.new("followings", 1)
t.PREMIUM = t.new("premiumfeatures", 1)
t.BLOG = "https://blog.roblox.com"
t.CORP = if var2 then "https://roblox.qq.com" else "https://corp.roblox.com"
t.USERMODERATION = t.new("usermoderation")
t.ACCOUNTINFORMATION = t.new("accountinformation", 1)
t.ACCOUNTSETTINGS = t.new("accountsettings")
t.BADGES = t.new("badges", 1)
t.INVENTORY = t.new("inventory", 1)
t.CATALOG = t.new("catalog", 1)
t.AVATAR = t.new("avatar", 1)
t.MOBILENAV = "roblox://navigation"
t.APPSFLYER = "https://ro.blox.com"

return t