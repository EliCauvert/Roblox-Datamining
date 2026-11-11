local ArgCheckModule = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck)
local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Constants)

return function(p1, p2, ItemID, ItemSubType, PriceInRobux, p3, p4)
	-- upvalues: ArgCheckModule (copy), ConstantsModule (copy)
	ArgCheckModule.isType(p2, "string", "purchaseBundle event expects eventContext")
	ArgCheckModule.isType(ItemID, "string", "purchaseBundle event expects itemId")
	ArgCheckModule.isType(ItemSubType, "string", "purchaseBundle event expects itemSubType")
	ArgCheckModule.isTypeOrNil(PriceInRobux, "number", "purchaseBundle event expects priceInRobux")
	ArgCheckModule.isTypeOrNil(p3, "boolean", "purchaseAsset event expects fromProfile")
	ArgCheckModule.isTypeOrNil(p4, "boolean", "purchaseAsset event expects fromContentFeed")
	p1:sendTelemetryEvent(p2, p2, {
		feature = if p3 then ConstantsModule.ProfileAnalyticsTag elseif p4 then ConstantsModule.ContentFeedAnalyticsTag else ConstantsModule.AnalyticsTag,
		itemID = ItemID,
		itemSubType = ItemSubType,
		priceInRobux = PriceInRobux
	})
end