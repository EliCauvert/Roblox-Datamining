local experimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local expChatNewSystemMessagesExperimentLayer = game:DefineFastString("ExpChatNewSystemMessagesExperimentLayer", "ExperienceChat.SystemMessages")
local expChatNewSystemMessagesVariant = game:DefineFastString("ExpChatNewSystemMessagesVariant", "enableNewSystemMessages")
local forceEnableExpChatNewSystemMessages = game:DefineFastFlag("ForceEnableExpChatNewSystemMessages", false)
local enableExpChatNewSystemMessagesExperimentation = game:DefineFastFlag("EnableExpChatNewSystemMessagesExperimentation", false)

local function _(p0) --[[ line: 14 | named "getIsUserInTreatment" ]]
	-- upvalues: experimentCacheManager (ref), expChatNewSystemMessagesExperimentLayer (ref)
	local var4 = experimentCacheManager.default:getLayerVariables(expChatNewSystemMessagesExperimentLayer)
	
	return if var4 and var4[p0] ~= nil then var4[p0] else false
end

return {
	getNewSystemMessagesEnabled = function() --[[ line: 25 ]]
		-- upvalues: forceEnableExpChatNewSystemMessages (ref), enableExpChatNewSystemMessagesExperimentation (ref), expChatNewSystemMessagesVariant (ref), experimentCacheManager (ref), expChatNewSystemMessagesExperimentLayer (ref)
		local var5 = forceEnableExpChatNewSystemMessages
		
		if not var5 then
			var5 = enableExpChatNewSystemMessagesExperimentation
			
			if var5 then
				local var6 = expChatNewSystemMessagesVariant
				local var7 = experimentCacheManager.default:getLayerVariables(expChatNewSystemMessagesExperimentLayer)
				
				if var7 and var7[var6] ~= nil then
					return var7[var6]
				end
				var5 = false
			end
		end
		return var5
	end,
	logExposure = function() --[[ line: 33 ]]
		-- upvalues: enableExpChatNewSystemMessagesExperimentation (ref), experimentCacheManager (ref), expChatNewSystemMessagesExperimentLayer (ref)
		if enableExpChatNewSystemMessagesExperimentation and experimentCacheManager.default:getLayerVariables(expChatNewSystemMessagesExperimentLayer) ~= nil then
			experimentCacheManager.default:logLayerExposure(expChatNewSystemMessagesExperimentLayer)
		end
	end,
	isExperimentEnabled = enableExpChatNewSystemMessagesExperimentation
}