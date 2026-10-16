local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local FormatInlineIconModule = require(ChatUIPrimitives.Utils.formatInlineIcon)
local IconName = require(ChatUIPrimitives.Parent.Foundation).Enums.IconName

local function _(p1: number): number --[[ Line: 13 | Named "ceilToEven" ]]
	return (math.max(0, math.ceil(p1 / 2) * 2))
end

local _ = function(p1: number): number --[[ Line: 18 | Named "getPresetIconSize" ]]
	return (math.max(0, math.ceil(p1 * 3 / 4 / 2) * 2))
end

return function(p1: number) --[[ Line: 22 | Named "getPresetIconRichText" ]]
	-- upvalues: FormatInlineIconModule (copy), IconName (copy)
	return FormatInlineIconModule(IconName.LightningBolt, {
		weight = "700",
		size = tostring((math.max(0, math.ceil(p1 * 3 / 4 / 2) * 2)))
	})
end