local GamePlayButton = script:FindFirstAncestor("GamePlayButton")
local ApiPostPreparePurchaseModule = require(GamePlayButton.ApiPostPreparePurchase)
local GamePlayButtonShareLinkAnalyticsModule = require(GamePlayButton.GamePlayButtonShareLinkAnalytics)
local OpenCentralOverlayForPurchaseGameModule = require(GamePlayButton.OpenCentralOverlayForPurchaseGame)
local OpenCentralOverlayForUnifiedPurchasePromptModule = require(GamePlayButton.OpenCentralOverlayForUnifiedPurchasePrompt)
local PlayButtonReferralSourceModule = require(GamePlayButton.PlayButtonReferralSource)
local PlayButtonStatesModule = require(GamePlayButton.PlayButtonStates)
local _ = require(GamePlayButton.PlayButtonTypes)
local UsePlayButtonLaunchAfterSeventeenPlusUpsellModule = require(GamePlayButton.PlayButtonLaunchChecks.usePlayButtonLaunchAfterSeventeenPlusUpsell)
local UsePlayButtonLaunchGameModule = require(GamePlayButton.PlayButtonLaunchChecks.usePlayButtonLaunchGame)
local UsePlayButtonLaunchWithUxTreatmentModule = require(GamePlayButton.PlayButtonLaunchChecks.usePlayButtonLaunchWithUxTreatment)
local UseAgeVerificationOverlayCallbackModule = require(GamePlayButton.PlayButtonLaunchChecks.useAgeVerificationOverlayCallback)
local UsePrivatePlaytestLaunchWithUpsellModule = require(GamePlayButton.PlayButtonLaunchChecks.usePrivatePlaytestLaunchWithUpsell)
local Parent = GamePlayButton.Parent
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseRouteNameFunction = require(Parent.Navigation).useRouteName
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local RoactAnalytics = RoactServiceTagsModule.RoactAnalytics
local RoactNetworking = RoactServiceTagsModule.RoactNetworking
local AppUpdateService = RoactServiceTagsModule.AppUpdateService
local JoinGamePlayButtonFunction = require(Parent.DiscoveryAnalytics).Points.joinGamePlayButton
local UnlockPlayIntentFunction = require(Parent.DiscoveryAnalytics).Events.unlockPlayIntent
local InvalidPlayIntentFunction = require(Parent.DiscoveryAnalytics).Events.invalidPlayIntent
local AppEventIngestService = require(Parent.RoactServiceTags).AppEventIngestService
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local HandleUpdateFunction = require(Parent.RobloxAppUpdate).HandleUpdate
local LaunchPlaytestWithLoadingStateModule = require(Parent.BuildExperiencePlaytestLaunch.launchPlaytestWithLoadingState)
local UseGameProductInfoSelectorFunction = require(Parent.GameProductInfoRodux).useGameProductInfoSelector
local UseGameInfosSelectorFunction = require(Parent.GameInfosRodux).useGameInfosSelector
local GameHydrationReactModule = require(Parent.GameHydrationReact)
local CloseCentralOverlayFunction = require(Parent.CentralOverlay).Thunks.CloseCentralOverlay
local FetchGamePlayabilityAndProductInfo = require(Parent.GameDetailRodux).FetchGamePlayabilityAndProductInfo
local PurchasePromptLiteModule = require(Parent.PurchasePromptLite)
local ProductPurchaseSurface = PurchasePromptLiteModule.Enums.ProductPurchaseSurface
local GetIsUserEligibleForUnifiedPurchaseFlowFunction = PurchasePromptLiteModule.getIsUserEligibleForUnifiedPurchaseFlow
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local GetFFlagLuaAppEnableVirtualEventPlaceIdFunction = require(Parent.SharedFlags).GetFFlagLuaAppEnableVirtualEventPlaceId
local FFlagShipUnifiedPurchaseFlowToPaidAccess = require(Parent.SharedFlags).FFlagShipUnifiedPurchaseFlowToPaidAccess
local CreateExperienceInviteFunction = require(Parent.Squads.Thunks).CreateExperienceInvite
local SquadExternalContractContext = require(Parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local SquadExperienceInviteType = require(Parent.SquadsCore.Enums).SquadExperienceInviteType
local SquadExperienceInviteSource = require(Parent.SquadsCore.Enums).SquadExperienceInviteSource
local _ = require(Parent.PlayabilityRodux)
local CanPerformBinaryUpdateEnabledEngineFeature = game:GetEngineFeature("CanPerformBinaryUpdateEnabled")
local FFlagEnableSquadRegroupExperimentation = require(Parent.SharedFlags).FFlagEnableSquadRegroupExperimentation
local FFlagLuaAppPlayableUxTreatment = require(Parent.SharedFlags).FFlagLuaAppPlayableUxTreatment
local FFlagEnablePrivatePartyStartJoin = require(Parent.SharedFlags).FFlagEnablePrivatePartyStartJoin
local FFlagLuaAppPlayButtonLoadingDurationTelemetry = require(Parent.SharedFlags).FFlagLuaAppPlayButtonLoadingDurationTelemetry
local FFlagLuaAppLaunchWhenLoadingEdp = require(Parent.SharedFlags).FFlagLuaAppLaunchWhenLoadingEdp
local FFlagEnableGameJoinEarlyAccess = require(Parent.SharedFlags).FFlagEnableGameJoinEarlyAccess
local FFlagLuaAppLaunchWhenLoadingForce = require(Parent.SharedFlags).FFlagLuaAppLaunchWhenLoadingForce
local FFlagLuaAppDemoModePlayButtonTelemetry = require(Parent.SharedFlags).FFlagLuaAppDemoModePlayButtonTelemetry
local FFlagMigrateGameInfoToStore = require(Parent.SharedFlags).FFlagMigrateGameInfoToStore
local FFlagLuaAppPlayButtonPrivatePT = require(Parent.SharedFlags).FFlagLuaAppPlayButtonPrivatePT
local FFlagLuaAppPlayButtonPrivatePTEnableSingleButton = require(Parent.SharedFlags).FFlagLuaAppPlayButtonPrivatePTEnableSingleButton
local FFlagLuaAppPlayButtonPrivatePTEnableDualButton = require(Parent.SharedFlags).FFlagLuaAppPlayButtonPrivatePTEnableDualButton

return function(UniverseId, ReferralSource, Ctx, _, p1, p2, p3, Enabled)
	-- upvalues: UseRoactServiceFunction (copy), RoactAnalytics (copy), AppUpdateService (copy), AppEventIngestService (copy), UseDispatchFunction (copy), UseSelectorFunction (copy), FFlagMigrateGameInfoToStore (copy), GameHydrationReactModule (copy), UseGameInfosSelectorFunction (copy), UseGameProductInfoSelectorFunction (copy), UseRouteNameFunction (copy), GetFFlagIsSquadEnabledFunction (copy), ReactModule (copy), SquadExternalContractContext (copy), GetFFlagLuaAppEnableVirtualEventPlaceIdFunction (copy), FFlagLuaAppPlayButtonPrivatePT (copy), UsePlayButtonLaunchGameModule (copy), FFlagLuaAppPlayableUxTreatment (copy), UsePlayButtonLaunchWithUxTreatmentModule (copy), UsePlayButtonLaunchAfterSeventeenPlusUpsellModule (copy), UseAgeVerificationOverlayCallbackModule (copy), FFlagLuaAppDemoModePlayButtonTelemetry (copy), HandleUpdateFunction (copy), CanPerformBinaryUpdateEnabledEngineFeature (copy), RoactNetworking (copy), FFlagLuaAppLaunchWhenLoadingForce (copy), FFlagLuaAppLaunchWhenLoadingEdp (copy), DiscoveryEventErrorLogger (copy), LaunchPlaytestWithLoadingStateModule (copy), FFlagLuaAppPlayButtonPrivatePTEnableSingleButton (copy), UsePrivatePlaytestLaunchWithUpsellModule (copy), JoinGamePlayButtonFunction (copy), PlayButtonReferralSourceModule (copy), GamePlayButtonShareLinkAnalyticsModule (copy), PlayButtonStatesModule (copy), CloseCentralOverlayFunction (copy), FetchGamePlayabilityAndProductInfo (copy), OpenCentralOverlayForPurchaseGameModule (copy), FFlagShipUnifiedPurchaseFlowToPaidAccess (copy), OpenCentralOverlayForUnifiedPurchasePromptModule (copy), ProductPurchaseSurface (copy), GetIsUserEligibleForUnifiedPurchaseFlowFunction (copy), FFlagLuaAppPlayButtonPrivatePTEnableDualButton (copy), ApiPostPreparePurchaseModule (copy), UnlockPlayIntentFunction (copy), InvalidPlayIntentFunction (copy), FFlagLuaAppPlayButtonLoadingDurationTelemetry (copy), CreateExperienceInviteFunction (copy), FFlagEnableSquadRegroupExperimentation (copy), SquadExperienceInviteSource (copy), FFlagEnablePrivatePartyStartJoin (copy), SquadExperienceInviteType (copy), FFlagEnableGameJoinEarlyAccess (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactAnalytics)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppUpdateService)
	local UseRoactServiceResult2 = UseRoactServiceFunction(AppEventIngestService)
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(function(p4)
		-- upvalues: UniverseId (copy)
		return p4.GameDetails[UniverseId]
	end)
	local v1 = nil
	local UseGameInfoResult = nil
	
	if FFlagMigrateGameInfoToStore then
		UseGameInfoResult = GameHydrationReactModule.useGameInfo(UniverseId)
	else
		v1 = UseGameInfosSelectorFunction(UniverseId)
	end
	local UseGameProductInfoSelectorResult = UseGameProductInfoSelectorFunction(UniverseId)
	local UseSelectorResult1 = UseSelectorFunction(function(p4)
		-- upvalues: UniverseId (copy)
		return p4.PlayabilityStatus[UniverseId]
	end)
	local UseGameIconResult = GameHydrationReactModule.useGameIcon(UniverseId)
	local UseRouteNameResult = UseRouteNameFunction()
	local UseContextResult = if GetFFlagIsSquadEnabledFunction() then ReactModule.useContext(SquadExternalContractContext) else nil
	local RootPlaceId = UseSelectorResult and UseSelectorResult.rootPlaceId or ((if FFlagMigrateGameInfoToStore then UseGameInfoResult and UseGameInfoResult.rootPlaceId else v1 and v1.placeId) or nil)
	local P6 = GetFFlagLuaAppEnableVirtualEventPlaceIdFunction() and p3 ~= "0" and p3 or RootPlaceId
	local Name = UseSelectorResult and UseSelectorResult.name or ((if FFlagMigrateGameInfoToStore then UseGameInfoResult and UseGameInfoResult.name else v1 and v1.name) or nil)
	local v2 = nil
	
	if FFlagLuaAppPlayButtonPrivatePT then
		local Id = UseSelectorResult and UseSelectorResult.creator and UseSelectorResult.creator.id or ((if FFlagMigrateGameInfoToStore then UseGameInfoResult and (UseGameInfoResult.creator and UseGameInfoResult.creator.id) else v1 and v1.creatorId) or nil)
		v2 = if Id == nil then nil else tostring(Id)
	end
	local UsePlayButtonLaunchGameModuleResult = UsePlayButtonLaunchGameModule(UniverseId, P6, RootPlaceId, ReferralSource, Ctx, p1, p2)
	local UsePlayButtonLaunchWithUxTreatmentModuleResult = if FFlagLuaAppPlayableUxTreatment then UsePlayButtonLaunchWithUxTreatmentModule(UseSelectorResult1, UniverseId, UsePlayButtonLaunchGameModuleResult, UseRouteNameResult) else nil
	local UsePlayButtonLaunchAfterSeventeenPlusUpsellModuleResult = UsePlayButtonLaunchAfterSeventeenPlusUpsellModule(UseSelectorResult1, UniverseId, if FFlagLuaAppPlayableUxTreatment then UsePlayButtonLaunchWithUxTreatmentModuleResult else UsePlayButtonLaunchGameModuleResult, UseRouteNameResult)
	local UseAgeVerificationOverlayCallbackModuleResult = UseAgeVerificationOverlayCallbackModule(UniverseId, UsePlayButtonLaunchGameModuleResult, UsePlayButtonLaunchAfterSeventeenPlusUpsellModuleResult)
	local UseResult = ReactModule.useCallback(function(p4, p5)
		-- upvalues: UseAgeVerificationOverlayCallbackModuleResult (copy), FFlagLuaAppDemoModePlayButtonTelemetry (upval), UsePlayButtonLaunchAfterSeventeenPlusUpsellModuleResult (copy), HandleUpdateFunction (upval), UseDispatchResult (copy), UseRoactServiceResult1 (copy), CanPerformBinaryUpdateEnabledEngineFeature (upval), UseRoactServiceResult (copy), Ctx (copy)
		HandleUpdateFunction(UseDispatchResult, UseRoactServiceResult1, CanPerformBinaryUpdateEnabledEngineFeature, UseRoactServiceResult, Ctx, if game:GetEngineFeature("VoiceChatSupported") then function()
			-- upvalues: UseAgeVerificationOverlayCallbackModuleResult (upval), p4 (copy), FFlagLuaAppDemoModePlayButtonTelemetry (upval), p5 (copy)
			UseAgeVerificationOverlayCallbackModuleResult(p4, if FFlagLuaAppDemoModePlayButtonTelemetry then p5 else nil)
		end else function()
			-- upvalues: UsePlayButtonLaunchAfterSeventeenPlusUpsellModuleResult (upval), p4 (copy), FFlagLuaAppDemoModePlayButtonTelemetry (upval), p5 (copy)
			UsePlayButtonLaunchAfterSeventeenPlusUpsellModuleResult(p4, if FFlagLuaAppDemoModePlayButtonTelemetry then p5 else nil)
		end)
	end, {
		UseRoactServiceResult, UseRoactServiceResult1,
		CanPerformBinaryUpdateEnabledEngineFeature, Ctx,
		UseAgeVerificationOverlayCallbackModuleResult,
		UsePlayButtonLaunchAfterSeventeenPlusUpsellModuleResult, UseDispatchResult
	})
	local UseRoactServiceResult3 = UseRoactServiceFunction(RoactNetworking)
	local FFlagLuaAppLaunchWhenLoadingForce1 = FFlagLuaAppLaunchWhenLoadingForce or FFlagLuaAppLaunchWhenLoadingEdp and Enabled == true
	local Callback = nil
	
	if FFlagLuaAppPlayButtonPrivatePT then
		local UseResult1 = ReactModule.useCallback(function(Callback: (any) -> (), p4)
			-- upvalues: P6 (ref), DiscoveryEventErrorLogger (upval), UniverseId (copy), LaunchPlaytestWithLoadingStateModule (upval), p1 (copy), FFlagLuaAppDemoModePlayButtonTelemetry (upval)
			local Number = if P6 == nil then nil else tonumber(P6)
			
			if Number == nil then
				DiscoveryEventErrorLogger.reportError("PlaytestLaunchMissingPlaceId", `Cannot launch private Playtest without a valid placeId for universeId {UniverseId}`)
				
				return
			end
			if LaunchPlaytestWithLoadingStateModule(Number, p1, true) and Callback ~= nil then
				Callback(if FFlagLuaAppDemoModePlayButtonTelemetry then p4 else nil)
			end
		end, { P6, p1, UniverseId })
		Callback = UsePrivatePlaytestLaunchWithUpsellModule(UseSelectorResult1, tostring(UniverseId), if FFlagLuaAppPlayButtonPrivatePTEnableSingleButton then UseResult else UseResult1, Ctx, UseRouteNameResult, v2)
	end
	return (ReactModule.useCallback(function(PlayButtonState, p4, p5)
		-- upvalues: JoinGamePlayButtonFunction (upval), UseRoactServiceResult (copy), ReferralSource (copy), RootPlaceId (copy), Ctx (copy), PlayButtonReferralSourceModule (upval), GamePlayButtonShareLinkAnalyticsModule (upval), GetFFlagLuaAppEnableVirtualEventPlaceIdFunction (upval), P6 (ref), UniverseId (copy), PlayButtonStatesModule (upval), FFlagLuaAppPlayButtonPrivatePTEnableSingleButton (upval), UseSelectorResult1 (copy), Callback (ref), UseResult (copy), UseGameProductInfoSelectorResult (copy), UseDispatchResult (copy), CloseCentralOverlayFunction (upval), FetchGamePlayabilityAndProductInfo (upval), UseRoactServiceResult3 (copy), OpenCentralOverlayForPurchaseGameModule (upval), Name (copy), UseRouteNameResult (copy), FFlagShipUnifiedPurchaseFlowToPaidAccess (upval), OpenCentralOverlayForUnifiedPurchasePromptModule (upval), UseGameIconResult (copy), ProductPurchaseSurface (upval), GetIsUserEligibleForUnifiedPurchaseFlowFunction (upval), FFlagLuaAppDemoModePlayButtonTelemetry (upval), FFlagLuaAppPlayButtonPrivatePTEnableDualButton (upval), ApiPostPreparePurchaseModule (upval), UnlockPlayIntentFunction (upval), UseRoactServiceResult2 (copy), InvalidPlayIntentFunction (upval), FFlagLuaAppPlayButtonLoadingDurationTelemetry (upval), FFlagLuaAppLaunchWhenLoadingForce1 (copy), GetFFlagIsSquadEnabledFunction (upval), CreateExperienceInviteFunction (upval), UseContextResult (copy), FFlagEnableSquadRegroupExperimentation (upval), SquadExperienceInviteSource (upval), FFlagEnablePrivatePartyStartJoin (upval), SquadExperienceInviteType (upval), FFlagEnableGameJoinEarlyAccess (upval)
		JoinGamePlayButtonFunction(UseRoactServiceResult.InfluxDb, "playButtonClicked", {
			isUniversalApp = true,
			referralSource = ReferralSource,
			placeId = RootPlaceId,
			buttonState = PlayButtonState and PlayButtonState or "Invalid",
			ctx = Ctx
		})
		
		if ReferralSource == PlayButtonReferralSourceModule.ExperienceDetailsLink then
			GamePlayButtonShareLinkAnalyticsModule(UseRoactServiceResult, {
				placeId = if GetFFlagLuaAppEnableVirtualEventPlaceIdFunction() then P6 else RootPlaceId,
				playButtonState = PlayButtonState,
				universeId = UniverseId
			})
		end
		if PlayButtonState == PlayButtonStatesModule.Playable or PlayButtonState == PlayButtonStatesModule.ActionNeeded then
			if FFlagLuaAppPlayButtonPrivatePTEnableSingleButton then
				local PrivatePlaytestInfo = UseSelectorResult1 and UseSelectorResult1.privatePlaytestInfo or nil
				
				if PlayButtonState == PlayButtonStatesModule.ActionNeeded and PrivatePlaytestInfo ~= nil then
					Callback(p4, "PlaytestPlayButtonClick")
					
					return
				end
			end
			UseResult(p4)
			
			return
		elseif PlayButtonState == PlayButtonStatesModule.PaidAccess then
			local Price = UseGameProductInfoSelectorResult and UseGameProductInfoSelectorResult.price or nil
			local ProductId = UseGameProductInfoSelectorResult and UseGameProductInfoSelectorResult.productId or nil
			local SellerId = UseGameProductInfoSelectorResult and UseGameProductInfoSelectorResult.sellerId or nil
			local UniverseId1 = UseGameProductInfoSelectorResult and UseGameProductInfoSelectorResult.universeId or nil
			
			local function onFlowComplete()
				-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
				UseDispatchResult(CloseCentralOverlayFunction())
			end
			
			local function onPurchaseSuccess()
				-- upvalues: UseDispatchResult (upval), FetchGamePlayabilityAndProductInfo (upval), UseRoactServiceResult3 (upval), UniverseId1 (copy)
				UseDispatchResult(FetchGamePlayabilityAndProductInfo.Fetch(UseRoactServiceResult3, UniverseId1))
			end
			
			local function _()
				-- upvalues: UseDispatchResult (upval), OpenCentralOverlayForPurchaseGameModule (upval), UniverseId1 (copy), Name (upval), Price (copy), ProductId (copy), SellerId (copy), UseRouteNameResult (upval)
				UseDispatchResult(OpenCentralOverlayForPurchaseGameModule(UniverseId1, Name, Price, ProductId, SellerId, { UseRouteNameResult }))
			end
			
			if FFlagShipUnifiedPurchaseFlowToPaidAccess then
				UseDispatchResult(OpenCentralOverlayForUnifiedPurchasePromptModule({
					productPayload = {
						kind = "Experience",
						universeId = UniverseId1,
						experienceName = Name,
						experienceIconUrl = UseGameIconResult
					},
					purchaseCallbacks = {
						onFlowComplete = onFlowComplete,
						onPurchaseSuccess = onPurchaseSuccess
					},
					purchaseAnalyticsMetadata = { surface = ProductPurchaseSurface.PaidAccess }
				}))
				
				return
			else
				GetIsUserEligibleForUnifiedPurchaseFlowFunction(UseRoactServiceResult3):andThen(function(Result)
					-- upvalues: UseDispatchResult (upval), OpenCentralOverlayForUnifiedPurchasePromptModule (upval), UniverseId1 (copy), Name (upval), UseGameIconResult (upval), onFlowComplete (copy), onPurchaseSuccess (copy), ProductPurchaseSurface (upval), OpenCentralOverlayForPurchaseGameModule (upval), Price (copy), ProductId (copy), SellerId (copy), UseRouteNameResult (upval)
					if Result then
						UseDispatchResult(OpenCentralOverlayForUnifiedPurchasePromptModule({
							productPayload = {
								kind = "Experience",
								universeId = UniverseId1,
								experienceName = Name,
								experienceIconUrl = UseGameIconResult
							},
							purchaseCallbacks = {
								onFlowComplete = onFlowComplete,
								onPurchaseSuccess = onPurchaseSuccess
							},
							purchaseAnalyticsMetadata = { surface = ProductPurchaseSurface.PaidAccess }
						}))
						
						return
					else
						UseDispatchResult(OpenCentralOverlayForPurchaseGameModule(UniverseId1, Name, Price, ProductId, SellerId, { UseRouteNameResult }))
					end
				end):catch(function(_)
					-- upvalues: UseDispatchResult (upval), OpenCentralOverlayForPurchaseGameModule (upval), UniverseId1 (copy), Name (upval), Price (copy), ProductId (copy), SellerId (copy), UseRouteNameResult (upval)
					UseDispatchResult(OpenCentralOverlayForPurchaseGameModule(UniverseId1, Name, Price, ProductId, SellerId, { UseRouteNameResult }))
				end)
				
				return
			end
		elseif PlayButtonState == PlayButtonStatesModule.DemoMode then
			if FFlagLuaAppDemoModePlayButtonTelemetry then
				UseResult(p4, "DemoPlayButtonClick")
				
				return
			else
				UseResult(p4)
				
				return
			end
		elseif FFlagLuaAppPlayButtonPrivatePTEnableDualButton and PlayButtonState == PlayButtonStatesModule.Playtest then
			Callback(p4, "PlaytestPlayButtonClick")
			
			return
		else
			if PlayButtonState == PlayButtonStatesModule.FiatPaidAccess then
				if RootPlaceId and UseGameProductInfoSelectorResult and UseGameProductInfoSelectorResult.fiatBasePriceId then
					UseDispatchResult(ApiPostPreparePurchaseModule.Fetch(UseRoactServiceResult3, RootPlaceId, UniverseId, UseGameProductInfoSelectorResult.fiatBasePriceId))
					UnlockPlayIntentFunction(UseRoactServiceResult2, {
						upsellName = "FiatPurchase",
						universeId = UniverseId,
						playabilityStatus = UseSelectorResult1 and UseSelectorResult1.playabilityStatus or nil,
						pageName = UseRouteNameResult
					})
					
					return
				end
			elseif PlayButtonState == PlayButtonStatesModule.Loading then
				InvalidPlayIntentFunction(Ctx, {
					universeId = UniverseId,
					playButtonState = PlayButtonState,
					playabilityStatus = UseSelectorResult1 and UseSelectorResult1.playabilityStatus or nil,
					pageName = if FFlagLuaAppPlayButtonLoadingDurationTelemetry then UseRouteNameResult else nil
				})
				
				if FFlagLuaAppLaunchWhenLoadingForce1 then
					UseResult(p4)
				end
				return
			elseif GetFFlagIsSquadEnabledFunction() and PlayButtonState == PlayButtonStatesModule.PlayableWithParty then
				if RootPlaceId then
					UseDispatchResult(CreateExperienceInviteFunction(RootPlaceId, UseContextResult, if FFlagEnableSquadRegroupExperimentation then SquadExperienceInviteSource.Default else nil, if FFlagEnablePrivatePartyStartJoin and (p5 and p5.isPrivateParty) then SquadExperienceInviteType.PlayWithPartyInPrivatePartyServer else nil))
					
					return
				end
			elseif PlayButtonState == PlayButtonStatesModule.WaitingForParty then
				InvalidPlayIntentFunction(Ctx, {
					universeId = UniverseId,
					playButtonState = PlayButtonState,
					playabilityStatus = UseSelectorResult1 and UseSelectorResult1.playabilityStatus or nil,
					pageName = if FFlagLuaAppPlayButtonLoadingDurationTelemetry then UseRouteNameResult else nil
				})
				
				return
			else
				if PlayButtonState == PlayButtonStatesModule.UnplayableOther or FFlagEnableGameJoinEarlyAccess and PlayButtonState == PlayButtonStatesModule.EarlyAccessLocked then
					InvalidPlayIntentFunction(Ctx, {
						universeId = UniverseId,
						playButtonState = PlayButtonState,
						playabilityStatus = UseSelectorResult1 and UseSelectorResult1.playabilityStatus or nil,
						pageName = if FFlagLuaAppPlayButtonLoadingDurationTelemetry then UseRouteNameResult else nil
					})
					
					return
				end
				error(`invalid play button state {PlayButtonState}!`)
			end
		end
	end, {
		UseRoactServiceResult, UseRoactServiceResult1,
		CanPerformBinaryUpdateEnabledEngineFeature, UniverseId,
		if GetFFlagLuaAppEnableVirtualEventPlaceIdFunction() or FFlagLuaAppPlayButtonPrivatePT then P6 else nil,
		RootPlaceId, Name, ReferralSource, Ctx, UseResult,
		UseGameProductInfoSelectorResult, UseRouteNameResult,
		if FFlagLuaAppPlayButtonPrivatePT then p1 else nil,
		if FFlagLuaAppPlayButtonPrivatePT then Callback else nil,
		if GetFFlagIsSquadEnabledFunction() then UseContextResult else nil,
		UseSelectorResult1, UseDispatchResult, UseRoactServiceResult2,
		UseGameIconResult, UseRoactServiceResult3,
		if FFlagLuaAppLaunchWhenLoadingForce or FFlagLuaAppLaunchWhenLoadingEdp then FFlagLuaAppLaunchWhenLoadingForce1 else nil
	}))
end