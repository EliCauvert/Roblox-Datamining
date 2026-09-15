local experimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local expChatPresetChatBadgeFTUXExperimentLayer = game:DefineFastString("ExpChatPresetChatBadgeFTUXExperimentLayer", "UniverseChat.PresetChat")
local expChatPresetChatBadgeFTUXVariable = game:DefineFastString("ExpChatPresetChatBadgeFTUXVariable", "ChatIconBadged")
local expChatEnablePresetChatBadgeFTUXExperimentation = game:DefineFastFlag("ExpChatEnablePresetChatBadgeFTUXExperimentation", false)
local expChatPresetChatIconBadgeOverride = game:DefineFastInt("ExpChatPresetChatIconBadgeOverride", 0)
local var1 = false

local function _()
	-- upvalues: experimentCacheManager (ref), expChatPresetChatBadgeFTUXExperimentLayer (ref), expChatPresetChatBadgeFTUXVariable (ref)
	local var2 = experimentCacheManager.default:getLayerVariables(expChatPresetChatBadgeFTUXExperimentLayer)
	
	return if var2 and var2[expChatPresetChatBadgeFTUXVariable] ~= nil then var2[expChatPresetChatBadgeFTUXVariable] else nil
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
		local var2 = experimentCacheManager.default:getLayerVariables(expChatPresetChatBadgeFTUXExperimentLayer)
		local var3 = if var2 and var2[expChatPresetChatBadgeFTUXVariable] ~= nil then var2[expChatPresetChatBadgeFTUXVariable] else nil
		
		return var3 == nil or var3 == 1
	end,
	logExposure = function()
		-- upvalues: expChatEnablePresetChatBadgeFTUXExperimentation (ref), var1 (write), experimentCacheManager (ref), expChatPresetChatBadgeFTUXExperimentLayer (ref), expChatPresetChatBadgeFTUXVariable (ref)
		if not expChatEnablePresetChatBadgeFTUXExperimentation or var1 then return end
		local var2 = experimentCacheManager.default:getLayerVariables(expChatPresetChatBadgeFTUXExperimentLayer)
		
		if (if var2 and var2[expChatPresetChatBadgeFTUXVariable] ~= nil then var2[expChatPresetChatBadgeFTUXVariable] else nil) == nil then
			return
		end
		var1 = true
		experimentCacheManager.default:logLayerExposure(expChatPresetChatBadgeFTUXExperimentLayer)
	end,
	isExperimentEnabled = expChatEnablePresetChatBadgeFTUXExperimentation
}