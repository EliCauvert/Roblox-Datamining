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

return function(p1, p2, p3, _, p4, p5, p6, p7)
	-- upvalues: useRoactService (ref), roactAnalytics (ref), appUpdateService (ref), appEventIngestService (ref), useDispatch (ref), useSelector (ref), useGameInfosSelector (ref), useGameProductInfoSelector (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), fFlagMigrateGameIconsToStore (ref), gameHydrationReactModule (ref), useGameIconSelector (ref), useRouteName (ref), getFFlagIsSquadEnabled (ref), reactModule (ref), squadExternalContractContext (ref), getFFlagLuaAppEnableVirtualEventPlaceId (ref), usePlayButtonLaunchGameModule (ref), fFlagLuaAppPlayableUxTreatment (ref), usePlayButtonLaunchWithUxTreatmentModule (ref), usePlayButtonLaunchAfterSeventeenPlusUpsellModule (ref), useAgeVerificationOverlayCallbackModule (ref), roactNetworking (ref), fFlagLuaAppLaunchWhenLoadingForce (ref), fFlagLuaAppLaunchWhenLoadingEdp (ref), fFlagLuaAppDemoModePlayButton (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref), autoUpgradeEngineFeatureOnlyEngineFeature (ref), fFlagCheckForUpdatePromise (ref), handleUpdate (ref), canPerformBinaryUpdateEnabledEngineFeature (ref), checkForUpdate (ref), joinGamePlayButton (ref), playButtonReferralSourceModule (ref), gamePlayButtonShareLinkAnalyticsModule (ref), playButtonStatesModule (ref), closeCentralOverlay (ref), fetchGamePlayabilityAndProductInfo (ref), openCentralOverlayForPurchaseGameModule (ref), fFlagShipUnifiedPurchaseFlowToPaidAccess (ref), openCentralOverlayForUnifiedPurchasePromptModule (ref), productPurchaseSurface (ref), getIsUserEligibleForUnifiedPurchaseFlow (ref), apiPostPreparePurchaseModule (ref), unlockPlayIntent (ref), invalidPlayIntent (ref), fFlagLuaAppPlayButtonLoadingDurationTelemetry (ref), createExperienceInvite (ref), fFlagEnableSquadRegroupExperimentation (ref), squadExperienceInviteSource (ref), fFlagEnablePrivatePartyStartJoin (ref), squadExperienceInviteType (ref), includeWaitingForPartyInCondition (ref)
	local var1 = useRoactService(roactAnalytics)
	local var2 = useRoactService(appUpdateService)
	local var3 = useRoactService(appEventIngestService)
	local var4 = useDispatch()
	local var5 = useSelector(function(p8)
		-- upvalues: p1 (ref)
		return p8.GameDetails[p1]
	end)
	local var6 = useGameInfosSelector(p1)
	local var7 = useGameProductInfoSelector(p1)
	local var8 = useSelector(function(p8)
		-- upvalues: p1 (ref)
		return p8.PlayabilityStatus[p1]
	end)
	local var9 = nil
	local var10 = nil
	
	if fFlagEnableUnifiedProductPurchaseFlow then
		if fFlagMigrateGameIconsToStore then
			var10 = gameHydrationReactModule.useGameIcon(p1)
		else
			var9 = useGameIconSelector(p1)
		end
	end
	local var11 = useRouteName()
	local var12 = if getFFlagIsSquadEnabled() then reactModule.useContext(squadExternalContractContext) else nil
	local var13 = if var5 then var5.rootPlaceId elseif var6 then var6.placeId else nil
	p6 = if getFFlagLuaAppEnableVirtualEventPlaceId() and p6 ~= "0" then p6 or var13 else var13
	local var14 = if var5 then var5.name elseif var6 then var6.name else nil
	local var15 = usePlayButtonLaunchGameModule(p1, p6, var13, p2, p3, p4, p5)
	local var16 = usePlayButtonLaunchAfterSeventeenPlusUpsellModule(var8, p1, if fFlagLuaAppPlayableUxTreatment then if fFlagLuaAppPlayableUxTreatment then usePlayButtonLaunchWithUxTreatmentModule(var8, p1, var15, var11) else nil else var15, var11)
	local var17 = useAgeVerificationOverlayCallbackModule(p1, var15, var16)
	local var18 = useRoactService(roactNetworking)
	local fFlagLuaAppLaunchWhenLoadingForce_1 = fFlagLuaAppLaunchWhenLoadingForce or fFlagLuaAppLaunchWhenLoadingEdp and p7 == true
	local var19 = if fFlagLuaAppLaunchWhenLoadingForce or fFlagLuaAppLaunchWhenLoadingEdp or fFlagLuaAppDemoModePlayButton then reactModule.useCallback(function(p8, p9)
		-- upvalues: var17 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy), var16 (ref), autoUpgradeEngineFeatureOnlyEngineFeature (copy), fFlagCheckForUpdatePromise (copy), handleUpdate (copy), var4 (ref), var2 (ref), canPerformBinaryUpdateEnabledEngineFeature (copy), var1 (ref), p3 (ref), checkForUpdate (copy)
		local _ = nil
		local var20 = if game:GetEngineFeature("VoiceChatSupported") then function()
			-- upvalues: var17 (copy), p8 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy), p9 (ref)
			var17(p8, if fFlagLuaAppDemoModePlayButtonTelemetry then p9 else nil)
		end else function()
			-- upvalues: var16 (copy), p8 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy), p9 (ref)
			var16(p8, if fFlagLuaAppDemoModePlayButtonTelemetry then p9 else nil)
		end
		
		if not autoUpgradeEngineFeatureOnlyEngineFeature then
			var20()
			
			return
		elseif fFlagCheckForUpdatePromise then
			handleUpdate(var4, var2, canPerformBinaryUpdateEnabledEngineFeature, var1, p3, var20)
			
			return
		end
		var4(checkForUpdate(var2, canPerformBinaryUpdateEnabledEngineFeature, var1, var20, { ctx = p3 }))
	end, {
		var1, var2, canPerformBinaryUpdateEnabledEngineFeature, p3, var17, var16,
		var4
	}) else nil
	
	return reactModule.useCallback(function(p8, p9, p10)
		-- upvalues: joinGamePlayButton (copy), var1 (ref), p2 (ref), var13 (ref), p3 (ref), playButtonReferralSourceModule (copy), gamePlayButtonShareLinkAnalyticsModule (copy), getFFlagLuaAppEnableVirtualEventPlaceId (copy), p6 (write), p1 (ref), playButtonStatesModule (copy), fFlagLuaAppLaunchWhenLoadingForce (copy), fFlagLuaAppLaunchWhenLoadingEdp (copy), fFlagLuaAppDemoModePlayButton (copy), var19 (ref), var17 (ref), var16 (ref), autoUpgradeEngineFeatureOnlyEngineFeature (copy), fFlagCheckForUpdatePromise (copy), handleUpdate (copy), var4 (ref), var2 (ref), canPerformBinaryUpdateEnabledEngineFeature (copy), checkForUpdate (copy), var7 (ref), fFlagEnableUnifiedProductPurchaseFlow (copy), closeCentralOverlay (copy), fetchGamePlayabilityAndProductInfo (copy), var18 (ref), openCentralOverlayForPurchaseGameModule (copy), var14 (ref), var11 (ref), fFlagShipUnifiedPurchaseFlowToPaidAccess (copy), openCentralOverlayForUnifiedPurchasePromptModule (copy), fFlagMigrateGameIconsToStore (copy), var10 (write), var9 (write), productPurchaseSurface (copy), getIsUserEligibleForUnifiedPurchaseFlow (copy), fFlagLuaAppDemoModePlayButtonTelemetry (copy), apiPostPreparePurchaseModule (copy), unlockPlayIntent (copy), var3 (ref), var8 (ref), invalidPlayIntent (copy), fFlagLuaAppPlayButtonLoadingDurationTelemetry (copy), fFlagLuaAppLaunchWhenLoadingForce_1 (ref), getFFlagIsSquadEnabled (copy), createExperienceInvite (copy), var12 (ref), fFlagEnableSquadRegroupExperimentation (copy), squadExperienceInviteSource (copy), fFlagEnablePrivatePartyStartJoin (copy), squadExperienceInviteType (copy), includeWaitingForPartyInCondition (copy)
		joinGamePlayButton(var1.InfluxDb, "playButtonClicked", {
			isUniversalApp = true,
			referralSource = p2,
			placeId = var13,
			buttonState = p8 or "Invalid",
			ctx = p3
		})
		
		if p2 == playButtonReferralSourceModule.ExperienceDetailsLink then
			gamePlayButtonShareLinkAnalyticsModule(var1, {
				placeId = if getFFlagLuaAppEnableVirtualEventPlaceId() then p6 else var13,
				playButtonState = p8,
				universeId = p1
			})
		end
		if p8 == playButtonStatesModule.Playable or p8 == playButtonStatesModule.ActionNeeded then
			if fFlagLuaAppLaunchWhenLoadingForce or fFlagLuaAppLaunchWhenLoadingEdp or fFlagLuaAppDemoModePlayButton then
				var19(p9)
				
				return
			end
			local _ = nil
			local var20 = if game:GetEngineFeature("VoiceChatSupported") then function()
				-- upvalues: var17 (copy), p9 (ref)
				var17(p9)
			end else function()
				-- upvalues: var16 (copy), p9 (ref)
				var16(p9)
			end
			
			if autoUpgradeEngineFeatureOnlyEngineFeature then
				if fFlagCheckForUpdatePromise then
					handleUpdate(var4, var2, canPerformBinaryUpdateEnabledEngineFeature, var1, p3, var20)
					
					return
				end
				var4(checkForUpdate(var2, canPerformBinaryUpdateEnabledEngineFeature, var1, var20, { ctx = p3 }))
				
				return
			else
				var20()
				
				return
			end
		elseif p8 == playButtonStatesModule.PaidAccess then
			local var21 = if var7 then var7.price else nil
			local var22 = if var7 then var7.productId else nil
			local var23 = if var7 then var7.sellerId else nil
			
			if fFlagEnableUnifiedProductPurchaseFlow then
				local var24 = if var7 then var7.universeId else nil
				
				local function onFlowComplete()
					-- upvalues: var4 (copy), closeCentralOverlay (copy)
					var4(closeCentralOverlay())
				end
				
				local function onPurchaseSuccess()
					-- upvalues: var4 (copy), fetchGamePlayabilityAndProductInfo (copy), var18 (copy), var24 (ref)
					var4(fetchGamePlayabilityAndProductInfo.Fetch(var18, var24))
				end
				
				local function _()
					-- upvalues: var4 (copy), openCentralOverlayForPurchaseGameModule (copy), var24 (ref), var14 (copy), var21 (ref), var22 (ref), var23 (ref), var11 (copy)
					var4(openCentralOverlayForPurchaseGameModule(var24, var14, var21, var22, var23, { var11 }))
				end
				
				if fFlagShipUnifiedPurchaseFlowToPaidAccess then
					var4(openCentralOverlayForUnifiedPurchasePromptModule({
						productPayload = {
							kind = "Experience",
							universeId = var24,
							experienceName = var14,
							experienceIconUrl = if fFlagMigrateGameIconsToStore then var10 elseif var9 then var9.url else nil
						},
						purchaseCallbacks = {
							onFlowComplete = onFlowComplete,
							onPurchaseSuccess = onPurchaseSuccess
						},
						purchaseAnalyticsMetadata = { surface = productPurchaseSurface.PaidAccess }
					}))
					
					return
				end
				getIsUserEligibleForUnifiedPurchaseFlow(var18):andThen(function(p11)
					-- upvalues: var4 (copy), openCentralOverlayForUnifiedPurchasePromptModule (copy), var24 (ref), var14 (copy), fFlagMigrateGameIconsToStore (copy), var10 (copy), var9 (copy), onFlowComplete (ref), onPurchaseSuccess (ref), productPurchaseSurface (copy), openCentralOverlayForPurchaseGameModule (copy), var21 (ref), var22 (ref), var23 (ref), var11 (copy)
					if p11 then
						var4(openCentralOverlayForUnifiedPurchasePromptModule({
							productPayload = {
								kind = "Experience",
								universeId = var24,
								experienceName = var14,
								experienceIconUrl = if fFlagMigrateGameIconsToStore then var10 elseif var9 then var9.url else nil
							},
							purchaseCallbacks = {
								onFlowComplete = onFlowComplete,
								onPurchaseSuccess = onPurchaseSuccess
							},
							purchaseAnalyticsMetadata = { surface = productPurchaseSurface.PaidAccess }
						}))
						
						return
					end
					var4(openCentralOverlayForPurchaseGameModule(var24, var14, var21, var22, var23, { var11 }))
				end):catch(function(_)
					-- upvalues: var4 (copy), openCentralOverlayForPurchaseGameModule (copy), var24 (ref), var14 (copy), var21 (ref), var22 (ref), var23 (ref), var11 (copy)
					var4(openCentralOverlayForPurchaseGameModule(var24, var14, var21, var22, var23, { var11 }))
				end)
				
				return
			else
				var4(openCentralOverlayForPurchaseGameModule(p1, var14, var21, var22, var23, { var11 }))
				
				return
			end
		elseif fFlagLuaAppDemoModePlayButton and p8 == playButtonStatesModule.DemoMode then
			if fFlagLuaAppDemoModePlayButtonTelemetry then
				var19(p9, "DemoPlayButtonClick")
				
				return
			end
			var19(p9)
			
			return
		elseif p8 == playButtonStatesModule.FiatPaidAccess then
			if var13 and var7 and var7.fiatBasePriceId then
				var4(apiPostPreparePurchaseModule.Fetch(var18, var13, p1, var7.fiatBasePriceId))
				unlockPlayIntent(var3, {
					upsellName = "FiatPurchase",
					universeId = p1,
					playabilityStatus = if var8 then var8.playabilityStatus else nil,
					pageName = var11
				})
				
				return
			end
		elseif p8 == playButtonStatesModule.Loading then
			invalidPlayIntent(p3, {
				universeId = p1,
				playButtonState = p8,
				playabilityStatus = if var8 then var8.playabilityStatus else nil,
				pageName = if fFlagLuaAppPlayButtonLoadingDurationTelemetry then var11 else nil
			})
			
			if fFlagLuaAppLaunchWhenLoadingForce_1 then
				var19(p9)
			end
			return
		elseif getFFlagIsSquadEnabled() and p8 == playButtonStatesModule.PlayableWithParty then
			if not var13 then return end
			var4(createExperienceInvite(var13, var12, if fFlagEnableSquadRegroupExperimentation then squadExperienceInviteSource.Default else nil, if fFlagEnablePrivatePartyStartJoin and p10 and p10.isPrivateParty then squadExperienceInviteType.PlayWithPartyInPrivatePartyServer else nil))
			
			return
		elseif includeWaitingForPartyInCondition and p8 == playButtonStatesModule.WaitingForParty then
			invalidPlayIntent(p3, {
				universeId = p1,
				playButtonState = p8,
				playabilityStatus = if var8 then var8.playabilityStatus else nil,
				pageName = if fFlagLuaAppPlayButtonLoadingDurationTelemetry then var11 else nil
			})
			
			return
		elseif p8 == playButtonStatesModule.UnplayableOther then
			invalidPlayIntent(p3, {
				universeId = p1,
				playButtonState = p8,
				playabilityStatus = if var8 then var8.playabilityStatus else nil,
				pageName = if fFlagLuaAppPlayButtonLoadingDurationTelemetry then var11 else nil
			})
			
			return
		end
		error(`invalid play button state {p8}!`)
	end, {
		var1, var2, canPerformBinaryUpdateEnabledEngineFeature, p1,
		if getFFlagLuaAppEnableVirtualEventPlaceId() then p6 else nil, var13, var14,
		p2, p3,
		if fFlagLuaAppLaunchWhenLoadingForce or fFlagLuaAppLaunchWhenLoadingEdp or fFlagLuaAppDemoModePlayButton then var19 else nil,
		if fFlagLuaAppLaunchWhenLoadingForce or fFlagLuaAppLaunchWhenLoadingEdp or fFlagLuaAppDemoModePlayButton then nil else var17,
		if fFlagLuaAppLaunchWhenLoadingForce or fFlagLuaAppLaunchWhenLoadingEdp or fFlagLuaAppDemoModePlayButton then nil else var16,
		var7, var11, if getFFlagIsSquadEnabled() then var12 else nil, var8,
		if fFlagLuaAppDemoModePlayButton then var4 else nil,
		if fFlagLuaAppDemoModePlayButton then var3 else nil,
		if fFlagLuaAppDemoModePlayButton then if fFlagMigrateGameIconsToStore then var10 else var9 else nil,
		if fFlagLuaAppDemoModePlayButton then var18 else nil,
		if fFlagLuaAppLaunchWhenLoadingForce or fFlagLuaAppLaunchWhenLoadingEdp then fFlagLuaAppLaunchWhenLoadingForce_1 else nil
	})
end