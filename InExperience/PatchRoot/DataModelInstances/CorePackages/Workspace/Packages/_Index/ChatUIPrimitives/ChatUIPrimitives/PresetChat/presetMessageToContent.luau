local engineFeaturePresetChatUseExpressionTrayOptionsEndpoint = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.SharedFlags).EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint
local _ = require(script.Parent.Types)
local _ = require(script.Parent.Parent.UniversalMessage.Types)

return {
	presetMessageToContent = function(value)
		-- upvalues: engineFeaturePresetChatUseExpressionTrayOptionsEndpoint (ref)
		return if value.presetId == "" then nil else {
			kind = "preset",
			presetId = value.presetId,
			text = if engineFeaturePresetChatUseExpressionTrayOptionsEndpoint then value.text else value.value
		}
	end,
	presetMessageToExpressionItem = function(value)
		-- upvalues: engineFeaturePresetChatUseExpressionTrayOptionsEndpoint (ref)
		local var1 = if value.presetId == "" then nil else {
			kind = "preset",
			presetId = value.presetId,
			text = if engineFeaturePresetChatUseExpressionTrayOptionsEndpoint then value.text else value.value
		}
		
		return if var1 == nil then nil else { content = var1 }
	end
}