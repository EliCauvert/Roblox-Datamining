local experimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local expChatGlobalTabDefaultExperimentLayer = game:DefineFastString("ExpChatGlobalTabDefaultExperimentLayer", "ExperienceChat.TabOrder")
local expChatGlobalTabDefaultVariant = game:DefineFastString("ExpChatGlobalTabDefaultVariant", "globalTabDefault")
local expChatGlobalTabBubbleChatVariant = game:DefineFastString("ExpChatGlobalTabBubbleChatVariant", "globalTabBubbleChat")
local expChatGlobalTabMessagePrefixVariant = game:DefineFastString("ExpChatGlobalTabMessagePrefixVariant", "globalTabMessagePrefix")
local expChatGlobalTabShortWelcomeVariant = game:DefineFastString("ExpChatGlobalTabShortWelcomeVariant", "globalTabShortWelcomeMessage")
local forceEnableExpChatGlobalTabDefault = game:DefineFastFlag("ForceEnableExpChatGlobalTabDefault", false)
local forceEnableExpChatGlobalTabBubbleChat = game:DefineFastFlag("ForceEnableExpChatGlobalTabBubbleChat", false)
local forceEnableExpChatGlobalTabMessagePrefix = game:DefineFastFlag("ForceEnableExpChatGlobalTabMessagePrefix", false)
local forceEnableExpChatGlobalTabShortWelcome = game:DefineFastFlag("ForceEnableExpChatGlobalTabShortWelcome", false)

local function _(p1)
	-- upvalues: experimentCacheManager (ref), expChatGlobalTabDefaultExperimentLayer (ref)
	local var1 = experimentCacheManager.default:getLayerVariables(expChatGlobalTabDefaultExperimentLayer)
	
	return if var1 and var1[p1] ~= nil then var1[p1] else false
end

return {
	getIsGlobalTabDefault = function()
		-- upvalues: forceEnableExpChatGlobalTabDefault (ref), expChatGlobalTabDefaultVariant (ref), experimentCacheManager (ref), expChatGlobalTabDefaultExperimentLayer (ref)
		local var1 = forceEnableExpChatGlobalTabDefault
		
		if not var1 then
			local var2 = expChatGlobalTabDefaultVariant
			local var3 = experimentCacheManager.default:getLayerVariables(expChatGlobalTabDefaultExperimentLayer)
			
			if var3 and var3[var2] ~= nil then
				return var3[var2]
			end
			var1 = false
		end
		return var1
	end,
	getIsGlobalBubbleChatEnabled = function()
		-- upvalues: forceEnableExpChatGlobalTabBubbleChat (ref), expChatGlobalTabBubbleChatVariant (ref), experimentCacheManager (ref), expChatGlobalTabDefaultExperimentLayer (ref)
		local var1 = forceEnableExpChatGlobalTabBubbleChat
		
		if not var1 then
			local var2 = expChatGlobalTabBubbleChatVariant
			local var3 = experimentCacheManager.default:getLayerVariables(expChatGlobalTabDefaultExperimentLayer)
			
			if var3 and var3[var2] ~= nil then
				return var3[var2]
			end
			var1 = false
		end
		return var1
	end,
	getIsGlobalMessagePrefixEnabled = function()
		-- upvalues: forceEnableExpChatGlobalTabMessagePrefix (ref), expChatGlobalTabMessagePrefixVariant (ref), experimentCacheManager (ref), expChatGlobalTabDefaultExperimentLayer (ref)
		local var1 = forceEnableExpChatGlobalTabMessagePrefix
		
		if not var1 then
			local var2 = expChatGlobalTabMessagePrefixVariant
			local var3 = experimentCacheManager.default:getLayerVariables(expChatGlobalTabDefaultExperimentLayer)
			
			if var3 and var3[var2] ~= nil then
				return var3[var2]
			end
			var1 = false
		end
		return var1
	end,
	getGlobalWelcomeMessageKey = function()
		-- upvalues: forceEnableExpChatGlobalTabShortWelcome (ref), expChatGlobalTabShortWelcomeVariant (ref), experimentCacheManager (ref), expChatGlobalTabDefaultExperimentLayer (ref)
		local var1 = forceEnableExpChatGlobalTabShortWelcome
		
		if not var1 then
			local var2 = expChatGlobalTabShortWelcomeVariant
			local var3 = experimentCacheManager.default:getLayerVariables(expChatGlobalTabDefaultExperimentLayer)
			var1 = if var3 and var3[var2] ~= nil then var3[var2] else false
		end
		return if var1 then "CoreScripts.TextChat.ChatWindow.ChatEnabled.Global3" else "CoreScripts.TextChat.ChatWindow.ChatEnabled.Global2"
	end,
	logExposure = function()
		-- upvalues: experimentCacheManager (ref), expChatGlobalTabDefaultExperimentLayer (ref)
		if experimentCacheManager.default:getLayerVariables(expChatGlobalTabDefaultExperimentLayer) ~= nil then
			experimentCacheManager.default:logLayerExposure(expChatGlobalTabDefaultExperimentLayer)
		end
	end
}