local Parent = script.Parent.Parent.Parent.Parent
local EnumerateModule = require(Parent.Parent.enumerate)

return require(Parent.Utility.strict)({
	ItemIconType = EnumerateModule("ItemIconType", { "AnimationBundle", "Bundle", "DynamicHead" }),
	Restriction = EnumerateModule("Restriction", { "Limited", "LimitedUnique", "Collectible" }),
	StatusStyle = EnumerateModule("StatusStyle", { "Alert", "Info", "PendingIcon", "AlertIcon" })
}, script.Name)