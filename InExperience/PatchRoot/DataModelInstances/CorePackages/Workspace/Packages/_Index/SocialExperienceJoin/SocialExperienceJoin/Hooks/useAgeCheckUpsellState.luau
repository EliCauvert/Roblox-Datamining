local socialExperienceJoin = script:FindFirstAncestor("SocialExperienceJoin")
local parent = socialExperienceJoin.Parent
local gameDetailRoduxModule = require(parent.GameDetailRodux)
local reactModule = require(parent.React)
local roactServiceTagsModule = require(parent.RoactServiceTags)
local roactUtilsModule = require(parent.RoactUtils)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local signalsReactModule = require(parent.SignalsReact)
local networkingGamesModule = require(socialExperienceJoin.Networking.NetworkingGames)
local joinCardCacheStoreModule = require(socialExperienceJoin.Stores.JoinCardCacheStore)
local playabilityStatusEnum = require(parent.DiscoveryTypes).PlayabilityStatusEnum
local fetchUserSettingsAndOptions = gameDetailRoduxModule.FetchUserSettingsAndOptions
local apiFetchAgeRecommendations = gameDetailRoduxModule.AgeRecommendations.ApiFetchAgeRecommendations
local roactNetworking = roactServiceTagsModule.RoactNetworking
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useRoactService = robloxAppHooksModule.useRoactService
local useSignalState = signalsReactModule.useSignalState
local fFlagLuaAppPlayButtonAmpAgeCheckFlow = require(parent.SharedFlags).FFlagLuaAppPlayButtonAmpAgeCheckFlow
local fFlagLuaAppPlayButtonWizardCloseDelay = require(parent.SharedFlags).FFlagLuaAppPlayButtonWizardCloseDelay
local fIntLuaAppPlayButtonWizardCloseDelayMs = require(parent.SharedFlags).FIntLuaAppPlayButtonWizardCloseDelayMs
local fStringLuaAppPlayButtonAgeCheckAmpFeatureName = require(parent.SharedFlags).FStringLuaAppPlayButtonAgeCheckAmpFeatureName
local fStringLuaAppPlayButtonAgeCheckAmpNameSpace = require(parent.SharedFlags).FStringLuaAppPlayButtonAgeCheckAmpNameSpace
local ampUpsellModule = require(parent.AmpUpsell)
local openAmpWizardContainer = ampUpsellModule.OpenAmpWizardContainer
local accessResponseEnum = ampUpsellModule.AmpEnums.AccessResponseEnum
local delayedAmpWizardCompletionCallbackOverride = require(parent.GamePlayButton).delayedAmpWizardCompletionCallbackOverride
local t = {}
local var11 = (function(p0) --[[ line: 55 | named "parseContentMaturityMapping" ]]
	local t = {}
	
	if p0 == "" then
		return t
	end
	for i, v in string.split(p0, ",") do
		local parts = string.split(v, "=")
		
		if #parts == 2 and parts[1] ~= "" and parts[2] ~= "" then
			t[parts[1]] = parts[2]
		end
	end
	return t
end)(game:DefineFastString("LuaAppUpsellMaturityRatingToSettingMapping", "mild=NinePlus,moderate=ThirteenPlus,restricted=SeventeenPlus,unrated=ThirteenPlus"))

local function parentalControlsRequiresAgeCheck(p1, p2) --[[ line: 71 ]]
	-- upvalues: var11 (ref)
	if not p1 or not p2 then
		return false
	end
	local contentAgeRestriction = p1.contentAgeRestriction
	
	if not contentAgeRestriction or not contentAgeRestriction.options then
		return false
	end
	local var15 = var11[p2]
	
	if not var15 then
		return false
	end
	for i, v in contentAgeRestriction.options do
		if v and v.option and v.option.optionValue == var15 then
			return v.requirement == "ContentAgeRestrictionVerification"
		end
	end
	return false
end

local _ = {
	Success = "Success",
	Cancelled = "Cancelled",
	Error = "Error"
}

return function(p3, p4) --[[ line: 110 | named "useAgeCheckUpsellState" ]]
	-- upvalues: useDispatch (ref), useRoactService (ref), roactNetworking (ref), reactModule (ref), joinCardCacheStoreModule (ref), useSignalState (ref), useSelector (ref), networkingGamesModule (ref), playabilityStatusEnum (ref), apiFetchAgeRecommendations (ref), fetchUserSettingsAndOptions (ref), t (ref), parentalControlsRequiresAgeCheck (ref), fFlagLuaAppPlayButtonAmpAgeCheckFlow (ref), accessResponseEnum (ref), openAmpWizardContainer (ref), fStringLuaAppPlayButtonAgeCheckAmpFeatureName (ref), fStringLuaAppPlayButtonAgeCheckAmpNameSpace (ref), fFlagLuaAppPlayButtonWizardCloseDelay (ref), delayedAmpWizardCompletionCallbackOverride (ref), fIntLuaAppPlayButtonWizardCloseDelayMs (ref)
	local var16 = useDispatch()
	local var17 = useRoactService(roactNetworking)
	local var18, var19 = reactModule.useState(false)
	local var20, var21 = reactModule.useState(false)
	local var22 = joinCardCacheStoreModule.get()
	local var23 = useSignalState(var22.getUserSettings)
	local var24 = if p3 ~= "" then nil else useSignalState(var22.getPlayabilityEntries)[p3]
	local var25 = reactModule.useRef(var24 ~= nil)
	local var26 = useSelector(function(p5) --[[ line: 127 ]]
		-- upvalues: p3 (ref)
		local var32 = p5.AgeRecommendations and p5.AgeRecommendations[p3]
		
		return if var32 and var32.summary and var32.summary.ageRecommendation then var32.summary.ageRecommendation.contentMaturity else nil
	end)
	reactModule.useEffect(function() --[[ line: 135 ]]
		-- upvalues: p3 (ref), var19 (ref), var21 (ref), var22 (ref), var16 (ref), networkingGamesModule (copy)
		if p3 == "" then
			var19(true)
			var21(false)
			
			return
		elseif var22.getPlayabilityEntries(false)[p3] == nil then
			var21(false)
			var19(false)
			var16(networkingGamesModule.GetExperiencesPlayabilityStatus.API({ p3 })):andThen(function(p6) --[[ line: 155 ]]
				-- upvalues: var22 (copy), p3 (copy)
				local var33 = p6.responseBody and p6.responseBody[1]
				
				if var33 then
					var22.setPlayabilityEntry(p3, var33)
				end
			end):catch(function() --[[ line: 161 ]] end):finally(function() --[[ line: 162 ]]
				-- upvalues: var19 (copy)
				var19(true)
			end)
			
			return
		end
		var19(true)
		var21(var22.getUserSettings(false) ~= nil)
	end, { var16, p3, var22 })
	reactModule.useEffect(function() --[[ line: 167 ]]
		-- upvalues: p3 (ref), var24 (ref), playabilityStatusEnum (copy), var16 (ref), apiFetchAgeRecommendations (copy), var17 (ref), var21 (ref)
		if p3 == "" then return end
		if (var24 and var24.playabilityStatus) == playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls then
			var16(apiFetchAgeRecommendations.Fetch(var17, p3)):catch(function() --[[ line: 176 ]] end):finally(function() --[[ line: 176 ]]
				-- upvalues: var21 (copy)
				var21(true)
			end)
			
			return
		end
	end, { var16, var17, p3, var24 })
	reactModule.useEffect(function() --[[ line: 181 ]]
		-- upvalues: p3 (ref), var24 (ref), playabilityStatusEnum (copy), var22 (ref), fetchUserSettingsAndOptions (copy), var17 (ref), t (copy)
		if p3 == "" then return end
		if (var24 and var24.playabilityStatus) ~= playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls then return end
		if var22.getUserSettings(false) == nil then
			fetchUserSettingsAndOptions(var17):andThen(function(p7) --[[ line: 192 ]]
				-- upvalues: var22 (copy)
				var22.setUserSettings(p7)
			end):catch(function() --[[ line: 194 ]]
				-- upvalues: var22 (copy), t (copy)
				var22.setUserSettings(t)
			end)
			
			return
		end
	end, { var17, p3, var24, var22 })
	local var27 = var24 ~= nil and (if var24.playabilityStatus ~= playabilityStatusEnum.ContextualPlayabilityUnverifiedSeventeenPlusUser then if fFlagLuaAppPlayButtonAmpAgeCheckFlow then true else var24 ~= nil and (var24.playabilityStatus == playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls and parentalControlsRequiresAgeCheck(var23, var26)) else true)
	local var28 = reactModule.useCallback(function() --[[ line: 211 ]]
		-- upvalues: p3 (ref), var16 (ref), networkingGamesModule (copy), var22 (ref), fetchUserSettingsAndOptions (copy), var17 (ref), t (copy)
		if p3 == "" then
			return
		end
		var16(networkingGamesModule.GetExperiencesPlayabilityStatus.API({ p3 })):andThen(function(p8) --[[ line: 216 ]]
			-- upvalues: var22 (copy), p3 (copy)
			local var34 = p8.responseBody and p8.responseBody[1]
			
			if var34 then
				var22.setPlayabilityEntry(p3, var34)
			end
		end):catch(function() --[[ line: 222 ]]
			-- upvalues: var22 (copy), p3 (copy)
			var22.clearPlayabilityEntry(p3)
		end)
		fetchUserSettingsAndOptions(var17):andThen(function(p9) --[[ line: 225 ]]
			-- upvalues: var22 (copy)
			var22.setUserSettings(p9)
		end):catch(function() --[[ line: 227 ]]
			-- upvalues: var22 (copy), t (copy)
			var22.setUserSettings(t)
		end)
	end, { var16, var17, p3, var22 })
	local var29 = reactModule.useCallback(function() --[[ line: 232 ]]
		-- upvalues: accessResponseEnum (copy), var28 (ref), p4 (ref), var16 (ref), openAmpWizardContainer (copy), fStringLuaAppPlayButtonAgeCheckAmpFeatureName (copy), fStringLuaAppPlayButtonAgeCheckAmpNameSpace (copy), fFlagLuaAppPlayButtonWizardCloseDelay (copy), delayedAmpWizardCompletionCallbackOverride (copy), fIntLuaAppPlayButtonWizardCloseDelayMs (copy)
		local function onAmpWizardCompletion(p10, _) --[[ line: 233 ]]
			-- upvalues: accessResponseEnum (copy), var28 (copy), p4 (copy)
			local var36 = if p10 == accessResponseEnum.Granted then "Success" elseif p10 == accessResponseEnum.Error then "Error" else "Cancelled"
			
			if var36 == "Success" then
				var28()
			end
			if p4 then
				p4(var36)
			end
		end
		
		var16(openAmpWizardContainer(fStringLuaAppPlayButtonAgeCheckAmpFeatureName, onAmpWizardCompletion, nil, "joinCardAgeCheckRequired", nil, fStringLuaAppPlayButtonAgeCheckAmpNameSpace, nil, nil, if fFlagLuaAppPlayButtonWizardCloseDelay then delayedAmpWizardCompletionCallbackOverride(onAmpWizardCompletion, fIntLuaAppPlayButtonWizardCloseDelayMs) else nil))
	end, { var16, var28, p4 })
	local var30 = var24 ~= nil and (var24.playabilityStatus == playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls and (if var23 ~= nil then var26 == nil and not var20 else true))
	local var31 = if var24 then var24.playabilityStatus else nil
	
	return reactModule.useMemo(function() --[[ line: 275 ]]
		-- upvalues: var31 (ref), var18 (ref), var30 (ref), var27 (ref), var25 (ref), var29 (ref), var28 (ref)
		return {
			cachedPlayabilityStatus = var31,
			playabilityChecked = var18,
			pendingParentalControlsResolution = var30,
			ageCheckRequired = var27,
			playabilityFromCache = var25.current,
			joinAgeCheckUpsellFlow = var29,
			refetchPlayability = var28
		}
	end, {
		var31, var18, var30, var27, var29, var28
	})
end