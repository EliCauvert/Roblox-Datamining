-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:00 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent.Parent
local enumerateModule = require(parent.Parent.enumerate)

return require(parent.Utility.strict)({
	ItemIconType = enumerateModule("ItemIconType", { "AnimationBundle", "Bundle", "DynamicHead" }),
	Restriction = enumerateModule("Restriction", { "Limited", "LimitedUnique", "Collectible" }),
	StatusStyle = enumerateModule("StatusStyle", { "Alert", "Info", "PendingIcon", "AlertIcon" })
}, script.Name)