local experimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local expChatPresetChatEmojiTabExperimentLayer = game:DefineFastString("ExpChatPresetChatEmojiTabExperimentLayer", "UniverseChat.PresetChat.Emojis")
local expChatPresetChatEmojiTabEmojiIconVariable = game:DefineFastString("ExpChatPresetChatEmojiTabEmojiIconVariable", "emojiIcon")
local expChatPresetChatEmojiTabEmphasizedRenderingVariable = game:DefineFastString("ExpChatPresetChatEmojiTabEmphasizedRenderingVariable", "emphasizedRendering")
local expChatPresetChatEmojiTabExperimentEnabled = game:DefineFastFlag("ExpChatPresetChatEmojiTabExperimentEnabled", false)
local var1 = false

local function _(value)
	-- upvalues: experimentCacheManager (ref), expChatPresetChatEmojiTabExperimentLayer (ref)
	local var2 = experimentCacheManager.default:getLayerVariables(expChatPresetChatEmojiTabExperimentLayer)
	
	return if var2 and var2[value] ~= nil then var2[value] else nil
end

local _ = function(p1)
	-- upvalues: expChatPresetChatEmojiTabExperimentEnabled (ref), experimentCacheManager (ref), expChatPresetChatEmojiTabExperimentLayer (ref)
	if not expChatPresetChatEmojiTabExperimentEnabled then
		return false
	end
	local var2 = experimentCacheManager.default:getLayerVariables(expChatPresetChatEmojiTabExperimentLayer)
	local var3 = if var2 and var2[p1] ~= nil then var2[p1] else nil
	var2 = if var3 ~= true then var3 == 1 else true
	
	return var2
end

return {
	getIsEmojiIconEnabled = function()
		-- upvalues: expChatPresetChatEmojiTabEmojiIconVariable (ref), expChatPresetChatEmojiTabExperimentEnabled (ref), experimentCacheManager (ref), expChatPresetChatEmojiTabExperimentLayer (ref)
		if not expChatPresetChatEmojiTabExperimentEnabled then
			return false
		end
		local var2 = experimentCacheManager.default:getLayerVariables(expChatPresetChatEmojiTabExperimentLayer)
		local var3 = if var2 and var2[expChatPresetChatEmojiTabEmojiIconVariable] ~= nil then var2[expChatPresetChatEmojiTabEmojiIconVariable] else nil
		
		return if var3 ~= true then var3 == 1 else true
	end,
	getIsEmphasizedRenderingEnabled = function()
		-- upvalues: expChatPresetChatEmojiTabEmphasizedRenderingVariable (ref), expChatPresetChatEmojiTabExperimentEnabled (ref), experimentCacheManager (ref), expChatPresetChatEmojiTabExperimentLayer (ref)
		if not expChatPresetChatEmojiTabExperimentEnabled then
			return false
		end
		local var2 = experimentCacheManager.default:getLayerVariables(expChatPresetChatEmojiTabExperimentLayer)
		local var3 = if var2 and var2[expChatPresetChatEmojiTabEmphasizedRenderingVariable] ~= nil then var2[expChatPresetChatEmojiTabEmphasizedRenderingVariable] else nil
		
		return if var3 ~= true then var3 == 1 else true
	end,
	logExposure = function()
		-- upvalues: expChatPresetChatEmojiTabExperimentEnabled (ref), var1 (write), expChatPresetChatEmojiTabEmojiIconVariable (ref), experimentCacheManager (ref), expChatPresetChatEmojiTabExperimentLayer (ref), expChatPresetChatEmojiTabEmphasizedRenderingVariable (ref)
		if not expChatPresetChatEmojiTabExperimentEnabled or var1 then return end
		local var2 = expChatPresetChatEmojiTabEmojiIconVariable
		local var3 = experimentCacheManager.default:getLayerVariables(expChatPresetChatEmojiTabExperimentLayer)
		local var4 = if var3 and var3[var2] ~= nil then var3[var2] else nil
		
		if var4 == nil then
			local var5 = expChatPresetChatEmojiTabEmphasizedRenderingVariable
			var3 = experimentCacheManager.default:getLayerVariables(expChatPresetChatEmojiTabExperimentLayer)
			var4 = if var3 and var3[var5] ~= nil then var3[var5] else nil
			
			if var4 == nil then
				return
			end
		end
		var1 = true
		pcall(function()
			-- upvalues: experimentCacheManager (copy), expChatPresetChatEmojiTabExperimentLayer (copy)
			experimentCacheManager.default:logLayerExposure(expChatPresetChatEmojiTabExperimentLayer)
		end)
	end,
	isExperimentEnabled = expChatPresetChatEmojiTabExperimentEnabled
}