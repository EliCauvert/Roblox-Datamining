local gamePlayButton = script:FindFirstAncestor("GamePlayButton")
local fetchGamePlayButtonDataModule = require(gamePlayButton.FetchGamePlayButtonData)
local playButtonStatesModule = require(gamePlayButton.PlayButtonStates)
local _ = require(gamePlayButton.PlayButtonTypes)
local delayedAmpWizardCompletionCallbackOverrideModule = require(gamePlayButton.PlayButtonLaunchChecks.delayedAmpWizardCompletionCallbackOverride)
local parent = gamePlayButton.Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useStore = roactUtilsModule.Hooks.RoactRodux.useStore
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local appEventIngestService = require(parent.RoactServiceTags).AppEventIngestService
local playabilityStatusEnum = require(parent.DiscoveryTypes).PlayabilityStatusEnum
local apiFetchPlayabilityStatus = require(parent.PlayabilityRodux).PlayabilityStatus.ApiFetchPlayabilityStatus
local openAmpWizardContainer = require(parent.AmpUpsell).OpenAmpWizardContainer
local unlockPlayIntent = require(parent.DiscoveryAnalytics).Events.unlockPlayIntent
local invalidPlayIntent = require(parent.DiscoveryAnalytics).Events.invalidPlayIntent
local fStringLuaAppPlayButtonAgeCheckAmpFeatureName = require(parent.SharedFlags).FStringLuaAppPlayButtonAgeCheckAmpFeatureName
local fStringLuaAppPlayButtonAgeCheckAmpNameSpace = require(parent.SharedFlags).FStringLuaAppPlayButtonAgeCheckAmpNameSpace
local fFlagLuaAppParentApprovedExperiences = require(parent.SharedFlags).FFlagLuaAppParentApprovedExperiences
local fFlagLuaAppPlayButtonWizardCloseDelay = require(parent.SharedFlags).FFlagLuaAppPlayButtonWizardCloseDelay
local fIntLuaAppPlayButtonWizardCloseDelayMs = require(parent.SharedFlags).FIntLuaAppPlayButtonWizardCloseDelayMs
local fFlagLuaAppDemoModePlayButtonTelemetry = require(parent.SharedFlags).FFlagLuaAppDemoModePlayButtonTelemetry

return function(p1, p2, p3, p4, p5)
	-- upvalues: useRoactService (ref), roactNetworking (ref), appEventIngestService (ref), useDispatch (ref), useStore (ref), reactModule (ref), fetchGamePlayButtonDataModule (ref), unlockPlayIntent (ref), invalidPlayIntent (ref), playButtonStatesModule (ref), openAmpWizardContainer (ref), fStringLuaAppPlayButtonAgeCheckAmpFeatureName (ref), fStringLuaAppPlayButtonAgeCheckAmpNameSpace (ref), fFlagLuaAppPlayButtonWizardCloseDelay (ref), delayedAmpWizardCompletionCallbackOverrideModule (ref), fIntLuaAppPlayButtonWizardCloseDelayMs (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref), playabilityStatusEnum (ref), fFlagLuaAppParentApprovedExperiences (ref), apiFetchPlayabilityStatus (ref)
	local var1 = useRoactService(roactNetworking)
	local var2 = useRoactService(appEventIngestService)
	local var3 = useDispatch()
	local var4 = useStore()
	local var5 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), fetchGamePlayButtonDataModule (copy), var1 (ref), p2 (ref)
		var3(fetchGamePlayButtonDataModule.Fetch(var1, p2, true))
	end, { var3, var1, p2 })
	local var6 = reactModule.useCallback(function(p6, p7)
		-- upvalues: unlockPlayIntent (copy), var2 (ref), p2 (ref), p5 (ref)
		unlockPlayIntent(var2, {
			universeId = p2,
			upsellName = p6,
			playabilityStatus = p7,
			pageName = p5
		})
	end, { var2, p2, p5 })
	local var7 = reactModule.useCallback(function(p6)
		-- upvalues: invalidPlayIntent (copy), p4 (ref), p2 (ref), playButtonStatesModule (copy)
		invalidPlayIntent(p4, {
			universeId = p2,
			playButtonState = playButtonStatesModule.Playtest,
			playabilityStatus = p6 or "None"
		})
	end, { p4, p2 })
	local var8 = reactModule.useCallback(function(p6)
		-- upvalues: var3 (ref), openAmpWizardContainer (copy), fStringLuaAppPlayButtonAgeCheckAmpFeatureName (copy), var5 (ref), p5 (ref), fStringLuaAppPlayButtonAgeCheckAmpNameSpace (copy), fFlagLuaAppPlayButtonWizardCloseDelay (copy), delayedAmpWizardCompletionCallbackOverrideModule (copy), fIntLuaAppPlayButtonWizardCloseDelayMs (copy), var6 (ref)
		var3(openAmpWizardContainer(fStringLuaAppPlayButtonAgeCheckAmpFeatureName, var5, nil, if p5 then `gameJoinAgeCheckRequired-{p5}` else "gameJoinAgeCheckRequired", nil, fStringLuaAppPlayButtonAgeCheckAmpNameSpace, nil, nil, if fFlagLuaAppPlayButtonWizardCloseDelay then delayedAmpWizardCompletionCallbackOverrideModule(var5, fIntLuaAppPlayButtonWizardCloseDelayMs) else nil))
		var6("AgeCheckRequired", p6)
	end, { var3, var5, p5, var6 })
	
	return reactModule.useCallback(function(p6, p7)
		-- upvalues: p3 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy), var7 (ref), playabilityStatusEnum (copy), var8 (ref), fFlagLuaAppParentApprovedExperiences (copy), var6 (ref), var3 (ref), apiFetchPlayabilityStatus (copy), var1 (ref), p2 (ref), var4 (ref), p1 (ref)
		local function _()
			-- upvalues: p3 (copy), p6 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy), p7 (ref)
			p3(p6, if fFlagLuaAppDemoModePlayButtonTelemetry then p7 else nil)
		end
		
		local function handlePrivatePlaytestInfo(p8)
			-- upvalues: var7 (copy), p3 (copy), p6 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy), p7 (ref), playabilityStatusEnum (copy), var8 (copy), fFlagLuaAppParentApprovedExperiences (copy), var6 (copy)
			if p8 == nil then
				var7(nil)
				
				return
			elseif p8.isPlayable then
				p3(p6, if fFlagLuaAppDemoModePlayButtonTelemetry then p7 else nil)
				
				return
			end
			local playabilityStatus = p8.playabilityStatus
			
			if playabilityStatus == playabilityStatusEnum.ContextualPlayabilityUnverifiedSeventeenPlusUser or playabilityStatus == playabilityStatusEnum.ContextualPlayabilityAgeCheckRequired then
				var8(playabilityStatus)
				
				return
			elseif fFlagLuaAppParentApprovedExperiences and playabilityStatus == playabilityStatusEnum.ContextualPlayabilityRequireParentApproval then
				var6("RequireParentApproval", playabilityStatus)
				
				return
			elseif playabilityStatus == playabilityStatusEnum.ContextualPlayabilityTrustedFriendRequired then
				var6("TrustedFriendRequired", playabilityStatus)
				
				return
			end
			var7(playabilityStatus)
		end
		
		var3(apiFetchPlayabilityStatus.Fetch(var1, { p2 })):andThen(function()
			-- upvalues: var4 (copy), p2 (copy), handlePrivatePlaytestInfo (ref)
			local var9 = var4:getState().PlayabilityStatus[p2]
			handlePrivatePlaytestInfo(if var9 then var9.privatePlaytestInfo else nil)
		end):catch(function()
			-- upvalues: handlePrivatePlaytestInfo (ref), p1 (copy)
			handlePrivatePlaytestInfo(if p1 then p1.privatePlaytestInfo else nil)
		end)
	end, {
		var3, var1, p2, var4, p3, p1, var8, var6, var7
	})
end