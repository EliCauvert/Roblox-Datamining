local GamePlayButton = script:FindFirstAncestor("GamePlayButton")
local _ = require(GamePlayButton.PlayButtonTypes)
local FetchGamePlayButtonDataModule = require(GamePlayButton.FetchGamePlayButtonData)
local PlayButtonUpsellBodyModule = require(GamePlayButton.PlayButtonUpsellBody)
local Parent = GamePlayButton.Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local AppEventIngestService = require(Parent.RoactServiceTags).AppEventIngestService
local FlaggedMutedErrorFunction = require(Parent.Loggers).flaggedMutedError
local GameInfosReducer = require(Parent.GameInfosRodux).GameInfosReducer
local GameHydrationReactModule = require(Parent.GameHydrationReact)
local FFlagMigrateGameInfoToStore = require(Parent.SharedFlags).FFlagMigrateGameInfoToStore
local FetchUserSettingsAndOptionsFunction = require(Parent.GameDetailRodux).FetchUserSettingsAndOptions
local DashModule = require(Parent.Dash)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local NavigateBackFunction = require(Parent.NavigationRodux).Thunks.NavigateBack
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local OpenCloseOnlyInteractiveAlertFunction = require(Parent.DiscoveryRouting).OpenCloseOnlyInteractiveAlert
local OpenPlayButtonUpsellDialogFunction = require(Parent.DiscoveryRouting).OpenPlayButtonUpsellDialog
local CloseCentralOverlayFunction = require(Parent.CentralOverlay).Thunks.CloseCentralOverlay
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local OpenAmpWizardContainerFunction = require(Parent.AmpUpsell).OpenAmpWizardContainer
local _ = require(Parent.AmpUpsell)
local AuthButtonClickFunction = require(Parent.AuthAnalytics).Events.authButtonClick
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local PlayabilityStatusEnum = require(Parent.DiscoveryTypes).PlayabilityStatusEnum
local UnlockPlayIntentFunction = require(Parent.DiscoveryAnalytics).Events.unlockPlayIntent
local DelayedAmpWizardCompletionCallbackOverrideModule = require(GamePlayButton.PlayButtonLaunchChecks.delayedAmpWizardCompletionCallbackOverride)
local UnknownUpsellErrorEventHundredthsPercent = game:DefineFastInt("UnknownUpsellErrorEventHundredthsPercent", 0)
local FFlagLuaAppParentUpsellPolicy = require(Parent.SharedFlags).FFlagLuaAppParentUpsellPolicy
local FFlagLuaAppPlayButtonAmpAgeCheckFlow = require(Parent.SharedFlags).FFlagLuaAppPlayButtonAmpAgeCheckFlow
local FStringLuaAppPlayButtonAgeCheckAmpFeatureName = require(Parent.SharedFlags).FStringLuaAppPlayButtonAgeCheckAmpFeatureName
local FStringLuaAppPlayButtonAgeCheckAmpNameSpace = require(Parent.SharedFlags).FStringLuaAppPlayButtonAgeCheckAmpNameSpace
local FFlagLuaAppVpcUpsellNamespace = require(Parent.SharedFlags).FFlagLuaAppVpcUpsellNamespace
local FStringLuaAppVpcSettingsChangeAmpNameSpace = require(Parent.SharedFlags).FStringLuaAppVpcSettingsChangeAmpNameSpace
local FStringLuaAppVpcAccountManagementAmpNameSpace = require(Parent.SharedFlags).FStringLuaAppVpcAccountManagementAmpNameSpace
local FFlagLuaAppParentApprovedExperiences = require(Parent.SharedFlags).FFlagLuaAppParentApprovedExperiences
local GetFFlagEnableAmpWizardVPCNavigationFixFunction = require(Parent.AmpUpsell).GetFFlagEnableAmpWizardVPCNavigationFix
local FFlagEnablePlayButtonWizardVPCPrologueModule = require(GamePlayButton.Flags.FFlagEnablePlayButtonWizardVPCPrologue)
local FFlagLuaAppPlayButtonOdpEventUniverseIdModule = require(GamePlayButton.Flags.FFlagLuaAppPlayButtonOdpEventUniverseId)
local FFlagLuaAppPlayButtonWizardCloseDelay = require(Parent.SharedFlags).FFlagLuaAppPlayButtonWizardCloseDelay
local FIntLuaAppPlayButtonWizardCloseDelayMs = require(Parent.SharedFlags).FIntLuaAppPlayButtonWizardCloseDelayMs

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

return function(UniverseId, Callback, PageName)
	-- upvalues: UseRoactServiceFunction (copy), RoactNetworking (copy), AppEventIngestService (copy), UseDispatchFunction (copy), UseSelectorFunction (copy), FFlagMigrateGameInfoToStore (copy), GameInfosReducer (copy), GameHydrationReactModule (copy), UseLocalizationFunction (copy), FFlagLuaAppParentApprovedExperiences (copy), ReactModule (copy), OpenAmpWizardContainerFunction (copy), FFlagLuaAppPlayButtonAmpAgeCheckFlow (copy), FFlagLuaAppVpcUpsellNamespace (copy), FFlagLuaAppPlayButtonWizardCloseDelay (copy), FFlagEnablePlayButtonWizardVPCPrologueModule (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), OpenPlayButtonUpsellDialogFunction (copy), OpenCloseOnlyInteractiveAlertFunction (copy), NavigateBackFunction (copy), CloseCentralOverlayFunction (copy), FetchGamePlayButtonDataModule (copy), AuthButtonClickFunction (copy), PlayButtonUpsellBodyModule (copy), FFlagLuaAppPlayButtonOdpEventUniverseIdModule (copy), GetFFlagEnableAmpWizardVPCNavigationFixFunction (copy), FStringLuaAppVpcAccountManagementAmpNameSpace (copy), FStringLuaAppVpcSettingsChangeAmpNameSpace (copy), UnlockPlayIntentFunction (copy), PlayabilityStatusEnum (copy), FFlagLuaAppParentUpsellPolicy (copy), UseAppPolicyFunction (copy), FetchUserSettingsAndOptionsFunction (copy), FlaggedMutedErrorFunction (copy), v1 (copy), LoggingProtocolModule (copy), UnknownUpsellErrorEventHundredthsPercent (copy), DashModule (copy), FStringLuaAppPlayButtonAgeCheckAmpFeatureName (copy), FStringLuaAppPlayButtonAgeCheckAmpNameSpace (copy), DelayedAmpWizardCompletionCallbackOverrideModule (copy), FIntLuaAppPlayButtonWizardCloseDelayMs (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppEventIngestService)
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(function(p1)
		-- upvalues: UniverseId (copy), FFlagMigrateGameInfoToStore (upval), GameInfosReducer (upval)
		local AgeRecommendation = p1.AgeRecommendations[UniverseId]
		
		if AgeRecommendation and AgeRecommendation.summary and AgeRecommendation.summary.ageRecommendation and AgeRecommendation.summary.ageRecommendation.contentMaturity then
			return AgeRecommendation.summary.ageRecommendation.contentMaturity
		elseif FFlagMigrateGameInfoToStore then
			return nil
		else
			local PersonalizationEntry = p1.Personalization[GameInfosReducer.key][UniverseId]
			
			return if PersonalizationEntry and PersonalizationEntry.contentMaturity then PersonalizationEntry.contentMaturity else nil
		end
	end)
	local ContentMaturity = nil
	
	if FFlagMigrateGameInfoToStore then
		local UseGameInfoResult = GameHydrationReactModule.useGameInfo(UniverseId)
		ContentMaturity = UseGameInfoResult and UseGameInfoResult.contentMaturity
	end
	local UseSelectorResult1 = if FFlagMigrateGameInfoToStore then UseSelectorResult or ContentMaturity else UseSelectorResult
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
	local UseResult = ReactModule.useCallback(function(p1, p2, p3, p4, p5, p6, p7, p8)
		-- upvalues: UseDispatchResult (copy), OpenAmpWizardContainerFunction (upval), FFlagLuaAppPlayButtonAmpAgeCheckFlow (upval), FFlagLuaAppVpcUpsellNamespace (upval), FFlagLuaAppPlayButtonWizardCloseDelay (upval), FFlagEnablePlayButtonWizardVPCPrologueModule (upval)
		UseDispatchResult(OpenAmpWizardContainerFunction(p1, p2, p3, p4, if FFlagLuaAppPlayButtonAmpAgeCheckFlow then p5 else nil, if FFlagLuaAppPlayButtonAmpAgeCheckFlow or FFlagLuaAppVpcUpsellNamespace then p6 else nil, nil, nil, if FFlagLuaAppPlayButtonWizardCloseDelay then p7 else nil, if FFlagEnablePlayButtonWizardVPCPrologueModule and p8 then true else nil, if FFlagEnablePlayButtonWizardVPCPrologueModule then p8 else nil))
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
	local UseResult2 = ReactModule.useCallback(function(p1, p2, p3, p4, p5, p6, p7)
		-- upvalues: UseDispatchResult (copy), OpenPlayButtonUpsellDialogFunction (upval)
		UseDispatchResult(OpenPlayButtonUpsellDialogFunction(p1, p2, p3, p4, p5, p6, p7))
	end, { UseDispatchResult })
	local UseResult3 = ReactModule.useCallback(function(p1, p2, p3, p4, p5)
		-- upvalues: UseDispatchResult (copy), OpenCloseOnlyInteractiveAlertFunction (upval)
		UseDispatchResult(OpenCloseOnlyInteractiveAlertFunction(p1, p2, p3, p4, p5))
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
	local UseResult9 = if FFlagEnablePlayButtonWizardVPCPrologueModule then ReactModule.useCallback(function(BodyText)
		-- upvalues: UseLocalizationResult (copy), FFlagLuaAppVpcUpsellNamespace (upval), ReactModule (upval), PlayButtonUpsellBodyModule (upval), UseResult8 (copy), AuthButtonClickFunction (upval), FFlagLuaAppPlayButtonOdpEventUniverseIdModule (upval), UniverseId (copy)
		return {
			config = {
				cancelFirst = true,
				dialogSize = "Medium",
				hasBackdrop = true,
				onCloseCancels = true,
				titleText = UseLocalizationResult.askYourParentTitleText,
				bodyText = if FFlagLuaAppVpcUpsellNamespace then BodyText else nil,
				bodyContent = ReactModule.createElement(PlayButtonUpsellBodyModule, { bodyText = BodyText, onCloseModal = UseResult8 }),
				confirmText = UseLocalizationResult.askYourParentActionButtonText,
				cancelText = UseLocalizationResult.askYourParentCancelButtonText
			},
			onConfirm = function()
				-- upvalues: AuthButtonClickFunction (upval)
				AuthButtonClickFunction("gameJoinContentMaturityLock", "askParent")
			end,
			onCancel = function()
				-- upvalues: AuthButtonClickFunction (upval)
				AuthButtonClickFunction("gameJoinContentMaturityLock", "cancelAskParent")
			end,
			odpEventUniverseId = if FFlagLuaAppPlayButtonOdpEventUniverseIdModule then UniverseId else nil
		}
	end, {
		UseLocalizationResult.askYourParentTitleText,
		UseLocalizationResult.askYourParentActionButtonText,
		UseLocalizationResult.askYourParentCancelButtonText,
		UseResult8,
		if FFlagLuaAppPlayButtonOdpEventUniverseIdModule then UniverseId else nil
	}) else nil
	local UseResult10 = ReactModule.useCallback(function(ContentAgeRestriction, p1)
		-- upvalues: UseResult5 (copy), FFlagEnablePlayButtonWizardVPCPrologueModule (upval), AuthButtonClickFunction (upval), FFlagLuaAppParentApprovedExperiences (upval), UseResult (copy), GetFFlagEnableAmpWizardVPCNavigationFixFunction (upval), UseResult6 (copy), UseResult4 (copy), UniverseId (copy), FFlagLuaAppVpcUpsellNamespace (upval), FStringLuaAppVpcAccountManagementAmpNameSpace (upval), FStringLuaAppVpcSettingsChangeAmpNameSpace (upval)
		UseResult5()
		
		if not FFlagEnablePlayButtonWizardVPCPrologueModule then
			AuthButtonClickFunction("gameJoinContentMaturityLock", "askParent")
		end
		if FFlagLuaAppParentApprovedExperiences then
			UseResult("CanApproveExperience", if GetFFlagEnableAmpWizardVPCNavigationFixFunction() then UseResult6 else UseResult4, {
				experienceManagementAction = "Approve",
				universeId = UniverseId
			}, "gameJoinContentMaturityLock", nil, if FFlagLuaAppVpcUpsellNamespace then FStringLuaAppVpcAccountManagementAmpNameSpace else nil, nil, if FFlagEnablePlayButtonWizardVPCPrologueModule then p1 else nil)
			
			return
		else
			UseResult("CanChangeSetting", if GetFFlagEnableAmpWizardVPCNavigationFixFunction() then UseResult6 else UseResult4, { contentAgeRestriction = ContentAgeRestriction }, "gameJoinContentMaturityLock", nil, if FFlagLuaAppVpcUpsellNamespace then FStringLuaAppVpcSettingsChangeAmpNameSpace else nil, nil, if FFlagEnablePlayButtonWizardVPCPrologueModule then p1 else nil)
		end
	end, {
		UseResult,
		if GetFFlagEnableAmpWizardVPCNavigationFixFunction() then UseResult6 else nil,
		if GetFFlagEnableAmpWizardVPCNavigationFixFunction() then nil else UseResult4,
		UseResult5,
		if FFlagLuaAppParentApprovedExperiences or FFlagEnablePlayButtonWizardVPCPrologueModule and FFlagLuaAppPlayButtonOdpEventUniverseIdModule then UniverseId else nil
	})
	local UseResult11 = ReactModule.useCallback(function(UpsellName, p1)
		-- upvalues: UnlockPlayIntentFunction (upval), UseRoactServiceResult1 (copy), UniverseId (copy), FFlagLuaAppParentApprovedExperiences (upval), PlayabilityStatusEnum (upval), PageName (copy)
		UnlockPlayIntentFunction(UseRoactServiceResult1, {
			universeId = UniverseId,
			upsellName = UpsellName,
			playabilityStatus = FFlagLuaAppParentApprovedExperiences and p1 or PlayabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls,
			pageName = PageName
		})
	end, { UseRoactServiceResult1, UniverseId, PageName })
	local UseAppPolicyResult = if FFlagLuaAppParentUpsellPolicy then UseAppPolicyFunction(function(p1)
		return p1.getShouldShowVpcPlayButtonUpsells()
	end) else nil
	local UseAppPolicyResult1 = UseAppPolicyFunction(function(p1)
		return p1.getWebViewSupport()
	end)
	local UseResult12 = if FFlagLuaAppParentApprovedExperiences then ReactModule.useCallback(function(p1)
		-- upvalues: FFlagLuaAppParentUpsellPolicy (upval), UseAppPolicyResult (ref), Callback (copy), UseResult11 (copy), PlayabilityStatusEnum (upval), FFlagEnablePlayButtonWizardVPCPrologueModule (upval), UseResult10 (copy), UseResult9 (ref), UseLocalizationResult (copy), UseResult2 (copy), UseResult8 (copy)
		if FFlagLuaAppParentUpsellPolicy and not UseAppPolicyResult then
			Callback(p1)
			UseResult11("GameLaunch", PlayabilityStatusEnum.ContextualPlayabilityRequireParentApproval)
			
			return
		end
		if FFlagEnablePlayButtonWizardVPCPrologueModule then
			UseResult10(nil, UseResult9(UseLocalizationResult.askYourParentToAllowGameBodyText))
		else
			UseResult2(UseLocalizationResult.askYourParentTitleText, UseLocalizationResult.askYourParentToAllowGameBodyText, UseLocalizationResult.askYourParentActionButtonText, UseLocalizationResult.askYourParentCancelButtonText, UseResult10, UseResult8, UseResult8)
		end
		UseResult11("ParentApprovedExperience", PlayabilityStatusEnum.ContextualPlayabilityRequireParentApproval)
	end, {
		UseResult2, UseResult10, UseResult8, UseResult11, Callback, UseAppPolicyResult,
		UseLocalizationResult.askYourParentTitleText,
		UseLocalizationResult.askYourParentToAllowGameBodyText,
		UseLocalizationResult.askYourParentActionButtonText,
		UseLocalizationResult.askYourParentCancelButtonText,
		if FFlagEnablePlayButtonWizardVPCPrologueModule then UseResult9 else nil
	}) else nil
	
	return ReactModule.useCallback(function(p1)
		-- upvalues: FFlagLuaAppParentUpsellPolicy (upval), UseAppPolicyResult (ref), Callback (copy), UseResult11 (copy), FetchUserSettingsAndOptionsFunction (upval), UseRoactServiceResult (copy), UseSelectorResult1 (copy), FlaggedMutedErrorFunction (upval), v1 (upval), LoggingProtocolModule (upval), UnknownUpsellErrorEventHundredthsPercent (upval), UniverseId (copy), DashModule (upval), UseAppPolicyResult1 (copy), UseResult3 (copy), UseLocalizationResult (copy), UseResult5 (copy), UseResult1 (copy), UseResult7 (copy), FFlagEnablePlayButtonWizardVPCPrologueModule (upval), UseResult10 (copy), UseResult9 (ref), UseResult2 (copy), UseResult8 (copy), UseResult (copy), FFlagLuaAppPlayButtonAmpAgeCheckFlow (upval), FStringLuaAppPlayButtonAgeCheckAmpFeatureName (upval), UseResult6 (copy), PageName (copy), FStringLuaAppPlayButtonAgeCheckAmpNameSpace (upval), FFlagLuaAppPlayButtonWizardCloseDelay (upval), DelayedAmpWizardCompletionCallbackOverrideModule (upval), FIntLuaAppPlayButtonWizardCloseDelayMs (upval)
		if FFlagLuaAppParentUpsellPolicy and not UseAppPolicyResult then
			Callback(p1)
			UseResult11("GameLaunch")
			
			return
		else
			FetchUserSettingsAndOptionsFunction(UseRoactServiceResult):andThen(function(Result)
				-- upvalues: UseSelectorResult1 (upval), FlaggedMutedErrorFunction (upval), Callback (upval), p1 (copy), UseResult11 (upval), v1 (upval), LoggingProtocolModule (upval), UnknownUpsellErrorEventHundredthsPercent (upval), UniverseId (upval), DashModule (upval), UseAppPolicyResult1 (upval), UseResult3 (upval), UseLocalizationResult (upval), UseResult5 (upval), UseResult1 (upval), UseResult7 (upval), FFlagEnablePlayButtonWizardVPCPrologueModule (upval), UseResult10 (upval), UseResult9 (upval), UseResult2 (upval), UseResult8 (upval), UseResult (upval), FFlagLuaAppPlayButtonAmpAgeCheckFlow (upval), FStringLuaAppPlayButtonAgeCheckAmpFeatureName (upval), UseResult6 (upval), PageName (upval), FStringLuaAppPlayButtonAgeCheckAmpNameSpace (upval), FFlagLuaAppPlayButtonWizardCloseDelay (upval), DelayedAmpWizardCompletionCallbackOverrideModule (upval), FIntLuaAppPlayButtonWizardCloseDelayMs (upval)
				local ContentAgeRestriction = Result.contentAgeRestriction
				
				if not ContentAgeRestriction or not UseSelectorResult1 then
					FlaggedMutedErrorFunction("ExperienceParentalControlsUpsellUnknownContentMaturityRating", `Unknown content maturity rating {UseSelectorResult1} or age restriction setting {ContentAgeRestriction} for Contextual Parental Controls upsell on play button click`)
					Callback(p1)
					UseResult11("GameLaunch")
					
					return
				end
				assert(UseSelectorResult1, "Content maturity rating must be present to show correct upsell")
				
				if not v1[UseSelectorResult1] then
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
						contentMaturityRating = UseSelectorResult1,
						universeId = UniverseId
					})
					Callback(p1)
					UseResult11("GameLaunch")
					
					return
				end
				local OptionValue = v1[UseSelectorResult1]
				local FindResult = DashModule.find(ContentAgeRestriction.options, function(p2): boolean
					-- upvalues: OptionValue (copy)
					return if p2 and p2.option then p2.option.optionValue == OptionValue else false
				end)
				
				if not FindResult then
					UseResult3(UseLocalizationResult.unplayableTitleText, UseLocalizationResult.unplayableBodyText, UseResult5, UseLocalizationResult.unplayableButtonText, true)
					UseResult11("RestrictedUnplayableOptionNotFound")
					
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
					if FFlagEnablePlayButtonWizardVPCPrologueModule then
						UseResult10(FindResult.option.optionValue, UseResult9(UseLocalizationResult.askYourParentBodyText))
					else
						UseResult2(UseLocalizationResult.askYourParentTitleText, UseLocalizationResult.askYourParentBodyText, UseLocalizationResult.askYourParentActionButtonText, UseLocalizationResult.askYourParentCancelButtonText, function()
							-- upvalues: UseResult10 (upval), FindResult (copy)
							UseResult10(FindResult.option.optionValue)
						end, UseResult8, UseResult8)
					end
				elseif Requirement == "ContentAgeRestrictionVerification" then
					UseResult(if FFlagLuaAppPlayButtonAmpAgeCheckFlow then FStringLuaAppPlayButtonAgeCheckAmpFeatureName else "ShouldNotPromptSeventeenPlusSettingVerifications", UseResult6, nil, if FFlagLuaAppPlayButtonAmpAgeCheckFlow then if PageName then `gameJoinContentMaturityLock-{PageName}` else "gameJoinContentMaturityLock" else nil, nil, if FFlagLuaAppPlayButtonAmpAgeCheckFlow then FStringLuaAppPlayButtonAgeCheckAmpNameSpace else nil, if FFlagLuaAppPlayButtonWizardCloseDelay then DelayedAmpWizardCompletionCallbackOverrideModule(UseResult6, FIntLuaAppPlayButtonWizardCloseDelayMs) else nil)
				else
					FlaggedMutedErrorFunction("ExperienceParentalControlsUnknownUpsellRequirement", `Unknown requirement {Requirement} for ContentAgeRestriction option {FindResult} on play button click`)
					Callback(p1)
				end
				UseResult11(Requirement or "GameLaunch")
			end, function()
				-- upvalues: Callback (upval), p1 (copy), UseResult11 (upval)
				Callback(p1)
				UseResult11("GameLaunch")
			end)
		end
	end, {
		UseRoactServiceResult, UniverseId, Callback, UseSelectorResult1,
		UseDispatchResult, UseResult1, UseResult, UseResult3, UseResult2, UseResult10,
		UseResult7, UseResult8, UseResult5,
		if FFlagLuaAppPlayButtonAmpAgeCheckFlow then UseResult6 else nil, UseResult11,
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
		UseAppPolicyResult1, PageName,
		if FFlagEnablePlayButtonWizardVPCPrologueModule then UseResult9 else nil
	}), if FFlagLuaAppParentApprovedExperiences then UseResult12 else nil
end