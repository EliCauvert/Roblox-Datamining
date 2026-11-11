local ExperimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local AppChatPerfExperimentLayer = game:DefineFastString("AppChatPerfExperimentLayer", "Party.Chat.Perf")

local function _(p1)
	-- upvalues: AppChatPerfExperimentLayer (copy), ExperimentCacheManager (copy)
	local LayerVariables = ExperimentCacheManager.default:getLayerVariables(AppChatPerfExperimentLayer)
	
	return if LayerVariables and LayerVariables[p1] ~= nil then LayerVariables[p1] else false
end

return {
	getChatLandingPaginationEnabled = function()
		-- upvalues: AppChatPerfExperimentLayer (copy), ExperimentCacheManager (copy)
		local LayerVariables = ExperimentCacheManager.default:getLayerVariables(AppChatPerfExperimentLayer)
		
		return if LayerVariables and LayerVariables.IsChatLandingPaginationEnabled ~= nil then LayerVariables.IsChatLandingPaginationEnabled else false
	end,
	getChatConversationPaginationEnabled = function()
		-- upvalues: AppChatPerfExperimentLayer (copy), ExperimentCacheManager (copy)
		local LayerVariables = ExperimentCacheManager.default:getLayerVariables(AppChatPerfExperimentLayer)
		
		return if LayerVariables and LayerVariables.IsChatConversationPaginationEnabled ~= nil then LayerVariables.IsChatConversationPaginationEnabled else false
	end,
	getChatMembersPaginationEnabled = function()
		-- upvalues: AppChatPerfExperimentLayer (copy), ExperimentCacheManager (copy)
		local LayerVariables = ExperimentCacheManager.default:getLayerVariables(AppChatPerfExperimentLayer)
		
		return if LayerVariables and LayerVariables.IsChatMembersPaginationEnabled ~= nil then LayerVariables.IsChatMembersPaginationEnabled else false
	end,
	getChatConversationRenderingFixEnabled = function()
		-- upvalues: AppChatPerfExperimentLayer (copy), ExperimentCacheManager (copy)
		local LayerVariables = ExperimentCacheManager.default:getLayerVariables(AppChatPerfExperimentLayer)
		
		return if LayerVariables and LayerVariables.IsChatConversationRenderingFixEnabled ~= nil then LayerVariables.IsChatConversationRenderingFixEnabled else false
	end,
	logExposure = function()
		-- upvalues: AppChatPerfExperimentLayer (copy), ExperimentCacheManager (copy)
		if ExperimentCacheManager.default:getLayerVariables(AppChatPerfExperimentLayer) ~= nil then
			ExperimentCacheManager.default:logLayerExposure(AppChatPerfExperimentLayer)
		end
	end
}