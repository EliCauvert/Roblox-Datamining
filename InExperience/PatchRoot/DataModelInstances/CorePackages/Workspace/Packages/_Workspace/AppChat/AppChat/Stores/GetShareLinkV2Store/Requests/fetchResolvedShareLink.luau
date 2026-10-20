local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local HttpClientModule = require(Parent.HttpClient)
local _ = require(Parent.ShareLinksNetworking)
local FFlagAppChatPlusReferralAssetCardModule = require(AppChat.Flags.FFlagAppChatPlusReferralAssetCard)
local Text = require(Parent.Http).Url.APIS_URL .. "deeplinks/v2/resolve"

local function decodeResolvedShareLink(p1)
	-- upvalues: FFlagAppChatPlusReferralAssetCardModule (copy)
	if type(p1) ~= "table" or type(p1.linkType) ~= "string" or type(p1.targetId) ~= "string" or type(p1.status) ~= "string" then
		error("Malformed deeplinks/v2/resolve response")
	end
	if FFlagAppChatPlusReferralAssetCardModule then
		if p1.customData ~= nil and type(p1.customData) ~= "string" then
			error("Malformed deeplinks/v2/resolve response")
		end
		p1.customData = p1.customData or ""
		
		return p1
	else
		if type(p1.customData) ~= "string" then
			error("Malformed deeplinks/v2/resolve response")
		end
		return p1
	end
end

return function(LinkId, Network)
	-- upvalues: HttpClientModule (copy), Text (copy), decodeResolvedShareLink (copy)
	return HttpClientModule.fetch({
		method = "POST",
		analyticsKey = "app-chat.resolve-share-link-v2",
		url = Text,
		body = { linkId = LinkId },
		network = Network,
		decode = decodeResolvedShareLink
	})
end