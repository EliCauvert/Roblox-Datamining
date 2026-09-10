local _ = require(script.Parent.Types)
local _ = require(script.Parent.Parent.UniversalMessage.Types)

return {
	presetMessageToContent = function(value)
		return if value.presetId == "" then nil else {
			kind = "preset",
			presetId = value.presetId,
			text = value.value
		}
	end,
	presetMessageToExpressionItem = function(value)
		local var1 = if value.presetId == "" then nil else {
			kind = "preset",
			presetId = value.presetId,
			text = value.value
		}
		
		return if var1 == nil then nil else { content = var1 }
	end
}