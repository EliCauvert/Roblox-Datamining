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
local var1 = (function(p1)
	local t = {}
	
	if p1 == "" then
		return t
	end
	for i, v in string.split(p1, ",") do
		local parts = string.split(v, "=")
		
		if #parts == 2 and parts[1] ~= "" and parts[2] ~= "" then
			t[parts[1]] = parts[2]
		end
	end
	return t
end)(game:DefineFastString("LuaAppUpsellMaturityRatingToSettingMapping", "mild=NinePlus,moderate=ThirteenPlus,restricted=SeventeenPlus,unrated=ThirteenPlus"))

local function parentalControlsRequiresAgeCheck(p2, p3)
	-- upvalues: var1 (ref)
	if not p2 or not p3 then
		return false
	end
	local contentAgeRestriction = p2.contentAgeRestriction
	
	if not contentAgeRestriction or not contentAgeRestriction.options then
		return false
	end
	local var2 = var1[p3]
	
	if not var2 then
		return false
	end
	for i, v in contentAgeRestriction.options do
		if v and v.option and v.option.optionValue == var2 then
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

return function(p4, p5)
	-- upvalues: useDispatch (ref), useRoactService (ref), roactNetworking (ref), reactModule (ref), joinCardCacheStoreModule (ref), useSignalState (ref), useSelector (ref), networkingGamesModule (ref), playabilityStatusEnum (ref), apiFetchAgeRecommendations (ref), fetchUserSettingsAndOptions (ref), t (ref), parentalControlsRequiresAgeCheck (ref), fFlagLuaAppPlayButtonAmpAgeCheckFlow (ref), accessResponseEnum (ref), openAmpWizardContainer (ref), fStringLuaAppPlayButtonAgeCheckAmpFeatureName (ref), fStringLuaAppPlayButtonAgeCheckAmpNameSpace (ref), fFlagLuaAppPlayButtonWizardCloseDelay (ref), delayedAmpWizardCompletionCallbackOverride (ref), fIntLuaAppPlayButtonWizardCloseDelayMs (ref)
	local var3 = useDispatch()
	local var4 = useRoactService(roactNetworking)
	local var5, var6 = reactModule.useState(false)
	local var7, var8 = reactModule.useState(false)
	local var9 = joinCardCacheStoreModule.get()
	local var10 = useSignalState(var9.getUserSettings)
	local var11 = if p4 ~= "" then nil else useSignalState(var9.getPlayabilityEntries)[p4]
	local var12 = reactModule.useRef(var11 ~= nil)
	local var13 = useSelector(function(p6)
		-- upvalues: p4 (ref)
		local var14 = p6.AgeRecommendations and p6.AgeRecommendations[p4]
		
		return if var14 and var14.summary and var14.summary.ageRecommendation then var14.summary.ageRecommendation.contentMaturity else nil
	end)
	reactModule.useEffect(function()
		-- upvalues: p4 (ref), var6 (ref), var8 (ref), var9 (ref), var3 (ref), networkingGamesModule (copy)
		if p4 == "" then
			var6(true)
			var8(false)
			
			return
		elseif var9.getPlayabilityEntries(false)[p4] == nil then
			var8(false)
			var6(false)
			var3(networkingGamesModule.GetExperiencesPlayabilityStatus.API({ p4 })):andThen(function(p6)
				-- upvalues: var9 (copy), p4 (copy)
				local var14 = p6.responseBody and p6.responseBody[1]
				
				if var14 then
					var9.setPlayabilityEntry(p4, var14)
				end
			end):catch(function() end):finally(function()
				-- upvalues: var6 (copy)
				var6(true)
			end)
			
			return
		end
		var6(true)
		var8(var9.getUserSettings(false) ~= nil)
	end, { var3, p4, var9 })
	reactModule.useEffect(function()
		-- upvalues: p4 (ref), var11 (ref), playabilityStatusEnum (copy), var3 (ref), apiFetchAgeRecommendations (copy), var4 (ref), var8 (ref)
		if p4 == "" then return end
		if (var11 and var11.playabilityStatus) == playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls then
			var3(apiFetchAgeRecommendations.Fetch(var4, p4)):catch(function() end):finally(function()
				-- upvalues: var8 (copy)
				var8(true)
			end)
			
			return
		end
	end, { var3, var4, p4, var11 })
	reactModule.useEffect(function()
		-- upvalues: p4 (ref), var11 (ref), playabilityStatusEnum (copy), var9 (ref), fetchUserSettingsAndOptions (copy), var4 (ref), t (copy)
		if p4 == "" then return end
		if (var11 and var11.playabilityStatus) ~= playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls then return end
		if var9.getUserSettings(false) == nil then
			fetchUserSettingsAndOptions(var4):andThen(function(p6)
				-- upvalues: var9 (copy)
				var9.setUserSettings(p6)
			end):catch(function()
				-- upvalues: var9 (copy), t (copy)
				var9.setUserSettings(t)
			end)
			
			return
		end
	end, { var4, p4, var11, var9 })
	local var14 = var11 ~= nil and (if var11.playabilityStatus ~= playabilityStatusEnum.ContextualPlayabilityUnverifiedSeventeenPlusUser then if fFlagLuaAppPlayButtonAmpAgeCheckFlow then true else var11 ~= nil and (var11.playabilityStatus == playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls and parentalControlsRequiresAgeCheck(var10, var13)) else true)
	local var15 = reactModule.useCallback(function()
		-- upvalues: p4 (ref), var3 (ref), networkingGamesModule (copy), var9 (ref), fetchUserSettingsAndOptions (copy), var4 (ref), t (copy)
		if p4 == "" then
			return
		end
		var3(networkingGamesModule.GetExperiencesPlayabilityStatus.API({ p4 })):andThen(function(p6)
			-- upvalues: var9 (copy), p4 (copy)
			local var16 = p6.responseBody and p6.responseBody[1]
			
			if var16 then
				var9.setPlayabilityEntry(p4, var16)
			end
		end):catch(function()
			-- upvalues: var9 (copy), p4 (copy)
			var9.clearPlayabilityEntry(p4)
		end)
		fetchUserSettingsAndOptions(var4):andThen(function(p6)
			-- upvalues: var9 (copy)
			var9.setUserSettings(p6)
		end):catch(function()
			-- upvalues: var9 (copy), t (copy)
			var9.setUserSettings(t)
		end)
	end, { var3, var4, p4, var9 })
	local var16 = reactModule.useCallback(function()
		-- upvalues: accessResponseEnum (copy), var15 (ref), p5 (ref), var3 (ref), openAmpWizardContainer (copy), fStringLuaAppPlayButtonAgeCheckAmpFeatureName (copy), fStringLuaAppPlayButtonAgeCheckAmpNameSpace (copy), fFlagLuaAppPlayButtonWizardCloseDelay (copy), delayedAmpWizardCompletionCallbackOverride (copy), fIntLuaAppPlayButtonWizardCloseDelayMs (copy)
		local function onAmpWizardCompletion(p6, _)
			-- upvalues: accessResponseEnum (copy), var15 (copy), p5 (copy)
			local var17 = if p6 == accessResponseEnum.Granted then "Success" elseif p6 == accessResponseEnum.Error then "Error" else "Cancelled"
			
			if var17 == "Success" then
				var15()
			end
			if p5 then
				p5(var17)
			end
		end
		
		var3(openAmpWizardContainer(fStringLuaAppPlayButtonAgeCheckAmpFeatureName, onAmpWizardCompletion, nil, "joinCardAgeCheckRequired", nil, fStringLuaAppPlayButtonAgeCheckAmpNameSpace, nil, nil, if fFlagLuaAppPlayButtonWizardCloseDelay then delayedAmpWizardCompletionCallbackOverride(onAmpWizardCompletion, fIntLuaAppPlayButtonWizardCloseDelayMs) else nil))
	end, { var3, var15, p5 })
	local var17 = var11 ~= nil and (var11.playabilityStatus == playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls and (if var10 ~= nil then var13 == nil and not var7 else true))
	local var18 = if var11 then var11.playabilityStatus else nil
	
	return reactModule.useMemo(function()
		-- upvalues: var18 (ref), var5 (ref), var17 (ref), var14 (ref), var12 (ref), var16 (ref), var15 (ref)
		return {
			cachedPlayabilityStatus = var18,
			playabilityChecked = var5,
			pendingParentalControlsResolution = var17,
			ageCheckRequired = var14,
			playabilityFromCache = var12.current,
			joinAgeCheckUpsellFlow = var16,
			refetchPlayability = var15
		}
	end, {
		var18, var5, var17, var14, var16, var15
	})
end