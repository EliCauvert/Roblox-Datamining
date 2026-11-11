local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local FFlagAXMISEnableMultiShoppingUnifiedEvents = require(Parent.AvatarExperienceFlags).FFlagAXMISEnableMultiShoppingUnifiedEvents
local MarketplaceName: string = `{require(Parent.Http).Url.APIS_URL}cloud/v2/avatar-marketplace-orders`

return function(p1)
	-- upvalues: FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), HttpService (copy), MarketplaceName (copy)
	local LookIds = {}
	
	if FFlagAXMISEnableMultiShoppingUnifiedEvents then
		if p1.lookId then
			table.insert(LookIds, p1.lookId)
		end
		if p1.makeupLookId then
			table.insert(LookIds, p1.makeupLookId)
		end
	end
	return p1.networkImpl(`{MarketplaceName}?idempotencyKey.key={HttpService:GenerateGUID(false)}`, "POST", {
		postBody = HttpService:JSONEncode({
			purchasingUser = `users/{p1.userId}`,
			context = {
				productSurface = "MARKETPLACE_UA",
				lookId = p1.lookId,
				lookContext = if FFlagAXMISEnableMultiShoppingUnifiedEvents then { lookIds = LookIds } else nil
			},
			fulfillmentGroups = { { strategy = "BEST_EFFORT", lineItems = p1.lineItems } }
		})
	})
end