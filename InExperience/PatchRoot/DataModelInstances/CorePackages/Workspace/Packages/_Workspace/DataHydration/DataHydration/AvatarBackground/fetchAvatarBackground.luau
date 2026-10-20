local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpModule = require(Parent.Http)
local HttpClientModule = require(Parent.HttpClient)
local _ = require(script.Parent.AvatarBackgroundStoreTypes)

local function parseAvatarBackground(p1)
	local AvatarConfigurations = if typeof(p1) == "table" then p1.avatarConfigurations else nil
	local Background = if typeof(AvatarConfigurations) == "table" then AvatarConfigurations.background else nil
	local BackgroundAsset = if typeof(Background) == "table" then Background.backgroundAsset else nil
	local Number = if typeof(BackgroundAsset) == "table" then tonumber(BackgroundAsset.id) else nil
	
	return { assetId = if Number and Number > 0 then Number else nil }
end

return function(p1, p2)
	-- upvalues: HttpModule (copy), HttpClientModule (copy), parseAvatarBackground (copy)
	local P2 = p2 or {}
	
	return HttpClientModule.asPromise((HttpClientModule.fetch({
		method = "GET",
		analyticsKey = "avatar.avatar-background.get",
		network = P2.network,
		url = `{string.gsub(P2.baseUrl or HttpModule.Url.AVATAR_URL, "/$", "")}/v4/avatar/users/{p1}?selectionTypes=Background`,
		decode = parseAvatarBackground
	})))
end