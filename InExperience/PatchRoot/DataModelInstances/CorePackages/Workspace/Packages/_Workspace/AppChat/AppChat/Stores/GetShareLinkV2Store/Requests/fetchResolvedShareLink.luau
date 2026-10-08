local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local httpModule = require(parent.Http)
local httpClientModule = require(parent.HttpClient)
local _ = require(parent.ShareLinksNetworking)
local fFlagAppChatPlusReferralAssetCardModule = require(appChat.Flags.FFlagAppChatPlusReferralAssetCard)
local text = httpModule.Url.APIS_URL .. "deeplinks/v2/resolve"

local function decodeResolvedShareLink(p1)
	-- upvalues: fFlagAppChatPlusReferralAssetCardModule (ref)
	if type(p1) ~= "table" or type(p1.linkType) ~= "string" or (type(p1.targetId) ~= "string" or type(p1.status) ~= "string") then
		error("Malformed deeplinks/v2/resolve response")
	end
	if fFlagAppChatPlusReferralAssetCardModule then
		if p1.customData ~= nil and type(p1.customData) ~= "string" then
			error("Malformed deeplinks/v2/resolve response")
		end
		p1.customData = p1.customData or ""
		
		return p1
	elseif type(p1.customData) ~= "string" then
		error("Malformed deeplinks/v2/resolve response")
	end
	return p1
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