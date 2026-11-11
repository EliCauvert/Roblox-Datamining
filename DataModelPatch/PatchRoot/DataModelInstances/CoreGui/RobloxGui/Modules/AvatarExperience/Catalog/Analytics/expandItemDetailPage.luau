local ArgCheckModule = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck)
local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Constants)

return function(p1, p2, ItemID, ItemType)
	-- upvalues: ArgCheckModule (copy), ConstantsModule (copy)
	ArgCheckModule.isType(ItemID, "string", "expandItemDetailPage event expects itemId")
	ArgCheckModule.isType(ItemType, "string", "expandItemDetailPage event expects itemType")
	p1:sendTelemetryEvent(p2, "swipeUpItemDetailPage", {
		feature = ConstantsModule.AnalyticsTag,
		itemID = ItemID,
		itemType = ItemType
	})
end