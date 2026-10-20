local GamePlayButton = script:FindFirstAncestor("GamePlayButton")
local _ = require(GamePlayButton.PlayButtonTypes)
local GetFFlagLuaAppFetchPlayabilityKillSwitchModule = require(GamePlayButton.Flags.GetFFlagLuaAppFetchPlayabilityKillSwitch)
local FetchGamePlayButtonDataModule = require(GamePlayButton.FetchGamePlayButtonData)
local Parent = GamePlayButton.Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local AppEventIngestService = require(Parent.RoactServiceTags).AppEventIngestService
local PlayabilityStatusEnum = require(Parent.DiscoveryTypes).PlayabilityStatusEnum
local _ = require(Parent.PlayabilityRodux)
local FetchGamePlayabilityAndProductInfo = require(Parent.GameDetailRodux).FetchGamePlayabilityAndProductInfo
local OpenAgeVerificationModalFunction = require(Parent.VoiceChat).AgeVerificationOverlay.OpenAgeVerificationModal
local UseContextualParentalControlsUpsellModule = require(GamePlayButton.PlayButtonLaunchChecks.useContextualParentalControlsUpsell)
local DelayedAmpWizardCompletionCallbackOverrideModule = require(GamePlayButton.PlayButtonLaunchChecks.delayedAmpWizardCompletionCallbackOverride)
local UnlockPlayIntentFunction = require(Parent.DiscoveryAnalytics).Events.unlockPlayIntent
local OpenAmpWizardContainerFunction = require(Parent.AmpUpsell).OpenAmpWizardContainer
local FFlagLuaAppPlayButtonAmpAgeCheckFlow = require(Parent.SharedFlags).FFlagLuaAppPlayButtonAmpAgeCheckFlow
local FStringLuaAppPlayButtonAgeCheckAmpFeatureName = require(Parent.SharedFlags).FStringLuaAppPlayButtonAgeCheckAmpFeatureName
local FStringLuaAppPlayButtonAgeCheckAmpNameSpace = require(Parent.SharedFlags).FStringLuaAppPlayButtonAgeCheckAmpNameSpace
local FFlagLuaAppParentApprovedExperiences = require(Parent.SharedFlags).FFlagLuaAppParentApprovedExperiences
local FFlagLuaAppPlayButtonWizardCloseDelay = require(Parent.SharedFlags).FFlagLuaAppPlayButtonWizardCloseDelay
local FIntLuaAppPlayButtonWizardCloseDelayMs = require(Parent.SharedFlags).FIntLuaAppPlayButtonWizardCloseDelayMs
local FFlagLuaAppDemoModePlayButtonTelemetry = require(Parent.SharedFlags).FFlagLuaAppDemoModePlayButtonTelemetry
local GameJoinAgeCheckRequired = if FFlagLuaAppPlayButtonAmpAgeCheckFlow then "gameJoinAgeCheckRequired" else nil

return function(p1, UniverseId, Callback, PageName)
	-- upvalues: UseRoactServiceFunction (copy), RoactNetworking (copy), AppEventIngestService (copy), UseDispatchFunction (copy), ReactModule (copy), UnlockPlayIntentFunction (copy), FFlagLuaAppParentApprovedExperiences (copy), UseContextualParentalControlsUpsellModule (copy), FFlagLuaAppPlayButtonAmpAgeCheckFlow (copy), FetchGamePlayButtonDataModule (copy), PlayabilityStatusEnum (copy), GetFFlagLuaAppFetchPlayabilityKillSwitchModule (copy), FetchGamePlayabilityAndProductInfo (copy), OpenAmpWizardContainerFunction (copy), FStringLuaAppPlayButtonAgeCheckAmpFeatureName (copy), GameJoinAgeCheckRequired (copy), FStringLuaAppPlayButtonAgeCheckAmpNameSpace (copy), FFlagLuaAppPlayButtonWizardCloseDelay (copy), DelayedAmpWizardCompletionCallbackOverrideModule (copy), FIntLuaAppPlayButtonWizardCloseDelayMs (copy), OpenAgeVerificationModalFunction (copy), FFlagLuaAppDemoModePlayButtonTelemetry (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppEventIngestService)
	local UseDispatchResult = UseDispatchFunction()
	local UseResult = ReactModule.useCallback(function(UpsellName)
		-- upvalues: UnlockPlayIntentFunction (upval), UseRoactServiceResult1 (copy), UniverseId (copy), p1 (copy), PageName (copy)
		UnlockPlayIntentFunction(UseRoactServiceResult1, {
			universeId = UniverseId,
			upsellName = UpsellName,
			playabilityStatus = p1 and p1.playabilityStatus or nil,
			pageName = PageName
		})
	end, { UseRoactServiceResult1, UniverseId, p1, PageName })
	local UseContextualParentalControlsUpsellModuleResult = nil
	local Callback1 = nil
	
	if FFlagLuaAppParentApprovedExperiences then
		UseContextualParentalControlsUpsellModuleResult, Callback1 = UseContextualParentalControlsUpsellModule(UniverseId, Callback, PageName)
	else
		UseContextualParentalControlsUpsellModuleResult = UseContextualParentalControlsUpsellModule(UniverseId, Callback, PageName)
	end
	local UseResult1 = if FFlagLuaAppPlayButtonAmpAgeCheckFlow then ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), FetchGamePlayButtonDataModule (upval), UseRoactServiceResult (copy), UniverseId (copy)
		UseDispatchResult(FetchGamePlayButtonDataModule.Fetch(UseRoactServiceResult, UniverseId, true))
	end, { UseDispatchResult, UseRoactServiceResult, UniverseId }) else nil
	
	return (ReactModule.useCallback(function(p2, p3)
		-- upvalues: p1 (copy), PlayabilityStatusEnum (upval), FFlagLuaAppPlayButtonAmpAgeCheckFlow (upval), FFlagLuaAppParentApprovedExperiences (upval), GetFFlagLuaAppFetchPlayabilityKillSwitchModule (upval), UseDispatchResult (copy), FetchGamePlayabilityAndProductInfo (upval), UseRoactServiceResult (copy), UniverseId (copy), OpenAmpWizardContainerFunction (upval), FStringLuaAppPlayButtonAgeCheckAmpFeatureName (upval), UseResult1 (ref), PageName (copy), GameJoinAgeCheckRequired (upval), FStringLuaAppPlayButtonAgeCheckAmpNameSpace (upval), FFlagLuaAppPlayButtonWizardCloseDelay (upval), DelayedAmpWizardCompletionCallbackOverrideModule (upval), FIntLuaAppPlayButtonWizardCloseDelayMs (upval), OpenAgeVerificationModalFunction (upval), UseResult (copy), UseContextualParentalControlsUpsellModuleResult (ref), Callback1 (ref), FFlagLuaAppDemoModePlayButtonTelemetry (upval), Callback (copy)
		if not p1 then
			Callback(p2, if FFlagLuaAppDemoModePlayButtonTelemetry then p3 else nil)
			
			return
		end
		if (p1.playabilityStatus == PlayabilityStatusEnum.ContextualPlayabilityUnverifiedSeventeenPlusUser or (p1.playabilityStatus == PlayabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls or (FFlagLuaAppPlayButtonAmpAgeCheckFlow and p1.playabilityStatus == PlayabilityStatusEnum.ContextualPlayabilityAgeCheckRequired or FFlagLuaAppParentApprovedExperiences and p1.playabilityStatus == PlayabilityStatusEnum.ContextualPlayabilityRequireParentApproval))) and not GetFFlagLuaAppFetchPlayabilityKillSwitchModule() then
			UseDispatchResult(FetchGamePlayabilityAndProductInfo.Fetch(UseRoactServiceResult, UniverseId)):andThen(function(Result)
				-- upvalues: PlayabilityStatusEnum (upval), FFlagLuaAppPlayButtonAmpAgeCheckFlow (upval), UseDispatchResult (upval), OpenAmpWizardContainerFunction (upval), FStringLuaAppPlayButtonAgeCheckAmpFeatureName (upval), UseResult1 (upval), PageName (upval), GameJoinAgeCheckRequired (upval), FStringLuaAppPlayButtonAgeCheckAmpNameSpace (upval), FFlagLuaAppPlayButtonWizardCloseDelay (upval), DelayedAmpWizardCompletionCallbackOverrideModule (upval), FIntLuaAppPlayButtonWizardCloseDelayMs (upval), OpenAgeVerificationModalFunction (upval), UniverseId (upval), UseResult (upval), UseContextualParentalControlsUpsellModuleResult (upval), FFlagLuaAppParentApprovedExperiences (upval), Callback1 (upval), p2 (copy), FFlagLuaAppDemoModePlayButtonTelemetry (upval), p3 (copy), Callback (upval)
				if Result == PlayabilityStatusEnum.ContextualPlayabilityUnverifiedSeventeenPlusUser or FFlagLuaAppPlayButtonAmpAgeCheckFlow and Result == PlayabilityStatusEnum.ContextualPlayabilityAgeCheckRequired then
					if FFlagLuaAppPlayButtonAmpAgeCheckFlow then
						UseDispatchResult(OpenAmpWizardContainerFunction(FStringLuaAppPlayButtonAgeCheckAmpFeatureName, UseResult1, nil, if PageName then `{GameJoinAgeCheckRequired}-{PageName}` else GameJoinAgeCheckRequired, nil, FStringLuaAppPlayButtonAgeCheckAmpNameSpace, nil, nil, if FFlagLuaAppPlayButtonWizardCloseDelay then DelayedAmpWizardCompletionCallbackOverrideModule(UseResult1, FIntLuaAppPlayButtonWizardCloseDelayMs) else nil))
					else
						UseDispatchResult(OpenAgeVerificationModalFunction(UniverseId))
					end
					UseResult(if FFlagLuaAppPlayButtonAmpAgeCheckFlow then "AgeCheckRequired" else "AgeVerificationUnverifiedSeventeenPlusUser")
					
					return
				elseif Result == PlayabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls then
					UseContextualParentalControlsUpsellModuleResult()
					
					return
				else
					if FFlagLuaAppParentApprovedExperiences and Result == PlayabilityStatusEnum.ContextualPlayabilityRequireParentApproval then
						Callback1(p2, if FFlagLuaAppDemoModePlayButtonTelemetry then p3 else nil)
						
						return
					else
						Callback(p2, if FFlagLuaAppDemoModePlayButtonTelemetry then p3 else nil)
						UseResult("GameLaunch")
					end
				end
			end):catch(function()
				-- upvalues: Callback (upval), p2 (copy), FFlagLuaAppDemoModePlayButtonTelemetry (upval), p3 (copy), UseResult (upval)
				Callback(p2, if FFlagLuaAppDemoModePlayButtonTelemetry then p3 else nil)
				UseResult("GameLaunch")
			end)
			
			return
		else
			Callback(p2, if FFlagLuaAppDemoModePlayButtonTelemetry then p3 else nil)
		end
	end, {
		UseRoactServiceResult, UniverseId, p1, Callback, UseResult,
		UseContextualParentalControlsUpsellModuleResult,
		if FFlagLuaAppParentApprovedExperiences then Callback1 else nil,
		if FFlagLuaAppPlayButtonAmpAgeCheckFlow then UseResult1 else nil,
		if FFlagLuaAppPlayButtonAmpAgeCheckFlow then UseDispatchResult else nil,
		PageName
	}))
end