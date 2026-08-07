local parent = script.Parent.Parent.Parent.Parent
local enumerateModule = require(parent.Parent.enumerate)

return require(parent.Utility.strict)({
	ItemIconType = enumerateModule("ItemIconType", { "AnimationBundle", "Bundle", "DynamicHead" }),
	Restriction = enumerateModule("Restriction", { "Limited", "LimitedUnique", "Collectible" }),
	StatusStyle = enumerateModule("StatusStyle", { "Alert", "Info", "PendingIcon", "AlertIcon" })
}, script.Name)