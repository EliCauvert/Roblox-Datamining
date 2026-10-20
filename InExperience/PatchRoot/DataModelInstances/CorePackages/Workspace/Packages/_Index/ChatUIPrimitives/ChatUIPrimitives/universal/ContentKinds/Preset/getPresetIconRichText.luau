local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local FormatInlineIconModule = require(ChatUIPrimitives.Utils.formatInlineIcon)
local IconName = require(ChatUIPrimitives.Parent.Foundation).Enums.IconName

local function _(p1: number): number
	return (math.max(0, math.ceil(p1 / 2) * 2))
end

local _ = function(p1: number): number
	return (math.max(0, math.ceil(p1 * 3 / 4 / 2) * 2))
end

return function(p1: number)
	-- upvalues: FormatInlineIconModule (copy), IconName (copy)
	return FormatInlineIconModule(IconName.LightningBolt, {
		weight = "700",
		size = tostring((math.max(0, math.ceil(p1 * 3 / 4 / 2) * 2)))
	})
end