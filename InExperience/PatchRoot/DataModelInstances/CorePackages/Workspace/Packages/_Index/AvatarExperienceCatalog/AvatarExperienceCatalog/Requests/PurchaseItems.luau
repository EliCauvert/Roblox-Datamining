local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local fFlagAXMISEnableMultiShoppingUnifiedEvents = require(parent.AvatarExperienceFlags).FFlagAXMISEnableMultiShoppingUnifiedEvents
local apis_url = `{require(parent.Http).Url.APIS_URL}cloud/v2/avatar-marketplace-orders`

return function(p1)
	-- upvalues: fFlagAXMISEnableMultiShoppingUnifiedEvents (ref), httpService (ref), apis_url (ref)
	local t = {}
	
	if fFlagAXMISEnableMultiShoppingUnifiedEvents then
		if p1.lookId then
			table.insert(t, p1.lookId)
		end
		if p1.makeupLookId then
			table.insert(t, p1.makeupLookId)
		end
	end
	return p1.networkImpl(`{apis_url}?idempotencyKey.key={httpService:GenerateGUID(false)}`, "POST", {
		postBody = httpService:JSONEncode({
			purchasingUser = `users/{p1.userId}`,
			context = {
				productSurface = "MARKETPLACE_UA",
				lookId = p1.lookId,
				lookContext = if fFlagAXMISEnableMultiShoppingUnifiedEvents then { lookIds = t } else nil
			},
			fulfillmentGroups = { { strategy = "BEST_EFFORT", lineItems = p1.lineItems } }
		})
	})
end