local GamePlayButton = script:FindFirstAncestor("GamePlayButton")
local _ = require(GamePlayButton.PlayButtonTypes)
local FetchGamePlayButtonDataModule = require(GamePlayButton.FetchGamePlayButtonData)
local Parent = GamePlayButton.Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local AppEventIngestService = require(Parent.RoactServiceTags).AppEventIngestService
local FlaggedMutedErrorFunction = require(Parent.Loggers).flaggedMutedError
local GameInfosReducer = require(Parent.GameInfosRodux).GameInfosReducer
local FetchUserSettingsAndOptionsFunction = require(Parent.GameDetailRodux).FetchUserSettingsAndOptions
local DashModule = require(Parent.Dash)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local NavigateBackFunction = require(Parent.NavigationRodux).Thunks.NavigateBack
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local OpenCloseOnlyInteractiveAlertFunction = require(Parent.DiscoveryRouting).OpenCloseOnlyInteractiveAlert
local OpenUpsellModalFunction = require(Parent.DiscoveryRouting).OpenUpsellModal
local OpenPlayButtonUpsellDialogFunction = require(Parent.DiscoveryRouting).OpenPlayButtonUpsellDialog
local CloseCentralOverlayFunction = require(Parent.CentralOverlay).Thunks.CloseCentralOverlay
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local OpenAmpWizardContainerFunction = require(Parent.AmpUpsell).OpenAmpWizardContainer
local AuthButtonClickFunction = require(Parent.AuthAnalytics).Events.authButtonClick
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local PlayabilityStatusEnum = require(Parent.DiscoveryTypes).PlayabilityStatusEnum
local UnlockPlayIntentFunction = require(Parent.DiscoveryAnalytics).Events.unlockPlayIntent
local DelayedAmpWizardCompletionCallbackOverrideModule = require(GamePlayButton.PlayButtonLaunchChecks.delayedAmpWizardCompletionCallbackOverride)
local UnknownUpsellErrorEventHundredthsPercent = game:DefineFastInt("UnknownUpsellErrorEventHundredthsPercent", 0)
local FFlagLuaAppParentUpsellPolicy = require(Parent.SharedFlags).FFlagLuaAppParentUpsellPolicy
local FFlagLuaAppPlayButtonUpsellLinking = require(Parent.SharedFlags).FFlagLuaAppPlayButtonUpsellLinking
local FFlagLuaAppPlayButtonAmpAgeCheckFlow = require(Parent.SharedFlags).FFlagLuaAppPlayButtonAmpAgeCheckFlow
local FStringLuaAppPlayButtonAgeCheckAmpFeatureName = require(Parent.SharedFlags).FStringLuaAppPlayButtonAgeCheckAmpFeatureName
local FStringLuaAppPlayButtonAgeCheckAmpNameSpace = require(Parent.SharedFlags).FStringLuaAppPlayButtonAgeCheckAmpNameSpace
local FFlagLuaAppParentApprovedExperiences = require(Parent.SharedFlags).FFlagLuaAppParentApprovedExperiences
local GetFFlagEnableAmpWizardVPCNavigationFixFunction = require(Parent.AmpUpsell).GetFFlagEnableAmpWizardVPCNavigationFix
local FFlagLuaAppPlayButtonWizardCloseDelay = require(Parent.SharedFlags).FFlagLuaAppPlayButtonWizardCloseDelay
local FIntLuaAppPlayButtonWizardCloseDelayMs = require(Parent.SharedFlags).FIntLuaAppPlayButtonWizardCloseDelayMs
local FFlagLuaAppLogPageContextUnlockPlayIntent = require(Parent.SharedFlags).FFlagLuaAppLogPageContextUnlockPlayIntent

local function parseContentMaturityMappingString(Text: string)
	if Text == "" then
		return {}
	end
	local t = {}
	
	for _, value in string.split(Text, ",") do
		local Parts = string.split(value, "=")
		
		if #Parts == 2 and Parts[1] ~= "" and Parts[2] ~= "" then
			t[Parts[1]] = Parts[2]
		else
			error(`Invalid content maturity mapping string {Text}`)
		end
	end
	return t
end

local v1 = (function(p1)
	-- upvalues: parseContentMaturityMappingString (copy), FlaggedMutedErrorFunction (copy)
	local Success, Result = pcall(function()
		-- upvalues: parseContentMaturityMappingString (upval), p1 (copy)
		return (parseContentMaturityMappingString(p1))
	end)
	
	if Success then
		return Result
	else
		FlaggedMutedErrorFunction("ExperienceParentalControlsUpsellContentMaturityMappingParsingError", `Error parsing content maturity mapping string {p1}, error is: {Result}`)
		
		return {}
	end
end)((game:DefineFastString("LuaAppUpsellMaturityRatingToSettingMapping", "mild=NinePlus,moderate=ThirteenPlus,restricted=SeventeenPlus,unrated=ThirteenPlus")))

return function(UniverseId, Callback, p1)
	-- upvalues: UseRoactServiceFunction (copy), RoactNetworking (copy), AppEventIngestService (copy), UseDispatchFunction (copy), UseSelectorFunction (copy), GameInfosReducer (copy), UseLocalizationFunction (copy), FFlagLuaAppParentApprovedExperiences (copy), ReactModule (copy), OpenAmpWizardContainerFunction (copy), FFlagLuaAppPlayButtonAmpAgeCheckFlow (copy), FFlagLuaAppPlayButtonWizardCloseDelay (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), FFlagLuaAppPlayButtonUpsellLinking (copy), OpenPlayButtonUpsellDialogFunction (copy), OpenUpsellModalFunction (copy), OpenCloseOnlyInteractiveAlertFunction (copy), NavigateBackFunction (copy), CloseCentralOverlayFunction (copy), FetchGamePlayButtonDataModule (copy), AuthButtonClickFunction (copy), GetFFlagEnableAmpWizardVPCNavigationFixFunction (copy), UnlockPlayIntentFunction (copy), PlayabilityStatusEnum (copy), FFlagLuaAppLogPageContextUnlockPlayIntent (copy), FFlagLuaAppParentUpsellPolicy (copy), UseAppPolicyFunction (copy), FetchUserSettingsAndOptionsFunction (copy), FlaggedMutedErrorFunction (copy), v1 (copy), LoggingProtocolModule (copy), UnknownUpsellErrorEventHundredthsPercent (copy), DashModule (copy), FStringLuaAppPlayButtonAgeCheckAmpFeatureName (copy), FStringLuaAppPlayButtonAgeCheckAmpNameSpace (copy), DelayedAmpWizardCompletionCallbackOverrideModule (copy), FIntLuaAppPlayButtonWizardCloseDelayMs (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppEventIngestService)
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: UniverseId (copy), GameInfosReducer (upval)
		local AgeRecommendation = p2.AgeRecommendations[UniverseId]
		
		if AgeRecommendation and AgeRecommendation.summary and AgeRecommendation.summary.ageRecommendation and AgeRecommendation.summary.ageRecommendation.contentMaturity then
			return AgeRecommendation.summary.ageRecommendation.contentMaturity
		else
			local PersonalizationEntry = p2.Personalization[GameInfosReducer.key][UniverseId]
			
			return if PersonalizationEntry and PersonalizationEntry.contentMaturity then PersonalizationEntry.contentMaturity else nil
		end
	end)
	local UseLocalizationResult = UseLocalizationFunction({
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
		askYourParentToAllowGameBodyText = if FFlagLuaAppParentApprovedExperiences then "Feature.ExperienceDetails.AskYourParentToAllowGameModal.Label.Body" else nil
	})
	local UseResult = ReactModule.useCallback(function(p2, p3, p4, p5, p6, p7, p8)
		-- upvalues: UseDispatchResult (copy), OpenAmpWizardContainerFunction (upval), FFlagLuaAppPlayButtonAmpAgeCheckFlow (upval), FFlagLuaAppPlayButtonWizardCloseDelay (upval)
		UseDispatchResult(OpenAmpWizardContainerFunction(p2, p3, p4, p5, if FFlagLuaAppPlayButtonAmpAgeCheckFlow then p6 else nil, if FFlagLuaAppPlayButtonAmpAgeCheckFlow then p7 else nil, nil, nil, if FFlagLuaAppPlayButtonWizardCloseDelay then p8 else nil))
	end, { UseDispatchResult })
	local UseResult1 = ReactModule.useCallback(function(FeatureName, LocalizationStrings, OnCloseModal, OnCancelled)
		-- upvalues: AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
		local config = {
			name = AppPage.AccountSettingsUpsell,
			extraProps = {
				featureName = FeatureName,
				localizationStrings = LocalizationStrings,
				onCloseModal = OnCloseModal,
				onCancelled = OnCancelled
			}
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config), true)
			
			return
		else
			UseDispatchResult(NavigateDownFunction(config, true))
		end
	end, { UseDispatchResult })
	local UseResult2 = ReactModule.useCallback(function(p2, p3, p4, p5, p6, p7, p8)
		-- upvalues: FFlagLuaAppPlayButtonUpsellLinking (upval), UseDispatchResult (copy), OpenPlayButtonUpsellDialogFunction (upval), OpenUpsellModalFunction (upval)
		if FFlagLuaAppPlayButtonUpsellLinking then
			UseDispatchResult(OpenPlayButtonUpsellDialogFunction(p2, p3, p4, p5, p6, p7, p8))
			
			return
		else
			UseDispatchResult(OpenUpsellModalFunction(p2, p3, p4, p5, p6, p7, p8))
		end
	end, { UseDispatchResult })
	local UseResult3 = ReactModule.useCallback(function(p2, p3, p4, p5, p6)
		-- upvalues: UseDispatchResult (copy), OpenCloseOnlyInteractiveAlertFunction (upval)
		UseDispatchResult(OpenCloseOnlyInteractiveAlertFunction(p2, p3, p4, p5, p6))
	end, { UseDispatchResult })
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateBackFunction (upval)
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.back(true)
			
			return
		else
			UseDispatchResult(NavigateBackFunction(true))
		end
	end, { UseDispatchResult })
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), CloseCentralOverlayFunction (upval)
		UseDispatchResult(CloseCentralOverlayFunction())
	end, { UseDispatchResult })
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), FetchGamePlayButtonDataModule (upval), UseRoactServiceResult (copy), UniverseId (copy)
		UseDispatchResult(FetchGamePlayButtonDataModule.Fetch(UseRoactServiceResult, UniverseId, true))
	end, { UseDispatchResult, UseRoactServiceResult, UniverseId })
	local UseResult7 = ReactModule.useCallback(function()
		-- upvalues: UseResult4 (copy), UseResult6 (copy)
		UseResult4()
		UseResult6()
	end, { UseResult4, UseResult6 })
	local UseResult8 = ReactModule.useCallback(function()
		-- upvalues: UseResult5 (copy), AuthButtonClickFunction (upval), UseResult6 (copy)
		UseResult5()
		AuthButtonClickFunction("gameJoinContentMaturityLock", "cancelAskParent")
		UseResult6()
	end, { UseResult5, UseResult6 })
	local UseResult9 = ReactModule.useCallback(function(ContentAgeRestriction)
		-- upvalues: UseResult5 (copy), AuthButtonClickFunction (upval), FFlagLuaAppParentApprovedExperiences (upval), UseResult (copy), GetFFlagEnableAmpWizardVPCNavigationFixFunction (upval), UseResult6 (copy), UseResult4 (copy), UniverseId (copy)
		UseResult5()
		AuthButtonClickFunction("gameJoinContentMaturityLock", "askParent")
		
		if FFlagLuaAppParentApprovedExperiences then
			UseResult("CanApproveExperience", if GetFFlagEnableAmpWizardVPCNavigationFixFunction() then UseResult6 else UseResult4, {
				experienceManagementAction = "Approve",
				universeId = UniverseId
			}, "gameJoinContentMaturityLock", nil, nil, nil)
			
			return
		else
			UseResult("CanChangeSetting", if GetFFlagEnableAmpWizardVPCNavigationFixFunction() then UseResult6 else UseResult4, { contentAgeRestriction = ContentAgeRestriction }, "gameJoinContentMaturityLock", nil, nil, nil)
		end
	end, {
		UseResult,
		if GetFFlagEnableAmpWizardVPCNavigationFixFunction() then UseResult6 else nil,
		if GetFFlagEnableAmpWizardVPCNavigationFixFunction() then nil else UseResult4,
		UseResult5,
		if FFlagLuaAppParentApprovedExperiences then UniverseId else nil
	})
	local UseResult10 = ReactModule.useCallback(function(UpsellName, p2)
		-- upvalues: UnlockPlayIntentFunction (upval), UseRoactServiceResult1 (copy), UniverseId (copy), FFlagLuaAppParentApprovedExperiences (upval), PlayabilityStatusEnum (upval), FFlagLuaAppLogPageContextUnlockPlayIntent (upval), p1 (copy)
		UnlockPlayIntentFunction(UseRoactServiceResult1, {
			universeId = UniverseId,
			upsellName = UpsellName,
			playabilityStatus = FFlagLuaAppParentApprovedExperiences and p2 or PlayabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls,
			pageName = if FFlagLuaAppLogPageContextUnlockPlayIntent then p1 else nil
		})
	end, {
		UseRoactServiceResult1,
		UniverseId,
		if FFlagLuaAppLogPageContextUnlockPlayIntent then p1 else nil
	})
	local UseAppPolicyResult = if FFlagLuaAppParentUpsellPolicy then UseAppPolicyFunction(function(p2)
		return p2.getShouldShowVpcPlayButtonUpsells()
	end) else nil
	local UseAppPolicyResult1 = UseAppPolicyFunction(function(p2)
		return p2.getWebViewSupport()
	end)
	local UseResult11 = if FFlagLuaAppParentApprovedExperiences then ReactModule.useCallback(function(p2)
		-- upvalues: FFlagLuaAppParentUpsellPolicy (upval), UseAppPolicyResult (ref), Callback (copy), UseResult10 (copy), PlayabilityStatusEnum (upval), UseResult2 (copy), UseLocalizationResult (copy), UseResult9 (copy), UseResult8 (copy)
		if FFlagLuaAppParentUpsellPolicy and not UseAppPolicyResult then
			Callback(p2)
			UseResult10("GameLaunch", PlayabilityStatusEnum.ContextualPlayabilityRequireParentApproval)
			
			return
		else
			UseResult2(UseLocalizationResult.askYourParentTitleText, UseLocalizationResult.askYourParentToAllowGameBodyText, UseLocalizationResult.askYourParentActionButtonText, UseLocalizationResult.askYourParentCancelButtonText, UseResult9, UseResult8, UseResult8)
			UseResult10("ParentApprovedExperience", PlayabilityStatusEnum.ContextualPlayabilityRequireParentApproval)
		end
	end, {
		UseResult2, UseResult9, UseResult8, UseResult10, Callback, UseAppPolicyResult,
		UseLocalizationResult.askYourParentTitleText,
		UseLocalizationResult.askYourParentToAllowGameBodyText,
		UseLocalizationResult.askYourParentActionButtonText,
		UseLocalizationResult.askYourParentCancelButtonText
	}) else nil
	
	return ReactModule.useCallback(function(p2)
		-- upvalues: FFlagLuaAppParentUpsellPolicy (upval), UseAppPolicyResult (ref), Callback (copy), UseResult10 (copy), FetchUserSettingsAndOptionsFunction (upval), UseRoactServiceResult (copy), UseSelectorResult (copy), FlaggedMutedErrorFunction (upval), v1 (upval), LoggingProtocolModule (upval), UnknownUpsellErrorEventHundredthsPercent (upval), UniverseId (copy), DashModule (upval), UseAppPolicyResult1 (copy), UseResult3 (copy), UseLocalizationResult (copy), UseResult5 (copy), UseResult1 (copy), UseResult7 (copy), UseResult2 (copy), UseResult9 (copy), UseResult8 (copy), UseResult (copy), FFlagLuaAppPlayButtonAmpAgeCheckFlow (upval), FStringLuaAppPlayButtonAgeCheckAmpFeatureName (upval), UseResult6 (copy), FFlagLuaAppLogPageContextUnlockPlayIntent (upval), p1 (copy), FStringLuaAppPlayButtonAgeCheckAmpNameSpace (upval), FFlagLuaAppPlayButtonWizardCloseDelay (upval), DelayedAmpWizardCompletionCallbackOverrideModule (upval), FIntLuaAppPlayButtonWizardCloseDelayMs (upval)
		if FFlagLuaAppParentUpsellPolicy and not UseAppPolicyResult then
			Callback(p2)
			UseResult10("GameLaunch")
			
			return
		else
			FetchUserSettingsAndOptionsFunction(UseRoactServiceResult):andThen(function(Result)
				-- upvalues: UseSelectorResult (upval), FlaggedMutedErrorFunction (upval), Callback (upval), p2 (copy), UseResult10 (upval), v1 (upval), LoggingProtocolModule (upval), UnknownUpsellErrorEventHundredthsPercent (upval), UniverseId (upval), DashModule (upval), UseAppPolicyResult1 (upval), UseResult3 (upval), UseLocalizationResult (upval), UseResult5 (upval), UseResult1 (upval), UseResult7 (upval), UseResult2 (upval), UseResult9 (upval), UseResult8 (upval), UseResult (upval), FFlagLuaAppPlayButtonAmpAgeCheckFlow (upval), FStringLuaAppPlayButtonAgeCheckAmpFeatureName (upval), UseResult6 (upval), FFlagLuaAppLogPageContextUnlockPlayIntent (upval), p1 (upval), FStringLuaAppPlayButtonAgeCheckAmpNameSpace (upval), FFlagLuaAppPlayButtonWizardCloseDelay (upval), DelayedAmpWizardCompletionCallbackOverrideModule (upval), FIntLuaAppPlayButtonWizardCloseDelayMs (upval)
				local ContentAgeRestriction = Result.contentAgeRestriction
				
				if not ContentAgeRestriction or not UseSelectorResult then
					FlaggedMutedErrorFunction("ExperienceParentalControlsUpsellUnknownContentMaturityRating", `Unknown content maturity rating {UseSelectorResult} or age restriction setting {ContentAgeRestriction} for Contextual Parental Controls upsell on play button click`)
					Callback(p2)
					UseResult10("GameLaunch")
					
					return
				end
				assert(UseSelectorResult, "Content maturity rating must be present to show correct upsell")
				
				if not v1[UseSelectorResult] then
					LoggingProtocolModule.default:logRobloxTelemetryEvent({
						eventName = "ExperienceParentalControlsUpsellUnexpectedContentMaturityRating",
						description = "Unexpected content maturity rating for Contextual Parental Controls upsell on play button click",
						backends = { LoggingProtocolModule.TelemetryBackends.Points },
						throttlingPercentage = UnknownUpsellErrorEventHundredthsPercent,
						lastUpdated = { 25, 8, 26 }
					}, {
						LoggingProtocolModule.default.StandardizedFields.addOsInfo
					}, {
						eventName = "ExperienceParentalControlsUpsellUnexpectedContentMaturityRating",
						contentMaturityRating = UseSelectorResult,
						universeId = UniverseId
					})
					Callback(p2)
					UseResult10("GameLaunch")
					
					return
				end
				local OptionValue = v1[UseSelectorResult]
				local FindResult = DashModule.find(ContentAgeRestriction.options, function(p3): boolean
					-- upvalues: OptionValue (copy)
					return if p3 and p3.option then p3.option.optionValue == OptionValue else false
				end)
				
				if not FindResult then
					UseResult3(UseLocalizationResult.unplayableTitleText, UseLocalizationResult.unplayableBodyText, UseResult5, UseLocalizationResult.unplayableButtonText, true)
					UseResult10("RestrictedUnplayableOptionNotFound")
					
					return
				end
				local Requirement = FindResult.requirement
				
				if Requirement == "SelfUpdateSetting" then
					if UseAppPolicyResult1 then
						UseResult1("gameJoinContentMaturityLock", {
							title = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Label.Title",
							message = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Label.Body",
							buttonCancel = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Action.Cancel",
							buttonSettings = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Action.GoToSettings"
						}, UseResult7, UseResult7)
					else
						UseResult3(UseLocalizationResult.consoleSelfUpdateSettingTitleText, UseLocalizationResult.consoleSelfUpdateSettingBodyText, UseResult5, UseLocalizationResult.consoleSelfUpdateSettingButtonText, true)
					end
				elseif Requirement == "ParentalConsent" then
					UseResult2(UseLocalizationResult.askYourParentTitleText, UseLocalizationResult.askYourParentBodyText, UseLocalizationResult.askYourParentActionButtonText, UseLocalizationResult.askYourParentCancelButtonText, function()
						-- upvalues: UseResult9 (upval), FindResult (copy)
						UseResult9(FindResult.option.optionValue)
					end, UseResult8, UseResult8)
				elseif Requirement == "ContentAgeRestrictionVerification" then
					UseResult(if FFlagLuaAppPlayButtonAmpAgeCheckFlow then FStringLuaAppPlayButtonAgeCheckAmpFeatureName else "ShouldNotPromptSeventeenPlusSettingVerifications", UseResult6, nil, if FFlagLuaAppPlayButtonAmpAgeCheckFlow then if FFlagLuaAppLogPageContextUnlockPlayIntent and p1 then `gameJoinContentMaturityLock-{p1}` else "gameJoinContentMaturityLock" else nil, nil, if FFlagLuaAppPlayButtonAmpAgeCheckFlow then FStringLuaAppPlayButtonAgeCheckAmpNameSpace else nil, if FFlagLuaAppPlayButtonWizardCloseDelay then DelayedAmpWizardCompletionCallbackOverrideModule(UseResult6, FIntLuaAppPlayButtonWizardCloseDelayMs) else nil)
				else
					FlaggedMutedErrorFunction("ExperienceParentalControlsUnknownUpsellRequirement", `Unknown requirement {Requirement} for ContentAgeRestriction option {FindResult} on play button click`)
					Callback(p2)
				end
				UseResult10(Requirement or "GameLaunch")
			end, function()
				-- upvalues: Callback (upval), p2 (copy), UseResult10 (upval)
				Callback(p2)
				UseResult10("GameLaunch")
			end)
		end
	end, {
		UseRoactServiceResult, UniverseId, Callback, UseSelectorResult,
		UseDispatchResult, UseResult1, UseResult, UseResult3, UseResult2, UseResult9,
		UseResult7, UseResult8, UseResult5,
		if FFlagLuaAppPlayButtonAmpAgeCheckFlow then UseResult6 else nil, UseResult10,
		UseLocalizationResult.unplayableTitleText,
		UseLocalizationResult.unplayableBodyText,
		UseLocalizationResult.unplayableButtonText,
		UseLocalizationResult.askYourParentTitleText,
		UseLocalizationResult.askYourParentBodyText,
		UseLocalizationResult.askYourParentActionButtonText,
		UseLocalizationResult.askYourParentCancelButtonText,
		UseLocalizationResult.consoleSelfUpdateSettingTitleText,
		UseLocalizationResult.consoleSelfUpdateSettingBodyText,
		UseLocalizationResult.consoleSelfUpdateSettingButtonText, UseAppPolicyResult,
		UseAppPolicyResult1,
		if FFlagLuaAppLogPageContextUnlockPlayIntent then p1 else nil
	}), if FFlagLuaAppParentApprovedExperiences then UseResult11 else nil
end