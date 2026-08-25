local discoveryUtils = script:FindFirstAncestor("DiscoveryUtils")
local discoveryClientAppStorageModule = require(discoveryUtils.DiscoveryClientAppStorage)
local discoveryEventErrorLoggerModule = require(discoveryUtils.Telemetry.DiscoveryEventErrorLogger)
local luaAppOmniRecommendationsTopicIdAndNumberOfItemsToCache = game:DefineFastString("LuaAppOmniRecommendationsTopicIdAndNumberOfItemsToCache", `{100000000}:20,{100000001}:20,{100000003}:20`)

return {
	HOME_OMNI_FEED_CACHE_VERSION = 2,
	cacheOmniRecommendationsData = function(p0)
		-- upvalues: luaAppOmniRecommendationsTopicIdAndNumberOfItemsToCache (ref), discoveryClientAppStorageModule (ref), discoveryEventErrorLoggerModule (ref)
		assert(p0.pageType, "pageType is required")
		assert(p0.sorts, "sorts is required")
		assert(p0.contentMetadata, "contentMetadata is required")
		assert(p0.contentMetadata.Game, "contentMetadata.Game is required")
		task.spawn(function()
			-- upvalues: luaAppOmniRecommendationsTopicIdAndNumberOfItemsToCache (copy), p0 (ref), discoveryClientAppStorageModule (copy), discoveryEventErrorLoggerModule (copy)
			local ok, status = pcall(function()
				-- upvalues: luaAppOmniRecommendationsTopicIdAndNumberOfItemsToCache (copy), p0 (copy), discoveryClientAppStorageModule (copy)
				local t = {}
				
				for i, v in string.split(luaAppOmniRecommendationsTopicIdAndNumberOfItemsToCache, ",") do
					local parts = string.split(v, ":")
					local var13 = tonumber(parts[1])
					local var14 = tonumber(parts[2])
					
					if var13 and var14 then
						t[var13] = { count = 0, cap = var14 }
					end
				end
				local t_1 = {}
				
				for i_1, v_1 in p0.sorts do
					local topicId = t[v_1.topicId]
					
					if topicId ~= nil and v_1.recommendationList ~= nil then
						local cloned = table.clone(v_1)
						
						if topicId.cap > topicId.count then
							local t_2 = {}
							
							for i_2, v_2 in v_1.recommendationList do
								if topicId.cap <= topicId.count then break end
								table.insert(t_2, v_2)
								topicId.count += 1
							end
							cloned.recommendationList = t_2
							table.insert(t_1, cloned)
						end
					end
				end
				local t_2 = {}
				
				for i_2, v_2 in ipairs(t_1) do
					for i_3, v_3 in ipairs(v_2.recommendationList) do
						if v_3.contentType == "Game" then
							local var7 = tostring(v_3.contentId)
							local var8 = p0.contentMetadata.Game[var7]
							
							if var8 then
								local cloned = table.clone(var8)
								cloned.playerCount = nil
								t_2[var7] = cloned
							end
						end
					end
				end
				discoveryClientAppStorageModule.setJsonStorageData(discoveryClientAppStorageModule.CacheKey.HomeOmniFeedCache, {
					pageType = p0.pageType,
					sorts = t_1,
					contentMetadata = { Game = t_2 }
				}, 2)
			end)
			
			if not ok then
				discoveryEventErrorLoggerModule.reportError("HomeOmniFeedCacheError", status)
			end
		end)
	end
}