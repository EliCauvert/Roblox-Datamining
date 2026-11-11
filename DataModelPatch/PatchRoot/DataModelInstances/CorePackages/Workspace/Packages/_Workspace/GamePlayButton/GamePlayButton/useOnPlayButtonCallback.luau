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
local CheckForUpdateFunction = require(Parent.RobloxAppUpdate).Thunks.CheckForUpdate
local UseGameProductInfoSelectorFunction = require(Parent.GameProductInfoRodux).useGameProductInfoSelector
local UseGameInfosSelectorFunction = require(Parent.GameInfosRodux).useGameInfosSelector
local UseGameIconSelectorFunction = require(Parent.GameIconRodux).GameIcons.useGameIconSelector
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
local AutoUpgradeEngineFeatureOnlyEngineFeature = game:GetEngineFeature("AutoUpgradeEngineFeatureOnly")
local CanPerformBinaryUpdateEnabledEngineFeature = game:GetEngineFeature("CanPerformBinaryUpdateEnabled")
local IncludeWaitingForPartyInCondition = game:DefineFastFlag("IncludeWaitingForPartyInCondition", false)
local FFlagEnableUnifiedProductPurchaseFlow = require(Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local FFlagEnableSquadRegroupExperimentation = require(Parent.SharedFlags).FFlagEnableSquadRegroupExperimentation
local FFlagLuaAppPlayableUxTreatment = require(Parent.SharedFlags).FFlagLuaAppPlayableUxTreatment
local FFlagEnablePrivatePartyStartJoin = require(Parent.SharedFlags).FFlagEnablePrivatePartyStartJoin
local FFlagLuaAppLogPageContextUnlockPlayIntent = require(Parent.SharedFlags).FFlagLuaAppLogPageContextUnlockPlayIntent
local FFlagLuaAppPlayButtonLoadingDurationTelemetry = require(Parent.SharedFlags).FFlagLuaAppPlayButtonLoadingDurationTelemetry
local FFlagLuaAppLaunchWhenLoadingEdp = require(Parent.SharedFlags).FFlagLuaAppLaunchWhenLoadingEdp
local FFlagLuaAppLaunchWhenLoadingForce = require(Parent.SharedFlags).FFlagLuaAppLaunchWhenLoadingForce

return function(UniverseId, ReferralSource, Ctx, _, p1, p2, p3, Enabled)
	-- upvalues: UseRoactServiceFunction (copy), RoactAnalytics (copy), AppUpdateService (copy), AppEventIngestService (copy), UseDispatchFunction (copy), UseSelectorFunction (copy), UseGameInfosSelectorFunction (copy), UseGameProductInfoSelectorFunction (copy), FFlagEnableUnifiedProductPurchaseFlow (copy), UseGameIconSelectorFunction (copy), UseRouteNameFunction (copy), GetFFlagIsSquadEnabledFunction (copy), ReactModule (copy), SquadExternalContractContext (copy), GetFFlagLuaAppEnableVirtualEventPlaceIdFunction (copy), UsePlayButtonLaunchGameModule (copy), FFlagLuaAppPlayableUxTreatment (copy), UsePlayButtonLaunchWithUxTreatmentModule (copy), FFlagLuaAppLogPageContextUnlockPlayIntent (copy), UsePlayButtonLaunchAfterSeventeenPlusUpsellModule (copy), UseAgeVerificationOverlayCallbackModule (copy), RoactNetworking (copy), FFlagLuaAppLaunchWhenLoadingForce (copy), FFlagLuaAppLaunchWhenLoadingEdp (copy), AutoUpgradeEngineFeatureOnlyEngineFeature (copy), CheckForUpdateFunction (copy), CanPerformBinaryUpdateEnabledEngineFeature (copy), JoinGamePlayButtonFunction (copy), PlayButtonReferralSourceModule (copy), GamePlayButtonShareLinkAnalyticsModule (copy), PlayButtonStatesModule (copy), CloseCentralOverlayFunction (copy), FetchGamePlayabilityAndProductInfo (copy), OpenCentralOverlayForPurchaseGameModule (copy), FFlagShipUnifiedPurchaseFlowToPaidAccess (copy), OpenCentralOverlayForUnifiedPurchasePromptModule (copy), ProductPurchaseSurface (copy), GetIsUserEligibleForUnifiedPurchaseFlowFunction (copy), ApiPostPreparePurchaseModule (copy), UnlockPlayIntentFunction (copy), InvalidPlayIntentFunction (copy), FFlagLuaAppPlayButtonLoadingDurationTelemetry (copy), CreateExperienceInviteFunction (copy), FFlagEnableSquadRegroupExperimentation (copy), SquadExperienceInviteSource (copy), FFlagEnablePrivatePartyStartJoin (copy), SquadExperienceInviteType (copy), IncludeWaitingForPartyInCondition (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactAnalytics)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppUpdateService)
	local UseRoactServiceResult2 = UseRoactServiceFunction(AppEventIngestService)
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(function(p4)
		-- upvalues: UniverseId (copy)
		return p4.GameDetails[UniverseId]
	end)
	local UseGameInfosSelectorResult = UseGameInfosSelectorFunction(UniverseId)
	local UseGameProductInfoSelectorResult = UseGameProductInfoSelectorFunction(UniverseId)
	local UseSelectorResult1 = UseSelectorFunction(function(p4)
		-- upvalues: UniverseId (copy)
		return p4.PlayabilityStatus[UniverseId]
	end)
	local UseGameIconSelectorResult = if FFlagEnableUnifiedProductPurchaseFlow then UseGameIconSelectorFunction(UniverseId) else nil
	local UseRouteNameResult = UseRouteNameFunction()
	local UseContextResult = if GetFFlagIsSquadEnabledFunction() then ReactModule.useContext(SquadExternalContractContext) else nil
	local RootPlaceId = UseSelectorResult and UseSelectorResult.rootPlaceId or (UseGameInfosSelectorResult and UseGameInfosSelectorResult.placeId or nil)
	local P6 = GetFFlagLuaAppEnableVirtualEventPlaceIdFunction() and p3 ~= "0" and p3 or RootPlaceId
	local Name = UseSelectorResult and UseSelectorResult.name or (UseGameInfosSelectorResult and UseGameInfosSelectorResult.name or nil)
	local UsePlayButtonLaunchGameModuleResult = UsePlayButtonLaunchGameModule(UniverseId, P6, RootPlaceId, ReferralSource, Ctx, p1, p2)
	local UsePlayButtonLaunchWithUxTreatmentModuleResult = if FFlagLuaAppPlayableUxTreatment then UsePlayButtonLaunchWithUxTreatmentModule(UseSelectorResult1, UniverseId, UsePlayButtonLaunchGameModuleResult, if FFlagLuaAppLogPageContextUnlockPlayIntent then UseRouteNameResult else nil) else nil
	local UsePlayButtonLaunchAfterSeventeenPlusUpsellModuleResult = UsePlayButtonLaunchAfterSeventeenPlusUpsellModule(UseSelectorResult1, UniverseId, if FFlagLuaAppPlayableUxTreatment then UsePlayButtonLaunchWithUxTreatmentModuleResult else UsePlayButtonLaunchGameModuleResult, if FFlagLuaAppLogPageContextUnlockPlayIntent then UseRouteNameResult else nil)
	local UseAgeVerificationOverlayCallbackModuleResult = UseAgeVerificationOverlayCallbackModule(UniverseId, UsePlayButtonLaunchGameModuleResult, UsePlayButtonLaunchAfterSeventeenPlusUpsellModuleResult)
	local UseRoactServiceResult3 = UseRoactServiceFunction(RoactNetworking)
	local FFlagLuaAppLaunchWhenLoadingForce1 = FFlagLuaAppLaunchWhenLoadingForce or FFlagLuaAppLaunchWhenLoadingEdp and Enabled == true
	local UseResult = if FFlagLuaAppLaunchWhenLoadingForce or FFlagLuaAppLaunchWhenLoadingEdp then ReactModule.useCallback(function(p4)
		-- upvalues: UseAgeVerificationOverlayCallbackModuleResult (copy), UsePlayButtonLaunchAfterSeventeenPlusUpsellModuleResult (copy), AutoUpgradeEngineFeatureOnlyEngineFeature (upval), UseDispatchResult (copy), CheckForUpdateFunction (upval), UseRoactServiceResult1 (copy), CanPerformBinaryUpdateEnabledEngineFeature (upval), UseRoactServiceResult (copy), Ctx (copy)
		local Callback: () -> () = if game:GetEngineFeature("VoiceChatSupported") then function()
			-- upvalues: UseAgeVerificationOverlayCallbackModuleResult (upval), p4 (copy)
			UseAgeVerificationOverlayCallbackModuleResult(p4)
		end else function()
			-- upvalues: UsePlayButtonLaunchAfterSeventeenPlusUpsellModuleResult (upval), p4 (copy)
			UsePlayButtonLaunchAfterSeventeenPlusUpsellModuleResult(p4)
		end
		
		if AutoUpgradeEngineFeatureOnlyEngineFeature then
			UseDispatchResult(CheckForUpdateFunction(UseRoactServiceResult1, CanPerformBinaryUpdateEnabledEngineFeature, UseRoactServiceResult, Callback, { ctx = Ctx }))
			
			return
		else
			Callback()
		end
	end, {
		UseRoactServiceResult, UseRoactServiceResult1,
		CanPerformBinaryUpdateEnabledEngineFeature, Ctx,
		UseAgeVerificationOverlayCallbackModuleResult,
		UsePlayButtonLaunchAfterSeventeenPlusUpsellModuleResult, UseDispatchResult
	}) else nil
	
	return (ReactModule.useCallback(function(PlayButtonState, p4, p5)
		-- upvalues: JoinGamePlayButtonFunction (upval), UseRoactServiceResult (copy), ReferralSource (copy), RootPlaceId (copy), Ctx (copy), PlayButtonReferralSourceModule (upval), GamePlayButtonShareLinkAnalyticsModule (upval), GetFFlagLuaAppEnableVirtualEventPlaceIdFunction (upval), P6 (ref), UniverseId (copy), PlayButtonStatesModule (upval), FFlagLuaAppLaunchWhenLoadingForce (upval), FFlagLuaAppLaunchWhenLoadingEdp (upval), UseResult (copy), UseAgeVerificationOverlayCallbackModuleResult (copy), UsePlayButtonLaunchAfterSeventeenPlusUpsellModuleResult (copy), AutoUpgradeEngineFeatureOnlyEngineFeature (upval), UseDispatchResult (copy), CheckForUpdateFunction (upval), UseRoactServiceResult1 (copy), CanPerformBinaryUpdateEnabledEngineFeature (upval), UseGameProductInfoSelectorResult (copy), FFlagEnableUnifiedProductPurchaseFlow (upval), CloseCentralOverlayFunction (upval), FetchGamePlayabilityAndProductInfo (upval), UseRoactServiceResult3 (copy), OpenCentralOverlayForPurchaseGameModule (upval), Name (copy), UseRouteNameResult (copy), FFlagShipUnifiedPurchaseFlowToPaidAccess (upval), OpenCentralOverlayForUnifiedPurchasePromptModule (upval), UseGameIconSelectorResult (ref), ProductPurchaseSurface (upval), GetIsUserEligibleForUnifiedPurchaseFlowFunction (upval), ApiPostPreparePurchaseModule (upval), UnlockPlayIntentFunction (upval), UseRoactServiceResult2 (copy), UseSelectorResult1 (copy), FFlagLuaAppLogPageContextUnlockPlayIntent (upval), InvalidPlayIntentFunction (upval), FFlagLuaAppPlayButtonLoadingDurationTelemetry (upval), FFlagLuaAppLaunchWhenLoadingForce1 (copy), GetFFlagIsSquadEnabledFunction (upval), CreateExperienceInviteFunction (upval), UseContextResult (copy), FFlagEnableSquadRegroupExperimentation (upval), SquadExperienceInviteSource (upval), FFlagEnablePrivatePartyStartJoin (upval), SquadExperienceInviteType (upval), IncludeWaitingForPartyInCondition (upval)
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
			if FFlagLuaAppLaunchWhenLoadingForce or FFlagLuaAppLaunchWhenLoadingEdp then
				UseResult(p4)
				
				return
			end
			local Callback: () -> () = if game:GetEngineFeature("VoiceChatSupported") then function()
				-- upvalues: UseAgeVerificationOverlayCallbackModuleResult (upval), p4 (copy)
				UseAgeVerificationOverlayCallbackModuleResult(p4)
			end else function()
				-- upvalues: UsePlayButtonLaunchAfterSeventeenPlusUpsellModuleResult (upval), p4 (copy)
				UsePlayButtonLaunchAfterSeventeenPlusUpsellModuleResult(p4)
			end
			
			if AutoUpgradeEngineFeatureOnlyEngineFeature then
				UseDispatchResult(CheckForUpdateFunction(UseRoactServiceResult1, CanPerformBinaryUpdateEnabledEngineFeature, UseRoactServiceResult, Callback, { ctx = Ctx }))
				
				return
			else
				Callback()
				
				return
			end
		elseif PlayButtonState == PlayButtonStatesModule.PaidAccess then
			local Price = UseGameProductInfoSelectorResult and UseGameProductInfoSelectorResult.price or nil
			local ProductId = UseGameProductInfoSelectorResult and UseGameProductInfoSelectorResult.productId or nil
			local SellerId = UseGameProductInfoSelectorResult and UseGameProductInfoSelectorResult.sellerId or nil
			
			if not FFlagEnableUnifiedProductPurchaseFlow then
				UseDispatchResult(OpenCentralOverlayForPurchaseGameModule(UniverseId, Name, Price, ProductId, SellerId, { UseRouteNameResult }))
				
				return
			end
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
						experienceIconUrl = UseGameIconSelectorResult.url
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
					-- upvalues: UseDispatchResult (upval), OpenCentralOverlayForUnifiedPurchasePromptModule (upval), UniverseId1 (copy), Name (upval), UseGameIconSelectorResult (upval), onFlowComplete (copy), onPurchaseSuccess (copy), ProductPurchaseSurface (upval), OpenCentralOverlayForPurchaseGameModule (upval), Price (copy), ProductId (copy), SellerId (copy), UseRouteNameResult (upval)
					if Result then
						UseDispatchResult(OpenCentralOverlayForUnifiedPurchasePromptModule({
							productPayload = {
								kind = "Experience",
								universeId = UniverseId1,
								experienceName = Name,
								experienceIconUrl = UseGameIconSelectorResult.url
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
		elseif PlayButtonState == PlayButtonStatesModule.FiatPaidAccess then
			if RootPlaceId and UseGameProductInfoSelectorResult and UseGameProductInfoSelectorResult.fiatBasePriceId then
				UseDispatchResult(ApiPostPreparePurchaseModule.Fetch(UseRoactServiceResult3, RootPlaceId, UniverseId, UseGameProductInfoSelectorResult.fiatBasePriceId))
				UnlockPlayIntentFunction(UseRoactServiceResult2, {
					upsellName = "FiatPurchase",
					universeId = UniverseId,
					playabilityStatus = UseSelectorResult1 and UseSelectorResult1.playabilityStatus or nil,
					pageName = if FFlagLuaAppLogPageContextUnlockPlayIntent then UseRouteNameResult else nil
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
				UseDispatchResult(CreateExperienceInviteFunction(RootPlaceId, UseContextResult, if FFlagEnableSquadRegroupExperimentation then SquadExperienceInviteSource.Default else nil, if FFlagEnablePrivatePartyStartJoin and p5 and p5.isPrivateParty then SquadExperienceInviteType.PlayWithPartyInPrivatePartyServer else nil))
				
				return
			end
		elseif IncludeWaitingForPartyInCondition and PlayButtonState == PlayButtonStatesModule.WaitingForParty then
			InvalidPlayIntentFunction(Ctx, {
				universeId = UniverseId,
				playButtonState = PlayButtonState,
				playabilityStatus = UseSelectorResult1 and UseSelectorResult1.playabilityStatus or nil,
				pageName = if FFlagLuaAppPlayButtonLoadingDurationTelemetry then UseRouteNameResult else nil
			})
			
			return
		else
			if PlayButtonState == PlayButtonStatesModule.UnplayableOther then
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
	end, {
		UseRoactServiceResult, UseRoactServiceResult1,
		CanPerformBinaryUpdateEnabledEngineFeature, UniverseId,
		if GetFFlagLuaAppEnableVirtualEventPlaceIdFunction() then P6 else nil,
		RootPlaceId, Name, ReferralSource, Ctx,
		if FFlagLuaAppLaunchWhenLoadingForce or FFlagLuaAppLaunchWhenLoadingEdp then UseResult else nil,
		if FFlagLuaAppLaunchWhenLoadingForce or FFlagLuaAppLaunchWhenLoadingEdp then nil else UseAgeVerificationOverlayCallbackModuleResult,
		if FFlagLuaAppLaunchWhenLoadingForce or FFlagLuaAppLaunchWhenLoadingEdp then nil else UsePlayButtonLaunchAfterSeventeenPlusUpsellModuleResult,
		UseGameProductInfoSelectorResult, UseRouteNameResult,
		if GetFFlagIsSquadEnabledFunction() then UseContextResult else nil,
		UseSelectorResult1,
		if FFlagLuaAppLaunchWhenLoadingForce or FFlagLuaAppLaunchWhenLoadingEdp then FFlagLuaAppLaunchWhenLoadingForce1 else nil
	}))
end