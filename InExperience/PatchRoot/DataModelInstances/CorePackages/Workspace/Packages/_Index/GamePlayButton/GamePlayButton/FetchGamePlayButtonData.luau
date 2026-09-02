local parent = script:FindFirstAncestor("GamePlayButton").Parent
local promiseUtilities = require(parent.AppCommonLib).Utils.PromiseUtilities
local retrievalStatus = require(parent.Http).Enum.RetrievalStatus
local gameDetailRoduxModule = require(parent.GameDetailRodux)
local apiFetchGameDetails = gameDetailRoduxModule.GameDetails.ApiFetchGameDetails
local fetchGamePlayabilityAndProductInfo = gameDetailRoduxModule.FetchGamePlayabilityAndProductInfo
local apiFetchAgeRecommendations = gameDetailRoduxModule.AgeRecommendations.ApiFetchAgeRecommendations
local fetchUserGameVotes = require(parent.GameVotesRodux).UserGameVotes.FetchUserGameVotes
local gameInfosReducer = require(parent.GameInfosRodux).GameInfosReducer
local dataHydrationModule = require(parent.DataHydration)
local fFlagMigrateGameInfoToStore = require(parent.SharedFlags).FFlagMigrateGameInfoToStore
local nextDataExpirationTimeRoduxModule = require(parent.NextDataExpirationTimeRodux)
local setNextDataExpirationTime = nextDataExpirationTimeRoduxModule.SetNextDataExpirationTime
local nextDataExpirationTimeReducer = nextDataExpirationTimeRoduxModule.NextDataExpirationTimeReducer
local expirationTimeNamespace = nextDataExpirationTimeRoduxModule.ExpirationTimeNamespace
local playabilityStatusEnum = require(parent.DiscoveryTypes).PlayabilityStatusEnum
local apiFetchShowAgeVerificationOverlay = require(parent.VoiceChat).AgeVerificationOverlay.ApiFetchShowAgeVerificationOverlay
local promiseModule = require(parent.Promise)
local getFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds = require(parent.SharedFlags).GetFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds
local runService = game:GetService("RunService")
local t = {}

local function hasContentMaturity(p1, p2)
	-- upvalues: fFlagMigrateGameInfoToStore (ref), dataHydrationModule (ref), gameInfosReducer (ref)
	local var1 = p1.AgeRecommendations and p1.AgeRecommendations[p2]
	
	if var1 and var1.summary and (var1.summary.ageRecommendation and var1.summary.ageRecommendation.contentMaturity) then
		return true
	elseif not fFlagMigrateGameInfoToStore then
		local var2 = p1.Personalization and (p1.Personalization[gameInfosReducer.key] and p1.Personalization[gameInfosReducer.key][p2])
		
		return var2 and var2.contentMaturity ~= nil
	end
	local var3 = dataHydrationModule.Game.getGameInfoStore(false).getGameInfo(p2).data(false)
	
	return var3 ~= nil and var3.contentMaturity ~= nil
end

local function _(p1, p2, p3)
	-- upvalues: playabilityStatusEnum (ref), hasContentMaturity (ref)
	return p3 == playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls and not hasContentMaturity(p1, p2)
end

local function playButtonDataFetchPromises(p1, p2, p3, p4, p5)
	-- upvalues: apiFetchGameDetails (ref), retrievalStatus (ref), fetchGamePlayabilityAndProductInfo (ref), playabilityStatusEnum (ref), hasContentMaturity (ref), apiFetchAgeRecommendations (ref), promiseModule (ref), apiFetchShowAgeVerificationOverlay (ref), fetchUserGameVotes (ref)
	local t = {}
	
	if apiFetchGameDetails.GetFetchingStatus(p2:getState(), p3) ~= retrievalStatus.Fetching and (p4 or p2:getState().GameDetails[p3] == nil) then
		table.insert(t, p2:dispatch(apiFetchGameDetails.Fetch(p1, { p3 })))
	end
	local fetchingStatus = fetchGamePlayabilityAndProductInfo.GetFetchingStatus(p2:getState(), p3)
	
	if p4 or p5 or (fetchingStatus == retrievalStatus.NotStarted or fetchingStatus == retrievalStatus.Failed) then
		table.insert(t, p2:dispatch(fetchGamePlayabilityAndProductInfo.Fetch(p1, p3)):andThen(function(p6)
			-- upvalues: p2 (ref), p3 (ref), playabilityStatusEnum (copy), hasContentMaturity (copy), apiFetchAgeRecommendations (copy), p1 (ref), promiseModule (copy)
			return if p6 == playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls and not hasContentMaturity(p2:getState(), p3) then p2:dispatch(apiFetchAgeRecommendations.Fetch(p1, p3)) else promiseModule.resolve(p6)
		end))
	end
	if game:GetEngineFeature("VoiceChatSupported") and apiFetchShowAgeVerificationOverlay.GetFetchingStatus(p2:getState(), p3) ~= retrievalStatus.Fetching and (p4 or p2:getState().ShowAgeVerificationOverlay[p3] == nil) then
		table.insert(t, p2:dispatch(apiFetchShowAgeVerificationOverlay.Fetch(p1, p3)))
	end
	if fetchUserGameVotes.GetFetchingStatus(p2:getState(), p3) ~= retrievalStatus.Fetching and (p4 or p2:getState().UserGameVotes[p3] == nil) then
		p2:dispatch(fetchUserGameVotes.Fetch(p1, p3))
	end
	return t
end

function t.IsLoading(p1, p2)
	-- upvalues: apiFetchGameDetails (ref), retrievalStatus (ref), fetchGamePlayabilityAndProductInfo (ref), playabilityStatusEnum (ref), hasContentMaturity (ref), apiFetchAgeRecommendations (ref), apiFetchShowAgeVerificationOverlay (ref)
	local fetchingStatus = apiFetchGameDetails.GetFetchingStatus(p1, p2)
	
	if fetchingStatus == retrievalStatus.NotStarted or fetchingStatus == retrievalStatus.Fetching then
		return true
	end
	local fetchingStatus_1 = fetchGamePlayabilityAndProductInfo.GetFetchingStatus(p1, p2)
	
	if fetchingStatus_1 == retrievalStatus.NotStarted or fetchingStatus_1 == retrievalStatus.Fetching then
		return true
	end
	local fetchingStatus_2
	local var1 = p1.PlayabilityStatus and p1.PlayabilityStatus[p2]
	
	if var1 and (var1.playabilityStatus == playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls and not hasContentMaturity(p1, p2)) then
		fetchingStatus_2 = apiFetchAgeRecommendations.GetFetchingStatus(p1, p2)
		
		if fetchingStatus_2 == retrievalStatus.NotStarted or fetchingStatus_2 == retrievalStatus.Fetching then
			return true
		elseif game:GetEngineFeature("VoiceChatSupported") then
			fetchingStatus_2 = apiFetchShowAgeVerificationOverlay.GetFetchingStatus(p1, p2)
			
			return fetchingStatus_2 == retrievalStatus.NotStarted or fetchingStatus_2 == retrievalStatus.Fetching
		end
	end
end

function t.Fetch(p1, p2, p3)
	-- upvalues: nextDataExpirationTimeReducer (ref), expirationTimeNamespace (ref), playButtonDataFetchPromises (ref), runService (ref), promiseUtilities (ref), getFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds (ref), setNextDataExpirationTime (ref)
	return function(p4)
		-- upvalues: nextDataExpirationTimeReducer (copy), expirationTimeNamespace (copy), p2 (ref), playButtonDataFetchPromises (copy), p1 (ref), p3 (ref), runService (copy), promiseUtilities (copy), getFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds (copy), setNextDataExpirationTime (copy)
		local currentTime = tick()
		local var1 = nil
		local gameDetailPlayability = p4:getState().Personalization[nextDataExpirationTimeReducer.key][expirationTimeNamespace.GameDetailPlayability]
		
		if gameDetailPlayability then
			var1 = gameDetailPlayability[p2]
		end
		local var2 = playButtonDataFetchPromises(p1, p4, p2, (var1 == nil or var1 < currentTime) and true, p3)
		
		if #var2 <= 0 then return end
		return promiseUtilities.Batch(var2, if _G.__TESTEZ_RUNNING_TEST__ or runService:IsStudio() then warn else nil):andThen(function(p5)
			-- upvalues: promiseUtilities (copy), currentTime (write), var1 (write), getFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds (copy), p4 (ref), setNextDataExpirationTime (copy), p2 (copy), expirationTimeNamespace (copy)
			if promiseUtilities.CountResults(p5).failureCount == 0 then
				currentTime = tick()
				var1 = math.floor(currentTime + getFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds())
				p4:dispatch(setNextDataExpirationTime(p2, var1, expirationTimeNamespace.GameDetailPlayability))
			end
		end)
	end
end

return t