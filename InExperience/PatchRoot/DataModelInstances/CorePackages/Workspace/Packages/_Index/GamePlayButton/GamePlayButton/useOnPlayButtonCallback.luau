local gamePlayButton = script:FindFirstAncestor("GamePlayButton")
local apiPostPreparePurchaseModule = require(gamePlayButton.ApiPostPreparePurchase)
local gamePlayButtonShareLinkAnalyticsModule = require(gamePlayButton.GamePlayButtonShareLinkAnalytics)
local openCentralOverlayForPurchaseGameModule = require(gamePlayButton.OpenCentralOverlayForPurchaseGame)
local openCentralOverlayForUnifiedPurchasePromptModule = require(gamePlayButton.OpenCentralOverlayForUnifiedPurchasePrompt)
local playButtonReferralSourceModule = require(gamePlayButton.PlayButtonReferralSource)
local playButtonStatesModule = require(gamePlayButton.PlayButtonStates)
local _ = require(gamePlayButton.PlayButtonTypes)
local usePlayButtonLaunchAfterSeventeenPlusUpsellModule = require(gamePlayButton.PlayButtonLaunchChecks.usePlayButtonLaunchAfterSeventeenPlusUpsell)
local usePlayButtonLaunchGameModule = require(gamePlayButton.PlayButtonLaunchChecks.usePlayButtonLaunchGame)
local usePlayButtonLaunchWithUxTreatmentModule = require(gamePlayButton.PlayButtonLaunchChecks.usePlayButtonLaunchWithUxTreatment)
local useAgeVerificationOverlayCallbackModule = require(gamePlayButton.PlayButtonLaunchChecks.useAgeVerificationOverlayCallback)
local parent = gamePlayButton.Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useRouteName = require(parent.Navigation).useRouteName
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local roactServiceTagsModule = require(parent.RoactServiceTags)
local roactAnalytics = roactServiceTagsModule.RoactAnalytics
local roactNetworking = roactServiceTagsModule.RoactNetworking
local appUpdateService = roactServiceTagsModule.AppUpdateService
local joinGamePlayButton = require(parent.DiscoveryAnalytics).Points.joinGamePlayButton
local unlockPlayIntent = require(parent.DiscoveryAnalytics).Events.unlockPlayIntent
local invalidPlayIntent = require(parent.DiscoveryAnalytics).Events.invalidPlayIntent
local appEventIngestService = require(parent.RoactServiceTags).AppEventIngestService
local robloxAppUpdateModule = require(parent.RobloxAppUpdate)
local checkForUpdate = robloxAppUpdateModule.Thunks.CheckForUpdate
local handleUpdate = robloxAppUpdateModule.HandleUpdate
local useGameProductInfoSelector = require(parent.GameProductInfoRodux).useGameProductInfoSelector
local useGameInfosSelector = require(parent.GameInfosRodux).useGameInfosSelector
local useGameIconSelector = require(parent.GameIconRodux).GameIcons.useGameIconSelector
local gameHydrationReactModule = require(parent.GameHydrationReact)
local closeCentralOverlay = require(parent.CentralOverlay).Thunks.CloseCentralOverlay
local fetchGamePlayabilityAndProductInfo = require(parent.GameDetailRodux).FetchGamePlayabilityAndProductInfo
local purchasePromptLiteModule = require(parent.PurchasePromptLite)
local productPurchaseSurface = purchasePromptLiteModule.Enums.ProductPurchaseSurface
local getIsUserEligibleForUnifiedPurchaseFlow = purchasePromptLiteModule.getIsUserEligibleForUnifiedPurchaseFlow
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local getFFlagLuaAppEnableVirtualEventPlaceId = require(parent.SharedFlags).GetFFlagLuaAppEnableVirtualEventPlaceId
local fFlagShipUnifiedPurchaseFlowToPaidAccess = require(parent.SharedFlags).FFlagShipUnifiedPurchaseFlowToPaidAccess
local fFlagCheckForUpdatePromise = require(parent.SharedFlags).FFlagCheckForUpdatePromise
local createExperienceInvite = require(parent.Squads.Thunks).CreateExperienceInvite
local squadExternalContractContext = require(parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local squadExperienceInviteType = require(parent.SquadsCore.Enums).SquadExperienceInviteType
local squadExperienceInviteSource = require(parent.SquadsCore.Enums).SquadExperienceInviteSource
local _ = require(parent.PlayabilityRodux)
local autoUpgradeEngineFeatureOnlyEngineFeature = game:GetEngineFeature("AutoUpgradeEngineFeatureOnly")
local canPerformBinaryUpdateEnabledEngineFeature = game:GetEngineFeature("CanPerformBinaryUpdateEnabled")
local includeWaitingForPartyInCondition = game:DefineFastFlag("IncludeWaitingForPartyInCondition", false)
local fFlagEnableUnifiedProductPurchaseFlow = require(parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local fFlagEnableSquadRegroupExperimentation = require(parent.SharedFlags).FFlagEnableSquadRegroupExperimentation
local fFlagLuaAppPlayableUxTreatment = require(parent.SharedFlags).FFlagLuaAppPlayableUxTreatment
local fFlagEnablePrivatePartyStartJoin = require(parent.SharedFlags).FFlagEnablePrivatePartyStartJoin
local fFlagLuaAppPlayButtonLoadingDurationTelemetry = require(parent.SharedFlags).FFlagLuaAppPlayButtonLoadingDurationTelemetry
local fFlagLuaAppLaunchWhenLoadingEdp = require(parent.SharedFlags).FFlagLuaAppLaunchWhenLoadingEdp
local fFlagLuaAppLaunchWhenLoadingForce = require(parent.SharedFlags).FFlagLuaAppLaunchWhenLoadingForce
local fFlagLuaAppDemoModePlayButton = require(parent.SharedFlags).FFlagLuaAppDemoModePlayButton
local fFlagLuaAppDemoModePlayButtonTelemetry = require(parent.SharedFlags).FFlagLuaAppDemoModePlayButtonTelemetry
local fFlagMigrateGameIconsToStore = require(parent.SharedFlags).FFlagMigrateGameIconsToStore

return function(p0, p1, p2, _, p3, p4, p5, p6)
	-- upvalues: useRoactService (ref), roactAnalytics (ref), appUpdateService (ref), appEventIngestService (ref), useDispatch (ref), useSelector (ref), useGameInfosSelector (ref), useGameProductInfoSelector (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), fFlagMigrateGameIconsToStore (ref), gameHydrationReactModule (ref), useGameIconSelector (ref), useRouteName (ref), getFFlagIsSquadEnabled (ref), reactModule (ref), squadExternalContractContext (ref), getFFlagLuaAppEnableVirtualEventPlaceId (ref), usePlayButtonLaunchGameModule (ref), fFlagLuaAppPlayableUxTreatment (ref), usePlayButtonLaunchWithUxTreatmentModule (ref), usePlayButtonLaunchAfterSeventeenPlusUpsellModule (ref), useAgeVerificationOverlayCallbackModule (ref), roactNetworking (ref), fFlagLuaAppLaunchWhenLoadingForce (ref), fFlagLuaAppLaunchWhenLoadingEdp (ref), fFlagLuaAppDemoModePlayButton (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref), autoUpgradeEngineFeatureOnlyEngineFeature (ref), fFlagCheckForUpdatePromise (ref), handleUpdate (ref), canPerformBinaryUpdateEnabledEngineFeature (ref), checkForUpdate (ref), joinGamePlayButton (ref), playButtonReferralSourceModule (ref), gamePlayButtonShareLinkAnalyticsModule (ref), playButtonStatesModule (ref), closeCentralOverlay (ref), fetchGamePlayabilityAndProductInfo (ref), openCentralOverlayForPurchaseGameModule (ref), fFlagShipUnifiedPurchaseFlowToPaidAccess (ref), openCentralOverlayForUnifiedPurchasePromptModule (ref), productPurchaseSurface (ref), getIsUserEligibleForUnifiedPurchaseFlow (ref), apiPostPreparePurchaseModule (ref), unlockPlayIntent (ref), invalidPlayIntent (ref), fFlagLuaAppPlayButtonLoadingDurationTelemetry (ref), createExperienceInvite (ref), fFlagEnableSquadRegroupExperimentation (ref), squadExperienceInviteSource (ref), fFlagEnablePrivatePartyStartJoin (ref), squadExperienceInviteType (ref), includeWaitingForPartyInCondition (ref)
	local var20 = useRoactService(roactAnalytics)
	local var21 = useRoactService(appUpdateService)
	local var22 = useRoactService(appEventIngestService)
	local var23 = useDispatch()
	local var24 = useSelector(function(p7)
		-- upvalues: p0 (ref)
		return p7.GameDetails[p0]
	end)
	local var25 = useGameInfosSelector(p0)
	local var26 = useGameProductInfoSelector(p0)
	local var27 = useSelector(function(p8)
		-- upvalues: p0 (ref)
		return p8.PlayabilityStatus[p0]
	end)
	local var28 = nil
	local var29 = nil
	
	if fFlagEnableUnifiedProductPurchaseFlow then
		if fFlagMigrateGameIconsToStore then
			var29 = gameHydrationReactModule.useGameIcon(p0)
		else
			var28 = useGameIconSelector(p0)
		end
	end
	local var30 = useRouteName()
	local var31 = if getFFlagIsSquadEnabled() then reactModule.useContext(squadExternalContractContext) else nil
	local var32 = if var24 then var24.rootPlaceId elseif var25 then var25.placeId else nil
	p5 = if getFFlagLuaAppEnableVirtualEventPlaceId() and p5 ~= "0" then p5 or var32 else var32
	local var33 = if var24 then var24.name elseif var25 then var25.name else nil
	local var34 = usePlayButtonLaunchGameModule(p0, p5, var32, p1, p2, p3, p4)
	local var35 = usePlayButtonLaunchAfterSeventeenPlusUpsellModule(var27, p0, if fFlagLuaAppPlayableUxTreatment then if fFlagLuaAppPlayableUxTreatment then usePlayButtonLaunchWithUxTreatmentModule(var27, p0, var34, var30) else nil else var34, var30)
	local var36 = useAgeVerificationOverlayCallbackModule(p0, var34, var35)
	local var37 = useRoactService(roactNetworking)
	local fFlagLuaAppLaunchWhenLoadingForce_1 = fFlagLuaAppLaunchWhenLoadingForce or fFlagLuaAppLaunchWhenLoadingEdp and p6 == true
	local var39 = if fFlagLuaAppLaunchWhenLoadingForce or fFlagLuaAppLaunchWhenLoadingEdp or fFlagLuaAppDemoModePlayButton then reactModule.useCallback(function(p9, p10)
		-- upvalues: var36 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy), var35 (ref), autoUpgradeEngineFeatureOnlyEngineFeature (copy), fFlagCheckForUpdatePromise (copy), handleUpdate (copy), var23 (ref), var21 (ref), canPerformBinaryUpdateEnabledEngineFeature (copy), var20 (ref), p2 (ref), checkForUpdate (copy)
		local _ = nil
		local var40 = if game:GetEngineFeature("VoiceChatSupported") then function()
			-- upvalues: var36 (copy), p9 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy), p10 (ref)
			var36(p9, if fFlagLuaAppDemoModePlayButtonTelemetry then p10 else nil)
		end else function()
			-- upvalues: var35 (copy), p9 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy), p10 (ref)
			var35(p9, if fFlagLuaAppDemoModePlayButtonTelemetry then p10 else nil)
		end
		
		if not autoUpgradeEngineFeatureOnlyEngineFeature then
			var40()
			
			return
		elseif fFlagCheckForUpdatePromise then
			handleUpdate(var23, var21, canPerformBinaryUpdateEnabledEngineFeature, var20, p2, var40)
			
			return
		end
		var23(checkForUpdate(var21, canPerformBinaryUpdateEnabledEngineFeature, var20, var40, { ctx = p2 }))
	end, {
		var20, var21, canPerformBinaryUpdateEnabledEngineFeature, p2, var36, var35,
		var23
	}) else nil
	
	return reactModule.useCallback(function(p11, p12, p13)
		-- upvalues: joinGamePlayButton (copy), var20 (ref), p1 (ref), var32 (ref), p2 (ref), playButtonReferralSourceModule (copy), gamePlayButtonShareLinkAnalyticsModule (copy), getFFlagLuaAppEnableVirtualEventPlaceId (copy), p5 (write), p0 (ref), playButtonStatesModule (copy), fFlagLuaAppLaunchWhenLoadingForce (copy), fFlagLuaAppLaunchWhenLoadingEdp (copy), fFlagLuaAppDemoModePlayButton (copy), var39 (ref), var36 (ref), var35 (ref), autoUpgradeEngineFeatureOnlyEngineFeature (copy), fFlagCheckForUpdatePromise (copy), handleUpdate (copy), var23 (ref), var21 (ref), canPerformBinaryUpdateEnabledEngineFeature (copy), checkForUpdate (copy), var26 (ref), fFlagEnableUnifiedProductPurchaseFlow (copy), closeCentralOverlay (copy), fetchGamePlayabilityAndProductInfo (copy), var37 (ref), openCentralOverlayForPurchaseGameModule (copy), var33 (ref), var30 (ref), fFlagShipUnifiedPurchaseFlowToPaidAccess (copy), openCentralOverlayForUnifiedPurchasePromptModule (copy), fFlagMigrateGameIconsToStore (copy), var29 (write), var28 (write), productPurchaseSurface (copy), getIsUserEligibleForUnifiedPurchaseFlow (copy), fFlagLuaAppDemoModePlayButtonTelemetry (copy), apiPostPreparePurchaseModule (copy), unlockPlayIntent (copy), var22 (ref), var27 (ref), invalidPlayIntent (copy), fFlagLuaAppPlayButtonLoadingDurationTelemetry (copy), fFlagLuaAppLaunchWhenLoadingForce_1 (ref), getFFlagIsSquadEnabled (copy), createExperienceInvite (copy), var31 (ref), fFlagEnableSquadRegroupExperimentation (copy), squadExperienceInviteSource (copy), fFlagEnablePrivatePartyStartJoin (copy), squadExperienceInviteType (copy), includeWaitingForPartyInCondition (copy)
		joinGamePlayButton(var20.InfluxDb, "playButtonClicked", {
			isUniversalApp = true,
			referralSource = p1,
			placeId = var32,
			buttonState = p11 or "Invalid",
			ctx = p2
		})
		
		if p1 == playButtonReferralSourceModule.ExperienceDetailsLink then
			gamePlayButtonShareLinkAnalyticsModule(var20, {
				placeId = if getFFlagLuaAppEnableVirtualEventPlaceId() then p5 else var32,
				playButtonState = p11,
				universeId = p0
			})
		end
		if p11 == playButtonStatesModule.Playable or p11 == playButtonStatesModule.ActionNeeded then
			if fFlagLuaAppLaunchWhenLoadingForce or fFlagLuaAppLaunchWhenLoadingEdp or fFlagLuaAppDemoModePlayButton then
				var39(p12)
				
				return
			end
			local _ = nil
			local var41 = if game:GetEngineFeature("VoiceChatSupported") then function()
				-- upvalues: var36 (copy), p12 (ref)
				var36(p12)
			end else function()
				-- upvalues: var35 (copy), p12 (ref)
				var35(p12)
			end
			
			if autoUpgradeEngineFeatureOnlyEngineFeature then
				if fFlagCheckForUpdatePromise then
					handleUpdate(var23, var21, canPerformBinaryUpdateEnabledEngineFeature, var20, p2, var41)
					
					return
				end
				var23(checkForUpdate(var21, canPerformBinaryUpdateEnabledEngineFeature, var20, var41, { ctx = p2 }))
				
				return
			else
				var41()
				
				return
			end
		elseif p11 == playButtonStatesModule.PaidAccess then
			local var42 = if var26 then var26.price else nil
			local var43 = if var26 then var26.productId else nil
			local var44 = if var26 then var26.sellerId else nil
			
			if fFlagEnableUnifiedProductPurchaseFlow then
				local var45 = if var26 then var26.universeId else nil
				
				local function onFlowComplete()
					-- upvalues: var23 (copy), closeCentralOverlay (copy)
					var23(closeCentralOverlay())
				end
				
				local function onPurchaseSuccess()
					-- upvalues: var23 (copy), fetchGamePlayabilityAndProductInfo (copy), var37 (copy), var45 (ref)
					var23(fetchGamePlayabilityAndProductInfo.Fetch(var37, var45))
				end
				
				local function _()
					-- upvalues: var23 (copy), openCentralOverlayForPurchaseGameModule (copy), var45 (ref), var33 (copy), var42 (ref), var43 (ref), var44 (ref), var30 (copy)
					var23(openCentralOverlayForPurchaseGameModule(var45, var33, var42, var43, var44, { var30 }))
				end
				
				if fFlagShipUnifiedPurchaseFlowToPaidAccess then
					var23(openCentralOverlayForUnifiedPurchasePromptModule({
						productPayload = {
							kind = "Experience",
							universeId = var45,
							experienceName = var33,
							experienceIconUrl = if fFlagMigrateGameIconsToStore then var29 elseif var28 then var28.url else nil
						},
						purchaseCallbacks = {
							onFlowComplete = onFlowComplete,
							onPurchaseSuccess = onPurchaseSuccess
						},
						purchaseAnalyticsMetadata = { surface = productPurchaseSurface.PaidAccess }
					}))
					
					return
				end
				getIsUserEligibleForUnifiedPurchaseFlow(var37):andThen(function(p14)
					-- upvalues: var23 (copy), openCentralOverlayForUnifiedPurchasePromptModule (copy), var45 (ref), var33 (copy), fFlagMigrateGameIconsToStore (copy), var29 (copy), var28 (copy), onFlowComplete (ref), onPurchaseSuccess (ref), productPurchaseSurface (copy), openCentralOverlayForPurchaseGameModule (copy), var42 (ref), var43 (ref), var44 (ref), var30 (copy)
					if p14 then
						var23(openCentralOverlayForUnifiedPurchasePromptModule({
							productPayload = {
								kind = "Experience",
								universeId = var45,
								experienceName = var33,
								experienceIconUrl = if fFlagMigrateGameIconsToStore then var29 elseif var28 then var28.url else nil
							},
							purchaseCallbacks = {
								onFlowComplete = onFlowComplete,
								onPurchaseSuccess = onPurchaseSuccess
							},
							purchaseAnalyticsMetadata = { surface = productPurchaseSurface.PaidAccess }
						}))
						
						return
					end
					var23(openCentralOverlayForPurchaseGameModule(var45, var33, var42, var43, var44, { var30 }))
				end):catch(function(_)
					-- upvalues: var23 (copy), openCentralOverlayForPurchaseGameModule (copy), var45 (ref), var33 (copy), var42 (ref), var43 (ref), var44 (ref), var30 (copy)
					var23(openCentralOverlayForPurchaseGameModule(var45, var33, var42, var43, var44, { var30 }))
				end)
				
				return
			else
				var23(openCentralOverlayForPurchaseGameModule(p0, var33, var42, var43, var44, { var30 }))
				
				return
			end
		elseif fFlagLuaAppDemoModePlayButton and p11 == playButtonStatesModule.DemoMode then
			if fFlagLuaAppDemoModePlayButtonTelemetry then
				var39(p12, "DemoPlayButtonClick")
				
				return
			end
			var39(p12)
			
			return
		elseif p11 == playButtonStatesModule.FiatPaidAccess then
			if var32 and var26 and var26.fiatBasePriceId then
				var23(apiPostPreparePurchaseModule.Fetch(var37, var32, p0, var26.fiatBasePriceId))
				unlockPlayIntent(var22, {
					upsellName = "FiatPurchase",
					universeId = p0,
					playabilityStatus = if var27 then var27.playabilityStatus else nil,
					pageName = var30
				})
				
				return
			end
		elseif p11 == playButtonStatesModule.Loading then
			invalidPlayIntent(p2, {
				universeId = p0,
				playButtonState = p11,
				playabilityStatus = if var27 then var27.playabilityStatus else nil,
				pageName = if fFlagLuaAppPlayButtonLoadingDurationTelemetry then var30 else nil
			})
			
			if fFlagLuaAppLaunchWhenLoadingForce_1 then
				var39(p12)
			end
			return
		elseif getFFlagIsSquadEnabled() and p11 == playButtonStatesModule.PlayableWithParty then
			if not var32 then return end
			var23(createExperienceInvite(var32, var31, if fFlagEnableSquadRegroupExperimentation then squadExperienceInviteSource.Default else nil, if fFlagEnablePrivatePartyStartJoin and p13 and p13.isPrivateParty then squadExperienceInviteType.PlayWithPartyInPrivatePartyServer else nil))
			
			return
		elseif includeWaitingForPartyInCondition and p11 == playButtonStatesModule.WaitingForParty then
			invalidPlayIntent(p2, {
				universeId = p0,
				playButtonState = p11,
				playabilityStatus = if var27 then var27.playabilityStatus else nil,
				pageName = if fFlagLuaAppPlayButtonLoadingDurationTelemetry then var30 else nil
			})
			
			return
		elseif p11 == playButtonStatesModule.UnplayableOther then
			invalidPlayIntent(p2, {
				universeId = p0,
				playButtonState = p11,
				playabilityStatus = if var27 then var27.playabilityStatus else nil,
				pageName = if fFlagLuaAppPlayButtonLoadingDurationTelemetry then var30 else nil
			})
			
			return
		end
		error(`invalid play button state {p11}!`)
	end, {
		var20, var21, canPerformBinaryUpdateEnabledEngineFeature, p0,
		if getFFlagLuaAppEnableVirtualEventPlaceId() then p5 else nil, var32, var33,
		p1, p2,
		if fFlagLuaAppLaunchWhenLoadingForce or fFlagLuaAppLaunchWhenLoadingEdp or fFlagLuaAppDemoModePlayButton then var39 else nil,
		if fFlagLuaAppLaunchWhenLoadingForce or fFlagLuaAppLaunchWhenLoadingEdp or fFlagLuaAppDemoModePlayButton then nil else var36,
		if fFlagLuaAppLaunchWhenLoadingForce or fFlagLuaAppLaunchWhenLoadingEdp or fFlagLuaAppDemoModePlayButton then nil else var35,
		var26, var30, if getFFlagIsSquadEnabled() then var31 else nil, var27,
		if fFlagLuaAppDemoModePlayButton then var23 else nil,
		if fFlagLuaAppDemoModePlayButton then var22 else nil,
		if fFlagLuaAppDemoModePlayButton then if fFlagMigrateGameIconsToStore then var29 else var28 else nil,
		if fFlagLuaAppDemoModePlayButton then var37 else nil,
		if fFlagLuaAppLaunchWhenLoadingForce or fFlagLuaAppLaunchWhenLoadingEdp then fFlagLuaAppLaunchWhenLoadingForce_1 else nil
	})
end