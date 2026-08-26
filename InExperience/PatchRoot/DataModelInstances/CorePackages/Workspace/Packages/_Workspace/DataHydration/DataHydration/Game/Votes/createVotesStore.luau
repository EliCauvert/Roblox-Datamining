local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local cryoModule = require(parent.Cryo)
local dashModule = require(parent.Dash)
local signalsModule = require(parent.Signals)
local httpService = game:GetService("HttpService")
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local votesStoreTypesModule = require(script.Parent.VotesStoreTypes)
local votesUtilsModule = require(script.Parent.VotesUtils)
local discoveryUtilsModule = require(parent.DiscoveryUtils)
local statusCodes = require(parent.Http).StatusCodes
local logResponseError = discoveryUtilsModule.logResponseError
local discoveryEventErrorLogger = discoveryUtilsModule.DiscoveryEventErrorLogger
local fetchVotesModule = require(script.Parent.fetchVotes)
local fetchUserVoteModule = require(script.Parent.fetchUserVote)
local requestUserVoteUpdateModule = require(script.Parent.requestUserVoteUpdate)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppDataHydrationVotesStoreTrackOptimisticVotes = sharedFlagsModule.FFlagLuaAppDataHydrationVotesStoreTrackOptimisticVotes
local fFlagLuaAppDataHydrationOptimisticMutationLayer = sharedFlagsModule.FFlagLuaAppDataHydrationOptimisticMutationLayer
local reasonNotVoteable = votesStoreTypesModule.ReasonNotVoteable
local fFlagLuaAppInExperienceDetailsPrompt = require(parent.SharedFlags).FFlagLuaAppInExperienceDetailsPrompt
local fFlagLuaAppDataHydrationUpdateItem = sharedFlagsModule.FFlagLuaAppDataHydrationUpdateItem
local fFlagLuaAppVoteOptimisticUpdateRaceFix = sharedFlagsModule.FFlagLuaAppVoteOptimisticUpdateRaceFix
local getGameInfoStoreModule = require(dataHydration.Game.GameInfo.getGameInfoStore)
local fFlagSduiExperienceDetailsSupport = sharedFlagsModule.FFlagSduiExperienceDetailsSupport
local user_vote_cache_ttl_seconds = game:DefineFastInt("USER_VOTE_CACHE_TTL_SECONDS", 600)

return function()
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), dashModule (ref), fetchVotesModule (ref), fFlagLuaAppInExperienceDetailsPrompt (ref), votesUtilsModule (ref), user_vote_cache_ttl_seconds (ref), logResponseError (ref), fetchUserVoteModule (ref), votesStoreTypesModule (ref), discoveryEventErrorLogger (ref), fFlagLuaAppDataHydrationOptimisticMutationLayer (ref), signalsModule (ref), fFlagLuaAppVoteOptimisticUpdateRaceFix (ref), cryoModule (ref), fFlagLuaAppDataHydrationVotesStoreTrackOptimisticVotes (ref), fFlagSduiExperienceDetailsSupport (ref), getGameInfoStoreModule (ref), requestUserVoteUpdateModule (ref), httpService (ref), reasonNotVoteable (ref), statusCodes (ref), fFlagLuaAppDataHydrationUpdateItem (ref)
	local var1 = createDataCacheModule()
	local var2 = createDataResolverModule({
		cache = var1,
		fetchFn = function(p1)
			-- upvalues: dashModule (copy), fetchVotesModule (copy), fFlagLuaAppInExperienceDetailsPrompt (copy), votesUtilsModule (copy)
			return fetchVotesModule(dashModule.keys(p1)):andThen(function(p2)
				-- upvalues: fFlagLuaAppInExperienceDetailsPrompt (copy), dashModule (copy), votesUtilsModule (copy)
				if not p2 then
					error("No response")
				end
				if not p2.responseBody or not p2.responseBody.data then
					if fFlagLuaAppInExperienceDetailsPrompt then
						error(`Response Code: {p2.responseCode}`)
					else
						error(`Response Code: {p2.reponseCode}`)
					end
				end
				local t = {}
				dashModule.forEach(p2.responseBody.data, function(p3)
					-- upvalues: votesUtilsModule (copy), t (ref)
					local var3 = nil
					local upVotes = p3.upVotes
					local downVotes = p3.downVotes
					
					if typeof(upVotes) == "number" and typeof(downVotes) == "number" then
						var3 = votesUtilsModule.calculateRating(upVotes, downVotes)
					end
					t[tostring(p3.id)] = { upVotes = upVotes, downVotes = downVotes, rating = var3 }
				end)
				
				return t
			end):catch(function(p2)
				error(`Error requesting votes: {p2}`)
			end)
		end
	})
	local var3 = createDataCacheModule(user_vote_cache_ttl_seconds)
	local var4 = createDataResolverModule({
		supportsMultiGet = false,
		cache = var3,
		logError = function(p1)
			-- upvalues: logResponseError (copy)
			logResponseError("v1/games/votes/user", p1)
		end,
		fetchFn = function(p1, _)
			-- upvalues: fetchUserVoteModule (copy), votesStoreTypesModule (copy), discoveryEventErrorLogger (copy)
			return fetchUserVoteModule(p1):andThen(function(p2)
				-- upvalues: votesStoreTypesModule (copy), discoveryEventErrorLogger (copy), p1 (ref)
				local responseBody = p2.responseBody
				
				if not votesStoreTypesModule.userVoteResponseValidator(responseBody) then
					discoveryEventErrorLogger.reportError("createVotesStore", "Invalid user vote response", { universeId = p1, responseBody = responseBody })
					error({ StatusCode = p2.responseCode })
				end
				return responseBody
			end)
		end,
		supportsMutations = fFlagLuaAppDataHydrationOptimisticMutationLayer
	})
	
	return {
		fetchVote = var2.fetchItem,
		fetchVotes = var2.fetchItems,
		getVote = var2.getCachedItem,
		getVotes = var2.getCachedItems,
		getAndFetchVote = var2.getAndFetchItem,
		getAndFetchVotes = var2.getAndFetchItems,
		fetchUserVote = var4.fetchItem,
		fetchUserVotes = var4.fetchItems,
		getUserVote = if fFlagLuaAppDataHydrationOptimisticMutationLayer then var4.getOptimisticCachedItem else var4.getCachedItem,
		getUserVotes = if fFlagLuaAppDataHydrationOptimisticMutationLayer then var4.getOptimisticCachedItems else var4.getCachedItems,
		getAndFetchUserVote = if fFlagLuaAppDataHydrationOptimisticMutationLayer then var4.getOptimisticAndFetchItem else var4.getAndFetchItem,
		getAndFetchUserVotes = if fFlagLuaAppDataHydrationOptimisticMutationLayer then var4.getOptimisticAndFetchItems else var4.getAndFetchItems,
		updateUserVote = function(p1, p2)
			-- upvalues: signalsModule (copy), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var4 (ref), var3 (ref), var1 (ref), fFlagLuaAppVoteOptimisticUpdateRaceFix (copy), cryoModule (copy), fFlagLuaAppDataHydrationVotesStoreTrackOptimisticVotes (copy), votesUtilsModule (copy), fFlagSduiExperienceDetailsSupport (copy), getGameInfoStoreModule (copy), requestUserVoteUpdateModule (copy), httpService (copy), votesStoreTypesModule (copy), reasonNotVoteable (copy), statusCodes (copy), discoveryEventErrorLogger (copy), logResponseError (copy)
			local var5, var6
			local var7, var8 = signalsModule.createSignal(nil)
			local _ = nil
			local _ = nil
			
			if fFlagLuaAppDataHydrationOptimisticMutationLayer then
				local optimisticCachedItem, optimisticCachedItem_1 = var4.getOptimisticCachedItem(p1)
				var5 = optimisticCachedItem
				var6 = optimisticCachedItem_1
			else
				local item, item_1 = var3.getItem(p1)
				var5 = item
				var6 = item_1
			end
			local var9 = var5 and var5.data(false)
			local var10 = if var9 then var9.userVote else nil
			local item = var1.getItem(p1)
			local var11 = item and item.data(false)
			
			if fFlagLuaAppVoteOptimisticUpdateRaceFix then
				if not var6 and var9 and not var9.canVote then
					var8({
						type = "error",
						reasonForNotVoteable = var9.reasonForNotVoteable
					})
					
					return var7
				elseif fFlagLuaAppDataHydrationOptimisticMutationLayer then
					var4.setMutation(p1, { userVote = if p2 == nil then cryoModule.None else p2 })
				else
					var3.replaceItem(p1, {
						canVote = if var9 then var9.canVote else nil,
						reasonForNotVoteable = if var9 then var9.reasonForNotVoteable else nil,
						userVote = p2
					})
				end
				if var11 then
					local var12, var13
					local _ = nil
					local _ = nil
					
					if fFlagLuaAppDataHydrationVotesStoreTrackOptimisticVotes then
						var12 = (if p2 == true then 1 else 0) - (if var10 == true then 1 else 0)
						var13 = (if p2 == false then 1 else 0) - (if var10 == false then 1 else 0)
					else
						var12 = if p2 == true then 1 else 0
						var13 = if p2 == false then 1 else 0
					end
					local var14 = var11.upVotes + var12
					local var15 = var11.downVotes + var13
					
					if fFlagLuaAppDataHydrationVotesStoreTrackOptimisticVotes then
						var14 = math.max(0, var14)
						var15 = math.max(0, var15)
					end
					var1.updateItem(p1, {
						upVotes = var14,
						downVotes = var15,
						rating = votesUtilsModule.calculateRating(var14, var15)
					})
				end
				local var16 = if fFlagSduiExperienceDetailsSupport then getGameInfoStoreModule(false).applyVoteChange(p1, var10, p2) else nil
				requestUserVoteUpdateModule(p1, p2):andThen(function(_)
					-- upvalues: fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var4 (copy), p1 (ref), var8 (ref), p2 (ref)
					if fFlagLuaAppDataHydrationOptimisticMutationLayer then
						var4.commitMutation(p1)
					end
					var8({ type = "success", userVote = p2 })
				end):catch(function(p3)
					-- upvalues: fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var4 (copy), p1 (ref), var9 (ref), var3 (copy), var10 (ref), var11 (ref), var1 (copy), fFlagSduiExperienceDetailsSupport (copy), var16 (write), getGameInfoStoreModule (copy), httpService (copy), votesStoreTypesModule (copy), reasonNotVoteable (copy), statusCodes (copy), var8 (ref), discoveryEventErrorLogger (copy), logResponseError (copy)
					if fFlagLuaAppDataHydrationOptimisticMutationLayer then
						var4.clearMutation(p1)
					else
						var3.replaceItem(p1, {
							canVote = if var9 then var9.canVote else nil,
							reasonForNotVoteable = if var9 then var9.reasonForNotVoteable else nil,
							userVote = var10
						})
					end
					if var11 then
						var1.updateItem(p1, var11)
					end
					if fFlagSduiExperienceDetailsSupport and var16 then
						getGameInfoStoreModule(false).updateGameInfo(p1, var16)
					end
					local var17 = if type(p3) == "table" and p3.StatusCode then p3.StatusCode else nil
					local floodCheckThresholdMet = nil
					
					if var17 then
						local ok, status = pcall(function()
							-- upvalues: httpService (copy), p3 (ref)
							return httpService:JSONDecode(p3.Body)
						end)
						
						if ok and status and status.errors then
							for i, v in ipairs(status.errors) do
								if v.code == votesStoreTypesModule.PLAY_GAME_ERROR_CODE then
									floodCheckThresholdMet = reasonNotVoteable.PlayGame
								end
							end
						end
						if var17 == statusCodes.TOO_MANY_REQUESTS then
							floodCheckThresholdMet = reasonNotVoteable.FloodCheckThresholdMet
						end
					end
					var8({
						type = "error",
						reasonForNotVoteable = floodCheckThresholdMet
					})
					discoveryEventErrorLogger.reportError("updateUserVote", "Error updating user vote", {
						universeId = p1,
						statusCode = var17,
						statusMessage = if type(p3) == "table" and p3.StatusMessage then p3.StatusMessage else nil
					})
					logResponseError("v1/games/votes/user-votes", { StatusCode = var17 })
				end)
				
				return var7
			elseif var6 then
				var4.fetchItem(p1)
			elseif var9 and not var9.canVote then
				var8({
					type = "error",
					reasonForNotVoteable = var9.reasonForNotVoteable
				})
				
				return var7
			end
		end,
		updateVoteItem = if fFlagLuaAppDataHydrationUpdateItem then function(p3, p4, p5)
			-- upvalues: var1 (ref), votesUtilsModule (copy)
			var1.updateItem(p3, {
				downVotes = p4,
				upVotes = p5,
				rating = votesUtilsModule.calculateRating(p5, p4)
			})
		end else nil,
		updateVoteItems = function(p3)
			-- upvalues: votesUtilsModule (copy), var1 (ref)
			local t = {}
			
			for i, v in p3 do
				t[i] = {
					upVotes = v.upVotes,
					downVotes = v.downVotes,
					rating = votesUtilsModule.calculateRating(v.upVotes, v.downVotes)
				}
			end
			var1.updateItems(t)
		end,
		updateUserVoteItem = if fFlagLuaAppDataHydrationUpdateItem then var3.updateItem else nil,
		updateUserVoteItems = var3.updateItems,
		clear = function()
			-- upvalues: var1 (ref), var2 (ref), var3 (ref), var4 (ref)
			var1.clear()
			var2.clear()
			var3.clear()
			var4.clear()
		end,
		dispose = function()
			-- upvalues: var1 (ref), var2 (ref), var4 (ref)
			var1.dispose()
			var2.dispose()
			var4.dispose()
		end
	}
end