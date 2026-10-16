local DiscoveryUtils = script:FindFirstAncestor("DiscoveryUtils")
local DiscoveryClientAppStorageModule = require(DiscoveryUtils.DiscoveryClientAppStorage)
local DiscoveryEventErrorLoggerModule = require(DiscoveryUtils.Telemetry.DiscoveryEventErrorLogger)
local LuaAppOmniRecommendationsTopicIdAndNumberOfItemsToCache = game:DefineFastString("LuaAppOmniRecommendationsTopicIdAndNumberOfItemsToCache", `{100000000}:20,{100000001}:20,{100000003}:20`)

return {
	HOME_OMNI_FEED_CACHE_VERSION = 2,
	HOME_SDUI_FEED_CACHE_VERSION = 3,
	cacheOmniRecommendationsData = function(p1) --[[ Line: 37 ]]
		-- upvalues: LuaAppOmniRecommendationsTopicIdAndNumberOfItemsToCache (copy), DiscoveryClientAppStorageModule (copy), DiscoveryEventErrorLoggerModule (copy)
		assert(p1.pageType, "pageType is required")
		assert(p1.sorts, "sorts is required")
		assert(p1.contentMetadata, "contentMetadata is required")
		assert(p1.contentMetadata.Game, "contentMetadata.Game is required")
		task.spawn(function() --[[ Line: 43 ]]
			-- upvalues: LuaAppOmniRecommendationsTopicIdAndNumberOfItemsToCache (upval), p1 (copy), DiscoveryClientAppStorageModule (upval), DiscoveryEventErrorLoggerModule (upval)
			local Success, Result = pcall(function() --[[ Line: 44 ]]
				-- upvalues: LuaAppOmniRecommendationsTopicIdAndNumberOfItemsToCache (upval), p1 (upval), DiscoveryClientAppStorageModule (upval)
				local t = {}
				
				for _, value in string.split(LuaAppOmniRecommendationsTopicIdAndNumberOfItemsToCache, ",") do
					local Parts = string.split(value, ":")
					local Number: number? = tonumber(Parts[1])
					local Number1: number? = tonumber(Parts[2])
					
					if Number and Number1 then
						t[Number] = { count = 0, cap = Number1 }
					end
				end
				local Sorts = {}
				
				for _, sort in p1.sorts do
					local Entry = t[sort.topicId]
					local NoEntry: boolean = Entry == nil or sort.recommendationList == nil
					local Copy = nil
					
					if not NoEntry then
						Copy = table.clone(sort)
						NoEntry = Entry.cap <= Entry.count
					end
					if not NoEntry then
						local RecommendationList = {}
						
						for _, value1 in sort.recommendationList do
							if Entry.cap <= Entry.count then break end
							table.insert(RecommendationList, value1)
							Entry.count += 1
						end
						Copy.recommendationList = RecommendationList
						table.insert(Sorts, Copy)
					end
				end
				local Game1 = {}
				
				for _, sort1 in ipairs(Sorts) do
					for _, value2 in ipairs(sort1.recommendationList) do
						if value2.contentType == "Game" then
							local Text = tostring(value2.contentId)
							local GameEntry = p1.contentMetadata.Game[Text]
							
							if GameEntry then
								local Copy = table.clone(GameEntry)
								Copy.playerCount = nil
								Game1[Text] = Copy
							end
						end
					end
				end
				DiscoveryClientAppStorageModule.setJsonStorageData(DiscoveryClientAppStorageModule.CacheKey.HomeOmniFeedCache, {
					pageType = p1.pageType,
					sorts = Sorts,
					contentMetadata = { Game = Game1 }
				}, 2)
			end)
			
			if not Success then
				DiscoveryEventErrorLoggerModule.reportError("HomeOmniFeedCacheError", Result)
			end
		end)
	end,
	getTopicIdToNumCacheItems = function() --[[ Line: 23 ]]
		-- upvalues: LuaAppOmniRecommendationsTopicIdAndNumberOfItemsToCache (copy)
		local t = {}
		
		for _, value in string.split(LuaAppOmniRecommendationsTopicIdAndNumberOfItemsToCache, ",") do
			local Parts = string.split(value, ":")
			local Number: number? = tonumber(Parts[1])
			local Number1: number? = tonumber(Parts[2])
			
			if Number and Number1 then
				t[tostring(Number)] = { count = 0, cap = Number1 }
			end
		end
		return t
	end,
	cacheSduiHomePageData = function(p2) --[[ Line: 117 ]]
		-- upvalues: DiscoveryClientAppStorageModule (copy), DiscoveryEventErrorLoggerModule (copy)
		task.spawn(function() --[[ Line: 118 ]]
			-- upvalues: DiscoveryClientAppStorageModule (upval), p2 (copy), DiscoveryEventErrorLoggerModule (upval)
			local Success, Result = pcall(function() --[[ Line: 119 ]]
				-- upvalues: DiscoveryClientAppStorageModule (upval), p2 (upval)
				DiscoveryClientAppStorageModule.setJsonStorageData(DiscoveryClientAppStorageModule.CacheKey.HomeOmniFeedCache, p2, 3)
			end)
			
			if not Success then
				DiscoveryEventErrorLoggerModule.reportError("HomeSduiFeedCacheError", Result)
			end
		end)
	end,
	getCachedSduiHomePageData = function() --[[ Line: 132 ]]
		-- upvalues: DiscoveryClientAppStorageModule (copy)
		local JsonStorageData = DiscoveryClientAppStorageModule.getJsonStorageData(DiscoveryClientAppStorageModule.CacheKey.HomeOmniFeedCache, 3)
		
		return if type(JsonStorageData) == "string" then JsonStorageData else nil
	end
}