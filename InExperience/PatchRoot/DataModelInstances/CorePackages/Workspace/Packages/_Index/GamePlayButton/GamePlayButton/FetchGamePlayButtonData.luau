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
local luaAppFetchContentMaturityWithPlayability = game:DefineFastFlag("LuaAppFetchContentMaturityWithPlayability", false)
local runService = game:GetService("RunService")
local t = {}

local function hasContentMaturity(p0, p1) --[[ line: 34 ]]
	-- upvalues: fFlagMigrateGameInfoToStore (ref), dataHydrationModule (ref), gameInfosReducer (ref)
	local var9 = p0.AgeRecommendations and p0.AgeRecommendations[p1]
	
	if var9 and var9.summary and (var9.summary.ageRecommendation and var9.summary.ageRecommendation.contentMaturity) then
		return true
	elseif not fFlagMigrateGameInfoToStore then
		local var11 = p0.Personalization and (p0.Personalization[gameInfosReducer.key] and p0.Personalization[gameInfosReducer.key][p1])
		
		return var11 and var11.contentMaturity ~= nil
	end
	local var10 = dataHydrationModule.Game.getGameInfoStore(false).getGameInfo(p1).data(false)
	
	return var10 ~= nil and var10.contentMaturity ~= nil
end

local function _(p2, p3, p4) --[[ line: 56 | named "shouldFetchAgeRecommendations" ]]
	-- upvalues: luaAppFetchContentMaturityWithPlayability (ref), playabilityStatusEnum (ref), hasContentMaturity (ref)
	return luaAppFetchContentMaturityWithPlayability and (p4 == playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls and not hasContentMaturity(p2, p3))
end

local function playButtonDataFetchPromises(p5, p6, p7, p8, p9) --[[ line: 62 ]]
	-- upvalues: apiFetchGameDetails (ref), retrievalStatus (ref), fetchGamePlayabilityAndProductInfo (ref), luaAppFetchContentMaturityWithPlayability (ref), playabilityStatusEnum (ref), hasContentMaturity (ref), apiFetchAgeRecommendations (ref), promiseModule (ref), apiFetchShowAgeVerificationOverlay (ref), fetchUserGameVotes (ref)
	local t = {}
	
	if apiFetchGameDetails.GetFetchingStatus(p6:getState(), p7) ~= retrievalStatus.Fetching and (p8 or p6:getState().GameDetails[p7] == nil) then
		table.insert(t, p6:dispatch(apiFetchGameDetails.Fetch(p5, { p7 })))
	end
	local fetchingStatus = fetchGamePlayabilityAndProductInfo.GetFetchingStatus(p6:getState(), p7)
	
	if p8 or p9 or (fetchingStatus == retrievalStatus.NotStarted or fetchingStatus == retrievalStatus.Failed) then
		local var14 = p6:dispatch(fetchGamePlayabilityAndProductInfo.Fetch(p5, p7))
		
		if luaAppFetchContentMaturityWithPlayability then
			var14 = var14:andThen(function(p10) --[[ line: 91 ]]
				-- upvalues: p6 (ref), p7 (ref), luaAppFetchContentMaturityWithPlayability (copy), playabilityStatusEnum (copy), hasContentMaturity (copy), apiFetchAgeRecommendations (copy), p5 (ref), promiseModule (copy)
				return if luaAppFetchContentMaturityWithPlayability and (p10 == playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls and not hasContentMaturity(p6:getState(), p7)) then p6:dispatch(apiFetchAgeRecommendations.Fetch(p5, p7)) else promiseModule.resolve(p10)
			end)
		end
		table.insert(t, var14)
	end
	if game:GetEngineFeature("VoiceChatSupported") and apiFetchShowAgeVerificationOverlay.GetFetchingStatus(p6:getState(), p7) ~= retrievalStatus.Fetching and (p8 or p6:getState().ShowAgeVerificationOverlay[p7] == nil) then
		table.insert(t, p6:dispatch(apiFetchShowAgeVerificationOverlay.Fetch(p5, p7)))
	end
	if fetchUserGameVotes.GetFetchingStatus(p6:getState(), p7) ~= retrievalStatus.Fetching and (p8 or p6:getState().UserGameVotes[p7] == nil) then
		p6:dispatch(fetchUserGameVotes.Fetch(p5, p7))
	end
	return t
end

function t.IsLoading(p11, p12) --[[ line: 126 ]]
	-- upvalues: apiFetchGameDetails (ref), retrievalStatus (ref), fetchGamePlayabilityAndProductInfo (ref), luaAppFetchContentMaturityWithPlayability (ref), playabilityStatusEnum (ref), hasContentMaturity (ref), apiFetchAgeRecommendations (ref), apiFetchShowAgeVerificationOverlay (ref)
	local fetchingStatus = apiFetchGameDetails.GetFetchingStatus(p11, p12)
	
	if fetchingStatus == retrievalStatus.NotStarted or fetchingStatus == retrievalStatus.Fetching then
		return true
	end
	local fetchingStatus_1 = fetchGamePlayabilityAndProductInfo.GetFetchingStatus(p11, p12)
	
	if fetchingStatus_1 == retrievalStatus.NotStarted or fetchingStatus_1 == retrievalStatus.Fetching then
		return true
	elseif luaAppFetchContentMaturityWithPlayability then
		local var17 = p11.PlayabilityStatus and p11.PlayabilityStatus[p12]
		
		if var17 and (luaAppFetchContentMaturityWithPlayability and (var17.playabilityStatus == playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls and not hasContentMaturity(p11, p12))) then
			local fetchingStatus_2 = apiFetchAgeRecommendations.GetFetchingStatus(p11, p12)
			
			if fetchingStatus_2 == retrievalStatus.NotStarted or fetchingStatus_2 == retrievalStatus.Fetching then
				return true
			elseif game:GetEngineFeature("VoiceChatSupported") then
				local fetchingStatus_2 = apiFetchShowAgeVerificationOverlay.GetFetchingStatus(p11, p12)
				
				return fetchingStatus_2 == retrievalStatus.NotStarted or fetchingStatus_2 == retrievalStatus.Fetching
			end
		end
	end
end

function t.Fetch(p13, p14, p15) --[[ line: 177 ]]
	-- upvalues: nextDataExpirationTimeReducer (ref), expirationTimeNamespace (ref), playButtonDataFetchPromises (ref), runService (ref), promiseUtilities (ref), getFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds (ref), setNextDataExpirationTime (ref)
	return function(p16) --[[ line: 178 ]]
		-- upvalues: nextDataExpirationTimeReducer (copy), expirationTimeNamespace (copy), p14 (ref), playButtonDataFetchPromises (copy), p13 (ref), p15 (ref), runService (copy), promiseUtilities (copy), getFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds (copy), setNextDataExpirationTime (copy)
		local currentTime = tick()
		local var21 = nil
		local gameDetailPlayability = p16:getState().Personalization[nextDataExpirationTimeReducer.key][expirationTimeNamespace.GameDetailPlayability]
		
		if gameDetailPlayability then
			var21 = gameDetailPlayability[p14]
		end
		local var22 = playButtonDataFetchPromises(p13, p16, p14, (var21 == nil or var21 < currentTime) and true, p15)
		
		if #var22 <= 0 then return end
		return promiseUtilities.Batch(var22, if _G.__TESTEZ_RUNNING_TEST__ or runService:IsStudio() then warn else nil):andThen(function(p17) --[[ line: 201 ]]
			-- upvalues: promiseUtilities (copy), currentTime (write), var21 (write), getFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds (copy), p16 (ref), setNextDataExpirationTime (copy), p14 (copy), expirationTimeNamespace (copy)
			if promiseUtilities.CountResults(p17).failureCount == 0 then
				currentTime = tick()
				var21 = math.floor(currentTime + getFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds())
				p16:dispatch(setNextDataExpirationTime(p14, var21, expirationTimeNamespace.GameDetailPlayability))
			end
		end)
	end
end

return t