local Replaced = string.gsub(string.gsub(string.gsub(game:GetService("ContentProvider").BaseUrl, ".*://", ""), "/.*", ""), "^www%.", "")
local UrlBaseModule = {
	new = function(Text, Version): string
		-- upvalues: Replaced (ref)
		assert(type(Text) == "string", "UrlBase.new: `name` should be a string")
		
		if Version == nil then
			Version = {}
		end
		if type(Version) == "number" or type(Version) == "string" then
			Version = { version = Version }
		end
		assert(type(Version) == "table", "UrlBase.new: `params` should be a table")
		local Proto = Version.proto
		local Version1 = Version.version
		local Path = Version.path
		
		if Proto == nil then
			Proto = if Version.secure == false then "http" else "https"
		end
		local Text1: string = Proto
		
		if #Proto > 0 then
			Text1 ..= "://"
		end
		local Text2 = Text1 .. Text
		
		if #Text > 0 then
			Text2 ..= "."
		end
		local Text3 = Text2 .. Replaced
		
		if Version1 ~= nil and #tostring(Version1) > 0 then
			Text3 ..= "/v" .. tostring(Version1)
		end
		if Path ~= nil and #Path > 0 then
			Text3 ..= "/" .. Path
		end
		return Text3
	end
}
local IsQqCom = string.sub(Replaced, -6) == "qq.com"
UrlBaseModule.API = UrlBaseModule.new("api")
UrlBaseModule.APIS = UrlBaseModule.new("apis")
UrlBaseModule.APIS_RBXCDN = "https://apis.rbxcdn.com"
UrlBaseModule.AUTH = UrlBaseModule.new("auth")
UrlBaseModule.CHAT = UrlBaseModule.new("chat")
UrlBaseModule.CREATE = UrlBaseModule.new("create")
UrlBaseModule.FRIENDS = UrlBaseModule.new("friends", 1)
UrlBaseModule.ASSETGAME = UrlBaseModule.new("assetgame")
UrlBaseModule.GAMES = UrlBaseModule.new("games", 1)
UrlBaseModule.NOTIFICATION = UrlBaseModule.new("notification", 2)
UrlBaseModule.NOTIFICATIONS = UrlBaseModule.new("notifications", 2)
UrlBaseModule.PRESENCE = UrlBaseModule.new("presence", 1)
UrlBaseModule.REALTIME = UrlBaseModule.new("realtime")
UrlBaseModule.WEB = UrlBaseModule.new("web")
UrlBaseModule.WWW = UrlBaseModule.new("www")
UrlBaseModule.ADS = UrlBaseModule.new("ads", 1)
UrlBaseModule.ADCONFIGURATION = UrlBaseModule.new("adconfiguration", 2)
UrlBaseModule.FOLLOWINGS = UrlBaseModule.new("followings", 1)
UrlBaseModule.PREMIUM = UrlBaseModule.new("premiumfeatures", 1)
UrlBaseModule.BLOG = "https://blog.roblox.com"
UrlBaseModule.CORP = if IsQqCom then "https://roblox.qq.com" else "https://corp.roblox.com"
UrlBaseModule.USERMODERATION = UrlBaseModule.new("usermoderation")
UrlBaseModule.ACCOUNTINFORMATION = UrlBaseModule.new("accountinformation", 1)
UrlBaseModule.ACCOUNTSETTINGS = UrlBaseModule.new("accountsettings")
UrlBaseModule.BADGES = UrlBaseModule.new("badges", 1)
UrlBaseModule.INVENTORY = UrlBaseModule.new("inventory", 1)
UrlBaseModule.CATALOG = UrlBaseModule.new("catalog", 1)
UrlBaseModule.AVATAR = UrlBaseModule.new("avatar", 1)
UrlBaseModule.MOBILENAV = "roblox://navigation"
UrlBaseModule.APPSFLYER = "https://ro.blox.com"

return UrlBaseModule