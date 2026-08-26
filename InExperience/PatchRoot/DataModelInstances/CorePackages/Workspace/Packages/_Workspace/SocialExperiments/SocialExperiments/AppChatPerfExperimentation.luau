local experimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local appChatPerfExperimentLayer = game:DefineFastString("AppChatPerfExperimentLayer", "Party.Chat.Perf")

local function _(p1)
	-- upvalues: appChatPerfExperimentLayer (ref), experimentCacheManager (ref)
	local var1 = experimentCacheManager.default:getLayerVariables(appChatPerfExperimentLayer)
	
	return if var1 and var1[p1] ~= nil then var1[p1] else false
end

return {
	getChatLandingPaginationEnabled = function()
		-- upvalues: appChatPerfExperimentLayer (ref), experimentCacheManager (ref)
		local var1 = experimentCacheManager.default:getLayerVariables(appChatPerfExperimentLayer)
		
		return if var1 and var1.IsChatLandingPaginationEnabled ~= nil then var1.IsChatLandingPaginationEnabled else false
	end,
	getChatConversationPaginationEnabled = function()
		-- upvalues: appChatPerfExperimentLayer (ref), experimentCacheManager (ref)
		local var1 = experimentCacheManager.default:getLayerVariables(appChatPerfExperimentLayer)
		
		return if var1 and var1.IsChatConversationPaginationEnabled ~= nil then var1.IsChatConversationPaginationEnabled else false
	end,
	getChatMembersPaginationEnabled = function()
		-- upvalues: appChatPerfExperimentLayer (ref), experimentCacheManager (ref)
		local var1 = experimentCacheManager.default:getLayerVariables(appChatPerfExperimentLayer)
		
		return if var1 and var1.IsChatMembersPaginationEnabled ~= nil then var1.IsChatMembersPaginationEnabled else false
	end,
	getChatConversationRenderingFixEnabled = function()
		-- upvalues: appChatPerfExperimentLayer (ref), experimentCacheManager (ref)
		local var1 = experimentCacheManager.default:getLayerVariables(appChatPerfExperimentLayer)
		
		return if var1 and var1.IsChatConversationRenderingFixEnabled ~= nil then var1.IsChatConversationRenderingFixEnabled else false
	end,
	logExposure = function()
		-- upvalues: appChatPerfExperimentLayer (ref), experimentCacheManager (ref)
		if experimentCacheManager.default:getLayerVariables(appChatPerfExperimentLayer) ~= nil then
			experimentCacheManager.default:logLayerExposure(appChatPerfExperimentLayer)
		end
	end
}