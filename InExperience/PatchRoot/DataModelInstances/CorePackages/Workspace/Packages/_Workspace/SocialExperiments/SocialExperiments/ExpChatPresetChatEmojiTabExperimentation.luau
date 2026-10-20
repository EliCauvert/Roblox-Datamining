local ExperimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local ExpChatPresetChatEmojiTabExperimentLayer = game:DefineFastString("ExpChatPresetChatEmojiTabExperimentLayer", "UniverseChat.PresetChat.Emojis")
local ExpChatPresetChatEmojiTabEmojiIconVariable = game:DefineFastString("ExpChatPresetChatEmojiTabEmojiIconVariable", "emojiIcon")
local ExpChatPresetChatEmojiTabEmphasizedRenderingVariable = game:DefineFastString("ExpChatPresetChatEmojiTabEmphasizedRenderingVariable", "emphasizedRendering")
local ExpChatPresetChatEmojiTabExperimentEnabled = game:DefineFastFlag("ExpChatPresetChatEmojiTabExperimentEnabled", false)
local Flag = false

local function _(p1)
	-- upvalues: ExperimentCacheManager (copy), ExpChatPresetChatEmojiTabExperimentLayer (copy)
	local LayerVariables = ExperimentCacheManager.default:getLayerVariables(ExpChatPresetChatEmojiTabExperimentLayer)
	
	return if LayerVariables and LayerVariables[p1] ~= nil then LayerVariables[p1] else nil
end

local _ = function(p1): boolean
	-- upvalues: ExpChatPresetChatEmojiTabExperimentEnabled (copy), ExperimentCacheManager (copy), ExpChatPresetChatEmojiTabExperimentLayer (copy)
	if ExpChatPresetChatEmojiTabExperimentEnabled then
		local LayerVariables = ExperimentCacheManager.default:getLayerVariables(ExpChatPresetChatEmojiTabExperimentLayer)
		local LayerVariable = if LayerVariables and LayerVariables[p1] ~= nil then LayerVariables[p1] else nil
		
		return LayerVariable == true or LayerVariable == 1
	else
		return false
	end
end

return {
	getIsEmojiIconEnabled = function(): boolean
		-- upvalues: ExpChatPresetChatEmojiTabEmojiIconVariable (copy), ExpChatPresetChatEmojiTabExperimentEnabled (copy), ExperimentCacheManager (copy), ExpChatPresetChatEmojiTabExperimentLayer (copy)
		if ExpChatPresetChatEmojiTabExperimentEnabled then
			local LayerVariables = ExperimentCacheManager.default:getLayerVariables(ExpChatPresetChatEmojiTabExperimentLayer)
			local LayerVariable = if LayerVariables and LayerVariables[ExpChatPresetChatEmojiTabEmojiIconVariable] ~= nil then LayerVariables[ExpChatPresetChatEmojiTabEmojiIconVariable] else nil
			
			return LayerVariable == true or LayerVariable == 1
		else
			return false
		end
	end,
	getIsEmphasizedRenderingEnabled = function(): boolean
		-- upvalues: ExpChatPresetChatEmojiTabEmphasizedRenderingVariable (copy), ExpChatPresetChatEmojiTabExperimentEnabled (copy), ExperimentCacheManager (copy), ExpChatPresetChatEmojiTabExperimentLayer (copy)
		if ExpChatPresetChatEmojiTabExperimentEnabled then
			local LayerVariables = ExperimentCacheManager.default:getLayerVariables(ExpChatPresetChatEmojiTabExperimentLayer)
			local LayerVariable = if LayerVariables and LayerVariables[ExpChatPresetChatEmojiTabEmphasizedRenderingVariable] ~= nil then LayerVariables[ExpChatPresetChatEmojiTabEmphasizedRenderingVariable] else nil
			
			return LayerVariable == true or LayerVariable == 1
		else
			return false
		end
	end,
	logExposure = function()
		-- upvalues: ExpChatPresetChatEmojiTabExperimentEnabled (copy), Flag (ref), ExpChatPresetChatEmojiTabEmojiIconVariable (copy), ExperimentCacheManager (copy), ExpChatPresetChatEmojiTabExperimentLayer (copy), ExpChatPresetChatEmojiTabEmphasizedRenderingVariable (copy)
		if not ExpChatPresetChatEmojiTabExperimentEnabled or Flag then return end
		local LayerVariables = ExperimentCacheManager.default:getLayerVariables(ExpChatPresetChatEmojiTabExperimentLayer)
		
		if (if LayerVariables and LayerVariables[ExpChatPresetChatEmojiTabEmojiIconVariable] ~= nil then LayerVariables[ExpChatPresetChatEmojiTabEmojiIconVariable] else nil) == nil then
			local LayerVariables1 = ExperimentCacheManager.default:getLayerVariables(ExpChatPresetChatEmojiTabExperimentLayer)
			
			if (if LayerVariables1 and LayerVariables1[ExpChatPresetChatEmojiTabEmphasizedRenderingVariable] ~= nil then LayerVariables1[ExpChatPresetChatEmojiTabEmphasizedRenderingVariable] else nil) == nil then return end
		end
		Flag = true
		pcall(function()
			-- upvalues: ExperimentCacheManager (upval), ExpChatPresetChatEmojiTabExperimentLayer (upval)
			ExperimentCacheManager.default:logLayerExposure(ExpChatPresetChatEmojiTabExperimentLayer)
		end)
	end,
	isExperimentEnabled = ExpChatPresetChatEmojiTabExperimentEnabled
}