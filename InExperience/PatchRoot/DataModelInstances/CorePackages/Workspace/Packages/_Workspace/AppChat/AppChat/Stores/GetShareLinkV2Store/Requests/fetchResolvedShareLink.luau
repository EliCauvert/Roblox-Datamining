local parent = script:FindFirstAncestor("AppChat").Parent
local httpModule = require(parent.Http)
local httpClientModule = require(parent.HttpClient)
local _ = require(parent.ShareLinksNetworking)
local text = httpModule.Url.APIS_URL .. "deeplinks/v2/resolve"

local function decodeResolvedShareLink(p0)
	if type(p0) ~= "table" or type(p0.linkType) ~= "string" or (type(p0.targetId) ~= "string" or type(p0.customData) ~= "string") or type(p0.status) ~= "string" then
		error("Malformed deeplinks/v2/resolve response")
	end
	return p0
end

return function(p1, p2)
	-- upvalues: httpClientModule (ref), text (ref), decodeResolvedShareLink (ref)
	return httpClientModule.fetch({
		method = "POST",
		analyticsKey = "app-chat.resolve-share-link-v2",
		url = text,
		body = { linkId = p1 },
		network = p2,
		decode = decodeResolvedShareLink
	})
end