local expChat = script:FindFirstAncestor("ExpChat")
local engineFeaturePresetChatUseExpressionTrayOptionsEndpoint = require(expChat.Parent.SharedFlags).EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint
local _ = require(expChat.Stores.GetPresetChatStore.createPresetChatStore)

return function(value)
	-- upvalues: engineFeaturePresetChatUseExpressionTrayOptionsEndpoint (ref)
	if not engineFeaturePresetChatUseExpressionTrayOptionsEndpoint then
		return false
	end
	for i, v in value do
		for i_1, v_1 in v.categories do
			for i_2, v_2 in v_1.contents or {} do
				if v_2.kind == "Emoji" then
					return true
				end
			end
		end
	end
	return false
end