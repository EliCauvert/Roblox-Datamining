local gamePlayButton = script:FindFirstAncestor("GamePlayButton")
local _ = require(gamePlayButton.PlayButtonTypes)
local getFFlagLuaAppFetchPlayabilityKillSwitchModule = require(gamePlayButton.Flags.GetFFlagLuaAppFetchPlayabilityKillSwitch)
local fetchGamePlayButtonDataModule = require(gamePlayButton.FetchGamePlayButtonData)
local parent = gamePlayButton.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local appEventIngestService = require(parent.RoactServiceTags).AppEventIngestService
local playabilityStatusEnum = require(parent.DiscoveryTypes).PlayabilityStatusEnum
local _ = require(parent.PlayabilityRodux)
local fetchGamePlayabilityAndProductInfo = require(parent.GameDetailRodux).FetchGamePlayabilityAndProductInfo
local openAgeVerificationModal = require(parent.VoiceChat).AgeVerificationOverlay.OpenAgeVerificationModal
local useContextualParentalControlsUpsellModule = require(gamePlayButton.PlayButtonLaunchChecks.useContextualParentalControlsUpsell)
local delayedAmpWizardCompletionCallbackOverrideModule = require(gamePlayButton.PlayButtonLaunchChecks.delayedAmpWizardCompletionCallbackOverride)
local unlockPlayIntent = require(parent.DiscoveryAnalytics).Events.unlockPlayIntent
local openAmpWizardContainer = require(parent.AmpUpsell).OpenAmpWizardContainer
local fFlagLuaAppPlayButtonAmpAgeCheckFlow = require(parent.SharedFlags).FFlagLuaAppPlayButtonAmpAgeCheckFlow
local fStringLuaAppPlayButtonAgeCheckAmpFeatureName = require(parent.SharedFlags).FStringLuaAppPlayButtonAgeCheckAmpFeatureName
local fStringLuaAppPlayButtonAgeCheckAmpNameSpace = require(parent.SharedFlags).FStringLuaAppPlayButtonAgeCheckAmpNameSpace
local fFlagLuaAppParentApprovedExperiences = require(parent.SharedFlags).FFlagLuaAppParentApprovedExperiences
local fFlagLuaAppPlayButtonWizardCloseDelay = require(parent.SharedFlags).FFlagLuaAppPlayButtonWizardCloseDelay
local fIntLuaAppPlayButtonWizardCloseDelayMs = require(parent.SharedFlags).FIntLuaAppPlayButtonWizardCloseDelayMs
local fFlagLuaAppDemoModePlayButtonTelemetry = require(parent.SharedFlags).FFlagLuaAppDemoModePlayButtonTelemetry
local var1 = if fFlagLuaAppPlayButtonAmpAgeCheckFlow then "gameJoinAgeCheckRequired" else nil

return function(p1, p2, p3, p4)
	-- upvalues: useRoactService (ref), roactNetworking (ref), appEventIngestService (ref), useDispatch (ref), reactModule (ref), unlockPlayIntent (ref), fFlagLuaAppParentApprovedExperiences (ref), useContextualParentalControlsUpsellModule (ref), fFlagLuaAppPlayButtonAmpAgeCheckFlow (ref), fetchGamePlayButtonDataModule (ref), playabilityStatusEnum (ref), getFFlagLuaAppFetchPlayabilityKillSwitchModule (ref), fetchGamePlayabilityAndProductInfo (ref), openAmpWizardContainer (ref), fStringLuaAppPlayButtonAgeCheckAmpFeatureName (ref), var1 (ref), fStringLuaAppPlayButtonAgeCheckAmpNameSpace (ref), fFlagLuaAppPlayButtonWizardCloseDelay (ref), delayedAmpWizardCompletionCallbackOverrideModule (ref), fIntLuaAppPlayButtonWizardCloseDelayMs (ref), openAgeVerificationModal (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref)
	local var2
	local var3 = useRoactService(roactNetworking)
	local var4 = useRoactService(appEventIngestService)
	local var5 = useDispatch()
	local var6 = reactModule.useCallback(function(p5)
		-- upvalues: unlockPlayIntent (copy), var4 (ref), p2 (ref), p1 (ref), p4 (ref)
		unlockPlayIntent(var4, {
			universeId = p2,
			upsellName = p5,
			playabilityStatus = if p1 then p1.playabilityStatus else nil,
			pageName = p4
		})
	end, { var4, p2, p1, p4 })
	local _ = nil
	local var7 = nil
	
	if fFlagLuaAppParentApprovedExperiences then
		local var8, var9 = useContextualParentalControlsUpsellModule(p2, p3, p4)
		var2 = var8
		var7 = var9
	else
		var2 = useContextualParentalControlsUpsellModule(p2, p3, p4)
	end
	local var10 = if fFlagLuaAppPlayButtonAmpAgeCheckFlow then reactModule.useCallback(function()
		-- upvalues: var5 (ref), fetchGamePlayButtonDataModule (copy), var3 (ref), p2 (ref)
		var5(fetchGamePlayButtonDataModule.Fetch(var3, p2, true))
	end, { var5, var3, p2 }) else nil
	
	return reactModule.useCallback(function(p5, p6)
		-- upvalues: p1 (ref), playabilityStatusEnum (copy), fFlagLuaAppPlayButtonAmpAgeCheckFlow (copy), fFlagLuaAppParentApprovedExperiences (copy), getFFlagLuaAppFetchPlayabilityKillSwitchModule (copy), var5 (ref), fetchGamePlayabilityAndProductInfo (copy), var3 (ref), p2 (ref), openAmpWizardContainer (copy), fStringLuaAppPlayButtonAgeCheckAmpFeatureName (copy), var10 (write), p4 (ref), var1 (copy), fStringLuaAppPlayButtonAgeCheckAmpNameSpace (copy), fFlagLuaAppPlayButtonWizardCloseDelay (copy), delayedAmpWizardCompletionCallbackOverrideModule (copy), fIntLuaAppPlayButtonWizardCloseDelayMs (copy), openAgeVerificationModal (copy), var6 (ref), var2 (write), var7 (write), fFlagLuaAppDemoModePlayButtonTelemetry (copy), p3 (ref)
		if not p1 then
			p3(p5, if fFlagLuaAppDemoModePlayButtonTelemetry then p6 else nil)
			
			return
		elseif (if p1.playabilityStatus ~= playabilityStatusEnum.ContextualPlayabilityUnverifiedSeventeenPlusUser then if p1.playabilityStatus ~= playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls then if fFlagLuaAppPlayButtonAmpAgeCheckFlow then true else fFlagLuaAppParentApprovedExperiences and p1.playabilityStatus == playabilityStatusEnum.ContextualPlayabilityRequireParentApproval else true else true) and not getFFlagLuaAppFetchPlayabilityKillSwitchModule() then
			var5(fetchGamePlayabilityAndProductInfo.Fetch(var3, p2)):andThen(function(p7)
				-- upvalues: playabilityStatusEnum (copy), fFlagLuaAppPlayButtonAmpAgeCheckFlow (copy), var5 (copy), openAmpWizardContainer (copy), fStringLuaAppPlayButtonAgeCheckAmpFeatureName (copy), var10 (copy), p4 (copy), var1 (copy), fStringLuaAppPlayButtonAgeCheckAmpNameSpace (copy), fFlagLuaAppPlayButtonWizardCloseDelay (copy), delayedAmpWizardCompletionCallbackOverrideModule (copy), fIntLuaAppPlayButtonWizardCloseDelayMs (copy), openAgeVerificationModal (copy), p2 (copy), var6 (copy), var2 (copy), fFlagLuaAppParentApprovedExperiences (copy), var7 (copy), p5 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy), p6 (ref), p3 (copy)
				if if p7 ~= playabilityStatusEnum.ContextualPlayabilityUnverifiedSeventeenPlusUser then fFlagLuaAppPlayButtonAmpAgeCheckFlow and p7 == playabilityStatusEnum.ContextualPlayabilityAgeCheckRequired else true then
					if fFlagLuaAppPlayButtonAmpAgeCheckFlow then
						var5(openAmpWizardContainer(fStringLuaAppPlayButtonAgeCheckAmpFeatureName, var10, nil, if p4 then `{var1}-{p4}` else var1, nil, fStringLuaAppPlayButtonAgeCheckAmpNameSpace, nil, nil, if fFlagLuaAppPlayButtonWizardCloseDelay then delayedAmpWizardCompletionCallbackOverrideModule(var10, fIntLuaAppPlayButtonWizardCloseDelayMs) else nil))
					else
						var5(openAgeVerificationModal(p2))
					end
					var6(if fFlagLuaAppPlayButtonAmpAgeCheckFlow then "AgeCheckRequired" else "AgeVerificationUnverifiedSeventeenPlusUser")
					
					return
				elseif p7 == playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls then
					var2()
					
					return
				elseif fFlagLuaAppParentApprovedExperiences and p7 == playabilityStatusEnum.ContextualPlayabilityRequireParentApproval then
					var7(p5, if fFlagLuaAppDemoModePlayButtonTelemetry then p6 else nil)
					
					return
				end
				p3(p5, if fFlagLuaAppDemoModePlayButtonTelemetry then p6 else nil)
				var6("GameLaunch")
			end):catch(function()
				-- upvalues: p3 (copy), p5 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy), p6 (ref), var6 (copy)
				p3(p5, if fFlagLuaAppDemoModePlayButtonTelemetry then p6 else nil)
				var6("GameLaunch")
			end)
			
			return
		end
		p3(p5, if fFlagLuaAppDemoModePlayButtonTelemetry then p6 else nil)
	end, {
		var3, p2, p1, p3, var6, var2,
		if fFlagLuaAppParentApprovedExperiences then var7 else nil,
		if fFlagLuaAppPlayButtonAmpAgeCheckFlow then var10 else nil,
		if fFlagLuaAppPlayButtonAmpAgeCheckFlow then var5 else nil, p4
	})
end