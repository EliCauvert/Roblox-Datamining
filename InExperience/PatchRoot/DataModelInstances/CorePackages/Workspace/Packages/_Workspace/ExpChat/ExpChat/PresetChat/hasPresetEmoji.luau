local ExpChat = script:FindFirstAncestor("ExpChat")
local EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint = require(ExpChat.Parent.SharedFlags).EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint
local _ = require(ExpChat.Stores.GetPresetChatStore.createPresetChatStore)

return function(List): boolean
	-- upvalues: EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint (copy)
	if not EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint then
		return false
	end
	for _, value in List do
		for _, category in value.categories do
			local Contents = category.contents or {}
			for _, content in Contents do
				if content.kind == "Emoji" then
					return true
				end
			end
		end
	end
	return false
end