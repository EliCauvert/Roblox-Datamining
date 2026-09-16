local parent = script:FindFirstAncestor("SocialExperiments").Parent
local experimentCacheManager = require(parent.ExperimentCacheManager).ExperimentCacheManager
local fFlagExpChatPresetChatBadgeExperimentCleanup = require(parent.SharedFlags).FFlagExpChatPresetChatBadgeExperimentCleanup
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
		-- upvalues: expChatPresetChatIconBadgeOverride (ref), expChatEnablePresetChatBadgeFTUXExperimentation (ref), fFlagExpChatPresetChatBadgeExperimentCleanup (ref), experimentCacheManager (ref), expChatPresetChatBadgeFTUXExperimentLayer (ref), expChatPresetChatBadgeFTUXVariable (ref)
		if expChatPresetChatIconBadgeOverride == 1 then
			return true
		elseif expChatPresetChatIconBadgeOverride == 2 then
			return false
		elseif expChatEnablePresetChatBadgeFTUXExperimentation then
			local var2 = experimentCacheManager.default:getLayerVariables(expChatPresetChatBadgeFTUXExperimentLayer)
			local var3 = if var2 and var2[expChatPresetChatBadgeFTUXVariable] ~= nil then var2[expChatPresetChatBadgeFTUXVariable] else nil
			
			if var3 == nil then
				return fFlagExpChatPresetChatBadgeExperimentCleanup
			elseif not fFlagExpChatPresetChatBadgeExperimentCleanup then
				return var3 == 1
			end
			var2 = if var3 ~= true then var3 == 1 else true
			
			return var2
		else
			return fFlagExpChatPresetChatBadgeExperimentCleanup
		end
	end,
	logExposure = function()
		-- upvalues: expChatEnablePresetChatBadgeFTUXExperimentation (ref), var1 (write), experimentCacheManager (ref), expChatPresetChatBadgeFTUXExperimentLayer (ref), expChatPresetChatBadgeFTUXVariable (ref)
		if not expChatEnablePresetChatBadgeFTUXExperimentation or var1 then return end
		local var2 = experimentCacheManager.default:getLayerVariables(expChatPresetChatBadgeFTUXExperimentLayer)
		
		if (if var2 and var2[expChatPresetChatBadgeFTUXVariable] ~= nil then var2[expChatPresetChatBadgeFTUXVariable] else nil) == nil then
			return
		end
		var1 = true
		pcall(function()
			-- upvalues: experimentCacheManager (copy), expChatPresetChatBadgeFTUXExperimentLayer (copy)
			experimentCacheManager.default:logLayerExposure(expChatPresetChatBadgeFTUXExperimentLayer)
		end)
	end,
	isExperimentEnabled = expChatEnablePresetChatBadgeFTUXExperimentation
}