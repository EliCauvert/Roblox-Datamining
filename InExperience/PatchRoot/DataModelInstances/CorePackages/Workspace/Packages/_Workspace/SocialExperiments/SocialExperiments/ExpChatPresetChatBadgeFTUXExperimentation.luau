local experimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local expChatPresetChatBadgeFTUXExperimentLayer = game:DefineFastString("ExpChatPresetChatBadgeFTUXExperimentLayer", "UniverseChat.PresetChat")
local expChatPresetChatBadgeFTUXVariable = game:DefineFastString("ExpChatPresetChatBadgeFTUXVariable", "ChatIconBadged")
local expChatEnablePresetChatBadgeFTUXExperimentation = game:DefineFastFlag("ExpChatEnablePresetChatBadgeFTUXExperimentation", false)
local expChatPresetChatIconBadgeOverride = game:DefineFastInt("ExpChatPresetChatIconBadgeOverride", 0)
local var4 = false

local function _()
	-- upvalues: experimentCacheManager (ref), expChatPresetChatBadgeFTUXExperimentLayer (ref), expChatPresetChatBadgeFTUXVariable (ref)
	local var5 = experimentCacheManager.default:getLayerVariables(expChatPresetChatBadgeFTUXExperimentLayer)
	
	return if var5 and var5[expChatPresetChatBadgeFTUXVariable] ~= nil then var5[expChatPresetChatBadgeFTUXVariable] else nil
end

return {
	getShouldShowPresetChatIconBadge = function()
		-- upvalues: expChatPresetChatIconBadgeOverride (ref), expChatEnablePresetChatBadgeFTUXExperimentation (ref), experimentCacheManager (ref), expChatPresetChatBadgeFTUXExperimentLayer (ref), expChatPresetChatBadgeFTUXVariable (ref)
		if expChatPresetChatIconBadgeOverride == 1 then
			return true
		elseif expChatPresetChatIconBadgeOverride == 2 then
			return false
		elseif not expChatEnablePresetChatBadgeFTUXExperimentation then
			return true
		end
		local var6 = experimentCacheManager.default:getLayerVariables(expChatPresetChatBadgeFTUXExperimentLayer)
		local var7 = if var6 and var6[expChatPresetChatBadgeFTUXVariable] ~= nil then var6[expChatPresetChatBadgeFTUXVariable] else nil
		
		return var7 == nil or var7 == 1
	end,
	logExposure = function()
		-- upvalues: expChatEnablePresetChatBadgeFTUXExperimentation (ref), var4 (write), experimentCacheManager (ref), expChatPresetChatBadgeFTUXExperimentLayer (ref), expChatPresetChatBadgeFTUXVariable (ref)
		if not expChatEnablePresetChatBadgeFTUXExperimentation or var4 then return end
		local var8 = experimentCacheManager.default:getLayerVariables(expChatPresetChatBadgeFTUXExperimentLayer)
		
		if (if var8 and var8[expChatPresetChatBadgeFTUXVariable] ~= nil then var8[expChatPresetChatBadgeFTUXVariable] else nil) == nil then
			return
		end
		var4 = true
		experimentCacheManager.default:logLayerExposure(expChatPresetChatBadgeFTUXExperimentLayer)
	end,
	isExperimentEnabled = expChatEnablePresetChatBadgeFTUXExperimentation
}