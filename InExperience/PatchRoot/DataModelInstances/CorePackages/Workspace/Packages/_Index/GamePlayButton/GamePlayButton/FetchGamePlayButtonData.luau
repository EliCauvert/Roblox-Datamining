local Parent = script:FindFirstAncestor("GamePlayButton").Parent
local PromiseUtilities = require(Parent.AppCommonLib).Utils.PromiseUtilities
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus
local GameDetailRoduxModule = require(Parent.GameDetailRodux)
local ApiFetchGameDetails = GameDetailRoduxModule.GameDetails.ApiFetchGameDetails
local FetchGamePlayabilityAndProductInfo = GameDetailRoduxModule.FetchGamePlayabilityAndProductInfo
local ApiFetchAgeRecommendations = GameDetailRoduxModule.AgeRecommendations.ApiFetchAgeRecommendations
local FetchUserGameVotes = require(Parent.GameVotesRodux).UserGameVotes.FetchUserGameVotes
local GameInfosReducer = require(Parent.GameInfosRodux).GameInfosReducer
local DataHydrationModule = require(Parent.DataHydration)
local FFlagMigrateGameInfoToStore = require(Parent.SharedFlags).FFlagMigrateGameInfoToStore
local NextDataExpirationTimeRoduxModule = require(Parent.NextDataExpirationTimeRodux)
local SetNextDataExpirationTimeFunction = NextDataExpirationTimeRoduxModule.SetNextDataExpirationTime
local NextDataExpirationTimeReducer = NextDataExpirationTimeRoduxModule.NextDataExpirationTimeReducer
local ExpirationTimeNamespace = NextDataExpirationTimeRoduxModule.ExpirationTimeNamespace
local PlayabilityStatusEnum = require(Parent.DiscoveryTypes).PlayabilityStatusEnum
local ApiFetchShowAgeVerificationOverlay = require(Parent.VoiceChat).AgeVerificationOverlay.ApiFetchShowAgeVerificationOverlay
local PromiseModule = require(Parent.Promise)
local GetFIntLuaAppThrottleRefreshPlayabilityIntervalSecondsFunction = require(Parent.SharedFlags).GetFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds
local RunService = game:GetService("RunService")

local function hasContentMaturity(State, p1): boolean --[[ Line: 31 ]]
	-- upvalues: FFlagMigrateGameInfoToStore (copy), DataHydrationModule (copy), GameInfosReducer (copy)
	local AgeRecommendation = State.AgeRecommendations and State.AgeRecommendations[p1]
	
	if AgeRecommendation and AgeRecommendation.summary and AgeRecommendation.summary.ageRecommendation and AgeRecommendation.summary.ageRecommendation.contentMaturity then
		return true
	elseif FFlagMigrateGameInfoToStore then
		local DataResult = DataHydrationModule.Game.getGameInfoStore(false).getGameInfo(p1).data(false)
		
		return DataResult ~= nil and DataResult.contentMaturity ~= nil
	else
		local PersonalizationEntry = State.Personalization and (State.Personalization[GameInfosReducer.key] and State.Personalization[GameInfosReducer.key][p1])
		
		return PersonalizationEntry and PersonalizationEntry.contentMaturity ~= nil
	end
end

local function _(p1, p2, ContextualPlayabilityAgeRecommendationParentalControls): boolean --[[ Line: 53 | Named "shouldFetchAgeRecommendations" ]]
	-- upvalues: PlayabilityStatusEnum (copy), hasContentMaturity (copy)
	return ContextualPlayabilityAgeRecommendationParentalControls == PlayabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls and not hasContentMaturity(p1, p2)
end

local function playButtonDataFetchPromises(p1, p2, p3, p4, p5) --[[ Line: 58 ]]
	-- upvalues: ApiFetchGameDetails (copy), RetrievalStatus (copy), FetchGamePlayabilityAndProductInfo (copy), PlayabilityStatusEnum (copy), hasContentMaturity (copy), ApiFetchAgeRecommendations (copy), PromiseModule (copy), ApiFetchShowAgeVerificationOverlay (copy), FetchUserGameVotes (copy)
	local List = {}
	
	if ApiFetchGameDetails.GetFetchingStatus(p2:getState(), p3) ~= RetrievalStatus.Fetching and (p4 or p2:getState().GameDetails[p3] == nil) then
		table.insert(List, p2:dispatch(ApiFetchGameDetails.Fetch(p1, { p3 })))
	end
	local FetchingStatus = FetchGamePlayabilityAndProductInfo.GetFetchingStatus(p2:getState(), p3)
	
	if p4 or p5 or FetchingStatus == RetrievalStatus.NotStarted or FetchingStatus == RetrievalStatus.Failed then
		table.insert(List, (p2:dispatch(FetchGamePlayabilityAndProductInfo.Fetch(p1, p3)):andThen(function(Result) --[[ Line: 85 ]]
			-- upvalues: p2 (copy), p3 (copy), PlayabilityStatusEnum (upval), hasContentMaturity (upval), ApiFetchAgeRecommendations (upval), p1 (copy), PromiseModule (upval)
			local State = p2:getState()
			local Inverted: boolean = Result == PlayabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls and not hasContentMaturity(State, p3)
			
			return if Inverted then p2:dispatch(ApiFetchAgeRecommendations.Fetch(p1, p3)) else PromiseModule.resolve(Result)
		end)))
	end
	if game:GetEngineFeature("VoiceChatSupported") and ApiFetchShowAgeVerificationOverlay.GetFetchingStatus(p2:getState(), p3) ~= RetrievalStatus.Fetching and (p4 or p2:getState().ShowAgeVerificationOverlay[p3] == nil) then
		table.insert(List, p2:dispatch(ApiFetchShowAgeVerificationOverlay.Fetch(p1, p3)))
	end
	if FetchUserGameVotes.GetFetchingStatus(p2:getState(), p3) ~= RetrievalStatus.Fetching and (p4 or p2:getState().UserGameVotes[p3] == nil) then
		p2:dispatch(FetchUserGameVotes.Fetch(p1, p3))
	end
	return List
end

return {
	IsLoading = function(p1, p2): boolean --[[ Line: 119 ]]
		-- upvalues: ApiFetchGameDetails (copy), RetrievalStatus (copy), FetchGamePlayabilityAndProductInfo (copy), PlayabilityStatusEnum (copy), hasContentMaturity (copy), ApiFetchAgeRecommendations (copy), ApiFetchShowAgeVerificationOverlay (copy)
		local FetchingStatus = ApiFetchGameDetails.GetFetchingStatus(p1, p2)
		
		if FetchingStatus == RetrievalStatus.NotStarted or FetchingStatus == RetrievalStatus.Fetching then
			return true
		end
		local FetchingStatus1 = FetchGamePlayabilityAndProductInfo.GetFetchingStatus(p1, p2)
		
		if FetchingStatus1 == RetrievalStatus.NotStarted or FetchingStatus1 == RetrievalStatus.Fetching then
			return true
		end
		local PlayabilityStatusEntry = p1.PlayabilityStatus and p1.PlayabilityStatus[p2]
		
		if PlayabilityStatusEntry and (PlayabilityStatusEntry.playabilityStatus == PlayabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls and not hasContentMaturity(p1, p2)) then
			local FetchingStatus2 = ApiFetchAgeRecommendations.GetFetchingStatus(p1, p2)
			
			if FetchingStatus2 == RetrievalStatus.NotStarted or FetchingStatus2 == RetrievalStatus.Fetching then
				return true
			end
		end
		if game:GetEngineFeature("VoiceChatSupported") then
			local FetchingStatus3 = ApiFetchShowAgeVerificationOverlay.GetFetchingStatus(p1, p2)
			
			if FetchingStatus3 == RetrievalStatus.NotStarted or FetchingStatus3 == RetrievalStatus.Fetching then
				return true
			end
		end
		return false
	end,
	Fetch = function(p1, p2, p3) --[[ Line: 164 ]]
		-- upvalues: NextDataExpirationTimeReducer (copy), ExpirationTimeNamespace (copy), playButtonDataFetchPromises (copy), RunService (copy), PromiseUtilities (copy), GetFIntLuaAppThrottleRefreshPlayabilityIntervalSecondsFunction (copy), SetNextDataExpirationTimeFunction (copy)
		return function(p4) --[[ Line: 165 ]]
			-- upvalues: NextDataExpirationTimeReducer (upval), ExpirationTimeNamespace (upval), p2 (copy), playButtonDataFetchPromises (upval), p1 (copy), p3 (copy), RunService (upval), PromiseUtilities (upval), GetFIntLuaAppThrottleRefreshPlayabilityIntervalSecondsFunction (upval), SetNextDataExpirationTimeFunction (upval)
			local CurrentTime = tick()
			local Floored = nil
			local PersonalizationEntry = p4:getState().Personalization[NextDataExpirationTimeReducer.key][ExpirationTimeNamespace.GameDetailPlayability]
			
			if PersonalizationEntry then
				Floored = PersonalizationEntry[p2]
			end
			local PlayButtonDataFetchPromisesResult = playButtonDataFetchPromises(p1, p4, p2, Floored == nil or Floored < CurrentTime, p3)
			
			if #PlayButtonDataFetchPromisesResult <= 0 then return end
			return PromiseUtilities.Batch(PlayButtonDataFetchPromisesResult, if _G.__TESTEZ_RUNNING_TEST__ or RunService:IsStudio() then warn else nil):andThen(function(Result) --[[ Line: 188 ]]
				-- upvalues: PromiseUtilities (upval), CurrentTime (ref), Floored (ref), GetFIntLuaAppThrottleRefreshPlayabilityIntervalSecondsFunction (upval), p4 (copy), SetNextDataExpirationTimeFunction (upval), p2 (upval), ExpirationTimeNamespace (upval)
				if PromiseUtilities.CountResults(Result).failureCount == 0 then
					CurrentTime = tick()
					Floored = math.floor(CurrentTime + GetFIntLuaAppThrottleRefreshPlayabilityIntervalSecondsFunction())
					p4:dispatch(SetNextDataExpirationTimeFunction(p2, Floored, ExpirationTimeNamespace.GameDetailPlayability))
				end
			end)
		end
	end
}