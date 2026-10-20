local ExperimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local ExpChatPresetChatEmojiEffectExperimentLayer = game:DefineFastString("ExpChatPresetChatEmojiEffectExperimentLayer", "UniverseChat.PresetChat.Emojis.Experiment1")
local ExpChatPresetChatEmojiEffectChatWindowEnlargeVariable = game:DefineFastString("ExpChatPresetChatEmojiEffectChatWindowEnlargeVariable", "hasChatWindowEnlargeEffect")
local ExpChatPresetChatEmojiEffectBorderlessBubbleChatVariable = game:DefineFastString("ExpChatPresetChatEmojiEffectBorderlessBubbleChatVariable", "hasBorderlessBubbleChatEffect")
local ExpChatPresetChatEmojiEffectExperimentEnabled = game:DefineFastFlag("ExpChatPresetChatEmojiEffectExperimentEnabled", false)
local Flag = false

local function _(p1)
	-- upvalues: ExperimentCacheManager (copy), ExpChatPresetChatEmojiEffectExperimentLayer (copy)
	local LayerVariables = ExperimentCacheManager.default:getLayerVariables(ExpChatPresetChatEmojiEffectExperimentLayer)
	
	return if LayerVariables and LayerVariables[p1] ~= nil then LayerVariables[p1] else nil
end

local _ = function(p1): boolean
	-- upvalues: ExpChatPresetChatEmojiEffectExperimentEnabled (copy), ExperimentCacheManager (copy), ExpChatPresetChatEmojiEffectExperimentLayer (copy)
	if ExpChatPresetChatEmojiEffectExperimentEnabled then
		local LayerVariables = ExperimentCacheManager.default:getLayerVariables(ExpChatPresetChatEmojiEffectExperimentLayer)
		local LayerVariable = if LayerVariables and LayerVariables[p1] ~= nil then LayerVariables[p1] else nil
		
		return LayerVariable == true or LayerVariable == 1
	else
		return false
	end
end

return {
	getHasChatWindowEnlargeEffect = function(): boolean
		-- upvalues: ExpChatPresetChatEmojiEffectChatWindowEnlargeVariable (copy), ExpChatPresetChatEmojiEffectExperimentEnabled (copy), ExperimentCacheManager (copy), ExpChatPresetChatEmojiEffectExperimentLayer (copy)
		if ExpChatPresetChatEmojiEffectExperimentEnabled then
			local LayerVariables = ExperimentCacheManager.default:getLayerVariables(ExpChatPresetChatEmojiEffectExperimentLayer)
			local LayerVariable = if LayerVariables and LayerVariables[ExpChatPresetChatEmojiEffectChatWindowEnlargeVariable] ~= nil then LayerVariables[ExpChatPresetChatEmojiEffectChatWindowEnlargeVariable] else nil
			
			return LayerVariable == true or LayerVariable == 1
		else
			return false
		end
	end,
	getHasBorderlessBubbleChatEffect = function(): boolean
		-- upvalues: ExpChatPresetChatEmojiEffectBorderlessBubbleChatVariable (copy), ExpChatPresetChatEmojiEffectExperimentEnabled (copy), ExperimentCacheManager (copy), ExpChatPresetChatEmojiEffectExperimentLayer (copy)
		if ExpChatPresetChatEmojiEffectExperimentEnabled then
			local LayerVariables = ExperimentCacheManager.default:getLayerVariables(ExpChatPresetChatEmojiEffectExperimentLayer)
			local LayerVariable = if LayerVariables and LayerVariables[ExpChatPresetChatEmojiEffectBorderlessBubbleChatVariable] ~= nil then LayerVariables[ExpChatPresetChatEmojiEffectBorderlessBubbleChatVariable] else nil
			
			return LayerVariable == true or LayerVariable == 1
		else
			return false
		end
	end,
	logExposure = function()
		-- upvalues: ExpChatPresetChatEmojiEffectExperimentEnabled (copy), Flag (ref), ExpChatPresetChatEmojiEffectChatWindowEnlargeVariable (copy), ExperimentCacheManager (copy), ExpChatPresetChatEmojiEffectExperimentLayer (copy), ExpChatPresetChatEmojiEffectBorderlessBubbleChatVariable (copy)
		if not ExpChatPresetChatEmojiEffectExperimentEnabled or Flag then return end
		local LayerVariables = ExperimentCacheManager.default:getLayerVariables(ExpChatPresetChatEmojiEffectExperimentLayer)
		
		if (if LayerVariables and LayerVariables[ExpChatPresetChatEmojiEffectChatWindowEnlargeVariable] ~= nil then LayerVariables[ExpChatPresetChatEmojiEffectChatWindowEnlargeVariable] else nil) == nil then
			local LayerVariables1 = ExperimentCacheManager.default:getLayerVariables(ExpChatPresetChatEmojiEffectExperimentLayer)
			
			if (if LayerVariables1 and LayerVariables1[ExpChatPresetChatEmojiEffectBorderlessBubbleChatVariable] ~= nil then LayerVariables1[ExpChatPresetChatEmojiEffectBorderlessBubbleChatVariable] else nil) == nil then return end
		end
		Flag = true
		pcall(function()
			-- upvalues: ExperimentCacheManager (upval), ExpChatPresetChatEmojiEffectExperimentLayer (upval)
			ExperimentCacheManager.default:logLayerExposure(ExpChatPresetChatEmojiEffectExperimentLayer)
		end)
	end,
	isExperimentEnabled = ExpChatPresetChatEmojiEffectExperimentEnabled
}