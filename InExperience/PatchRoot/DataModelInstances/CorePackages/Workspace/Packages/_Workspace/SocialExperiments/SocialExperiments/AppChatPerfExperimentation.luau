local experimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local appChatPerfExperimentLayer = game:DefineFastString("AppChatPerfExperimentLayer", "Party.Chat.Perf")

local function _(p0)
	-- upvalues: appChatPerfExperimentLayer (ref), experimentCacheManager (ref)
	local var1 = experimentCacheManager.default:getLayerVariables(appChatPerfExperimentLayer)
	
	return if var1 and var1[p0] ~= nil then var1[p0] else false
end

return {
	getChatLandingPaginationEnabled = function()
		-- upvalues: appChatPerfExperimentLayer (ref), experimentCacheManager (ref)
		local var2 = experimentCacheManager.default:getLayerVariables(appChatPerfExperimentLayer)
		
		return if var2 and var2.IsChatLandingPaginationEnabled ~= nil then var2.IsChatLandingPaginationEnabled else false
	end,
	getChatConversationPaginationEnabled = function()
		-- upvalues: appChatPerfExperimentLayer (ref), experimentCacheManager (ref)
		local var3 = experimentCacheManager.default:getLayerVariables(appChatPerfExperimentLayer)
		
		return if var3 and var3.IsChatConversationPaginationEnabled ~= nil then var3.IsChatConversationPaginationEnabled else false
	end,
	getChatMembersPaginationEnabled = function()
		-- upvalues: appChatPerfExperimentLayer (ref), experimentCacheManager (ref)
		local var4 = experimentCacheManager.default:getLayerVariables(appChatPerfExperimentLayer)
		
		return if var4 and var4.IsChatMembersPaginationEnabled ~= nil then var4.IsChatMembersPaginationEnabled else false
	end,
	getChatConversationRenderingFixEnabled = function()
		-- upvalues: appChatPerfExperimentLayer (ref), experimentCacheManager (ref)
		local var5 = experimentCacheManager.default:getLayerVariables(appChatPerfExperimentLayer)
		
		return if var5 and var5.IsChatConversationRenderingFixEnabled ~= nil then var5.IsChatConversationRenderingFixEnabled else false
	end,
	logExposure = function()
		-- upvalues: appChatPerfExperimentLayer (ref), experimentCacheManager (ref)
		if experimentCacheManager.default:getLayerVariables(appChatPerfExperimentLayer) ~= nil then
			experimentCacheManager.default:logLayerExposure(appChatPerfExperimentLayer)
		end
	end
}