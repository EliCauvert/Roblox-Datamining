local Parent = script:FindFirstAncestor("GamePlayButton").Parent
local PromiseUtilities = require(Parent.AppCommonLib).Utils.PromiseUtilities
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus
local GameDetailRoduxModule = require(Parent.GameDetailRodux)
local ApiFetchGameDetails = GameDetailRoduxModule.GameDetails.ApiFetchGameDetails
local FetchGamePlayabilityAndProductInfo = GameDetailRoduxModule.FetchGamePlayabilityAndProductInfo
local ApiFetchAgeRecommendations = GameDetailRoduxModule.AgeRecommendations.ApiFetchAgeRecommendations
local FetchUserGameVotes = require(Parent.GameVotesRodux).UserGameVotes.FetchUserGameVotes
local DataHydrationModule = require(Parent.DataHydration)
local NextDataExpirationTimeRoduxModule = require(Parent.NextDataExpirationTimeRodux)
local SetNextDataExpirationTimeFunction = NextDataExpirationTimeRoduxModule.SetNextDataExpirationTime
local NextDataExpirationTimeReducer = NextDataExpirationTimeRoduxModule.NextDataExpirationTimeReducer
local ExpirationTimeNamespace = NextDataExpirationTimeRoduxModule.ExpirationTimeNamespace
local PlayabilityStatusEnum = require(Parent.DiscoveryTypes).PlayabilityStatusEnum
local ApiFetchShowAgeVerificationOverlay = require(Parent.VoiceChat).AgeVerificationOverlay.ApiFetchShowAgeVerificationOverlay
local PromiseModule = require(Parent.Promise)
local FFlagLuaAppPlayButtonCoalescePlayabilityFetch = require(Parent.SharedFlags).FFlagLuaAppPlayButtonCoalescePlayabilityFetch
local GetFIntLuaAppThrottleRefreshPlayabilityIntervalSecondsFunction = require(Parent.SharedFlags).GetFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds
local RunService = game:GetService("RunService")
local self = setmetatable({}, { __mode = "k" })

local function _(p1, p2): boolean
	-- upvalues: self (copy)
	local SelfEntry = self[p1]
	
	return SelfEntry ~= nil and SelfEntry[p2] ~= nil
end

local function startInFlightBatch(Key, Key1)
	-- upvalues: self (copy)
	local SelfEntry = self[Key]
	
	if SelfEntry == nil then
		SelfEntry = {}
		self[Key] = SelfEntry
	end
	local SelfEntry1 = SelfEntry[Key1]
	
	if SelfEntry1 == nil then
		SelfEntry1 = { count = 0, hadFailure = false }
		SelfEntry[Key1] = SelfEntry1
	end
	SelfEntry1.count += 1
end

local _ = function(p1, Key, p2)
	-- upvalues: self (copy)
	local SelfEntry = self[p1]
	local SelfEntry1 = if SelfEntry then SelfEntry[Key] else nil
	
	if SelfEntry == nil or SelfEntry1 == nil then
		return p2
	end
	SelfEntry1.count -= 1
	
	if not p2 then
		SelfEntry1.hadFailure = true
	end
	if SelfEntry1.count > 0 then
		return false
	else
		SelfEntry[Key] = nil
		
		return not SelfEntry1.hadFailure
	end
end

local function hasContentMaturity(State, p1): boolean
	-- upvalues: DataHydrationModule (copy)
	local AgeRecommendation = State.AgeRecommendations and State.AgeRecommendations[p1]
	
	if AgeRecommendation and AgeRecommendation.summary and AgeRecommendation.summary.ageRecommendation and AgeRecommendation.summary.ageRecommendation.contentMaturity then
		return true
	else
		local DataResult = DataHydrationModule.Game.getGameInfoStore(false).getGameInfo(p1).data(false)
		
		return DataResult ~= nil and DataResult.contentMaturity ~= nil
	end
end

local _ = function(p1, p2, ContextualPlayabilityAgeRecommendationParentalControls): boolean
	-- upvalues: PlayabilityStatusEnum (copy), hasContentMaturity (copy)
	return ContextualPlayabilityAgeRecommendationParentalControls == PlayabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls and not hasContentMaturity(p1, p2)
end

local function playButtonDataFetchPromises(p1, p2, p3, p4, p5)
	-- upvalues: ApiFetchGameDetails (copy), RetrievalStatus (copy), FetchGamePlayabilityAndProductInfo (copy), PlayabilityStatusEnum (copy), hasContentMaturity (copy), ApiFetchAgeRecommendations (copy), PromiseModule (copy), ApiFetchShowAgeVerificationOverlay (copy), FetchUserGameVotes (copy)
	local List = {}
	
	if ApiFetchGameDetails.GetFetchingStatus(p2:getState(), p3) ~= RetrievalStatus.Fetching and (p4 or p2:getState().GameDetails[p3] == nil) then
		table.insert(List, p2:dispatch(ApiFetchGameDetails.Fetch(p1, { p3 })))
	end
	local FetchingStatus = FetchGamePlayabilityAndProductInfo.GetFetchingStatus(p2:getState(), p3)
	
	if p4 or p5 or FetchingStatus == RetrievalStatus.NotStarted or FetchingStatus == RetrievalStatus.Failed then
		table.insert(List, (p2:dispatch(FetchGamePlayabilityAndProductInfo.Fetch(p1, p3)):andThen(function(Result)
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
	IsLoading = function(p1, p2): boolean
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
	Fetch = function(p1, p2, p3)
		-- upvalues: NextDataExpirationTimeReducer (copy), ExpirationTimeNamespace (copy), FFlagLuaAppPlayButtonCoalescePlayabilityFetch (copy), self (copy), playButtonDataFetchPromises (copy), RunService (copy), startInFlightBatch (copy), PromiseUtilities (copy), GetFIntLuaAppThrottleRefreshPlayabilityIntervalSecondsFunction (copy), SetNextDataExpirationTimeFunction (copy)
		return function(p4)
			-- upvalues: NextDataExpirationTimeReducer (upval), ExpirationTimeNamespace (upval), p2 (copy), FFlagLuaAppPlayButtonCoalescePlayabilityFetch (upval), self (upval), p3 (copy), playButtonDataFetchPromises (upval), p1 (copy), RunService (upval), startInFlightBatch (upval), PromiseUtilities (upval), GetFIntLuaAppThrottleRefreshPlayabilityIntervalSecondsFunction (upval), SetNextDataExpirationTimeFunction (upval)
			local CurrentTime = tick()
			local Floored = nil
			local PersonalizationEntry = p4:getState().Personalization[NextDataExpirationTimeReducer.key][ExpirationTimeNamespace.GameDetailPlayability]
			
			if PersonalizationEntry then
				Floored = PersonalizationEntry[p2]
			end
			local NoFloored: boolean = Floored == nil or Floored < CurrentTime
			
			if FFlagLuaAppPlayButtonCoalescePlayabilityFetch then
				local SelfEntry = self[p4]
				
				if SelfEntry ~= nil and SelfEntry[p2] ~= nil and not p3 then
					NoFloored = false
				end
			end
			local PlayButtonDataFetchPromisesResult = playButtonDataFetchPromises(p1, p4, p2, NoFloored, p3)
			
			if #PlayButtonDataFetchPromisesResult <= 0 then
				return nil
			end
			local Warn = if _G.__TESTEZ_RUNNING_TEST__ or RunService:IsStudio() then warn else nil
			
			if FFlagLuaAppPlayButtonCoalescePlayabilityFetch then
				startInFlightBatch(p4, p2)
			end
			return (PromiseUtilities.Batch(PlayButtonDataFetchPromisesResult, Warn):andThen(function(Result)
				-- upvalues: PromiseUtilities (upval), FFlagLuaAppPlayButtonCoalescePlayabilityFetch (upval), p4 (copy), p2 (upval), self (upval), CurrentTime (ref), Floored (ref), GetFIntLuaAppThrottleRefreshPlayabilityIntervalSecondsFunction (upval), SetNextDataExpirationTimeFunction (upval), ExpirationTimeNamespace (upval)
				local FailureCount = PromiseUtilities.CountResults(Result).failureCount
				local IsFailureCountMatch = FailureCount == 0
				
				if FFlagLuaAppPlayButtonCoalescePlayabilityFetch then
					local IsFailureCountMatch1 = FailureCount == 0
					local SelfEntry = self[p4]
					local SelfEntry1 = if SelfEntry then SelfEntry[p2] else nil
					
					if SelfEntry == nil or SelfEntry1 == nil then
						IsFailureCountMatch = IsFailureCountMatch1
					else
						SelfEntry1.count -= 1
						
						if not IsFailureCountMatch1 then
							SelfEntry1.hadFailure = true
						end
						if SelfEntry1.count > 0 then
							IsFailureCountMatch = false
						else
							SelfEntry[p2] = nil
							IsFailureCountMatch = not SelfEntry1.hadFailure
						end
					end
				end
				if IsFailureCountMatch then
					CurrentTime = tick()
					Floored = math.floor(CurrentTime + GetFIntLuaAppThrottleRefreshPlayabilityIntervalSecondsFunction())
					p4:dispatch(SetNextDataExpirationTimeFunction(p2, Floored, ExpirationTimeNamespace.GameDetailPlayability))
				end
			end))
		end
	end
}