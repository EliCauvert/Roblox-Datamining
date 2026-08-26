local experimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local expChatNewSystemMessagesExperimentLayer = game:DefineFastString("ExpChatNewSystemMessagesExperimentLayer", "ExperienceChat.SystemMessages")
local expChatNewSystemMessagesVariant = game:DefineFastString("ExpChatNewSystemMessagesVariant", "enableNewSystemMessages")
local forceEnableExpChatNewSystemMessages = game:DefineFastFlag("ForceEnableExpChatNewSystemMessages", false)
local enableExpChatNewSystemMessagesExperimentation = game:DefineFastFlag("EnableExpChatNewSystemMessagesExperimentation", false)

local function _(p1)
	-- upvalues: experimentCacheManager (ref), expChatNewSystemMessagesExperimentLayer (ref)
	local var1 = experimentCacheManager.default:getLayerVariables(expChatNewSystemMessagesExperimentLayer)
	
	return if var1 and var1[p1] ~= nil then var1[p1] else false
end

return {
	getNewSystemMessagesEnabled = function()
		-- upvalues: forceEnableExpChatNewSystemMessages (ref), enableExpChatNewSystemMessagesExperimentation (ref), expChatNewSystemMessagesVariant (ref), experimentCacheManager (ref), expChatNewSystemMessagesExperimentLayer (ref)
		local var1 = forceEnableExpChatNewSystemMessages
		
		if not var1 then
			var1 = enableExpChatNewSystemMessagesExperimentation
			
			if var1 then
				local var2 = expChatNewSystemMessagesVariant
				local var3 = experimentCacheManager.default:getLayerVariables(expChatNewSystemMessagesExperimentLayer)
				
				if var3 and var3[var2] ~= nil then
					return var3[var2]
				end
				var1 = false
			end
		end
		return var1
	end,
	logExposure = function()
		-- upvalues: enableExpChatNewSystemMessagesExperimentation (ref), experimentCacheManager (ref), expChatNewSystemMessagesExperimentLayer (ref)
		if enableExpChatNewSystemMessagesExperimentation and experimentCacheManager.default:getLayerVariables(expChatNewSystemMessagesExperimentLayer) ~= nil then
			experimentCacheManager.default:logLayerExposure(expChatNewSystemMessagesExperimentLayer)
		end
	end,
	isExperimentEnabled = enableExpChatNewSystemMessagesExperimentation
}