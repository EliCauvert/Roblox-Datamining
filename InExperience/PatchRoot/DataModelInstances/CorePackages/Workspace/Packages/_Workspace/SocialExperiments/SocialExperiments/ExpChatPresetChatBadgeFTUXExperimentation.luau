local Parent = script:FindFirstAncestor("SocialExperiments").Parent
local ExperimentCacheManager = require(Parent.ExperimentCacheManager).ExperimentCacheManager
local FFlagExpChatPresetChatBadgeExperimentCleanup = require(Parent.SharedFlags).FFlagExpChatPresetChatBadgeExperimentCleanup
local ExpChatPresetChatBadgeFTUXExperimentLayer = game:DefineFastString("ExpChatPresetChatBadgeFTUXExperimentLayer", "UniverseChat.PresetChat")
local ExpChatPresetChatBadgeFTUXVariable = game:DefineFastString("ExpChatPresetChatBadgeFTUXVariable", "ChatIconBadged")
local ExpChatEnablePresetChatBadgeFTUXExperimentation = game:DefineFastFlag("ExpChatEnablePresetChatBadgeFTUXExperimentation", false)
local ExpChatPresetChatIconBadgeOverride = game:DefineFastInt("ExpChatPresetChatIconBadgeOverride", 0)
local Flag = false

local function _() --[[ Line: 21 | Named "getChatIconBadged" ]]
	-- upvalues: ExperimentCacheManager (copy), ExpChatPresetChatBadgeFTUXExperimentLayer (copy), ExpChatPresetChatBadgeFTUXVariable (copy)
	local LayerVariables = ExperimentCacheManager.default:getLayerVariables(ExpChatPresetChatBadgeFTUXExperimentLayer)
	
	return if LayerVariables and LayerVariables[ExpChatPresetChatBadgeFTUXVariable] ~= nil then LayerVariables[ExpChatPresetChatBadgeFTUXVariable] else nil
end

return {
	getShouldShowPresetChatIconBadge = function(): boolean --[[ Line: 32 ]]
		-- upvalues: ExpChatPresetChatIconBadgeOverride (copy), ExpChatEnablePresetChatBadgeFTUXExperimentation (copy), FFlagExpChatPresetChatBadgeExperimentCleanup (copy), ExperimentCacheManager (copy), ExpChatPresetChatBadgeFTUXExperimentLayer (copy), ExpChatPresetChatBadgeFTUXVariable (copy)
		if ExpChatPresetChatIconBadgeOverride == 1 then
			return true
		elseif ExpChatPresetChatIconBadgeOverride == 2 then
			return false
		elseif ExpChatEnablePresetChatBadgeFTUXExperimentation then
			local LayerVariables = ExperimentCacheManager.default:getLayerVariables(ExpChatPresetChatBadgeFTUXExperimentLayer)
			local LayerVariable = if LayerVariables and LayerVariables[ExpChatPresetChatBadgeFTUXVariable] ~= nil then LayerVariables[ExpChatPresetChatBadgeFTUXVariable] else nil
			
			return if LayerVariable == nil then not FFlagExpChatPresetChatBadgeExperimentCleanup else FFlagExpChatPresetChatBadgeExperimentCleanup and LayerVariable == true or LayerVariable == 1
		else
			return not FFlagExpChatPresetChatBadgeExperimentCleanup
		end
	end,
	logExposure = function() --[[ Line: 63 ]]
		-- upvalues: ExpChatEnablePresetChatBadgeFTUXExperimentation (copy), Flag (ref), ExperimentCacheManager (copy), ExpChatPresetChatBadgeFTUXExperimentLayer (copy), ExpChatPresetChatBadgeFTUXVariable (copy)
		if not ExpChatEnablePresetChatBadgeFTUXExperimentation or Flag then return end
		local LayerVariables = ExperimentCacheManager.default:getLayerVariables(ExpChatPresetChatBadgeFTUXExperimentLayer)
		
		if (if LayerVariables and LayerVariables[ExpChatPresetChatBadgeFTUXVariable] ~= nil then LayerVariables[ExpChatPresetChatBadgeFTUXVariable] else nil) ~= nil then
			Flag = true
			pcall(function() --[[ Line: 73 ]]
				-- upvalues: ExperimentCacheManager (upval), ExpChatPresetChatBadgeFTUXExperimentLayer (upval)
				ExperimentCacheManager.default:logLayerExposure(ExpChatPresetChatBadgeFTUXExperimentLayer)
			end)
			
			return
		end
	end,
	isExperimentEnabled = ExpChatEnablePresetChatBadgeFTUXExperimentation
}