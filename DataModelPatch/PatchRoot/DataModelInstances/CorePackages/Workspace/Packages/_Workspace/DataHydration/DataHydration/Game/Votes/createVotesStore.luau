local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local CryoModule = require(Parent.Cryo)
local DashModule = require(Parent.Dash)
local SignalsModule = require(Parent.Signals)
local HttpService = game:GetService("HttpService")
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local VotesStoreTypesModule = require(script.Parent.VotesStoreTypes)
local VotesUtilsModule = require(script.Parent.VotesUtils)
local DiscoveryUtilsModule = require(Parent.DiscoveryUtils)
local StatusCodes = require(Parent.Http).StatusCodes
local LogResponseErrorFunction = DiscoveryUtilsModule.logResponseError
local DiscoveryEventErrorLogger = DiscoveryUtilsModule.DiscoveryEventErrorLogger
local FetchVotesModule = require(script.Parent.fetchVotes)
local FetchUserVoteModule = require(script.Parent.fetchUserVote)
local RequestUserVoteUpdateModule = require(script.Parent.requestUserVoteUpdate)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppDataHydrationVotesStoreTrackOptimisticVotes = SharedFlagsModule.FFlagLuaAppDataHydrationVotesStoreTrackOptimisticVotes
local FFlagLuaAppDataHydrationOptimisticMutationLayer = SharedFlagsModule.FFlagLuaAppDataHydrationOptimisticMutationLayer
local ReasonNotVoteable = VotesStoreTypesModule.ReasonNotVoteable
local FFlagLuaAppInExperienceDetailsPrompt = require(Parent.SharedFlags).FFlagLuaAppInExperienceDetailsPrompt
local FFlagLuaAppDataHydrationUpdateItem = SharedFlagsModule.FFlagLuaAppDataHydrationUpdateItem
local FFlagLuaAppVoteOptimisticUpdateRaceFix = SharedFlagsModule.FFlagLuaAppVoteOptimisticUpdateRaceFix
local GetGameInfoStoreModule = require(DataHydration.Game.GameInfo.getGameInfoStore)
local FFlagSduiExperienceDetailsSupport = SharedFlagsModule.FFlagSduiExperienceDetailsSupport
local USERVOTECACHETTLSECONDS = game:DefineFastInt("USER_VOTE_CACHE_TTL_SECONDS", 600)

return function()
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), DashModule (copy), FetchVotesModule (copy), FFlagLuaAppInExperienceDetailsPrompt (copy), VotesUtilsModule (copy), USERVOTECACHETTLSECONDS (copy), LogResponseErrorFunction (copy), FetchUserVoteModule (copy), VotesStoreTypesModule (copy), DiscoveryEventErrorLogger (copy), FFlagLuaAppDataHydrationOptimisticMutationLayer (copy), SignalsModule (copy), FFlagLuaAppVoteOptimisticUpdateRaceFix (copy), CryoModule (copy), FFlagLuaAppDataHydrationVotesStoreTrackOptimisticVotes (copy), FFlagSduiExperienceDetailsSupport (copy), GetGameInfoStoreModule (copy), RequestUserVoteUpdateModule (copy), HttpService (copy), ReasonNotVoteable (copy), StatusCodes (copy), FFlagLuaAppDataHydrationUpdateItem (copy)
	local DataCacheModule = CreateDataCacheModule()
	local DataResolverModule = CreateDataResolverModule({
		cache = DataCacheModule,
		fetchFn = function(p1)
			-- upvalues: DashModule (upval), FetchVotesModule (upval), FFlagLuaAppInExperienceDetailsPrompt (upval), VotesUtilsModule (upval)
			return FetchVotesModule((DashModule.keys(p1))):andThen(function(Result)
				-- upvalues: FFlagLuaAppInExperienceDetailsPrompt (upval), DashModule (upval), VotesUtilsModule (upval)
				if not Result then
					error("No response")
				end
				if not Result.responseBody or not Result.responseBody.data then
					if FFlagLuaAppInExperienceDetailsPrompt then
						error(`Response Code: {Result.responseCode}`)
					else
						error(`Response Code: {Result.reponseCode}`)
					end
				end
				local t = {}
				DashModule.forEach(Result.responseBody.data, function(p2)
					-- upvalues: VotesUtilsModule (upval), t (copy)
					local Rating = nil
					local UpVotes = p2.upVotes
					local DownVotes = p2.downVotes
					
					if typeof(UpVotes) == "number" and typeof(DownVotes) == "number" then
						Rating = VotesUtilsModule.calculateRating(UpVotes, DownVotes)
					end
					t[tostring(p2.id)] = {
						upVotes = UpVotes,
						downVotes = DownVotes,
						rating = Rating
					}
				end)
				
				return t
			end):catch(function(Err)
				error(`Error requesting votes: {Err}`)
			end)
		end
	})
	local DataCacheModule1 = CreateDataCacheModule(USERVOTECACHETTLSECONDS)
	local DataResolverModule1 = CreateDataResolverModule({
		supportsMultiGet = false,
		cache = DataCacheModule1,
		logError = function(p1)
			-- upvalues: LogResponseErrorFunction (upval)
			LogResponseErrorFunction("v1/games/votes/user", p1)
		end,
		fetchFn = function(UniverseId, _)
			-- upvalues: FetchUserVoteModule (upval), VotesStoreTypesModule (upval), DiscoveryEventErrorLogger (upval)
			return FetchUserVoteModule(UniverseId):andThen(function(Result)
				-- upvalues: VotesStoreTypesModule (upval), DiscoveryEventErrorLogger (upval), UniverseId (copy)
				local ResponseBody = Result.responseBody
				
				if not VotesStoreTypesModule.userVoteResponseValidator(ResponseBody) then
					DiscoveryEventErrorLogger.reportError("createVotesStore", "Invalid user vote response", { universeId = UniverseId, responseBody = ResponseBody })
					error({ StatusCode = Result.responseCode })
				end
				return ResponseBody
			end)
		end,
		supportsMutations = FFlagLuaAppDataHydrationOptimisticMutationLayer
	})
	
	return {
		fetchVote = DataResolverModule.fetchItem,
		fetchVotes = DataResolverModule.fetchItems,
		getVote = DataResolverModule.getCachedItem,
		getVotes = DataResolverModule.getCachedItems,
		getAndFetchVote = DataResolverModule.getAndFetchItem,
		getAndFetchVotes = DataResolverModule.getAndFetchItems,
		fetchUserVote = DataResolverModule1.fetchItem,
		fetchUserVotes = DataResolverModule1.fetchItems,
		getUserVote = if FFlagLuaAppDataHydrationOptimisticMutationLayer then DataResolverModule1.getOptimisticCachedItem else DataResolverModule1.getCachedItem,
		getUserVotes = if FFlagLuaAppDataHydrationOptimisticMutationLayer then DataResolverModule1.getOptimisticCachedItems else DataResolverModule1.getCachedItems,
		getAndFetchUserVote = if FFlagLuaAppDataHydrationOptimisticMutationLayer then DataResolverModule1.getOptimisticAndFetchItem else DataResolverModule1.getAndFetchItem,
		getAndFetchUserVotes = if FFlagLuaAppDataHydrationOptimisticMutationLayer then DataResolverModule1.getOptimisticAndFetchItems else DataResolverModule1.getAndFetchItems,
		updateUserVote = function(UniverseId, Enabled)
			-- upvalues: SignalsModule (upval), FFlagLuaAppDataHydrationOptimisticMutationLayer (upval), DataResolverModule1 (copy), DataCacheModule1 (copy), DataCacheModule (copy), FFlagLuaAppVoteOptimisticUpdateRaceFix (upval), CryoModule (upval), FFlagLuaAppDataHydrationVotesStoreTrackOptimisticVotes (upval), VotesUtilsModule (upval), FFlagSduiExperienceDetailsSupport (upval), GetGameInfoStoreModule (upval), RequestUserVoteUpdateModule (upval), HttpService (upval), VotesStoreTypesModule (upval), ReasonNotVoteable (upval), StatusCodes (upval), DiscoveryEventErrorLogger (upval), LogResponseErrorFunction (upval)
			local Signal, Signal2 = SignalsModule.createSignal(nil)
			local OptimisticCachedItem = nil
			local OptimisticCachedItem2 = nil
			
			if FFlagLuaAppDataHydrationOptimisticMutationLayer then
				OptimisticCachedItem, OptimisticCachedItem2 = DataResolverModule1.getOptimisticCachedItem(UniverseId)
			else
				OptimisticCachedItem, OptimisticCachedItem2 = DataCacheModule1.getItem(UniverseId)
			end
			local DataResult = OptimisticCachedItem and OptimisticCachedItem.data(false)
			local UserVote = if DataResult then DataResult.userVote else nil
			local Item = DataCacheModule.getItem(UniverseId)
			local DataResult1 = Item and Item.data(false)
			
			if not FFlagLuaAppVoteOptimisticUpdateRaceFix then
				if OptimisticCachedItem2 then
					DataResolverModule1.fetchItem(UniverseId)
				elseif DataResult and not DataResult.canVote then
					Signal2({
						type = "error",
						reasonForNotVoteable = DataResult.reasonForNotVoteable
					})
					
					return Signal
				end
			elseif not OptimisticCachedItem2 and DataResult and not DataResult.canVote then
				Signal2({
					type = "error",
					reasonForNotVoteable = DataResult.reasonForNotVoteable
				})
				
				return Signal
			end
			if FFlagLuaAppDataHydrationOptimisticMutationLayer then
				DataResolverModule1.setMutation(UniverseId, {
					userVote = if Enabled == nil then CryoModule.None else Enabled
				})
			else
				DataCacheModule1.replaceItem(UniverseId, {
					canVote = DataResult and DataResult.canVote or nil,
					reasonForNotVoteable = DataResult and DataResult.reasonForNotVoteable or nil,
					userVote = Enabled
				})
			end
			if DataResult1 then
				local v1 = nil
				local v2 = nil
				if FFlagLuaAppDataHydrationVotesStoreTrackOptimisticVotes then
					v1 = (if Enabled == true then 1 else 0) - (if UserVote == true then 1 else 0)
					v2 = (if Enabled == false then 1 else 0) - (if UserVote == false then 1 else 0)
				else
					v1 = if Enabled == true then 1 else 0
					v2 = if Enabled == false then 1 else 0
				end
				local NewUpVotes = DataResult1.upVotes + v1
				local NewDownVotes = DataResult1.downVotes + v2
				
				if FFlagLuaAppDataHydrationVotesStoreTrackOptimisticVotes then
					NewUpVotes = math.max(0, NewUpVotes)
					NewDownVotes = math.max(0, NewDownVotes)
				end
				DataCacheModule.updateItem(UniverseId, {
					upVotes = NewUpVotes,
					downVotes = NewDownVotes,
					rating = VotesUtilsModule.calculateRating(NewUpVotes, NewDownVotes)
				})
			end
			local ApplyVoteChangeResult = if FFlagSduiExperienceDetailsSupport then GetGameInfoStoreModule(false).applyVoteChange(UniverseId, UserVote, Enabled) else nil
			RequestUserVoteUpdateModule(UniverseId, Enabled):andThen(function(_)
				-- upvalues: FFlagLuaAppDataHydrationOptimisticMutationLayer (upval), DataResolverModule1 (upval), UniverseId (copy), Signal2 (copy), Enabled (copy)
				if FFlagLuaAppDataHydrationOptimisticMutationLayer then
					DataResolverModule1.commitMutation(UniverseId)
				end
				Signal2({ type = "success", userVote = Enabled })
			end):catch(function(Err)
				-- upvalues: FFlagLuaAppDataHydrationOptimisticMutationLayer (upval), DataResolverModule1 (upval), UniverseId (copy), DataResult (copy), DataCacheModule1 (upval), UserVote (copy), DataResult1 (copy), DataCacheModule (upval), FFlagSduiExperienceDetailsSupport (upval), ApplyVoteChangeResult (ref), GetGameInfoStoreModule (upval), HttpService (upval), VotesStoreTypesModule (upval), ReasonNotVoteable (upval), StatusCodes (upval), Signal2 (copy), DiscoveryEventErrorLogger (upval), LogResponseErrorFunction (upval)
				if FFlagLuaAppDataHydrationOptimisticMutationLayer then
					DataResolverModule1.clearMutation(UniverseId)
				else
					DataCacheModule1.replaceItem(UniverseId, {
						canVote = DataResult and DataResult.canVote or nil,
						reasonForNotVoteable = DataResult and DataResult.reasonForNotVoteable or nil,
						userVote = UserVote
					})
				end
				if DataResult1 then
					DataCacheModule.updateItem(UniverseId, DataResult1)
				end
				if FFlagSduiExperienceDetailsSupport and ApplyVoteChangeResult then
					GetGameInfoStoreModule(false).updateGameInfo(UniverseId, ApplyVoteChangeResult)
				end
				local StatusCode = if type(Err) == "table" and Err.StatusCode then Err.StatusCode else nil
				local FloodCheckThresholdMet = nil
				
				if StatusCode then
					local Success, Result = pcall(function()
						-- upvalues: HttpService (upval), Err (copy)
						return HttpService:JSONDecode(Err.Body)
					end)
					
					if Success and Result and Result.errors then
						for _, _error in ipairs(Result.errors) do
							if _error.code == VotesStoreTypesModule.PLAY_GAME_ERROR_CODE then
								FloodCheckThresholdMet = ReasonNotVoteable.PlayGame
							end
						end
					end
					if StatusCode == StatusCodes.TOO_MANY_REQUESTS then
						FloodCheckThresholdMet = ReasonNotVoteable.FloodCheckThresholdMet
					end
				end
				Signal2({
					type = "error",
					reasonForNotVoteable = FloodCheckThresholdMet
				})
				DiscoveryEventErrorLogger.reportError("updateUserVote", "Error updating user vote", {
					universeId = UniverseId,
					statusCode = StatusCode,
					statusMessage = if type(Err) == "table" and Err.StatusMessage then Err.StatusMessage else nil
				})
				LogResponseErrorFunction("v1/games/votes/user-votes", { StatusCode = StatusCode })
			end)
			
			return Signal
		end,
		updateVoteItem = if FFlagLuaAppDataHydrationUpdateItem then function(p1, DownVotes, UpVotes)
			-- upvalues: DataCacheModule (copy), VotesUtilsModule (upval)
			DataCacheModule.updateItem(p1, {
				downVotes = DownVotes,
				upVotes = UpVotes,
				rating = VotesUtilsModule.calculateRating(UpVotes, DownVotes)
			})
		end else nil,
		updateUserVoteItem = if FFlagLuaAppDataHydrationUpdateItem then DataCacheModule1.updateItem else nil,
		updateUserVoteItems = DataCacheModule1.updateItems,
		clear = function()
			-- upvalues: DataCacheModule (copy), DataResolverModule (copy), DataCacheModule1 (copy), DataResolverModule1 (copy)
			DataCacheModule.clear()
			DataResolverModule.clear()
			DataCacheModule1.clear()
			DataResolverModule1.clear()
		end,
		dispose = function()
			-- upvalues: DataCacheModule (copy), DataResolverModule (copy), DataResolverModule1 (copy)
			DataCacheModule.dispose()
			DataResolverModule.dispose()
			DataResolverModule1.dispose()
		end
	}
end