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

return function() --[[ line: 42 | named "createVotesStore" ]]
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), dashModule (ref), fetchVotesModule (ref), fFlagLuaAppInExperienceDetailsPrompt (ref), votesUtilsModule (ref), user_vote_cache_ttl_seconds (ref), logResponseError (ref), fetchUserVoteModule (ref), votesStoreTypesModule (ref), discoveryEventErrorLogger (ref), fFlagLuaAppDataHydrationOptimisticMutationLayer (ref), signalsModule (ref), fFlagLuaAppVoteOptimisticUpdateRaceFix (ref), cryoModule (ref), fFlagLuaAppDataHydrationVotesStoreTrackOptimisticVotes (ref), fFlagSduiExperienceDetailsSupport (ref), getGameInfoStoreModule (ref), requestUserVoteUpdateModule (ref), httpService (ref), reasonNotVoteable (ref), statusCodes (ref), fFlagLuaAppDataHydrationUpdateItem (ref)
	local var16 = createDataCacheModule()
	local var17 = createDataResolverModule({
		cache = var16,
		fetchFn = function(p0) --[[ line: 46 ]]
			-- upvalues: dashModule (copy), fetchVotesModule (copy), fFlagLuaAppInExperienceDetailsPrompt (copy), votesUtilsModule (copy)
			return fetchVotesModule(dashModule.keys(p0)):andThen(function(p2) --[[ line: 51 ]]
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
				dashModule.forEach(p2.responseBody.data, function(p3) --[[ line: 65 ]]
					-- upvalues: votesUtilsModule (copy), t (ref)
					local var21 = nil
					local upVotes = p3.upVotes
					local downVotes = p3.downVotes
					
					if typeof(upVotes) == "number" and typeof(downVotes) == "number" then
						var21 = votesUtilsModule.calculateRating(upVotes, downVotes)
					end
					t[tostring(p3.id)] = { upVotes = upVotes, downVotes = downVotes, rating = var21 }
				end)
				
				return t
			end):catch(function(p1) --[[ line: 81 ]]
				error(`Error requesting votes: {p1}`)
			end)
		end
	})
	local var18 = createDataCacheModule(user_vote_cache_ttl_seconds)
	local var19 = createDataResolverModule({
		supportsMultiGet = false,
		cache = var18,
		logError = function(p4) --[[ line: 92 ]]
			-- upvalues: logResponseError (copy)
			logResponseError("v1/games/votes/user", p4)
		end,
		fetchFn = function(p5, _) --[[ line: 95 ]]
			-- upvalues: fetchUserVoteModule (copy), votesStoreTypesModule (copy), discoveryEventErrorLogger (copy)
			return fetchUserVoteModule(p5):andThen(function(p6) --[[ line: 99 ]]
				-- upvalues: votesStoreTypesModule (copy), discoveryEventErrorLogger (copy), p5 (ref)
				local responseBody = p6.responseBody
				
				if not votesStoreTypesModule.userVoteResponseValidator(responseBody) then
					discoveryEventErrorLogger.reportError("createVotesStore", "Invalid user vote response", { universeId = p5, responseBody = responseBody })
					error({ StatusCode = p6.responseCode })
				end
				return responseBody
			end)
		end,
		supportsMutations = fFlagLuaAppDataHydrationOptimisticMutationLayer
	})
	
	return {
		fetchVote = var17.fetchItem,
		fetchVotes = var17.fetchItems,
		getVote = var17.getCachedItem,
		getVotes = var17.getCachedItems,
		getAndFetchVote = var17.getAndFetchItem,
		getAndFetchVotes = var17.getAndFetchItems,
		fetchUserVote = var19.fetchItem,
		fetchUserVotes = var19.fetchItems,
		getUserVote = if fFlagLuaAppDataHydrationOptimisticMutationLayer then var19.getOptimisticCachedItem else var19.getCachedItem,
		getUserVotes = if fFlagLuaAppDataHydrationOptimisticMutationLayer then var19.getOptimisticCachedItems else var19.getCachedItems,
		getAndFetchUserVote = if fFlagLuaAppDataHydrationOptimisticMutationLayer then var19.getOptimisticAndFetchItem else var19.getAndFetchItem,
		getAndFetchUserVotes = if fFlagLuaAppDataHydrationOptimisticMutationLayer then var19.getOptimisticAndFetchItems else var19.getAndFetchItems,
		updateUserVote = function(p7, p8) --[[ line: 116 ]]
			-- upvalues: signalsModule (copy), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var19 (ref), var18 (ref), var16 (ref), fFlagLuaAppVoteOptimisticUpdateRaceFix (copy), cryoModule (copy), fFlagLuaAppDataHydrationVotesStoreTrackOptimisticVotes (copy), votesUtilsModule (copy), fFlagSduiExperienceDetailsSupport (copy), getGameInfoStoreModule (copy), requestUserVoteUpdateModule (copy), httpService (copy), votesStoreTypesModule (copy), reasonNotVoteable (copy), statusCodes (copy), discoveryEventErrorLogger (copy), logResponseError (copy)
			local var26, var27
			local var22, var23 = signalsModule.createSignal(nil)
			local _ = nil
			local _ = nil
			
			if fFlagLuaAppDataHydrationOptimisticMutationLayer then
				local optimisticCachedItem, optimisticCachedItem_1 = var19.getOptimisticCachedItem(p7)
				var26 = optimisticCachedItem
				var27 = optimisticCachedItem_1
			else
				local item, item_1 = var18.getItem(p7)
				var26 = item
				var27 = item_1
			end
			local var30 = var26 and var26.data(false)
			local var31 = if var30 then var30.userVote else nil
			local item = var16.getItem(p7)
			local var33 = item and item.data(false)
			
			if fFlagLuaAppVoteOptimisticUpdateRaceFix then
				if not var27 and var30 and not var30.canVote then
					var23({
						type = "error",
						reasonForNotVoteable = var30.reasonForNotVoteable
					})
					
					return var22
				elseif fFlagLuaAppDataHydrationOptimisticMutationLayer then
					var19.setMutation(p7, { userVote = if p8 == nil then cryoModule.None else p8 })
				else
					var18.replaceItem(p7, {
						canVote = if var30 then var30.canVote else nil,
						reasonForNotVoteable = if var30 then var30.reasonForNotVoteable else nil,
						userVote = p8
					})
				end
				if var33 then
					local var34, var35
					local _ = nil
					local _ = nil
					
					if fFlagLuaAppDataHydrationVotesStoreTrackOptimisticVotes then
						var34 = (if p8 == true then 1 else 0) - (if var31 == true then 1 else 0)
						var35 = (if p8 == false then 1 else 0) - (if var31 == false then 1 else 0)
					else
						var34 = if p8 == true then 1 else 0
						var35 = if p8 == false then 1 else 0
					end
					local var36 = var33.upVotes + var34
					local var37 = var33.downVotes + var35
					
					if fFlagLuaAppDataHydrationVotesStoreTrackOptimisticVotes then
						var36 = math.max(0, var36)
						var37 = math.max(0, var37)
					end
					var16.updateItem(p7, {
						upVotes = var36,
						downVotes = var37,
						rating = votesUtilsModule.calculateRating(var36, var37)
					})
				end
				local var38 = if fFlagSduiExperienceDetailsSupport then getGameInfoStoreModule(false).applyVoteChange(p7, var31, p8) else nil
				requestUserVoteUpdateModule(p7, p8):andThen(function(_) --[[ line: 219 ]]
					-- upvalues: fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var19 (copy), p7 (ref), var23 (ref), p8 (ref)
					if fFlagLuaAppDataHydrationOptimisticMutationLayer then
						var19.commitMutation(p7)
					end
					var23({ type = "success", userVote = p8 })
				end):catch(function(p9) --[[ line: 228 ]]
					-- upvalues: fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var19 (copy), p7 (ref), var30 (ref), var18 (copy), var31 (ref), var33 (ref), var16 (copy), fFlagSduiExperienceDetailsSupport (copy), var38 (write), getGameInfoStoreModule (copy), httpService (copy), votesStoreTypesModule (copy), reasonNotVoteable (copy), statusCodes (copy), var23 (ref), discoveryEventErrorLogger (copy), logResponseError (copy)
					if fFlagLuaAppDataHydrationOptimisticMutationLayer then
						var19.clearMutation(p7)
					else
						var18.replaceItem(p7, {
							canVote = if var30 then var30.canVote else nil,
							reasonForNotVoteable = if var30 then var30.reasonForNotVoteable else nil,
							userVote = var31
						})
					end
					if var33 then
						var16.updateItem(p7, var33)
					end
					if fFlagSduiExperienceDetailsSupport and var38 then
						getGameInfoStoreModule(false).updateGameInfo(p7, var38)
					end
					local var39 = if type(p9) == "table" and p9.StatusCode then p9.StatusCode else nil
					local floodCheckThresholdMet = nil
					
					if var39 then
						local ok, status = pcall(function() --[[ line: 259 ]]
							-- upvalues: httpService (copy), p9 (ref)
							return httpService:JSONDecode(p9.Body)
						end)
						
						if ok and status and status.errors then
							for i, v in ipairs(status.errors) do
								if v.code == votesStoreTypesModule.PLAY_GAME_ERROR_CODE then
									floodCheckThresholdMet = reasonNotVoteable.PlayGame
								end
							end
						end
						if var39 == statusCodes.TOO_MANY_REQUESTS then
							floodCheckThresholdMet = reasonNotVoteable.FloodCheckThresholdMet
						end
					end
					var23({
						type = "error",
						reasonForNotVoteable = floodCheckThresholdMet
					})
					discoveryEventErrorLogger.reportError("updateUserVote", "Error updating user vote", {
						universeId = p7,
						statusCode = var39,
						statusMessage = if type(p9) == "table" and p9.StatusMessage then p9.StatusMessage else nil
					})
					logResponseError("v1/games/votes/user-votes", { StatusCode = var39 })
				end)
				
				return var22
			elseif var27 then
				var19.fetchItem(p7)
			elseif var30 and not var30.canVote then
				var23({
					type = "error",
					reasonForNotVoteable = var30.reasonForNotVoteable
				})
				
				return var22
			end
		end,
		updateVoteItem = if fFlagLuaAppDataHydrationUpdateItem then function(p10, p11, p12) --[[ line: 330 ]]
			-- upvalues: var16 (ref), votesUtilsModule (copy)
			var16.updateItem(p10, {
				downVotes = p11,
				upVotes = p12,
				rating = votesUtilsModule.calculateRating(p12, p11)
			})
		end else nil,
		updateUserVoteItem = if fFlagLuaAppDataHydrationUpdateItem then var18.updateItem else nil,
		updateUserVoteItems = var18.updateItems,
		clear = function() --[[ line: 292 ]]
			-- upvalues: var16 (ref), var17 (ref), var18 (ref), var19 (ref)
			var16.clear()
			var17.clear()
			var18.clear()
			var19.clear()
		end,
		dispose = function() --[[ line: 299 ]]
			-- upvalues: var16 (ref), var17 (ref), var19 (ref)
			var16.dispose()
			var17.dispose()
			var19.dispose()
		end
	}
end