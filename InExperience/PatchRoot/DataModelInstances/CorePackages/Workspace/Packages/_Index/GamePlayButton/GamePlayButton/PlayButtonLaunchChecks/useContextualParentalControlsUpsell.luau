local gamePlayButton = script:FindFirstAncestor("GamePlayButton")
local _ = require(gamePlayButton.PlayButtonTypes)
local fetchGamePlayButtonDataModule = require(gamePlayButton.FetchGamePlayButtonData)
local playButtonUpsellBodyModule = require(gamePlayButton.PlayButtonUpsellBody)
local parent = gamePlayButton.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local appEventIngestService = require(parent.RoactServiceTags).AppEventIngestService
local flaggedMutedError = require(parent.Loggers).flaggedMutedError
local gameInfosReducer = require(parent.GameInfosRodux).GameInfosReducer
local gameHydrationReactModule = require(parent.GameHydrationReact)
local fFlagMigrateGameInfoToStore = require(parent.SharedFlags).FFlagMigrateGameInfoToStore
local fetchUserSettingsAndOptions = require(parent.GameDetailRodux).FetchUserSettingsAndOptions
local dashModule = require(parent.Dash)
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local navigateBack = require(parent.NavigationRodux).Thunks.NavigateBack
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var6 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local openCloseOnlyInteractiveAlert = require(parent.DiscoveryRouting).OpenCloseOnlyInteractiveAlert
local openPlayButtonUpsellDialog = require(parent.DiscoveryRouting).OpenPlayButtonUpsellDialog
local closeCentralOverlay = require(parent.CentralOverlay).Thunks.CloseCentralOverlay
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local openAmpWizardContainer = require(parent.AmpUpsell).OpenAmpWizardContainer
local _ = require(parent.AmpUpsell)
local authButtonClick = require(parent.AuthAnalytics).Events.authButtonClick
local loggingProtocolModule = require(parent.LoggingProtocol)
local playabilityStatusEnum = require(parent.DiscoveryTypes).PlayabilityStatusEnum
local unlockPlayIntent = require(parent.DiscoveryAnalytics).Events.unlockPlayIntent
local delayedAmpWizardCompletionCallbackOverrideModule = require(gamePlayButton.PlayButtonLaunchChecks.delayedAmpWizardCompletionCallbackOverride)
local unknownUpsellErrorEventHundredthsPercent = game:DefineFastInt("UnknownUpsellErrorEventHundredthsPercent", 0)
local luaAppUpsellMaturityRatingToSettingMapping = game:DefineFastString("LuaAppUpsellMaturityRatingToSettingMapping", "mild=NinePlus,moderate=ThirteenPlus,restricted=SeventeenPlus,unrated=ThirteenPlus")
local fFlagLuaAppParentUpsellPolicy = require(parent.SharedFlags).FFlagLuaAppParentUpsellPolicy
local fFlagLuaAppPlayButtonAmpAgeCheckFlow = require(parent.SharedFlags).FFlagLuaAppPlayButtonAmpAgeCheckFlow
local fStringLuaAppPlayButtonAgeCheckAmpFeatureName = require(parent.SharedFlags).FStringLuaAppPlayButtonAgeCheckAmpFeatureName
local fStringLuaAppPlayButtonAgeCheckAmpNameSpace = require(parent.SharedFlags).FStringLuaAppPlayButtonAgeCheckAmpNameSpace
local fFlagLuaAppParentApprovedExperiences = require(parent.SharedFlags).FFlagLuaAppParentApprovedExperiences
local getFFlagEnableAmpWizardVPCNavigationFix = require(parent.AmpUpsell).GetFFlagEnableAmpWizardVPCNavigationFix
local fFlagEnablePlayButtonWizardVPCPrologueModule = require(gamePlayButton.Flags.FFlagEnablePlayButtonWizardVPCPrologue)
local fFlagLuaAppPlayButtonWizardCloseDelay = require(parent.SharedFlags).FFlagLuaAppPlayButtonWizardCloseDelay
local fIntLuaAppPlayButtonWizardCloseDelayMs = require(parent.SharedFlags).FIntLuaAppPlayButtonWizardCloseDelayMs
local _ = {
	SelfUpdateSetting = "SelfUpdateSetting",
	ParentalConsent = "ParentalConsent",
	ContentAgeRestrictionVerification = "ContentAgeRestrictionVerification"
}

local function parseContentMaturityMappingString(p0) --[[ line: 68 ]]
	if p0 == "" then
		return {}
	end
	local t = {}
	
	for i, v in string.split(p0, ",") do
		local parts = string.split(v, "=")
		
		if #parts == 2 and parts[1] ~= "" and parts[2] ~= "" then
			t[parts[1]] = parts[2]
		else
			error(`Invalid content maturity mapping string {p0}`)
		end
	end
	return t
end

local var13 = (function(p1) --[[ line: 89 | named "safeParseContentMaturityMappingString" ]]
	-- upvalues: parseContentMaturityMappingString (ref), flaggedMutedError (ref)
	local ok, status = pcall(function() --[[ line: 90 ]]
		-- upvalues: parseContentMaturityMappingString (copy), p1 (ref)
		return parseContentMaturityMappingString(p1)
	end)
	
	if ok then
		return status
	end
	flaggedMutedError("ExperienceParentalControlsUpsellContentMaturityMappingParsingError", `Error parsing content maturity mapping string {p1}, error is: {status}`)
	
	return {}
end)(luaAppUpsellMaturityRatingToSettingMapping)

return function(p2, p3, p4) --[[ line: 110 ]]
	-- upvalues: useRoactService (ref), roactNetworking (ref), appEventIngestService (ref), useDispatch (ref), useSelector (ref), fFlagMigrateGameInfoToStore (ref), gameInfosReducer (ref), gameHydrationReactModule (ref), useLocalization (ref), fFlagLuaAppParentApprovedExperiences (ref), reactModule (ref), openAmpWizardContainer (ref), fFlagLuaAppPlayButtonAmpAgeCheckFlow (ref), fFlagLuaAppPlayButtonWizardCloseDelay (ref), fFlagEnablePlayButtonWizardVPCPrologueModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var6 (ref), navigateDown (ref), openPlayButtonUpsellDialog (ref), openCloseOnlyInteractiveAlert (ref), navigateBack (ref), closeCentralOverlay (ref), fetchGamePlayButtonDataModule (ref), authButtonClick (ref), playButtonUpsellBodyModule (ref), getFFlagEnableAmpWizardVPCNavigationFix (ref), unlockPlayIntent (ref), playabilityStatusEnum (ref), fFlagLuaAppParentUpsellPolicy (ref), useAppPolicy (ref), fetchUserSettingsAndOptions (ref), flaggedMutedError (ref), var13 (ref), loggingProtocolModule (ref), unknownUpsellErrorEventHundredthsPercent (ref), dashModule (ref), fStringLuaAppPlayButtonAgeCheckAmpFeatureName (ref), fStringLuaAppPlayButtonAgeCheckAmpNameSpace (ref), delayedAmpWizardCompletionCallbackOverrideModule (ref), fIntLuaAppPlayButtonWizardCloseDelayMs (ref)
	local var16 = useRoactService(roactNetworking)
	local var17 = useRoactService(appEventIngestService)
	local var18 = useDispatch()
	local var19 = useSelector(function(p5) --[[ line: 119 ]]
		-- upvalues: p2 (ref), fFlagMigrateGameInfoToStore (copy), gameInfosReducer (copy)
		local var38 = p5.AgeRecommendations[p2]
		
		if var38 and var38.summary and (var38.summary.ageRecommendation and var38.summary.ageRecommendation.contentMaturity) then
			return var38.summary.ageRecommendation.contentMaturity
		elseif fFlagMigrateGameInfoToStore then
			return nil
		end
		local var39 = p5.Personalization[gameInfosReducer.key][p2]
		
		return if var39 and var39.contentMaturity then var39.contentMaturity else nil
	end)
	local var20 = nil
	
	if fFlagMigrateGameInfoToStore then
		local var21 = gameHydrationReactModule.useGameInfo(p2)
		var20 = var21 and var21.contentMaturity
	end
	local var22 = if fFlagMigrateGameInfoToStore then var19 or var20 else var19
	local var23 = useLocalization({
		unplayableTitleText = "Feature.ExperienceDetails.RestrictedUnplayableModal.Label.Title",
		unplayableBodyText = "Feature.ExperienceDetails.RestrictedUnplayableModal.Label.Body",
		unplayableButtonText = "Feature.ExperienceDetails.RestrictedUnplayableModal.Action.Ok",
		askYourParentTitleText = "Feature.ExperienceDetails.AskYourParentModal.Label.Title",
		askYourParentBodyText = "Feature.ExperienceDetails.AskYourParentModal.Label.Body",
		askYourParentActionButtonText = "Feature.ExperienceDetails.AskYourParentModal.Action.AskNow",
		askYourParentCancelButtonText = "Feature.ExperienceDetails.AskYourParentModal.Action.Cancel",
		consoleSelfUpdateSettingTitleText = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Console.Label.Title",
		consoleSelfUpdateSettingBodyText = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Console.Label.Body",
		consoleSelfUpdateSettingButtonText = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Console.Action.Ok",
		askYourParentToAllowGameBodyText = if fFlagLuaAppParentApprovedExperiences then "Feature.ExperienceDetails.AskYourParentToAllowGameModal.Label.Body" else nil
	})
	local var24 = reactModule.useCallback(function(p6, p7, p8, p9, p10, p11, p12, p13) --[[ line: 172 ]]
		-- upvalues: var18 (ref), openAmpWizardContainer (copy), fFlagLuaAppPlayButtonAmpAgeCheckFlow (copy), fFlagLuaAppPlayButtonWizardCloseDelay (copy), fFlagEnablePlayButtonWizardVPCPrologueModule (copy)
		var18(openAmpWizardContainer(p6, p7, p8, p9, if fFlagLuaAppPlayButtonAmpAgeCheckFlow then p10 else nil, if fFlagLuaAppPlayButtonAmpAgeCheckFlow then p11 else nil, nil, nil, if fFlagLuaAppPlayButtonWizardCloseDelay then p12 else nil, if fFlagEnablePlayButtonWizardVPCPrologueModule and p13 then true else nil, if fFlagEnablePlayButtonWizardVPCPrologueModule then p13 else nil))
	end, { var18 })
	local var25 = reactModule.useCallback(function(p14, p15, p16, p17) --[[ line: 202 ]]
		-- upvalues: appPage (copy), fFlagSignalsNavP3Dispatch (copy), var6 (copy), var18 (ref), navigateDown (copy)
		local t = {
			name = appPage.AccountSettingsUpsell,
			extraProps = {
				featureName = p14,
				localizationStrings = p15,
				onCloseModal = p16,
				onCancelled = p17
			}
		}
		
		if fFlagSignalsNavP3Dispatch then
			var6.down(var6.fromLegacyPage(t), true)
			
			return
		end
		var18(navigateDown(t, true))
	end, { var18 })
	local var26 = reactModule.useCallback(function(p18, p19, p20, p21, p22, p23, p24) --[[ line: 222 ]]
		-- upvalues: var18 (ref), openPlayButtonUpsellDialog (copy)
		var18(openPlayButtonUpsellDialog(p18, p19, p20, p21, p22, p23, p24))
	end, { var18 })
	local var27 = reactModule.useCallback(function(p25, p26, p27, p28, p29) --[[ line: 246 ]]
		-- upvalues: var18 (ref), openCloseOnlyInteractiveAlert (copy)
		var18(openCloseOnlyInteractiveAlert(p25, p26, p27, p28, p29))
	end, { var18 })
	local var28 = reactModule.useCallback(function() --[[ line: 250 ]]
		-- upvalues: fFlagSignalsNavP3Dispatch (copy), var6 (copy), var18 (ref), navigateBack (copy)
		if fFlagSignalsNavP3Dispatch then
			var6.back(true)
			
			return
		end
		var18(navigateBack(true))
	end, { var18 })
	local var29 = reactModule.useCallback(function() --[[ line: 258 ]]
		-- upvalues: var18 (ref), closeCentralOverlay (copy)
		var18(closeCentralOverlay())
	end, { var18 })
	local var30 = reactModule.useCallback(function() --[[ line: 262 ]]
		-- upvalues: var18 (ref), fetchGamePlayButtonDataModule (copy), var16 (ref), p2 (ref)
		var18(fetchGamePlayButtonDataModule.Fetch(var16, p2, true))
	end, { var18, var16, p2 })
	local var31 = reactModule.useCallback(function() --[[ line: 266 ]]
		-- upvalues: var28 (ref), var30 (ref)
		var28()
		var30()
	end, { var28, var30 })
	local var32 = reactModule.useCallback(function() --[[ line: 273 ]]
		-- upvalues: var29 (ref), authButtonClick (copy), var30 (ref)
		var29()
		authButtonClick("gameJoinContentMaturityLock", "cancelAskParent")
		var30()
	end, { var29, var30 })
	local var33 = if fFlagEnablePlayButtonWizardVPCPrologueModule then reactModule.useCallback(function(p30) --[[ line: 285 ]]
		-- upvalues: var23 (ref), reactModule (copy), playButtonUpsellBodyModule (copy), var32 (ref), authButtonClick (copy)
		return {
			config = {
				cancelFirst = true,
				dialogSize = "Medium",
				hasBackdrop = true,
				onCloseCancels = true,
				titleText = var23.askYourParentTitleText,
				bodyContent = reactModule.createElement(playButtonUpsellBodyModule, { bodyText = p30, onCloseModal = var32 }),
				confirmText = var23.askYourParentActionButtonText,
				cancelText = var23.askYourParentCancelButtonText
			},
			onConfirm = function() --[[ line: 300 ]]
				-- upvalues: authButtonClick (copy)
				authButtonClick("gameJoinContentMaturityLock", "askParent")
			end,
			onCancel = function() --[[ line: 303 ]]
				-- upvalues: authButtonClick (copy)
				authButtonClick("gameJoinContentMaturityLock", "cancelAskParent")
			end
		}
	end, {
		var23.askYourParentTitleText,
		var23.askYourParentActionButtonText,
		var23.askYourParentCancelButtonText,
		var32
	}) else nil
	local var34 = reactModule.useCallback(function(p31, p32) --[[ line: 318 ]]
		-- upvalues: var29 (ref), fFlagEnablePlayButtonWizardVPCPrologueModule (copy), authButtonClick (copy), fFlagLuaAppParentApprovedExperiences (copy), var24 (ref), getFFlagEnableAmpWizardVPCNavigationFix (copy), var30 (ref), var28 (ref), p2 (ref)
		var29()
		
		if not fFlagEnablePlayButtonWizardVPCPrologueModule then
			authButtonClick("gameJoinContentMaturityLock", "askParent")
		end
		if fFlagLuaAppParentApprovedExperiences then
			var24("CanApproveExperience", if getFFlagEnableAmpWizardVPCNavigationFix() then var30 else var28, { experienceManagementAction = "Approve", universeId = p2 }, "gameJoinContentMaturityLock", nil, nil, nil, if fFlagEnablePlayButtonWizardVPCPrologueModule then p32 else nil)
			
			return
		end
		var24("CanChangeSetting", if getFFlagEnableAmpWizardVPCNavigationFix() then var30 else var28, { contentAgeRestriction = p31 }, "gameJoinContentMaturityLock", nil, nil, nil, if fFlagEnablePlayButtonWizardVPCPrologueModule then p32 else nil)
	end, {
		var24,
		if getFFlagEnableAmpWizardVPCNavigationFix() then var30 else nil,
		if not getFFlagEnableAmpWizardVPCNavigationFix() then var28 else nil,
		var29,
		if fFlagLuaAppParentApprovedExperiences then p2 else nil
	})
	local var35 = reactModule.useCallback(function(p33, p34) --[[ line: 364 ]]
		-- upvalues: unlockPlayIntent (copy), var17 (ref), p2 (ref), fFlagLuaAppParentApprovedExperiences (copy), playabilityStatusEnum (copy), p4 (ref)
		unlockPlayIntent(var17, {
			universeId = p2,
			upsellName = p33,
			playabilityStatus = if fFlagLuaAppParentApprovedExperiences then p34 or playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls else playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls,
			pageName = p4
		})
	end, { var17, p2, p4 })
	local var36 = if fFlagLuaAppParentUpsellPolicy then useAppPolicy(function(p35) --[[ line: 377 ]]
		return p35.getShouldShowVpcPlayButtonUpsells()
	end) else nil
	local var37 = useAppPolicy(function(p36) --[[ line: 382 ]]
		return p36.getWebViewSupport()
	end)
	
	return reactModule.useCallback(function(p37) --[[ line: 433 ]]
		-- upvalues: fFlagLuaAppParentUpsellPolicy (copy), var36 (write), p3 (ref), var35 (ref), fetchUserSettingsAndOptions (copy), var16 (ref), var22 (ref), flaggedMutedError (copy), var13 (copy), loggingProtocolModule (copy), unknownUpsellErrorEventHundredthsPercent (copy), p2 (ref), dashModule (copy), var37 (ref), var27 (ref), var23 (ref), var29 (ref), var25 (ref), var31 (ref), fFlagEnablePlayButtonWizardVPCPrologueModule (copy), var34 (ref), var33 (write), var26 (ref), var32 (ref), var24 (ref), fFlagLuaAppPlayButtonAmpAgeCheckFlow (copy), fStringLuaAppPlayButtonAgeCheckAmpFeatureName (copy), var30 (ref), p4 (ref), fStringLuaAppPlayButtonAgeCheckAmpNameSpace (copy), fFlagLuaAppPlayButtonWizardCloseDelay (copy), delayedAmpWizardCompletionCallbackOverrideModule (copy), fIntLuaAppPlayButtonWizardCloseDelayMs (copy)
		if fFlagLuaAppParentUpsellPolicy and not var36 then
			p3(p37)
			var35("GameLaunch")
			
			return
		end
		fetchUserSettingsAndOptions(var16):andThen(function(p38) --[[ line: 442 ]]
			-- upvalues: var22 (copy), flaggedMutedError (copy), p3 (copy), p37 (ref), var35 (copy), var13 (copy), loggingProtocolModule (copy), unknownUpsellErrorEventHundredthsPercent (copy), p2 (copy), dashModule (copy), var37 (copy), var27 (copy), var23 (copy), var29 (copy), var25 (copy), var31 (copy), fFlagEnablePlayButtonWizardVPCPrologueModule (copy), var34 (copy), var33 (copy), var26 (copy), var32 (copy), var24 (copy), fFlagLuaAppPlayButtonAmpAgeCheckFlow (copy), fStringLuaAppPlayButtonAgeCheckAmpFeatureName (copy), var30 (copy), p4 (copy), fStringLuaAppPlayButtonAgeCheckAmpNameSpace (copy), fFlagLuaAppPlayButtonWizardCloseDelay (copy), delayedAmpWizardCompletionCallbackOverrideModule (copy), fIntLuaAppPlayButtonWizardCloseDelayMs (copy)
			local contentAgeRestriction = p38.contentAgeRestriction
			
			if not contentAgeRestriction or not var22 then
				flaggedMutedError("ExperienceParentalControlsUpsellUnknownContentMaturityRating", `Unknown content maturity rating {var22} or age restriction setting {contentAgeRestriction} for Contextual Parental Controls upsell on play button click`)
				p3(p37)
				var35("GameLaunch")
				
				return
			end
			assert(var22, "Content maturity rating must be present to show correct upsell")
			
			if not var13[var22] then
				loggingProtocolModule.default:logRobloxTelemetryEvent({
					eventName = "ExperienceParentalControlsUpsellUnexpectedContentMaturityRating",
					description = "Unexpected content maturity rating for Contextual Parental Controls upsell on play button click",
					backends = { loggingProtocolModule.TelemetryBackends.Points },
					throttlingPercentage = unknownUpsellErrorEventHundredthsPercent,
					lastUpdated = { 25, 8, 26 }
				}, {
					loggingProtocolModule.default.StandardizedFields.addOsInfo
				}, {
					eventName = "ExperienceParentalControlsUpsellUnexpectedContentMaturityRating",
					contentMaturityRating = var22,
					universeId = p2
				})
				p3(p37)
				var35("GameLaunch")
				
				return
			end
			local var41 = var13[var22]
			local var42 = dashModule.find(contentAgeRestriction.options, function(p39) --[[ line: 485 ]]
				-- upvalues: var41 (ref)
				local var43
				if p39 and p39.option then
					var43 = true
					
					if p39.option.optionValue ~= var41 then
						var43 = false
					end
					return var43
				end
			end)
			
			if not var42 then
				var27(var23.unplayableTitleText, var23.unplayableBodyText, var29, var23.unplayableButtonText, true)
				var35("RestrictedUnplayableOptionNotFound")
				
				return
			end
			local requirement = var42.requirement
			
			if requirement == "SelfUpdateSetting" then
				if var37 then
					var25("gameJoinContentMaturityLock", {
						title = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Label.Title",
						message = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Label.Body",
						buttonCancel = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Action.Cancel",
						buttonSettings = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Action.GoToSettings"
					}, var31, var31)
				else
					var27(var23.consoleSelfUpdateSettingTitleText, var23.consoleSelfUpdateSettingBodyText, var29, var23.consoleSelfUpdateSettingButtonText, true)
				end
			elseif requirement == "ParentalConsent" then
				if fFlagEnablePlayButtonWizardVPCPrologueModule then
					var34(var42.option.optionValue, var33(var23.askYourParentBodyText))
				else
					var26(var23.askYourParentTitleText, var23.askYourParentBodyText, var23.askYourParentActionButtonText, var23.askYourParentCancelButtonText, function() --[[ line: 522 ]]
						-- upvalues: var34 (copy), var42 (ref)
						var34(var42.option.optionValue)
					end, var32, var32)
				end
			elseif requirement == "ContentAgeRestrictionVerification" then
				var24(if fFlagLuaAppPlayButtonAmpAgeCheckFlow then fStringLuaAppPlayButtonAgeCheckAmpFeatureName else "ShouldNotPromptSeventeenPlusSettingVerifications", var30, nil, if fFlagLuaAppPlayButtonAmpAgeCheckFlow then if p4 then `gameJoinContentMaturityLock-{p4}` else "gameJoinContentMaturityLock" else nil, nil, if fFlagLuaAppPlayButtonAmpAgeCheckFlow then fStringLuaAppPlayButtonAgeCheckAmpNameSpace else nil, if fFlagLuaAppPlayButtonWizardCloseDelay then delayedAmpWizardCompletionCallbackOverrideModule(var30, fIntLuaAppPlayButtonWizardCloseDelayMs) else nil)
			else
				flaggedMutedError("ExperienceParentalControlsUnknownUpsellRequirement", `Unknown requirement {requirement} for ContentAgeRestriction option {var42} on play button click`)
				p3(p37)
			end
			var35(requirement or "GameLaunch")
		end, function() --[[ line: 575 ]]
			-- upvalues: p3 (copy), p37 (ref), var35 (copy)
			p3(p37)
			var35("GameLaunch")
		end)
	end, {
		var16, p2, p3, var22, var18, var25, var24, var27, var26, var34, var31, var32,
		var29, if fFlagLuaAppPlayButtonAmpAgeCheckFlow then var30 else nil, var35,
		var23.unplayableTitleText, var23.unplayableBodyText,
		var23.unplayableButtonText, var23.askYourParentTitleText,
		var23.askYourParentBodyText, var23.askYourParentActionButtonText,
		var23.askYourParentCancelButtonText, var23.consoleSelfUpdateSettingTitleText,
		var23.consoleSelfUpdateSettingBodyText,
		var23.consoleSelfUpdateSettingButtonText, var36, var37, p4,
		if fFlagEnablePlayButtonWizardVPCPrologueModule then var33 else nil
	}), if fFlagLuaAppParentApprovedExperiences then if fFlagLuaAppParentApprovedExperiences then reactModule.useCallback(function(p40) --[[ line: 388 ]]
		-- upvalues: fFlagLuaAppParentUpsellPolicy (copy), var36 (write), p3 (ref), var35 (ref), playabilityStatusEnum (copy), fFlagEnablePlayButtonWizardVPCPrologueModule (copy), var34 (ref), var33 (write), var23 (ref), var26 (ref), var32 (ref)
		if fFlagLuaAppParentUpsellPolicy and not var36 then
			p3(p40)
			var35("GameLaunch", playabilityStatusEnum.ContextualPlayabilityRequireParentApproval)
			
			return
		elseif fFlagEnablePlayButtonWizardVPCPrologueModule then
			var34(nil, var33(var23.askYourParentToAllowGameBodyText))
		else
			var26(var23.askYourParentTitleText, var23.askYourParentToAllowGameBodyText, var23.askYourParentActionButtonText, var23.askYourParentCancelButtonText, var34, var32, var32)
		end
		var35("ParentApprovedExperience", playabilityStatusEnum.ContextualPlayabilityRequireParentApproval)
	end, {
		var26, var34, var32, var35, p3, var36, var23.askYourParentTitleText,
		var23.askYourParentToAllowGameBodyText, var23.askYourParentActionButtonText,
		var23.askYourParentCancelButtonText,
		if fFlagEnablePlayButtonWizardVPCPrologueModule then var33 else nil
	}) else nil else nil
end