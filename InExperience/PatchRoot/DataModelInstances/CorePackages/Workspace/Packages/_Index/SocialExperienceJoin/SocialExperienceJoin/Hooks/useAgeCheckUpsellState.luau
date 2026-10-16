local SocialExperienceJoin = script:FindFirstAncestor("SocialExperienceJoin")
local Parent = SocialExperienceJoin.Parent
local GameDetailRoduxModule = require(Parent.GameDetailRodux)
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local NetworkingGamesModule = require(SocialExperienceJoin.Networking.NetworkingGames)
local JoinCardCacheStoreModule = require(SocialExperienceJoin.Stores.JoinCardCacheStore)
local PlayabilityStatusEnum = require(Parent.DiscoveryTypes).PlayabilityStatusEnum
local FetchUserSettingsAndOptionsFunction = GameDetailRoduxModule.FetchUserSettingsAndOptions
local ApiFetchAgeRecommendations = GameDetailRoduxModule.AgeRecommendations.ApiFetchAgeRecommendations
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local FFlagLuaAppPlayButtonAmpAgeCheckFlow = require(Parent.SharedFlags).FFlagLuaAppPlayButtonAmpAgeCheckFlow
local FFlagLuaAppPlayButtonWizardCloseDelay = require(Parent.SharedFlags).FFlagLuaAppPlayButtonWizardCloseDelay
local FIntLuaAppPlayButtonWizardCloseDelayMs = require(Parent.SharedFlags).FIntLuaAppPlayButtonWizardCloseDelayMs
local FStringLuaAppPlayButtonAgeCheckAmpFeatureName = require(Parent.SharedFlags).FStringLuaAppPlayButtonAgeCheckAmpFeatureName
local FStringLuaAppPlayButtonAgeCheckAmpNameSpace = require(Parent.SharedFlags).FStringLuaAppPlayButtonAgeCheckAmpNameSpace
local AmpUpsellModule = require(Parent.AmpUpsell)
local OpenAmpWizardContainerFunction = AmpUpsellModule.OpenAmpWizardContainer
local AccessResponseEnum = AmpUpsellModule.AmpEnums.AccessResponseEnum
local DelayedAmpWizardCompletionCallbackOverrideFunction = require(Parent.GamePlayButton).delayedAmpWizardCompletionCallbackOverride
local t = {}
local v1 = (function(Text: string) --[[ Line: 55 | Named "parseContentMaturityMapping" ]]
	local t = {}
	
	if Text == "" then
		return t
	end
	for _, value in string.split(Text, ",") do
		local Parts = string.split(value, "=")
		
		if #Parts == 2 and Parts[1] ~= "" and Parts[2] ~= "" then
			t[Parts[1]] = Parts[2]
		end
	end
	return t
end)((game:DefineFastString("LuaAppUpsellMaturityRatingToSettingMapping", "mild=NinePlus,moderate=ThirteenPlus,restricted=SeventeenPlus,unrated=ThirteenPlus")))

local function parentalControlsRequiresAgeCheck(p1, p2): boolean --[[ Line: 71 ]]
	-- upvalues: v1 (copy)
	if not p1 or not p2 then
		return false
	end
	local ContentAgeRestriction = p1.contentAgeRestriction
	
	if not ContentAgeRestriction or not ContentAgeRestriction.options then
		return false
	end
	local OptionValue = v1[p2]
	
	if not OptionValue then
		return false
	end
	for _, option in ContentAgeRestriction.options do
		if option and option.option and option.option.optionValue == OptionValue then
			return option.requirement == "ContentAgeRestrictionVerification"
		end
	end
	return false
end

return function(p3, Callback) --[[ Line: 110 | Named "useAgeCheckUpsellState" ]]
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), ReactModule (copy), JoinCardCacheStoreModule (copy), UseSignalStateFunction (copy), UseSelectorFunction (copy), NetworkingGamesModule (copy), PlayabilityStatusEnum (copy), ApiFetchAgeRecommendations (copy), FetchUserSettingsAndOptionsFunction (copy), t (copy), parentalControlsRequiresAgeCheck (copy), FFlagLuaAppPlayButtonAmpAgeCheckFlow (copy), AccessResponseEnum (copy), OpenAmpWizardContainerFunction (copy), FStringLuaAppPlayButtonAgeCheckAmpFeatureName (copy), FStringLuaAppPlayButtonAgeCheckAmpNameSpace (copy), FFlagLuaAppPlayButtonWizardCloseDelay (copy), DelayedAmpWizardCompletionCallbackOverrideFunction (copy), FIntLuaAppPlayButtonWizardCloseDelayMs (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local GetResult = JoinCardCacheStoreModule.get()
	local UseSignalStateResult = UseSignalStateFunction(GetResult.getPlayabilityEntries)
	local UseSignalStateResult1 = UseSignalStateFunction(GetResult.getUserSettings)
	local UseSignalStateResultEntry = if p3 == "" then nil else UseSignalStateResult[p3]
	local UseRefResult = ReactModule.useRef(UseSignalStateResultEntry ~= nil)
	local UseSelectorResult = UseSelectorFunction(function(p4) --[[ Line: 127 ]]
		-- upvalues: p3 (copy)
		local AgeRecommendation = p4.AgeRecommendations and p4.AgeRecommendations[p3]
		
		return if AgeRecommendation and AgeRecommendation.summary and AgeRecommendation.summary.ageRecommendation then AgeRecommendation.summary.ageRecommendation.contentMaturity else nil
	end)
	ReactModule.useEffect(function() --[[ Line: 135 ]]
		-- upvalues: p3 (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), GetResult (copy), UseDispatchResult (copy), NetworkingGamesModule (upval)
		if p3 == "" then
			UseStateResult2(true)
			UseStateResult2_1(false)
			
			return
		end
		if GetResult.getPlayabilityEntries(false)[p3] == nil then
			UseStateResult2_1(false)
			UseStateResult2(false)
			UseDispatchResult(NetworkingGamesModule.GetExperiencesPlayabilityStatus.API({ p3 })):andThen(function(Result) --[[ Line: 155 ]]
				-- upvalues: GetResult (upval), p3 (upval)
				local ResponseBodyEntry = Result.responseBody and Result.responseBody[1]
				
				if ResponseBodyEntry then
					GetResult.setPlayabilityEntry(p3, ResponseBodyEntry)
				end
			end):catch(function() --[[ Line: 161 ]] end):finally(function() --[[ Line: 162 ]]
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(true)
			end)
			
			return
		else
			UseStateResult2(true)
			UseStateResult2_1(GetResult.getUserSettings(false) ~= nil)
		end
	end, { UseDispatchResult, p3, GetResult })
	ReactModule.useEffect(function() --[[ Line: 167 ]]
		-- upvalues: p3 (copy), UseSignalStateResultEntry (copy), PlayabilityStatusEnum (upval), UseDispatchResult (copy), ApiFetchAgeRecommendations (upval), UseRoactServiceResult (copy), UseStateResult2_1 (copy)
		if p3 == "" then return end
		if (UseSignalStateResultEntry and UseSignalStateResultEntry.playabilityStatus) == PlayabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls then
			UseDispatchResult(ApiFetchAgeRecommendations.Fetch(UseRoactServiceResult, p3)):catch(function() --[[ Line: 176 ]] end):finally(function() --[[ Line: 176 ]]
				-- upvalues: UseStateResult2_1 (upval)
				UseStateResult2_1(true)
			end)
			
			return
		end
	end, {
		UseDispatchResult,
		UseRoactServiceResult,
		p3,
		UseSignalStateResultEntry
	})
	ReactModule.useEffect(function() --[[ Line: 181 ]]
		-- upvalues: p3 (copy), UseSignalStateResultEntry (copy), PlayabilityStatusEnum (upval), GetResult (copy), FetchUserSettingsAndOptionsFunction (upval), UseRoactServiceResult (copy), t (upval)
		if p3 == "" then return end
		if (UseSignalStateResultEntry and UseSignalStateResultEntry.playabilityStatus) ~= PlayabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls then return end
		if GetResult.getUserSettings(false) == nil then
			FetchUserSettingsAndOptionsFunction(UseRoactServiceResult):andThen(function(Result) --[[ Line: 192 ]]
				-- upvalues: GetResult (upval)
				GetResult.setUserSettings(Result)
			end):catch(function() --[[ Line: 194 ]]
				-- upvalues: GetResult (upval), t (upval)
				GetResult.setUserSettings(t)
			end)
			
			return
		end
	end, {
		UseRoactServiceResult,
		p3,
		UseSignalStateResultEntry,
		GetResult
	})
	local ParentalControlsRequiresAgeCheckResult = UseSignalStateResultEntry ~= nil and (UseSignalStateResultEntry.playabilityStatus == PlayabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls and parentalControlsRequiresAgeCheck(UseSignalStateResult1, UseSelectorResult))
	local IsPlayabilityStatusMatch = UseSignalStateResultEntry ~= nil and (UseSignalStateResultEntry.playabilityStatus == PlayabilityStatusEnum.ContextualPlayabilityUnverifiedSeventeenPlusUser or (FFlagLuaAppPlayButtonAmpAgeCheckFlow and UseSignalStateResultEntry.playabilityStatus == PlayabilityStatusEnum.ContextualPlayabilityAgeCheckRequired or ParentalControlsRequiresAgeCheckResult))
	local UseResult = ReactModule.useCallback(function() --[[ Line: 211 ]]
		-- upvalues: p3 (copy), UseDispatchResult (copy), NetworkingGamesModule (upval), GetResult (copy), FetchUserSettingsAndOptionsFunction (upval), UseRoactServiceResult (copy), t (upval)
		if p3 ~= "" then
			UseDispatchResult(NetworkingGamesModule.GetExperiencesPlayabilityStatus.API({ p3 })):andThen(function(Result) --[[ Line: 216 ]]
				-- upvalues: GetResult (upval), p3 (upval)
				local ResponseBodyEntry = Result.responseBody and Result.responseBody[1]
				
				if ResponseBodyEntry then
					GetResult.setPlayabilityEntry(p3, ResponseBodyEntry)
				end
			end):catch(function() --[[ Line: 222 ]]
				-- upvalues: GetResult (upval), p3 (upval)
				GetResult.clearPlayabilityEntry(p3)
			end)
			FetchUserSettingsAndOptionsFunction(UseRoactServiceResult):andThen(function(Result) --[[ Line: 225 ]]
				-- upvalues: GetResult (upval)
				GetResult.setUserSettings(Result)
			end):catch(function() --[[ Line: 227 ]]
				-- upvalues: GetResult (upval), t (upval)
				GetResult.setUserSettings(t)
			end)
			
			return
		end
	end, { UseDispatchResult, UseRoactServiceResult, p3, GetResult })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 232 ]]
		-- upvalues: AccessResponseEnum (upval), UseResult (copy), Callback (copy), UseDispatchResult (copy), OpenAmpWizardContainerFunction (upval), FStringLuaAppPlayButtonAgeCheckAmpFeatureName (upval), FStringLuaAppPlayButtonAgeCheckAmpNameSpace (upval), FFlagLuaAppPlayButtonWizardCloseDelay (upval), DelayedAmpWizardCompletionCallbackOverrideFunction (upval), FIntLuaAppPlayButtonWizardCloseDelayMs (upval)
		local function onAmpWizardCompletion(Error, _) --[[ Line: 233 ]]
			-- upvalues: AccessResponseEnum (upval), UseResult (upval), Callback (upval)
			local Success: string = if Error == AccessResponseEnum.Granted then "Success" elseif Error == AccessResponseEnum.Error then "Error" else "Cancelled"
			
			if Success == "Success" then
				UseResult()
			end
			if Callback then
				Callback(Success)
			end
		end
		
		UseDispatchResult(OpenAmpWizardContainerFunction(FStringLuaAppPlayButtonAgeCheckAmpFeatureName, onAmpWizardCompletion, nil, "joinCardAgeCheckRequired", nil, FStringLuaAppPlayButtonAgeCheckAmpNameSpace, nil, nil, if FFlagLuaAppPlayButtonWizardCloseDelay then DelayedAmpWizardCompletionCallbackOverrideFunction(onAmpWizardCompletion, FIntLuaAppPlayButtonWizardCloseDelayMs) else nil))
	end, { UseDispatchResult, UseResult, Callback })
	local NoUseSignalStateResult: boolean = UseSignalStateResultEntry ~= nil and (UseSignalStateResultEntry.playabilityStatus == PlayabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls and (UseSignalStateResult1 == nil or UseSelectorResult == nil and not UseStateResult1))
	local PlayabilityStatus = if UseSignalStateResultEntry then UseSignalStateResultEntry.playabilityStatus else nil
	
	return ReactModule.useMemo(function() --[[ Line: 275 ]]
		-- upvalues: PlayabilityStatus (copy), UseStateResult (copy), NoUseSignalStateResult (copy), IsPlayabilityStatusMatch (copy), UseRefResult (copy), UseResult1 (copy), UseResult (copy)
		return {
			cachedPlayabilityStatus = PlayabilityStatus,
			playabilityChecked = UseStateResult,
			pendingParentalControlsResolution = NoUseSignalStateResult,
			ageCheckRequired = IsPlayabilityStatusMatch,
			playabilityFromCache = UseRefResult.current,
			joinAgeCheckUpsellFlow = UseResult1,
			refetchPlayability = UseResult
		}
	end, {
		PlayabilityStatus, UseStateResult, NoUseSignalStateResult,
		IsPlayabilityStatusMatch, UseResult1, UseResult
	})
end