local parent = script:FindFirstAncestor("GamePlayButton").Parent
local promiseUtilities = require(parent.AppCommonLib).Utils.PromiseUtilities
local retrievalStatus = require(parent.Http).Enum.RetrievalStatus
local gameDetailRoduxModule = require(parent.GameDetailRodux)
local apiFetchGameDetails = gameDetailRoduxModule.GameDetails.ApiFetchGameDetails
local fetchGamePlayabilityAndProductInfo = gameDetailRoduxModule.FetchGamePlayabilityAndProductInfo
local apiFetchAgeRecommendations = gameDetailRoduxModule.AgeRecommendations.ApiFetchAgeRecommendations
local fetchUserGameVotes = require(parent.GameVotesRodux).UserGameVotes.FetchUserGameVotes
local gameInfosReducer = require(parent.GameInfosRodux).GameInfosReducer
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
local t = {
	IsLoading = function(p0, p1) --[[ line: 119 ]]
		-- upvalues: apiFetchGameDetails (ref), retrievalStatus (ref), fetchGamePlayabilityAndProductInfo (ref), luaAppFetchContentMaturityWithPlayability (ref), playabilityStatusEnum (ref), gameInfosReducer (ref), apiFetchAgeRecommendations (ref), apiFetchShowAgeVerificationOverlay (ref)
		local fetchingStatus = apiFetchGameDetails.GetFetchingStatus(p0, p1)
		
		if fetchingStatus == retrievalStatus.NotStarted or fetchingStatus == retrievalStatus.Fetching then
			return true
		end
		local fetchingStatus_1 = fetchGamePlayabilityAndProductInfo.GetFetchingStatus(p0, p1)
		
		if fetchingStatus_1 == retrievalStatus.NotStarted or fetchingStatus_1 == retrievalStatus.Fetching then
			return true
		elseif luaAppFetchContentMaturityWithPlayability then
			local var9 = p0.PlayabilityStatus and p0.PlayabilityStatus[p1]
			
			if var9 then
				local playabilityStatus = var9.playabilityStatus
				local var10 = luaAppFetchContentMaturityWithPlayability
				
				if var10 then
					var10 = false
					
					if playabilityStatus == playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls then
						local var13
						local var11 = p0.AgeRecommendations and p0.AgeRecommendations[p1]
						
						if var11 and var11.summary and (var11.summary.ageRecommendation and var11.summary.ageRecommendation.contentMaturity) then
							var13 = true
						else
							local var12 = p0.Personalization and (p0.Personalization[gameInfosReducer.key] and p0.Personalization[gameInfosReducer.key][p1])
							var13 = var12 and var12.contentMaturity ~= nil
						end
						var10 = not var13
					end
				end
				if var10 then
					var10 = apiFetchAgeRecommendations.GetFetchingStatus(p0, p1)
					
					if var10 == retrievalStatus.NotStarted or var10 == retrievalStatus.Fetching then
						return true
					elseif game:GetEngineFeature("VoiceChatSupported") then
						local fetchingStatus_2 = apiFetchShowAgeVerificationOverlay.GetFetchingStatus(p0, p1)
						
						return fetchingStatus_2 == retrievalStatus.NotStarted or fetchingStatus_2 == retrievalStatus.Fetching
					end
				end
			end
		end
	end
}

local function _(p2, p3) --[[ line: 32 | named "hasContentMaturity" ]]
	-- upvalues: gameInfosReducer (ref)
	local var15 = p2.AgeRecommendations and p2.AgeRecommendations[p3]
	
	if var15 and var15.summary and (var15.summary.ageRecommendation and var15.summary.ageRecommendation.contentMaturity) then
		return true
	end
	local var16 = p2.Personalization and (p2.Personalization[gameInfosReducer.key] and p2.Personalization[gameInfosReducer.key][p3])
	
	return var16 and var16.contentMaturity ~= nil
end

local _ = function(p4, p5, p6) --[[ line: 49 | named "shouldFetchAgeRecommendations" ]]
	-- upvalues: luaAppFetchContentMaturityWithPlayability (ref), playabilityStatusEnum (ref), gameInfosReducer (ref)
	local var17 = luaAppFetchContentMaturityWithPlayability
	
	if var17 then
		var17 = false
		
		if p6 == playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls then
			local var20
			local var18 = p4.AgeRecommendations and p4.AgeRecommendations[p5]
			
			if var18 and var18.summary and (var18.summary.ageRecommendation and var18.summary.ageRecommendation.contentMaturity) then
				var20 = true
			else
				local var19 = p4.Personalization and (p4.Personalization[gameInfosReducer.key] and p4.Personalization[gameInfosReducer.key][p5])
				var20 = var19 and var19.contentMaturity ~= nil
			end
			var17 = not var20
		end
	end
	return var17
end

local function playButtonDataFetchPromises(p7, p8, p9, p10, p11) --[[ line: 55 ]]
	-- upvalues: apiFetchGameDetails (ref), retrievalStatus (ref), fetchGamePlayabilityAndProductInfo (ref), luaAppFetchContentMaturityWithPlayability (ref), playabilityStatusEnum (ref), gameInfosReducer (ref), apiFetchAgeRecommendations (ref), promiseModule (ref), apiFetchShowAgeVerificationOverlay (ref), fetchUserGameVotes (ref)
	local t = {}
	
	if apiFetchGameDetails.GetFetchingStatus(p8:getState(), p9) ~= retrievalStatus.Fetching and (p10 or p8:getState().GameDetails[p9] == nil) then
		table.insert(t, p8:dispatch(apiFetchGameDetails.Fetch(p7, { p9 })))
	end
	local fetchingStatus = fetchGamePlayabilityAndProductInfo.GetFetchingStatus(p8:getState(), p9)
	
	if p10 or p11 or (fetchingStatus == retrievalStatus.NotStarted or fetchingStatus == retrievalStatus.Failed) then
		local var23 = p8:dispatch(fetchGamePlayabilityAndProductInfo.Fetch(p7, p9))
		
		if luaAppFetchContentMaturityWithPlayability then
			var23 = var23:andThen(function(p12) --[[ line: 84 ]]
				-- upvalues: p8 (ref), p9 (ref), luaAppFetchContentMaturityWithPlayability (copy), playabilityStatusEnum (copy), gameInfosReducer (copy), apiFetchAgeRecommendations (copy), p7 (ref), promiseModule (copy)
				local state = p8:getState()
				local var25 = p9
				local var26 = luaAppFetchContentMaturityWithPlayability
				
				if var26 then
					var26 = false
					
					if p12 == playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls then
						local var29
						local var27 = state.AgeRecommendations and state.AgeRecommendations[var25]
						
						if var27 and var27.summary and (var27.summary.ageRecommendation and var27.summary.ageRecommendation.contentMaturity) then
							var29 = true
						else
							local var28 = state.Personalization and (state.Personalization[gameInfosReducer.key] and state.Personalization[gameInfosReducer.key][var25])
							var29 = var28 and var28.contentMaturity ~= nil
						end
						var26 = not var29
					end
				end
				return if var26 then p8:dispatch(apiFetchAgeRecommendations.Fetch(p7, p9)) else promiseModule.resolve(p12)
			end)
		end
		table.insert(t, var23)
	end
	if game:GetEngineFeature("VoiceChatSupported") and apiFetchShowAgeVerificationOverlay.GetFetchingStatus(p8:getState(), p9) ~= retrievalStatus.Fetching and (p10 or p8:getState().ShowAgeVerificationOverlay[p9] == nil) then
		table.insert(t, p8:dispatch(apiFetchShowAgeVerificationOverlay.Fetch(p7, p9)))
	end
	if fetchUserGameVotes.GetFetchingStatus(p8:getState(), p9) ~= retrievalStatus.Fetching and (p10 or p8:getState().UserGameVotes[p9] == nil) then
		p8:dispatch(fetchUserGameVotes.Fetch(p7, p9))
	end
	return t
end

function t.Fetch(p13, p14, p15) --[[ line: 170 ]]
	-- upvalues: nextDataExpirationTimeReducer (ref), expirationTimeNamespace (ref), playButtonDataFetchPromises (ref), runService (ref), promiseUtilities (ref), getFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds (ref), setNextDataExpirationTime (ref)
	return function(p16) --[[ line: 171 ]]
		-- upvalues: nextDataExpirationTimeReducer (copy), expirationTimeNamespace (copy), p14 (ref), playButtonDataFetchPromises (copy), p13 (ref), p15 (ref), runService (copy), promiseUtilities (copy), getFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds (copy), setNextDataExpirationTime (copy)
		local currentTime = tick()
		local var31 = nil
		local gameDetailPlayability = p16:getState().Personalization[nextDataExpirationTimeReducer.key][expirationTimeNamespace.GameDetailPlayability]
		
		if gameDetailPlayability then
			var31 = gameDetailPlayability[p14]
		end
		local var32 = playButtonDataFetchPromises(p13, p16, p14, (var31 == nil or var31 < currentTime) and true, p15)
		
		if #var32 <= 0 then return end
		return promiseUtilities.Batch(var32, if _G.__TESTEZ_RUNNING_TEST__ or runService:IsStudio() then warn else nil):andThen(function(p17) --[[ line: 194 ]]
			-- upvalues: promiseUtilities (copy), currentTime (write), var31 (write), getFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds (copy), p16 (ref), setNextDataExpirationTime (copy), p14 (copy), expirationTimeNamespace (copy)
			if promiseUtilities.CountResults(p17).failureCount == 0 then
				currentTime = tick()
				var31 = math.floor(currentTime + getFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds())
				p16:dispatch(setNextDataExpirationTime(p14, var31, expirationTimeNamespace.GameDetailPlayability))
			end
		end)
	end
end

return t