local GamePlayButton = script:FindFirstAncestor("GamePlayButton")
local FetchGamePlayButtonDataModule = require(GamePlayButton.FetchGamePlayButtonData)
local PlaytestUnlockUpsellModule = require(GamePlayButton.PlaytestUnlockUpsell)
local PlayButtonStatesModule = require(GamePlayButton.PlayButtonStates)
local _ = require(GamePlayButton.PlayButtonTypes)
local DelayedAmpWizardCompletionCallbackOverrideModule = require(GamePlayButton.PlayButtonLaunchChecks.delayedAmpWizardCompletionCallbackOverride)
local Parent = GamePlayButton.Parent
local UseUpdatePlaytestSettingsUpsellModule = require(Parent.BuildExperiencePlaytestLaunch.useUpdatePlaytestSettingsUpsell)
local UseTrustedFriendsPlaytestUpsellModule = require(Parent.BuildExperiencePlaytestLaunch.useTrustedFriendsPlaytestUpsell)
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseStoreFunction = RoactUtilsModule.Hooks.RoactRodux.useStore
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local AppEventIngestService = require(Parent.RoactServiceTags).AppEventIngestService
local ApiFetchPlayabilityStatus = require(Parent.PlayabilityRodux).PlayabilityStatus.ApiFetchPlayabilityStatus
local OpenAmpWizardContainerFunction = require(Parent.AmpUpsell).OpenAmpWizardContainer
local UnlockPlayIntentFunction = require(Parent.DiscoveryAnalytics).Events.unlockPlayIntent
local InvalidPlayIntentFunction = require(Parent.DiscoveryAnalytics).Events.invalidPlayIntent
local FStringLuaAppPlayButtonAgeCheckAmpFeatureName = require(Parent.SharedFlags).FStringLuaAppPlayButtonAgeCheckAmpFeatureName
local FStringLuaAppPlayButtonAgeCheckAmpNameSpace = require(Parent.SharedFlags).FStringLuaAppPlayButtonAgeCheckAmpNameSpace
local FFlagLuaAppPlayButtonWizardCloseDelay = require(Parent.SharedFlags).FFlagLuaAppPlayButtonWizardCloseDelay
local FIntLuaAppPlayButtonWizardCloseDelayMs = require(Parent.SharedFlags).FIntLuaAppPlayButtonWizardCloseDelayMs
local FFlagLuaAppDemoModePlayButtonTelemetry = require(Parent.SharedFlags).FFlagLuaAppDemoModePlayButtonTelemetry
local FFlagLuaAppPlaytestTrustedFriendsRefetchPlayability = require(Parent.SharedFlags).FFlagLuaAppPlaytestTrustedFriendsRefetchPlayability
local Type = PlaytestUnlockUpsellModule.Type

return function(p1, UniverseId, Callback, p2, PageName, p3)
	-- upvalues: UseRoactServiceFunction (copy), RoactNetworking (copy), AppEventIngestService (copy), UseDispatchFunction (copy), UseStoreFunction (copy), UseUpdatePlaytestSettingsUpsellModule (copy), ReactModule (copy), FetchGamePlayButtonDataModule (copy), UseTrustedFriendsPlaytestUpsellModule (copy), FFlagLuaAppPlaytestTrustedFriendsRefetchPlayability (copy), UnlockPlayIntentFunction (copy), InvalidPlayIntentFunction (copy), PlayButtonStatesModule (copy), OpenAmpWizardContainerFunction (copy), FStringLuaAppPlayButtonAgeCheckAmpFeatureName (copy), FStringLuaAppPlayButtonAgeCheckAmpNameSpace (copy), FFlagLuaAppPlayButtonWizardCloseDelay (copy), DelayedAmpWizardCompletionCallbackOverrideModule (copy), FIntLuaAppPlayButtonWizardCloseDelayMs (copy), FFlagLuaAppDemoModePlayButtonTelemetry (copy), PlaytestUnlockUpsellModule (copy), Type (copy), ApiFetchPlayabilityStatus (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppEventIngestService)
	local UseDispatchResult = UseDispatchFunction()
	local UseStoreResult = UseStoreFunction()
	local UseUpdatePlaytestSettingsUpsellModuleResult = UseUpdatePlaytestSettingsUpsellModule()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), FetchGamePlayButtonDataModule (upval), UseRoactServiceResult (copy), UniverseId (copy)
		UseDispatchResult(FetchGamePlayButtonDataModule.Fetch(UseRoactServiceResult, UniverseId, true))
	end, { UseDispatchResult, UseRoactServiceResult, UniverseId })
	local UseTrustedFriendsPlaytestUpsellModuleResult = UseTrustedFriendsPlaytestUpsellModule(p3, if FFlagLuaAppPlaytestTrustedFriendsRefetchPlayability then UseResult else nil)
	local UseResult1 = ReactModule.useCallback(function(UpsellName, PlayabilityStatus)
		-- upvalues: UnlockPlayIntentFunction (upval), UseRoactServiceResult1 (copy), UniverseId (copy), PageName (copy)
		UnlockPlayIntentFunction(UseRoactServiceResult1, {
			universeId = UniverseId,
			upsellName = UpsellName,
			playabilityStatus = PlayabilityStatus,
			pageName = PageName
		})
	end, { UseRoactServiceResult1, UniverseId, PageName })
	local UseResult2 = ReactModule.useCallback(function(p4)
		-- upvalues: InvalidPlayIntentFunction (upval), p2 (copy), UniverseId (copy), PlayButtonStatesModule (upval)
		InvalidPlayIntentFunction(p2, {
			universeId = UniverseId,
			playButtonState = PlayButtonStatesModule.Playtest,
			playabilityStatus = p4 or "None"
		})
	end, { p2, UniverseId })
	local UseResult3 = ReactModule.useCallback(function(p4)
		-- upvalues: UseDispatchResult (copy), OpenAmpWizardContainerFunction (upval), FStringLuaAppPlayButtonAgeCheckAmpFeatureName (upval), UseResult (copy), PageName (copy), FStringLuaAppPlayButtonAgeCheckAmpNameSpace (upval), FFlagLuaAppPlayButtonWizardCloseDelay (upval), DelayedAmpWizardCompletionCallbackOverrideModule (upval), FIntLuaAppPlayButtonWizardCloseDelayMs (upval), UseResult1 (copy)
		UseDispatchResult(OpenAmpWizardContainerFunction(FStringLuaAppPlayButtonAgeCheckAmpFeatureName, UseResult, nil, if PageName then `gameJoinAgeCheckRequired-{PageName}` else "gameJoinAgeCheckRequired", nil, FStringLuaAppPlayButtonAgeCheckAmpNameSpace, nil, nil, if FFlagLuaAppPlayButtonWizardCloseDelay then DelayedAmpWizardCompletionCallbackOverrideModule(UseResult, FIntLuaAppPlayButtonWizardCloseDelayMs) else nil))
		UseResult1("AgeCheckRequired", p4)
	end, { UseDispatchResult, UseResult, PageName, UseResult1 })
	
	return (ReactModule.useCallback(function(p4, p5)
		-- upvalues: Callback (copy), FFlagLuaAppDemoModePlayButtonTelemetry (upval), UseResult2 (copy), PlaytestUnlockUpsellModule (upval), Type (upval), UseResult3 (copy), UseUpdatePlaytestSettingsUpsellModuleResult (copy), UseResult1 (copy), UseTrustedFriendsPlaytestUpsellModuleResult (copy), UseDispatchResult (copy), ApiFetchPlayabilityStatus (upval), UseRoactServiceResult (copy), UniverseId (copy), UseStoreResult (copy), p1 (copy)
		local function _()
			-- upvalues: Callback (upval), p4 (copy), FFlagLuaAppDemoModePlayButtonTelemetry (upval), p5 (copy)
			Callback(p4, if FFlagLuaAppDemoModePlayButtonTelemetry then p5 else nil)
		end
		
		local function handlePrivatePlaytestInfo(PrivatePlaytestInfo)
			-- upvalues: UseResult2 (upval), Callback (upval), p4 (copy), FFlagLuaAppDemoModePlayButtonTelemetry (upval), p5 (copy), PlaytestUnlockUpsellModule (upval), Type (upval), UseResult3 (upval), UseUpdatePlaytestSettingsUpsellModuleResult (upval), UseResult1 (upval), UseTrustedFriendsPlaytestUpsellModuleResult (upval)
			if PrivatePlaytestInfo == nil then
				UseResult2(nil)
				
				return
			end
			if PrivatePlaytestInfo.isPlayable then
				Callback(p4, if FFlagLuaAppDemoModePlayButtonTelemetry then p5 else nil)
				
				return
			end
			local PlayabilityStatus = PrivatePlaytestInfo.playabilityStatus
			local Type1 = PlaytestUnlockUpsellModule.getType(PlayabilityStatus)
			
			if Type1 == Type.AgeVerification then
				UseResult3(PlayabilityStatus)
				
				return
			end
			if Type1 == Type.UpdatePlaytestSettings then
				UseUpdatePlaytestSettingsUpsellModuleResult()
				UseResult1("UpdatePlaytestSettings", PlayabilityStatus)
				
				return
			end
			if Type1 == Type.TrustedFriends then
				UseTrustedFriendsPlaytestUpsellModuleResult()
				UseResult1("TrustedFriendRequired", PlayabilityStatus)
				
				return
			else
				UseResult2(PlayabilityStatus)
			end
		end
		
		UseDispatchResult(ApiFetchPlayabilityStatus.Fetch(UseRoactServiceResult, { UniverseId })):andThen(function()
			-- upvalues: UseStoreResult (upval), UniverseId (upval), handlePrivatePlaytestInfo (copy)
			local PlayabilityStatusEntry = UseStoreResult:getState().PlayabilityStatus[UniverseId]
			handlePrivatePlaytestInfo(PlayabilityStatusEntry and PlayabilityStatusEntry.privatePlaytestInfo or nil)
		end):catch(function()
			-- upvalues: handlePrivatePlaytestInfo (copy), p1 (upval)
			handlePrivatePlaytestInfo(p1 and p1.privatePlaytestInfo or nil)
		end)
	end, {
		UseDispatchResult, UseRoactServiceResult, UniverseId, UseStoreResult, Callback,
		p1, UseResult3, UseUpdatePlaytestSettingsUpsellModuleResult,
		UseTrustedFriendsPlaytestUpsellModuleResult, UseResult1, UseResult2
	}))
end