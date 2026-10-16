local ExperimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local ExpChatLocalChatEnabledMessageExperimentLayer = game:DefineFastString("ExpChatLocalChatEnabledMessageExperimentLayer", "ExperienceChat.SystemMessages")
local ExpChatLocalChatEnabledMessageVariable = game:DefineFastString("ExpChatLocalChatEnabledMessageVariable", "SystemMessageKey")
local ExpChatLocalChatEnabledMessageForcedKey = game:DefineFastString("ExpChatLocalChatEnabledMessageForcedKey", "")
local EnableExpChatLocalChatEnabledMessageExperimentation2 = game:DefineFastFlag("EnableExpChatLocalChatEnabledMessageExperimentation2", false)

return {
	getSystemMessageKey = function() --[[ Line: 18 ]]
		-- upvalues: ExpChatLocalChatEnabledMessageForcedKey (copy), ExperimentCacheManager (copy), ExpChatLocalChatEnabledMessageExperimentLayer (copy), ExpChatLocalChatEnabledMessageVariable (copy)
		if ExpChatLocalChatEnabledMessageForcedKey == "" then
			local LayerVariables = ExperimentCacheManager.default:getLayerVariables(ExpChatLocalChatEnabledMessageExperimentLayer)
			
			return if LayerVariables and LayerVariables[ExpChatLocalChatEnabledMessageVariable] ~= nil then LayerVariables[ExpChatLocalChatEnabledMessageVariable] else nil
		else
			return ExpChatLocalChatEnabledMessageForcedKey
		end
	end,
	logExposure = function() --[[ Line: 33 ]]
		-- upvalues: EnableExpChatLocalChatEnabledMessageExperimentation2 (copy), ExperimentCacheManager (copy), ExpChatLocalChatEnabledMessageExperimentLayer (copy)
		if EnableExpChatLocalChatEnabledMessageExperimentation2 and ExperimentCacheManager.default:getLayerVariables(ExpChatLocalChatEnabledMessageExperimentLayer) ~= nil then
			ExperimentCacheManager.default:logLayerExposure(ExpChatLocalChatEnabledMessageExperimentLayer)
		end
	end,
	isExperimentEnabled = EnableExpChatLocalChatEnabledMessageExperimentation2
}