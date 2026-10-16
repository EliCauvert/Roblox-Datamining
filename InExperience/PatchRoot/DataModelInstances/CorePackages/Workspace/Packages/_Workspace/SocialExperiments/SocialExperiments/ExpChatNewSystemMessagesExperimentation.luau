local ExperimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local ExpChatNewSystemMessagesExperimentLayer = game:DefineFastString("ExpChatNewSystemMessagesExperimentLayer", "ExperienceChat.SystemMessages")
local ExpChatNewSystemMessagesVariant = game:DefineFastString("ExpChatNewSystemMessagesVariant", "enableNewSystemMessages")
local ForceEnableExpChatNewSystemMessages = game:DefineFastFlag("ForceEnableExpChatNewSystemMessages", false)
local EnableExpChatNewSystemMessagesExperimentation = game:DefineFastFlag("EnableExpChatNewSystemMessagesExperimentation", false)

local function _(p1) --[[ Line: 14 | Named "getIsUserInTreatment" ]]
	-- upvalues: ExperimentCacheManager (copy), ExpChatNewSystemMessagesExperimentLayer (copy)
	local LayerVariables = ExperimentCacheManager.default:getLayerVariables(ExpChatNewSystemMessagesExperimentLayer)
	
	return if LayerVariables and LayerVariables[p1] ~= nil then LayerVariables[p1] else false
end

return {
	getNewSystemMessagesEnabled = function() --[[ Line: 25 ]]
		-- upvalues: ForceEnableExpChatNewSystemMessages (copy), EnableExpChatNewSystemMessagesExperimentation (copy), ExpChatNewSystemMessagesVariant (copy), ExperimentCacheManager (copy), ExpChatNewSystemMessagesExperimentLayer (copy)
		local Flag: boolean = ForceEnableExpChatNewSystemMessages
		
		if not Flag then
			Flag = EnableExpChatNewSystemMessagesExperimentation
			
			if Flag then
				local LayerVariables = ExperimentCacheManager.default:getLayerVariables(ExpChatNewSystemMessagesExperimentLayer)
				
				if LayerVariables and LayerVariables[ExpChatNewSystemMessagesVariant] ~= nil then
					return LayerVariables[ExpChatNewSystemMessagesVariant]
				end
				Flag = false
			end
		end
		return Flag
	end,
	logExposure = function() --[[ Line: 33 ]]
		-- upvalues: EnableExpChatNewSystemMessagesExperimentation (copy), ExperimentCacheManager (copy), ExpChatNewSystemMessagesExperimentLayer (copy)
		if EnableExpChatNewSystemMessagesExperimentation and ExperimentCacheManager.default:getLayerVariables(ExpChatNewSystemMessagesExperimentLayer) ~= nil then
			ExperimentCacheManager.default:logLayerExposure(ExpChatNewSystemMessagesExperimentLayer)
		end
	end,
	isExperimentEnabled = EnableExpChatNewSystemMessagesExperimentation
}