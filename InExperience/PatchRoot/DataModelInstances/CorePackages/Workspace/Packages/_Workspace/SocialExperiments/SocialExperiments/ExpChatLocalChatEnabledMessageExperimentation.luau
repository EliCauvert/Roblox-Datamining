local experimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local expChatLocalChatEnabledMessageExperimentLayer = game:DefineFastString("ExpChatLocalChatEnabledMessageExperimentLayer", "ExperienceChat.SystemMessages")
local expChatLocalChatEnabledMessageVariable = game:DefineFastString("ExpChatLocalChatEnabledMessageVariable", "SystemMessageKey")
local expChatLocalChatEnabledMessageForcedKey = game:DefineFastString("ExpChatLocalChatEnabledMessageForcedKey", "")
local enableExpChatLocalChatEnabledMessageExperimentation2 = game:DefineFastFlag("EnableExpChatLocalChatEnabledMessageExperimentation2", false)

return {
	getSystemMessageKey = function()
		-- upvalues: expChatLocalChatEnabledMessageForcedKey (ref), experimentCacheManager (ref), expChatLocalChatEnabledMessageExperimentLayer (ref), expChatLocalChatEnabledMessageVariable (ref)
		if expChatLocalChatEnabledMessageForcedKey ~= "" then
			return expChatLocalChatEnabledMessageForcedKey
		end
		local var1 = experimentCacheManager.default:getLayerVariables(expChatLocalChatEnabledMessageExperimentLayer)
		
		return if var1 and var1[expChatLocalChatEnabledMessageVariable] ~= nil then var1[expChatLocalChatEnabledMessageVariable] else nil
	end,
	logExposure = function()
		-- upvalues: enableExpChatLocalChatEnabledMessageExperimentation2 (ref), experimentCacheManager (ref), expChatLocalChatEnabledMessageExperimentLayer (ref)
		if enableExpChatLocalChatEnabledMessageExperimentation2 and experimentCacheManager.default:getLayerVariables(expChatLocalChatEnabledMessageExperimentLayer) ~= nil then
			experimentCacheManager.default:logLayerExposure(expChatLocalChatEnabledMessageExperimentLayer)
		end
	end,
	isExperimentEnabled = enableExpChatLocalChatEnabledMessageExperimentation2
}