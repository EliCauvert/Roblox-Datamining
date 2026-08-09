local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
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
local reasonNotVoteable = votesStoreTypesModule.ReasonNotVoteable
local fFlagLuaAppInExperienceDetailsPrompt = require(parent.SharedFlags).FFlagLuaAppInExperienceDetailsPrompt
local fFlagLuaAppDataHydrationUpdateItem = sharedFlagsModule.FFlagLuaAppDataHydrationUpdateItem
local fFlagLuaAppVoteOptimisticUpdateRaceFix = sharedFlagsModule.FFlagLuaAppVoteOptimisticUpdateRaceFix
local getGameInfoStoreModule = require(dataHydration.Game.GameInfo.getGameInfoStore)
local fFlagSduiExperienceDetailsSupport = sharedFlagsModule.FFlagSduiExperienceDetailsSupport
local user_vote_cache_ttl_seconds = game:DefineFastInt("USER_VOTE_CACHE_TTL_SECONDS", 600)

return function() --[[ line: 40 | named "createVotesStore" ]]
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), dashModule (ref), fetchVotesModule (ref), fFlagLuaAppInExperienceDetailsPrompt (ref), votesUtilsModule (ref), user_vote_cache_ttl_seconds (ref), logResponseError (ref), fetchUserVoteModule (ref), votesStoreTypesModule (ref), discoveryEventErrorLogger (ref), signalsModule (ref), fFlagLuaAppVoteOptimisticUpdateRaceFix (ref), fFlagLuaAppDataHydrationVotesStoreTrackOptimisticVotes (ref), fFlagSduiExperienceDetailsSupport (ref), getGameInfoStoreModule (ref), requestUserVoteUpdateModule (ref), httpService (ref), reasonNotVoteable (ref), statusCodes (ref), fFlagLuaAppDataHydrationUpdateItem (ref)
	local var15 = createDataCacheModule()
	local var16 = createDataResolverModule({
		cache = var15,
		fetchFn = function(p0) --[[ line: 44 ]]
			-- upvalues: dashModule (copy), fetchVotesModule (copy), fFlagLuaAppInExperienceDetailsPrompt (copy), votesUtilsModule (copy)
			return fetchVotesModule(dashModule.keys(p0)):andThen(function(p2) --[[ line: 49 ]]
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
				dashModule.forEach(p2.responseBody.data, function(p3) --[[ line: 63 ]]
					-- upvalues: votesUtilsModule (copy), t (ref)
					local var20 = nil
					local upVotes = p3.upVotes
					local downVotes = p3.downVotes
					
					if typeof(upVotes) == "number" and typeof(downVotes) == "number" then
						var20 = votesUtilsModule.calculateRating(upVotes, downVotes)
					end
					t[tostring(p3.id)] = { upVotes = upVotes, downVotes = downVotes, rating = var20 }
				end)
				
				return t
			end):catch(function(p1) --[[ line: 79 ]]
				error(`Error requesting votes: {p1}`)
			end)
		end
	})
	local var17 = createDataCacheModule(user_vote_cache_ttl_seconds)
	local var18 = createDataResolverModule({
		supportsMultiGet = false,
		cache = var17,
		logError = function(p4) --[[ line: 89 ]]
			-- upvalues: logResponseError (copy)
			logResponseError("v1/games/votes/user", p4)
		end,
		fetchFn = function(p5, _) --[[ line: 92 ]]
			-- upvalues: fetchUserVoteModule (copy), votesStoreTypesModule (copy), discoveryEventErrorLogger (copy)
			return fetchUserVoteModule(p5):andThen(function(p6) --[[ line: 96 ]]
				-- upvalues: votesStoreTypesModule (copy), discoveryEventErrorLogger (copy), p5 (ref)
				local responseBody = p6.responseBody
				
				if not votesStoreTypesModule.userVoteResponseValidator(responseBody) then
					discoveryEventErrorLogger.reportError("createVotesStore", "Invalid user vote response", { universeId = p5, responseBody = responseBody })
					error({ StatusCode = p6.responseCode })
				end
				return responseBody
			end)
		end
	})
	
	return {
		fetchVote = var16.fetchItem,
		fetchVotes = var16.fetchItems,
		getVote = var16.getCachedItem,
		getVotes = var16.getCachedItems,
		getAndFetchVote = var16.getAndFetchItem,
		getAndFetchVotes = var16.getAndFetchItems,
		fetchUserVote = var18.fetchItem,
		fetchUserVotes = var18.fetchItems,
		getUserVote = var18.getCachedItem,
		getUserVotes = var18.getCachedItems,
		getAndFetchUserVote = var18.getAndFetchItem,
		getAndFetchUserVotes = var18.getAndFetchItems,
		updateUserVote = function(p7, p8) --[[ line: 112 ]]
			-- upvalues: signalsModule (copy), var17 (ref), var15 (ref), fFlagLuaAppVoteOptimisticUpdateRaceFix (copy), var18 (ref), fFlagLuaAppDataHydrationVotesStoreTrackOptimisticVotes (copy), votesUtilsModule (copy), fFlagSduiExperienceDetailsSupport (copy), getGameInfoStoreModule (copy), requestUserVoteUpdateModule (copy), httpService (copy), votesStoreTypesModule (copy), reasonNotVoteable (copy), statusCodes (copy), discoveryEventErrorLogger (copy), logResponseError (copy)
			local var21, var22 = signalsModule.createSignal(nil)
			local item, item_1 = var17.getItem(p7)
			local var25 = item and item.data(false)
			local var26 = if var25 then var25.userVote else nil
			local item_2 = var15.getItem(p7)
			local var28 = item_2 and item_2.data(false)
			
			if fFlagLuaAppVoteOptimisticUpdateRaceFix then
				if not item_1 and var25 and not var25.canVote then
					var22({
						type = "error",
						reasonForNotVoteable = var25.reasonForNotVoteable
					})
					
					return var21
				end
			elseif item_1 then
				var18.fetchItem(p7)
			elseif var25 and not var25.canVote then
				var22({
					type = "error",
					reasonForNotVoteable = var25.reasonForNotVoteable
				})
				
				return var21
			end
			local var29 = if var25 then var25.canVote else nil
			local var30 = if var25 then var25.reasonForNotVoteable else nil
			var17.replaceItem(p7, {
				canVote = var29,
				reasonForNotVoteable = var30,
				userVote = p8
			})
			
			if var28 then
				local var31, var32
				local _ = nil
				local _ = nil
				
				if fFlagLuaAppDataHydrationVotesStoreTrackOptimisticVotes then
					var31 = (if p8 == true then 1 else 0) - (if var26 == true then 1 else 0)
					var32 = (if p8 == false then 1 else 0) - (if var26 == false then 1 else 0)
				else
					var31 = if p8 == true then 1 else 0
					var32 = if p8 == false then 1 else 0
				end
				local var33 = var28.upVotes + var31
				local var34 = var28.downVotes + var32
				
				if fFlagLuaAppDataHydrationVotesStoreTrackOptimisticVotes then
					var33 = math.max(0, var33)
					var34 = math.max(0, var34)
				end
				var15.updateItem(p7, {
					upVotes = var33,
					downVotes = var34,
					rating = votesUtilsModule.calculateRating(var33, var34)
				})
			end
			local var35 = if fFlagSduiExperienceDetailsSupport then getGameInfoStoreModule(false).applyVoteChange(p7, var26, p8) else nil
			requestUserVoteUpdateModule(p7, p8):andThen(function(_) --[[ line: 205 ]]
				-- upvalues: var22 (ref), p8 (ref)
				var22({ type = "success", userVote = p8 })
			end):catch(function(p9) --[[ line: 211 ]]
				-- upvalues: var17 (copy), p7 (ref), var29 (ref), var30 (ref), var26 (ref), var28 (ref), var15 (copy), fFlagSduiExperienceDetailsSupport (copy), var35 (write), getGameInfoStoreModule (copy), httpService (copy), votesStoreTypesModule (copy), reasonNotVoteable (copy), statusCodes (copy), var22 (ref), discoveryEventErrorLogger (copy), logResponseError (copy)
				var17.replaceItem(p7, {
					canVote = var29,
					reasonForNotVoteable = var30,
					userVote = var26
				})
				
				if var28 then
					var15.updateItem(p7, var28)
				end
				if fFlagSduiExperienceDetailsSupport and var35 then
					getGameInfoStoreModule(false).updateGameInfo(p7, var35)
				end
				local var36 = if type(p9) == "table" and p9.StatusCode then p9.StatusCode else nil
				local floodCheckThresholdMet = nil
				
				if var36 then
					local ok, status = pcall(function() --[[ line: 236 ]]
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
					if var36 == statusCodes.TOO_MANY_REQUESTS then
						floodCheckThresholdMet = reasonNotVoteable.FloodCheckThresholdMet
					end
				end
				var22({
					type = "error",
					reasonForNotVoteable = floodCheckThresholdMet
				})
				discoveryEventErrorLogger.reportError("updateUserVote", "Error updating user vote", {
					universeId = p7,
					statusCode = var36,
					statusMessage = if type(p9) == "table" and p9.StatusMessage then p9.StatusMessage else nil
				})
				logResponseError("v1/games/votes/user-votes", { StatusCode = var36 })
			end)
			
			return var21
		end,
		updateVoteItem = if fFlagLuaAppDataHydrationUpdateItem then function(p10, p11, p12) --[[ line: 299 ]]
			-- upvalues: var15 (ref), votesUtilsModule (copy)
			var15.updateItem(p10, {
				downVotes = p11,
				upVotes = p12,
				rating = votesUtilsModule.calculateRating(p12, p11)
			})
		end else nil,
		updateUserVoteItem = if fFlagLuaAppDataHydrationUpdateItem then var17.updateItem else nil,
		updateUserVoteItems = var17.updateItems,
		clear = function() --[[ line: 269 ]]
			-- upvalues: var15 (ref), var16 (ref), var17 (ref), var18 (ref)
			var15.clear()
			var16.clear()
			var17.clear()
			var18.clear()
		end,
		dispose = function() --[[ line: 276 ]]
			-- upvalues: var15 (ref), var16 (ref), var18 (ref)
			var15.dispose()
			var16.dispose()
			var18.dispose()
		end
	}
end