local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpModule = require(Parent.Http)
local HttpClientModule = require(Parent.HttpClient)
local _ = require(script.Parent.AvatarInventoryStoreTypes)

local function parseCurrentAvatarResponse(p1)
	if typeof(p1) ~= "table" then
		error("AvatarInventory: the current avatar response isn't an object")
	end
	return {
		playerAvatarType = p1.playerAvatarType or "R15",
		bodyColor3s = p1.bodyColor3s or {},
		scales = p1.scales or {},
		assets = p1.assets or {},
		emotes = p1.emotes or {}
	}
end

return function(p1)
	-- upvalues: HttpModule (copy), HttpClientModule (copy), parseCurrentAvatarResponse (copy)
	local P1 = p1 or {}
	
	return HttpClientModule.asPromise((HttpClientModule.fetch({
		method = "GET",
		analyticsKey = "avatar.avatar.get",
		network = P1.network,
		url = `{string.gsub(P1.baseUrl or HttpModule.Url.AVATAR_URL, "/$", "")}/v2/avatar/avatar`,
		decode = parseCurrentAvatarResponse
	})))
end