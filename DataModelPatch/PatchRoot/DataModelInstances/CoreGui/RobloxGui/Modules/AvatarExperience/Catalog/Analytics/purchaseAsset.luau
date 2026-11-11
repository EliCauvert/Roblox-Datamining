local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local ArgCheckModule = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck)
local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Constants)

return function(p1, p2, ItemID, ItemSubType, PriceInRobux, p3, p4, p5)
	-- upvalues: ArgCheckModule (copy), ConstantsModule (copy), RbxAnalyticsService (copy)
	ArgCheckModule.isType(p2, "string", "purchaseAsset event expects eventContext")
	ArgCheckModule.isType(ItemID, "string", "purchaseAsset event expects itemId")
	ArgCheckModule.isType(ItemSubType, "string", "purchaseAsset event expects itemSubType")
	ArgCheckModule.isTypeOrNil(PriceInRobux, "number", "purchaseAsset event expects priceInRobux")
	ArgCheckModule.isTypeOrNil(p3, "boolean", "purchaseAsset event expects fromProfile")
	ArgCheckModule.isTypeOrNil(p5, "boolean", "purchaseAsset event expects fromContentFeed")
	local ProfileAnalyticsTag = if p3 then ConstantsModule.ProfileAnalyticsTag elseif p5 then ConstantsModule.ContentFeedAnalyticsTag else ConstantsModule.AnalyticsTag
	p1:sendTelemetryEvent(p2, p2, {
		feature = ProfileAnalyticsTag,
		itemID = ItemID,
		itemSubType = ItemSubType,
		priceInRobux = PriceInRobux
	})
	
	if p4 then
		p1:sendTelemetryEvent(p2, "purchaseAssetHasAccessoryAdjustment", {
			feature = ProfileAnalyticsTag,
			itemID = ItemID,
			itemSubType = ItemSubType,
			priceInRobux = PriceInRobux,
			refineSessionId = RbxAnalyticsService:GetSessionId()
		})
	end
end