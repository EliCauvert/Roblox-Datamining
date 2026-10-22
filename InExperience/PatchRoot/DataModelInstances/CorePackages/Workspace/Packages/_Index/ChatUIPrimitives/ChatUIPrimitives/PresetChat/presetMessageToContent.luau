local EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.SharedFlags).EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint
local _ = require(script.Parent.Types)
local _ = require(script.Parent.Parent.UniversalMessage.Types)

return {
	presetMessageToContent = function(p1)
		-- upvalues: EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint (copy)
		return if p1.presetId == "" then nil else {
			kind = "preset",
			presetId = p1.presetId,
			text = if EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint then p1.text else p1.value,
			presetVersion = p1.presetVersion
		}
	end,
	presetMessageToExpressionItem = function(p1)
		-- upvalues: EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint (copy)
		local Config = if p1.presetId == "" then nil else {
			kind = "preset",
			presetId = p1.presetId,
			text = if EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint then p1.text else p1.value,
			presetVersion = p1.presetVersion
		}
		
		return if Config == nil then nil else { content = Config }
	end
}