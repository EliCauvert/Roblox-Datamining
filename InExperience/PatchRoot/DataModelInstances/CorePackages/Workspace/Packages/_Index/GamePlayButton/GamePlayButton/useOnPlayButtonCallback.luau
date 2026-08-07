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
local fFlagLuaAppLogPageContextUnlockPlayIntent = require(parent.SharedFlags).FFlagLuaAppLogPageContextUnlockPlayIntent
local fFlagLuaAppPlayButtonLoadingDurationTelemetry = require(parent.SharedFlags).FFlagLuaAppPlayButtonLoadingDurationTelemetry
local fFlagLuaAppLaunchWhenLoadingEdp = require(parent.SharedFlags).FFlagLuaAppLaunchWhenLoadingEdp
local fFlagLuaAppLaunchWhenLoadingForce = require(parent.SharedFlags).FFlagLuaAppLaunchWhenLoadingForce
local fFlagLuaAppDemoModePlayButton = require(parent.SharedFlags).FFlagLuaAppDemoModePlayButton
local fFlagLuaAppDemoModePlayButtonTelemetry = require(parent.SharedFlags).FFlagLuaAppDemoModePlayButtonTelemetry

return function(p0, p1, p2, _, p3, p4, p5, p6) --[[ line: 79 ]]
	-- upvalues: useRoactService (ref), roactAnalytics (ref), appUpdateService (ref), appEventIngestService (ref), useDispatch (ref), useSelector (ref), useGameInfosSelector (ref), useGameProductInfoSelector (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), useGameIconSelector (ref), useRouteName (ref), getFFlagIsSquadEnabled (ref), reactModule (ref), squadExternalContractContext (ref), getFFlagLuaAppEnableVirtualEventPlaceId (ref), usePlayButtonLaunchGameModule (ref), fFlagLuaAppPlayableUxTreatment (ref), usePlayButtonLaunchWithUxTreatmentModule (ref), fFlagLuaAppLogPageContextUnlockPlayIntent (ref), usePlayButtonLaunchAfterSeventeenPlusUpsellModule (ref), useAgeVerificationOverlayCallbackModule (ref), roactNetworking (ref), fFlagLuaAppLaunchWhenLoadingForce (ref), fFlagLuaAppLaunchWhenLoadingEdp (ref), fFlagLuaAppDemoModePlayButton (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref), autoUpgradeEngineFeatureOnlyEngineFeature (ref), fFlagCheckForUpdatePromise (ref), handleUpdate (ref), canPerformBinaryUpdateEnabledEngineFeature (ref), checkForUpdate (ref), joinGamePlayButton (ref), playButtonReferralSourceModule (ref), gamePlayButtonShareLinkAnalyticsModule (ref), playButtonStatesModule (ref), closeCentralOverlay (ref), fetchGamePlayabilityAndProductInfo (ref), openCentralOverlayForPurchaseGameModule (ref), fFlagShipUnifiedPurchaseFlowToPaidAccess (ref), openCentralOverlayForUnifiedPurchasePromptModule (ref), productPurchaseSurface (ref), getIsUserEligibleForUnifiedPurchaseFlow (ref), apiPostPreparePurchaseModule (ref), unlockPlayIntent (ref), invalidPlayIntent (ref), fFlagLuaAppPlayButtonLoadingDurationTelemetry (ref), createExperienceInvite (ref), fFlagEnableSquadRegroupExperimentation (ref), squadExperienceInviteSource (ref), fFlagEnablePrivatePartyStartJoin (ref), squadExperienceInviteType (ref), includeWaitingForPartyInCondition (ref)
	local var19 = useRoactService(roactAnalytics)
	local var20 = useRoactService(appUpdateService)
	local var21 = useRoactService(appEventIngestService)
	local var22 = useDispatch()
	local var23 = useSelector(function(p7) --[[ line: 94 ]]
		-- upvalues: p0 (ref)
		return p7.GameDetails[p0]
	end)
	local var24 = useGameInfosSelector(p0)
	local var25 = useGameProductInfoSelector(p0)
	local var26 = useSelector(function(p8) --[[ line: 99 ]]
		-- upvalues: p0 (ref)
		return p8.PlayabilityStatus[p0]
	end)
	local var27 = if fFlagEnableUnifiedProductPurchaseFlow then useGameIconSelector(p0) else nil
	local var28 = useRouteName()
	local var29 = if getFFlagIsSquadEnabled() then reactModule.useContext(squadExternalContractContext) else nil
	local var30 = if var23 then var23.rootPlaceId elseif var24 then var24.placeId else nil
	p5 = if getFFlagLuaAppEnableVirtualEventPlaceId() and p5 ~= "0" then p5 or var30 else var30
	local var31 = if var23 then var23.name elseif var24 then var24.name else nil
	local var32 = usePlayButtonLaunchGameModule(p0, p5, var30, p1, p2, p3, p4)
	local var33 = usePlayButtonLaunchAfterSeventeenPlusUpsellModule(var26, p0, if fFlagLuaAppPlayableUxTreatment then if fFlagLuaAppPlayableUxTreatment then usePlayButtonLaunchWithUxTreatmentModule(var26, p0, var32, if fFlagLuaAppLogPageContextUnlockPlayIntent then var28 else nil) else nil else var32, if fFlagLuaAppLogPageContextUnlockPlayIntent then var28 else nil)
	local var34 = useAgeVerificationOverlayCallbackModule(p0, var32, var33)
	local var35 = useRoactService(roactNetworking)
	local fFlagLuaAppLaunchWhenLoadingForce_1 = fFlagLuaAppLaunchWhenLoadingForce or fFlagLuaAppLaunchWhenLoadingEdp and p6 == true
	local var37 = if fFlagLuaAppLaunchWhenLoadingForce or fFlagLuaAppLaunchWhenLoadingEdp or fFlagLuaAppDemoModePlayButton then reactModule.useCallback(function(p9, p10) --[[ line: 163 ]]
		-- upvalues: var34 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy), var33 (ref), autoUpgradeEngineFeatureOnlyEngineFeature (copy), fFlagCheckForUpdatePromise (copy), handleUpdate (copy), var22 (ref), var20 (ref), canPerformBinaryUpdateEnabledEngineFeature (copy), var19 (ref), p2 (ref), checkForUpdate (copy)
		local _ = nil
		local var38 = if game:GetEngineFeature("VoiceChatSupported") then function() --[[ line: 166 ]]
			-- upvalues: var34 (copy), p9 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy), p10 (ref)
			var34(p9, if fFlagLuaAppDemoModePlayButtonTelemetry then p10 else nil)
		end else function() --[[ line: 173 ]]
			-- upvalues: var33 (copy), p9 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy), p10 (ref)
			var33(p9, if fFlagLuaAppDemoModePlayButtonTelemetry then p10 else nil)
		end
		
		if not autoUpgradeEngineFeatureOnlyEngineFeature then
			var38()
			
			return
		elseif fFlagCheckForUpdatePromise then
			handleUpdate(var22, var20, canPerformBinaryUpdateEnabledEngineFeature, var19, p2, var38)
			
			return
		end
		var22(checkForUpdate(var20, canPerformBinaryUpdateEnabledEngineFeature, var19, var38, { ctx = p2 }))
	end, {
		var19, var20, canPerformBinaryUpdateEnabledEngineFeature, p2, var34, var33,
		var22
	}) else nil
	
	return reactModule.useCallback(function(p11, p12, p13) --[[ line: 211 ]]
		-- upvalues: joinGamePlayButton (copy), var19 (ref), p1 (ref), var30 (ref), p2 (ref), playButtonReferralSourceModule (copy), gamePlayButtonShareLinkAnalyticsModule (copy), getFFlagLuaAppEnableVirtualEventPlaceId (copy), p5 (write), p0 (ref), playButtonStatesModule (copy), fFlagLuaAppLaunchWhenLoadingForce (copy), fFlagLuaAppLaunchWhenLoadingEdp (copy), fFlagLuaAppDemoModePlayButton (copy), var37 (ref), var34 (ref), var33 (ref), autoUpgradeEngineFeatureOnlyEngineFeature (copy), fFlagCheckForUpdatePromise (copy), handleUpdate (copy), var22 (ref), var20 (ref), canPerformBinaryUpdateEnabledEngineFeature (copy), checkForUpdate (copy), var25 (ref), fFlagEnableUnifiedProductPurchaseFlow (copy), closeCentralOverlay (copy), fetchGamePlayabilityAndProductInfo (copy), var35 (ref), openCentralOverlayForPurchaseGameModule (copy), var31 (ref), var28 (ref), fFlagShipUnifiedPurchaseFlowToPaidAccess (copy), openCentralOverlayForUnifiedPurchasePromptModule (copy), var27 (write), productPurchaseSurface (copy), getIsUserEligibleForUnifiedPurchaseFlow (copy), fFlagLuaAppDemoModePlayButtonTelemetry (copy), apiPostPreparePurchaseModule (copy), unlockPlayIntent (copy), var21 (ref), var26 (ref), fFlagLuaAppLogPageContextUnlockPlayIntent (copy), invalidPlayIntent (copy), fFlagLuaAppPlayButtonLoadingDurationTelemetry (copy), fFlagLuaAppLaunchWhenLoadingForce_1 (ref), getFFlagIsSquadEnabled (copy), createExperienceInvite (copy), var29 (ref), fFlagEnableSquadRegroupExperimentation (copy), squadExperienceInviteSource (copy), fFlagEnablePrivatePartyStartJoin (copy), squadExperienceInviteType (copy), includeWaitingForPartyInCondition (copy)
		joinGamePlayButton(var19.InfluxDb, "playButtonClicked", {
			isUniversalApp = true,
			referralSource = p1,
			placeId = var30,
			buttonState = p11 or "Invalid",
			ctx = p2
		})
		
		if p1 == playButtonReferralSourceModule.ExperienceDetailsLink then
			gamePlayButtonShareLinkAnalyticsModule(var19, {
				placeId = if getFFlagLuaAppEnableVirtualEventPlaceId() then p5 else var30,
				playButtonState = p11,
				universeId = p0
			})
		end
		if p11 == playButtonStatesModule.Playable or p11 == playButtonStatesModule.ActionNeeded then
			if fFlagLuaAppLaunchWhenLoadingForce or fFlagLuaAppLaunchWhenLoadingEdp or fFlagLuaAppDemoModePlayButton then
				var37(p12)
				
				return
			end
			local _ = nil
			local var39 = if game:GetEngineFeature("VoiceChatSupported") then function() --[[ line: 237 ]]
				-- upvalues: var34 (copy), p12 (ref)
				var34(p12)
			end else function() --[[ line: 241 ]]
				-- upvalues: var33 (copy), p12 (ref)
				var33(p12)
			end
			
			if autoUpgradeEngineFeatureOnlyEngineFeature then
				if fFlagCheckForUpdatePromise then
					handleUpdate(var22, var20, canPerformBinaryUpdateEnabledEngineFeature, var19, p2, var39)
					
					return
				end
				var22(checkForUpdate(var20, canPerformBinaryUpdateEnabledEngineFeature, var19, var39, { ctx = p2 }))
				
				return
			else
				var39()
				
				return
			end
		elseif p11 == playButtonStatesModule.PaidAccess then
			local var40 = if var25 then var25.price else nil
			local var41 = if var25 then var25.productId else nil
			local var42 = if var25 then var25.sellerId else nil
			
			if fFlagEnableUnifiedProductPurchaseFlow then
				local var43 = if var25 then var25.universeId else nil
				
				local function onFlowComplete() --[[ line: 274 ]]
					-- upvalues: var22 (copy), closeCentralOverlay (copy)
					var22(closeCentralOverlay())
				end
				
				local function onPurchaseSuccess() --[[ line: 277 ]]
					-- upvalues: var22 (copy), fetchGamePlayabilityAndProductInfo (copy), var35 (copy), var43 (ref)
					var22(fetchGamePlayabilityAndProductInfo.Fetch(var35, var43))
				end
				
				local function _() --[[ line: 280 | named "initiateLegacyPurchaseFlow" ]]
					-- upvalues: var22 (copy), openCentralOverlayForPurchaseGameModule (copy), var43 (ref), var31 (copy), var40 (ref), var41 (ref), var42 (ref), var28 (copy)
					var22(openCentralOverlayForPurchaseGameModule(var43, var31, var40, var41, var42, { var28 }))
				end
				
				if fFlagShipUnifiedPurchaseFlowToPaidAccess then
					var22(openCentralOverlayForUnifiedPurchasePromptModule({
						productPayload = {
							kind = "Experience",
							universeId = var43,
							experienceName = var31,
							experienceIconUrl = var27.url
						},
						purchaseCallbacks = {
							onFlowComplete = onFlowComplete,
							onPurchaseSuccess = onPurchaseSuccess
						},
						purchaseAnalyticsMetadata = { surface = productPurchaseSurface.PaidAccess }
					}))
					
					return
				end
				getIsUserEligibleForUnifiedPurchaseFlow(var35):andThen(function(p14) --[[ line: 311 ]]
					-- upvalues: var22 (copy), openCentralOverlayForUnifiedPurchasePromptModule (copy), var43 (ref), var31 (copy), var27 (copy), onFlowComplete (ref), onPurchaseSuccess (ref), productPurchaseSurface (copy), openCentralOverlayForPurchaseGameModule (copy), var40 (ref), var41 (ref), var42 (ref), var28 (copy)
					if p14 then
						var22(openCentralOverlayForUnifiedPurchasePromptModule({
							productPayload = {
								kind = "Experience",
								universeId = var43,
								experienceName = var31,
								experienceIconUrl = var27.url
							},
							purchaseCallbacks = {
								onFlowComplete = onFlowComplete,
								onPurchaseSuccess = onPurchaseSuccess
							},
							purchaseAnalyticsMetadata = { surface = productPurchaseSurface.PaidAccess }
						}))
						
						return
					end
					var22(openCentralOverlayForPurchaseGameModule(var43, var31, var40, var41, var42, { var28 }))
				end):catch(function(_) --[[ line: 332 ]]
					-- upvalues: var22 (copy), openCentralOverlayForPurchaseGameModule (copy), var43 (ref), var31 (copy), var40 (ref), var41 (ref), var42 (ref), var28 (copy)
					var22(openCentralOverlayForPurchaseGameModule(var43, var31, var40, var41, var42, { var28 }))
				end)
				
				return
			else
				var22(openCentralOverlayForPurchaseGameModule(p0, var31, var40, var41, var42, { var28 }))
				
				return
			end
		elseif fFlagLuaAppDemoModePlayButton and p11 == playButtonStatesModule.DemoMode then
			if fFlagLuaAppDemoModePlayButtonTelemetry then
				var37(p12, "DemoPlayButtonClick")
				
				return
			end
			var37(p12)
			
			return
		elseif p11 == playButtonStatesModule.FiatPaidAccess then
			if var30 and var25 and var25.fiatBasePriceId then
				var22(apiPostPreparePurchaseModule.Fetch(var35, var30, p0, var25.fiatBasePriceId))
				unlockPlayIntent(var21, {
					upsellName = "FiatPurchase",
					universeId = p0,
					playabilityStatus = if var26 then var26.playabilityStatus else nil,
					pageName = if fFlagLuaAppLogPageContextUnlockPlayIntent then var28 else nil
				})
				
				return
			end
		elseif p11 == playButtonStatesModule.Loading then
			invalidPlayIntent(p2, {
				universeId = p0,
				playButtonState = p11,
				playabilityStatus = if var26 then var26.playabilityStatus else nil,
				pageName = if fFlagLuaAppPlayButtonLoadingDurationTelemetry then var28 else nil
			})
			
			if fFlagLuaAppLaunchWhenLoadingForce_1 then
				var37(p12)
			end
			return
		elseif getFFlagIsSquadEnabled() and p11 == playButtonStatesModule.PlayableWithParty then
			if not var30 then return end
			var22(createExperienceInvite(var30, var29, if fFlagEnableSquadRegroupExperimentation then squadExperienceInviteSource.Default else nil, if fFlagEnablePrivatePartyStartJoin and p13 and p13.isPrivateParty then squadExperienceInviteType.PlayWithPartyInPrivatePartyServer else nil))
			
			return
		elseif includeWaitingForPartyInCondition and p11 == playButtonStatesModule.WaitingForParty then
			invalidPlayIntent(p2, {
				universeId = p0,
				playButtonState = p11,
				playabilityStatus = if var26 then var26.playabilityStatus else nil,
				pageName = if fFlagLuaAppPlayButtonLoadingDurationTelemetry then var28 else nil
			})
			
			return
		elseif p11 == playButtonStatesModule.UnplayableOther then
			invalidPlayIntent(p2, {
				universeId = p0,
				playButtonState = p11,
				playabilityStatus = if var26 then var26.playabilityStatus else nil,
				pageName = if fFlagLuaAppPlayButtonLoadingDurationTelemetry then var28 else nil
			})
			
			return
		end
		error(`invalid play button state {p11}!`)
	end, {
		var19, var20, canPerformBinaryUpdateEnabledEngineFeature, p0,
		if getFFlagLuaAppEnableVirtualEventPlaceId() then p5 else nil, var30, var31,
		p1, p2,
		if fFlagLuaAppLaunchWhenLoadingForce or fFlagLuaAppLaunchWhenLoadingEdp or fFlagLuaAppDemoModePlayButton then var37 else nil,
		if fFlagLuaAppLaunchWhenLoadingForce or fFlagLuaAppLaunchWhenLoadingEdp or fFlagLuaAppDemoModePlayButton then nil else var34,
		if fFlagLuaAppLaunchWhenLoadingForce or fFlagLuaAppLaunchWhenLoadingEdp or fFlagLuaAppDemoModePlayButton then nil else var33,
		var25, var28, if getFFlagIsSquadEnabled() then var29 else nil, var26,
		if fFlagLuaAppDemoModePlayButton then var22 else nil,
		if fFlagLuaAppDemoModePlayButton then var21 else nil,
		if fFlagLuaAppDemoModePlayButton then var27 else nil,
		if fFlagLuaAppDemoModePlayButton then var35 else nil,
		if fFlagLuaAppLaunchWhenLoadingForce or fFlagLuaAppLaunchWhenLoadingEdp then fFlagLuaAppLaunchWhenLoadingForce_1 else nil
	})
end