local experimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local expChatPresetChatEmojiEffectExperimentLayer = game:DefineFastString("ExpChatPresetChatEmojiEffectExperimentLayer", "UniverseChat.PresetChat.Emojis.Experiment1")
local expChatPresetChatEmojiEffectChatWindowEnlargeVariable = game:DefineFastString("ExpChatPresetChatEmojiEffectChatWindowEnlargeVariable", "hasChatWindowEnlargeEffect")
local expChatPresetChatEmojiEffectBorderlessBubbleChatVariable = game:DefineFastString("ExpChatPresetChatEmojiEffectBorderlessBubbleChatVariable", "hasBorderlessBubbleChatEffect")
local expChatPresetChatEmojiEffectExperimentEnabled = game:DefineFastFlag("ExpChatPresetChatEmojiEffectExperimentEnabled", false)
local var1 = false

local function _(value)
	-- upvalues: experimentCacheManager (ref), expChatPresetChatEmojiEffectExperimentLayer (ref)
	local var2 = experimentCacheManager.default:getLayerVariables(expChatPresetChatEmojiEffectExperimentLayer)
	
	return if var2 and var2[value] ~= nil then var2[value] else nil
end

local _ = function(p1)
	-- upvalues: expChatPresetChatEmojiEffectExperimentEnabled (ref), experimentCacheManager (ref), expChatPresetChatEmojiEffectExperimentLayer (ref)
	if not expChatPresetChatEmojiEffectExperimentEnabled then
		return false
	end
	local var2 = experimentCacheManager.default:getLayerVariables(expChatPresetChatEmojiEffectExperimentLayer)
	local var3 = if var2 and var2[p1] ~= nil then var2[p1] else nil
	var2 = if var3 ~= true then var3 == 1 else true
	
	return var2
end

return {
	getHasChatWindowEnlargeEffect = function()
		-- upvalues: expChatPresetChatEmojiEffectChatWindowEnlargeVariable (ref), expChatPresetChatEmojiEffectExperimentEnabled (ref), experimentCacheManager (ref), expChatPresetChatEmojiEffectExperimentLayer (ref)
		if not expChatPresetChatEmojiEffectExperimentEnabled then
			return false
		end
		local var2 = experimentCacheManager.default:getLayerVariables(expChatPresetChatEmojiEffectExperimentLayer)
		local var3 = if var2 and var2[expChatPresetChatEmojiEffectChatWindowEnlargeVariable] ~= nil then var2[expChatPresetChatEmojiEffectChatWindowEnlargeVariable] else nil
		
		return if var3 ~= true then var3 == 1 else true
	end,
	getHasBorderlessBubbleChatEffect = function()
		-- upvalues: expChatPresetChatEmojiEffectBorderlessBubbleChatVariable (ref), expChatPresetChatEmojiEffectExperimentEnabled (ref), experimentCacheManager (ref), expChatPresetChatEmojiEffectExperimentLayer (ref)
		if not expChatPresetChatEmojiEffectExperimentEnabled then
			return false
		end
		local var2 = experimentCacheManager.default:getLayerVariables(expChatPresetChatEmojiEffectExperimentLayer)
		local var3 = if var2 and var2[expChatPresetChatEmojiEffectBorderlessBubbleChatVariable] ~= nil then var2[expChatPresetChatEmojiEffectBorderlessBubbleChatVariable] else nil
		
		return if var3 ~= true then var3 == 1 else true
	end,
	logExposure = function()
		-- upvalues: expChatPresetChatEmojiEffectExperimentEnabled (ref), var1 (write), expChatPresetChatEmojiEffectChatWindowEnlargeVariable (ref), experimentCacheManager (ref), expChatPresetChatEmojiEffectExperimentLayer (ref), expChatPresetChatEmojiEffectBorderlessBubbleChatVariable (ref)
		if not expChatPresetChatEmojiEffectExperimentEnabled or var1 then return end
		local var2 = expChatPresetChatEmojiEffectChatWindowEnlargeVariable
		local var3 = experimentCacheManager.default:getLayerVariables(expChatPresetChatEmojiEffectExperimentLayer)
		local var4 = if var3 and var3[var2] ~= nil then var3[var2] else nil
		
		if var4 == nil then
			local var5 = expChatPresetChatEmojiEffectBorderlessBubbleChatVariable
			var3 = experimentCacheManager.default:getLayerVariables(expChatPresetChatEmojiEffectExperimentLayer)
			var4 = if var3 and var3[var5] ~= nil then var3[var5] else nil
			
			if var4 == nil then
				return
			end
		end
		var1 = true
		pcall(function()
			-- upvalues: experimentCacheManager (copy), expChatPresetChatEmojiEffectExperimentLayer (copy)
			experimentCacheManager.default:logLayerExposure(expChatPresetChatEmojiEffectExperimentLayer)
		end)
	end,
	isExperimentEnabled = expChatPresetChatEmojiEffectExperimentEnabled
}