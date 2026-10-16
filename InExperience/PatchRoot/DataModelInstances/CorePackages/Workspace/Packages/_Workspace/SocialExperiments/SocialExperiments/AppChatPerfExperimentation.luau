local ExperimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local AppChatPerfExperimentLayer = game:DefineFastString("AppChatPerfExperimentLayer", "Party.Chat.Perf")

local function _(p1) --[[ Line: 8 | Named "getIsUserInTreatment" ]]
	-- upvalues: AppChatPerfExperimentLayer (copy), ExperimentCacheManager (copy)
	local LayerVariables = ExperimentCacheManager.default:getLayerVariables(AppChatPerfExperimentLayer)
	
	return if LayerVariables and LayerVariables[p1] ~= nil then LayerVariables[p1] else false
end

return {
	getChatLandingPaginationEnabled = function() --[[ Line: 19 ]]
		-- upvalues: AppChatPerfExperimentLayer (copy), ExperimentCacheManager (copy)
		local LayerVariables = ExperimentCacheManager.default:getLayerVariables(AppChatPerfExperimentLayer)
		
		return if LayerVariables and LayerVariables.IsChatLandingPaginationEnabled ~= nil then LayerVariables.IsChatLandingPaginationEnabled else false
	end,
	getChatConversationPaginationEnabled = function() --[[ Line: 23 ]]
		-- upvalues: AppChatPerfExperimentLayer (copy), ExperimentCacheManager (copy)
		local LayerVariables = ExperimentCacheManager.default:getLayerVariables(AppChatPerfExperimentLayer)
		
		return if LayerVariables and LayerVariables.IsChatConversationPaginationEnabled ~= nil then LayerVariables.IsChatConversationPaginationEnabled else false
	end,
	getChatMembersPaginationEnabled = function() --[[ Line: 27 ]]
		-- upvalues: AppChatPerfExperimentLayer (copy), ExperimentCacheManager (copy)
		local LayerVariables = ExperimentCacheManager.default:getLayerVariables(AppChatPerfExperimentLayer)
		
		return if LayerVariables and LayerVariables.IsChatMembersPaginationEnabled ~= nil then LayerVariables.IsChatMembersPaginationEnabled else false
	end,
	getChatConversationRenderingFixEnabled = function() --[[ Line: 31 ]]
		-- upvalues: AppChatPerfExperimentLayer (copy), ExperimentCacheManager (copy)
		local LayerVariables = ExperimentCacheManager.default:getLayerVariables(AppChatPerfExperimentLayer)
		
		return if LayerVariables and LayerVariables.IsChatConversationRenderingFixEnabled ~= nil then LayerVariables.IsChatConversationRenderingFixEnabled else false
	end,
	logExposure = function() --[[ Line: 35 ]]
		-- upvalues: AppChatPerfExperimentLayer (copy), ExperimentCacheManager (copy)
		if ExperimentCacheManager.default:getLayerVariables(AppChatPerfExperimentLayer) ~= nil then
			ExperimentCacheManager.default:logLayerExposure(AppChatPerfExperimentLayer)
		end
	end
}