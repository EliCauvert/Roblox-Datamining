local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local formatInlineIconModule = require(chatUIPrimitives.Utils.formatInlineIcon)
local iconName = require(chatUIPrimitives.Parent.Foundation).Enums.IconName

local function _(value)
	return math.max(0, math.ceil(value / 2) * 2)
end

local _ = function(value)
	return math.max(0, math.ceil(value * 3 / 4 / 2) * 2)
end

return function(value)
	-- upvalues: formatInlineIconModule (ref), iconName (ref)
	return formatInlineIconModule(iconName.LightningBolt, {
		weight = "700",
		size = tostring(math.max(0, math.ceil(value * 3 / 4 / 2) * 2))
	})
end