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
local var6 = if fFlagLuaAppPlayButtonAmpAgeCheckFlow then "gameJoinAgeCheckRequired" else nil

return function(p0, p1, p2, p3)
	-- upvalues: useRoactService (ref), roactNetworking (ref), appEventIngestService (ref), useDispatch (ref), reactModule (ref), unlockPlayIntent (ref), fFlagLuaAppParentApprovedExperiences (ref), useContextualParentalControlsUpsellModule (ref), fFlagLuaAppPlayButtonAmpAgeCheckFlow (ref), fetchGamePlayButtonDataModule (ref), playabilityStatusEnum (ref), getFFlagLuaAppFetchPlayabilityKillSwitchModule (ref), fetchGamePlayabilityAndProductInfo (ref), openAmpWizardContainer (ref), fStringLuaAppPlayButtonAgeCheckAmpFeatureName (ref), var6 (ref), fStringLuaAppPlayButtonAgeCheckAmpNameSpace (ref), fFlagLuaAppPlayButtonWizardCloseDelay (ref), delayedAmpWizardCompletionCallbackOverrideModule (ref), fIntLuaAppPlayButtonWizardCloseDelayMs (ref), openAgeVerificationModal (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref)
	local var14
	local var7 = useRoactService(roactNetworking)
	local var8 = useRoactService(appEventIngestService)
	local var9 = useDispatch()
	local var10 = reactModule.useCallback(function(p4)
		-- upvalues: unlockPlayIntent (copy), var8 (ref), p1 (ref), p0 (ref), p3 (ref)
		unlockPlayIntent(var8, {
			universeId = p1,
			upsellName = p4,
			playabilityStatus = if p0 then p0.playabilityStatus else nil,
			pageName = p3
		})
	end, { var8, p1, p0, p3 })
	local _ = nil
	local var11 = nil
	
	if fFlagLuaAppParentApprovedExperiences then
		local var12, var13 = useContextualParentalControlsUpsellModule(p1, p2, p3)
		var14 = var12
		var11 = var13
	else
		var14 = useContextualParentalControlsUpsellModule(p1, p2, p3)
	end
	local var15 = if fFlagLuaAppPlayButtonAmpAgeCheckFlow then reactModule.useCallback(function()
		-- upvalues: var9 (ref), fetchGamePlayButtonDataModule (copy), var7 (ref), p1 (ref)
		var9(fetchGamePlayButtonDataModule.Fetch(var7, p1, true))
	end, { var9, var7, p1 }) else nil
	
	return reactModule.useCallback(function(p5, p6)
		-- upvalues: p0 (ref), playabilityStatusEnum (copy), fFlagLuaAppPlayButtonAmpAgeCheckFlow (copy), fFlagLuaAppParentApprovedExperiences (copy), getFFlagLuaAppFetchPlayabilityKillSwitchModule (copy), var9 (ref), fetchGamePlayabilityAndProductInfo (copy), var7 (ref), p1 (ref), openAmpWizardContainer (copy), fStringLuaAppPlayButtonAgeCheckAmpFeatureName (copy), var15 (write), p3 (ref), var6 (copy), fStringLuaAppPlayButtonAgeCheckAmpNameSpace (copy), fFlagLuaAppPlayButtonWizardCloseDelay (copy), delayedAmpWizardCompletionCallbackOverrideModule (copy), fIntLuaAppPlayButtonWizardCloseDelayMs (copy), openAgeVerificationModal (copy), var10 (ref), var14 (write), var11 (write), fFlagLuaAppDemoModePlayButtonTelemetry (copy), p2 (ref)
		if not p0 then
			p2(p5, if fFlagLuaAppDemoModePlayButtonTelemetry then p6 else nil)
			
			return
		elseif (if p0.playabilityStatus ~= playabilityStatusEnum.ContextualPlayabilityUnverifiedSeventeenPlusUser then if p0.playabilityStatus ~= playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls then if fFlagLuaAppPlayButtonAmpAgeCheckFlow then true else fFlagLuaAppParentApprovedExperiences and p0.playabilityStatus == playabilityStatusEnum.ContextualPlayabilityRequireParentApproval else true else true) and not getFFlagLuaAppFetchPlayabilityKillSwitchModule() then
			var9(fetchGamePlayabilityAndProductInfo.Fetch(var7, p1)):andThen(function(p7)
				-- upvalues: playabilityStatusEnum (copy), fFlagLuaAppPlayButtonAmpAgeCheckFlow (copy), var9 (copy), openAmpWizardContainer (copy), fStringLuaAppPlayButtonAgeCheckAmpFeatureName (copy), var15 (copy), p3 (copy), var6 (copy), fStringLuaAppPlayButtonAgeCheckAmpNameSpace (copy), fFlagLuaAppPlayButtonWizardCloseDelay (copy), delayedAmpWizardCompletionCallbackOverrideModule (copy), fIntLuaAppPlayButtonWizardCloseDelayMs (copy), openAgeVerificationModal (copy), p1 (copy), var10 (copy), var14 (copy), fFlagLuaAppParentApprovedExperiences (copy), var11 (copy), p5 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy), p6 (ref), p2 (copy)
				if if p7 ~= playabilityStatusEnum.ContextualPlayabilityUnverifiedSeventeenPlusUser then fFlagLuaAppPlayButtonAmpAgeCheckFlow and p7 == playabilityStatusEnum.ContextualPlayabilityAgeCheckRequired else true then
					if fFlagLuaAppPlayButtonAmpAgeCheckFlow then
						var9(openAmpWizardContainer(fStringLuaAppPlayButtonAgeCheckAmpFeatureName, var15, nil, if p3 then `{var6}-{p3}` else var6, nil, fStringLuaAppPlayButtonAgeCheckAmpNameSpace, nil, nil, if fFlagLuaAppPlayButtonWizardCloseDelay then delayedAmpWizardCompletionCallbackOverrideModule(var15, fIntLuaAppPlayButtonWizardCloseDelayMs) else nil))
					else
						var9(openAgeVerificationModal(p1))
					end
					var10(if fFlagLuaAppPlayButtonAmpAgeCheckFlow then "AgeCheckRequired" else "AgeVerificationUnverifiedSeventeenPlusUser")
					
					return
				elseif p7 == playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls then
					var14()
					
					return
				elseif fFlagLuaAppParentApprovedExperiences and p7 == playabilityStatusEnum.ContextualPlayabilityRequireParentApproval then
					var11(p5, if fFlagLuaAppDemoModePlayButtonTelemetry then p6 else nil)
					
					return
				end
				p2(p5, if fFlagLuaAppDemoModePlayButtonTelemetry then p6 else nil)
				var10("GameLaunch")
			end):catch(function()
				-- upvalues: p2 (copy), p5 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy), p6 (ref), var10 (copy)
				p2(p5, if fFlagLuaAppDemoModePlayButtonTelemetry then p6 else nil)
				var10("GameLaunch")
			end)
			
			return
		end
		p2(p5, if fFlagLuaAppDemoModePlayButtonTelemetry then p6 else nil)
	end, {
		var7, p1, p0, p2, var10, var14,
		if fFlagLuaAppParentApprovedExperiences then var11 else nil,
		if fFlagLuaAppPlayButtonAmpAgeCheckFlow then var15 else nil,
		if fFlagLuaAppPlayButtonAmpAgeCheckFlow then var9 else nil, p3
	})
end