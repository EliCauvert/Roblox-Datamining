local ExperimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local ExpChatGlobalTabDefaultExperimentLayer = game:DefineFastString("ExpChatGlobalTabDefaultExperimentLayer", "ExperienceChat.TabOrder")
local ExpChatGlobalTabDefaultVariant = game:DefineFastString("ExpChatGlobalTabDefaultVariant", "globalTabDefault")
local ExpChatGlobalTabBubbleChatVariant = game:DefineFastString("ExpChatGlobalTabBubbleChatVariant", "globalTabBubbleChat")
local ExpChatGlobalTabMessagePrefixVariant = game:DefineFastString("ExpChatGlobalTabMessagePrefixVariant", "globalTabMessagePrefix")
local ExpChatGlobalTabShortWelcomeVariant = game:DefineFastString("ExpChatGlobalTabShortWelcomeVariant", "globalTabShortWelcomeMessage")
local ForceEnableExpChatGlobalTabDefault = game:DefineFastFlag("ForceEnableExpChatGlobalTabDefault", false)
local ForceEnableExpChatGlobalTabBubbleChat = game:DefineFastFlag("ForceEnableExpChatGlobalTabBubbleChat", false)
local ForceEnableExpChatGlobalTabMessagePrefix = game:DefineFastFlag("ForceEnableExpChatGlobalTabMessagePrefix", false)
local ForceEnableExpChatGlobalTabShortWelcome = game:DefineFastFlag("ForceEnableExpChatGlobalTabShortWelcome", false)

local function _(p1) --[[ Line: 43 | Named "getIsUserInTreatment" ]]
	-- upvalues: ExperimentCacheManager (copy), ExpChatGlobalTabDefaultExperimentLayer (copy)
	local LayerVariables = ExperimentCacheManager.default:getLayerVariables(ExpChatGlobalTabDefaultExperimentLayer)
	
	return if LayerVariables and LayerVariables[p1] ~= nil then LayerVariables[p1] else false
end

return {
	getIsGlobalTabDefault = function() --[[ Line: 54 ]]
		-- upvalues: ForceEnableExpChatGlobalTabDefault (copy), ExpChatGlobalTabDefaultVariant (copy), ExperimentCacheManager (copy), ExpChatGlobalTabDefaultExperimentLayer (copy)
		local Flag: boolean = ForceEnableExpChatGlobalTabDefault
		
		if not Flag then
			local LayerVariables = ExperimentCacheManager.default:getLayerVariables(ExpChatGlobalTabDefaultExperimentLayer)
			
			if LayerVariables and LayerVariables[ExpChatGlobalTabDefaultVariant] ~= nil then
				return LayerVariables[ExpChatGlobalTabDefaultVariant]
			end
			Flag = false
		end
		return Flag
	end,
	getIsGlobalBubbleChatEnabled = function() --[[ Line: 60 ]]
		-- upvalues: ForceEnableExpChatGlobalTabBubbleChat (copy), ExpChatGlobalTabBubbleChatVariant (copy), ExperimentCacheManager (copy), ExpChatGlobalTabDefaultExperimentLayer (copy)
		local Flag: boolean = ForceEnableExpChatGlobalTabBubbleChat
		
		if not Flag then
			local LayerVariables = ExperimentCacheManager.default:getLayerVariables(ExpChatGlobalTabDefaultExperimentLayer)
			
			if LayerVariables and LayerVariables[ExpChatGlobalTabBubbleChatVariant] ~= nil then
				return LayerVariables[ExpChatGlobalTabBubbleChatVariant]
			end
			Flag = false
		end
		return Flag
	end,
	getIsGlobalMessagePrefixEnabled = function() --[[ Line: 66 ]]
		-- upvalues: ForceEnableExpChatGlobalTabMessagePrefix (copy), ExpChatGlobalTabMessagePrefixVariant (copy), ExperimentCacheManager (copy), ExpChatGlobalTabDefaultExperimentLayer (copy)
		local Flag: boolean = ForceEnableExpChatGlobalTabMessagePrefix
		
		if not Flag then
			local LayerVariables = ExperimentCacheManager.default:getLayerVariables(ExpChatGlobalTabDefaultExperimentLayer)
			
			if LayerVariables and LayerVariables[ExpChatGlobalTabMessagePrefixVariant] ~= nil then
				return LayerVariables[ExpChatGlobalTabMessagePrefixVariant]
			end
			Flag = false
		end
		return Flag
	end,
	getGlobalWelcomeMessageKey = function(): string --[[ Line: 73 ]]
		-- upvalues: ForceEnableExpChatGlobalTabShortWelcome (copy), ExpChatGlobalTabShortWelcomeVariant (copy), ExperimentCacheManager (copy), ExpChatGlobalTabDefaultExperimentLayer (copy)
		local ForceEnableExpChatGlobalTabShortWelcome1 = ForceEnableExpChatGlobalTabShortWelcome
		
		if not ForceEnableExpChatGlobalTabShortWelcome1 then
			local LayerVariables = ExperimentCacheManager.default:getLayerVariables(ExpChatGlobalTabDefaultExperimentLayer)
			ForceEnableExpChatGlobalTabShortWelcome1 = if LayerVariables and LayerVariables[ExpChatGlobalTabShortWelcomeVariant] ~= nil then LayerVariables[ExpChatGlobalTabShortWelcomeVariant] else false
		end
		return if ForceEnableExpChatGlobalTabShortWelcome1 then "CoreScripts.TextChat.ChatWindow.ChatEnabled.Global3" else "CoreScripts.TextChat.ChatWindow.ChatEnabled.Global2"
	end,
	logExposure = function() --[[ Line: 82 ]]
		-- upvalues: ExperimentCacheManager (copy), ExpChatGlobalTabDefaultExperimentLayer (copy)
		if ExperimentCacheManager.default:getLayerVariables(ExpChatGlobalTabDefaultExperimentLayer) ~= nil then
			ExperimentCacheManager.default:logLayerExposure(ExpChatGlobalTabDefaultExperimentLayer)
		end
	end
}