local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local fFlagAXMISEnableMultiShoppingUnifiedEvents = require(parent.AvatarExperienceFlags).FFlagAXMISEnableMultiShoppingUnifiedEvents
local apis_url = `{require(parent.Http).Url.APIS_URL}cloud/v2/avatar-marketplace-orders`

return function(p0) --[[ line: 31 | named "purchaseItems" ]]
	-- upvalues: fFlagAXMISEnableMultiShoppingUnifiedEvents (ref), httpService (ref), apis_url (ref)
	local t = {}
	
	if fFlagAXMISEnableMultiShoppingUnifiedEvents then
		if p0.lookId then
			table.insert(t, p0.lookId)
		end
		if p0.makeupLookId then
			table.insert(t, p0.makeupLookId)
		end
	end
	return p0.networkImpl(`{apis_url}?idempotencyKey.key={httpService:GenerateGUID(false)}`, "POST", {
		postBody = httpService:JSONEncode({
			purchasingUser = `users/{p0.userId}`,
			context = {
				productSurface = "MARKETPLACE_UA",
				lookId = p0.lookId,
				lookContext = if fFlagAXMISEnableMultiShoppingUnifiedEvents then { lookIds = t } else nil
			},
			fulfillmentGroups = { { strategy = "BEST_EFFORT", lineItems = p0.lineItems } }
		})
	})
end