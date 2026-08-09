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
local fFlagLuaAppLogPageContextUnlockPlayIntent = require(parent.SharedFlags).FFlagLuaAppLogPageContextUnlockPlayIntent
local var6 = if fFlagLuaAppPlayButtonAmpAgeCheckFlow then "gameJoinAgeCheckRequired" else nil

return function(p0, p1, p2, p3) --[[ line: 37 ]]
	-- upvalues: useRoactService (ref), roactNetworking (ref), appEventIngestService (ref), useDispatch (ref), reactModule (ref), unlockPlayIntent (ref), fFlagLuaAppLogPageContextUnlockPlayIntent (ref), fFlagLuaAppParentApprovedExperiences (ref), useContextualParentalControlsUpsellModule (ref), fFlagLuaAppPlayButtonAmpAgeCheckFlow (ref), fetchGamePlayButtonDataModule (ref), playabilityStatusEnum (ref), getFFlagLuaAppFetchPlayabilityKillSwitchModule (ref), fetchGamePlayabilityAndProductInfo (ref), openAmpWizardContainer (ref), fStringLuaAppPlayButtonAgeCheckAmpFeatureName (ref), var6 (ref), fStringLuaAppPlayButtonAgeCheckAmpNameSpace (ref), fFlagLuaAppPlayButtonWizardCloseDelay (ref), delayedAmpWizardCompletionCallbackOverrideModule (ref), fIntLuaAppPlayButtonWizardCloseDelayMs (ref), openAgeVerificationModal (ref)
	local var12
	local var7 = useRoactService(roactNetworking)
	local var8 = useRoactService(appEventIngestService)
	local var9 = useDispatch()
	local var10 = reactModule.useCallback(function(p4) --[[ line: 48 ]]
		-- upvalues: unlockPlayIntent (copy), var8 (ref), p1 (ref), p0 (ref), fFlagLuaAppLogPageContextUnlockPlayIntent (copy), p3 (ref)
		unlockPlayIntent(var8, {
			universeId = p1,
			upsellName = p4,
			playabilityStatus = if p0 then p0.playabilityStatus else nil,
			pageName = if fFlagLuaAppLogPageContextUnlockPlayIntent then p3 else nil
		})
	end, {
		var8,
		p1,
		p0,
		if fFlagLuaAppLogPageContextUnlockPlayIntent then p3 else nil
	})
	local _ = nil
	local var11 = nil
	
	if fFlagLuaAppParentApprovedExperiences then
		local var13, var14 = useContextualParentalControlsUpsellModule(p1, p2, if fFlagLuaAppLogPageContextUnlockPlayIntent then p3 else nil)
		var12 = var13
		var11 = var14
	else
		var12 = useContextualParentalControlsUpsellModule(p1, p2, if fFlagLuaAppLogPageContextUnlockPlayIntent then p3 else nil)
	end
	local var15 = if fFlagLuaAppPlayButtonAmpAgeCheckFlow then reactModule.useCallback(function() --[[ line: 80 ]]
		-- upvalues: var9 (ref), fetchGamePlayButtonDataModule (copy), var7 (ref), p1 (ref)
		var9(fetchGamePlayButtonDataModule.Fetch(var7, p1, true))
	end, { var9, var7, p1 }) else nil
	
	return reactModule.useCallback(function(p5) --[[ line: 85 ]]
		-- upvalues: p0 (ref), playabilityStatusEnum (copy), fFlagLuaAppPlayButtonAmpAgeCheckFlow (copy), fFlagLuaAppParentApprovedExperiences (copy), getFFlagLuaAppFetchPlayabilityKillSwitchModule (copy), var9 (ref), fetchGamePlayabilityAndProductInfo (copy), var7 (ref), p1 (ref), openAmpWizardContainer (copy), fStringLuaAppPlayButtonAgeCheckAmpFeatureName (copy), var15 (write), fFlagLuaAppLogPageContextUnlockPlayIntent (copy), p3 (ref), var6 (copy), fStringLuaAppPlayButtonAgeCheckAmpNameSpace (copy), fFlagLuaAppPlayButtonWizardCloseDelay (copy), delayedAmpWizardCompletionCallbackOverrideModule (copy), fIntLuaAppPlayButtonWizardCloseDelayMs (copy), openAgeVerificationModal (copy), var10 (ref), var12 (write), var11 (write), p2 (ref)
		if not p0 then
			p2(p5)
			
			return
		elseif (if p0.playabilityStatus ~= playabilityStatusEnum.ContextualPlayabilityUnverifiedSeventeenPlusUser then if p0.playabilityStatus ~= playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls then if fFlagLuaAppPlayButtonAmpAgeCheckFlow then true else fFlagLuaAppParentApprovedExperiences and p0.playabilityStatus == playabilityStatusEnum.ContextualPlayabilityRequireParentApproval else true else true) and not getFFlagLuaAppFetchPlayabilityKillSwitchModule() then
			var9(fetchGamePlayabilityAndProductInfo.Fetch(var7, p1)):andThen(function(p6) --[[ line: 99 ]]
				-- upvalues: playabilityStatusEnum (copy), fFlagLuaAppPlayButtonAmpAgeCheckFlow (copy), var9 (copy), openAmpWizardContainer (copy), fStringLuaAppPlayButtonAgeCheckAmpFeatureName (copy), var15 (copy), fFlagLuaAppLogPageContextUnlockPlayIntent (copy), p3 (copy), var6 (copy), fStringLuaAppPlayButtonAgeCheckAmpNameSpace (copy), fFlagLuaAppPlayButtonWizardCloseDelay (copy), delayedAmpWizardCompletionCallbackOverrideModule (copy), fIntLuaAppPlayButtonWizardCloseDelayMs (copy), openAgeVerificationModal (copy), p1 (copy), var10 (copy), var12 (copy), fFlagLuaAppParentApprovedExperiences (copy), var11 (copy), p5 (ref), p2 (copy)
				if if p6 ~= playabilityStatusEnum.ContextualPlayabilityUnverifiedSeventeenPlusUser then fFlagLuaAppPlayButtonAmpAgeCheckFlow and p6 == playabilityStatusEnum.ContextualPlayabilityAgeCheckRequired else true then
					if fFlagLuaAppPlayButtonAmpAgeCheckFlow then
						var9(openAmpWizardContainer(fStringLuaAppPlayButtonAgeCheckAmpFeatureName, var15, nil, if fFlagLuaAppLogPageContextUnlockPlayIntent and p3 then `{var6}-{p3}` else var6, nil, fStringLuaAppPlayButtonAgeCheckAmpNameSpace, nil, nil, if fFlagLuaAppPlayButtonWizardCloseDelay then delayedAmpWizardCompletionCallbackOverrideModule(var15, fIntLuaAppPlayButtonWizardCloseDelayMs) else nil))
					else
						var9(openAgeVerificationModal(p1))
					end
					var10(if fFlagLuaAppPlayButtonAmpAgeCheckFlow then "AgeCheckRequired" else "AgeVerificationUnverifiedSeventeenPlusUser")
					
					return
				elseif p6 == playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls then
					var12()
					
					return
				elseif fFlagLuaAppParentApprovedExperiences and p6 == playabilityStatusEnum.ContextualPlayabilityRequireParentApproval then
					var11(p5)
					
					return
				end
				p2(p5)
				var10("GameLaunch")
			end):catch(function() --[[ line: 158 ]]
				-- upvalues: p2 (copy), p5 (ref), var10 (copy)
				p2(p5)
				var10("GameLaunch")
			end)
			
			return
		end
		p2(p5)
	end, {
		var7, p1, p0, p2, var10, var12,
		if fFlagLuaAppParentApprovedExperiences then var11 else nil,
		if fFlagLuaAppPlayButtonAmpAgeCheckFlow then var15 else nil,
		if fFlagLuaAppPlayButtonAmpAgeCheckFlow then var9 else nil,
		if fFlagLuaAppLogPageContextUnlockPlayIntent then p3 else nil
	})
end