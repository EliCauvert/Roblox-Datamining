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
local usePrivatePlaytestLaunchWithUpsellModule = require(gamePlayButton.PlayButtonLaunchChecks.usePrivatePlaytestLaunchWithUpsell)
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
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local handleUpdate = require(parent.RobloxAppUpdate).HandleUpdate
local launchPlaytestWithLoadingStateModule = require(parent.BuildExperiencePlaytestLaunch.launchPlaytestWithLoadingState)
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
local createExperienceInvite = require(parent.Squads.Thunks).CreateExperienceInvite
local squadExternalContractContext = require(parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local squadExperienceInviteType = require(parent.SquadsCore.Enums).SquadExperienceInviteType
local squadExperienceInviteSource = require(parent.SquadsCore.Enums).SquadExperienceInviteSource
local _ = require(parent.PlayabilityRodux)
local autoUpgradeEngineFeatureOnlyEngineFeature = game:GetEngineFeature("AutoUpgradeEngineFeatureOnly")
local canPerformBinaryUpdateEnabledEngineFeature = game:GetEngineFeature("CanPerformBinaryUpdateEnabled")
local includeWaitingForPartyInCondition = game:DefineFastFlag("IncludeWaitingForPartyInCondition", false)
local fFlagEnableSquadRegroupExperimentation = require(parent.SharedFlags).FFlagEnableSquadRegroupExperimentation
local fFlagLuaAppPlayableUxTreatment = require(parent.SharedFlags).FFlagLuaAppPlayableUxTreatment
local fFlagEnablePrivatePartyStartJoin = require(parent.SharedFlags).FFlagEnablePrivatePartyStartJoin
local fFlagLuaAppPlayButtonLoadingDurationTelemetry = require(parent.SharedFlags).FFlagLuaAppPlayButtonLoadingDurationTelemetry
local fFlagLuaAppLaunchWhenLoadingEdp = require(parent.SharedFlags).FFlagLuaAppLaunchWhenLoadingEdp
local fFlagEnableGameJoinEarlyAccess = require(parent.SharedFlags).FFlagEnableGameJoinEarlyAccess
local fFlagLuaAppLaunchWhenLoadingForce = require(parent.SharedFlags).FFlagLuaAppLaunchWhenLoadingForce
local fFlagLuaAppDemoModePlayButtonTelemetry = require(parent.SharedFlags).FFlagLuaAppDemoModePlayButtonTelemetry
local fFlagMigrateGameIconsToStore = require(parent.SharedFlags).FFlagMigrateGameIconsToStore
local fFlagMigrateGameInfoToStore = require(parent.SharedFlags).FFlagMigrateGameInfoToStore
local fFlagLuaAppPlayButtonPrivatePT = require(parent.SharedFlags).FFlagLuaAppPlayButtonPrivatePT

return function(p1, p2, p3, _, p4, p5, p6, p7)
	-- upvalues: useRoactService (ref), roactAnalytics (ref), appUpdateService (ref), appEventIngestService (ref), useDispatch (ref), useSelector (ref), fFlagMigrateGameInfoToStore (ref), gameHydrationReactModule (ref), useGameInfosSelector (ref), useGameProductInfoSelector (ref), fFlagMigrateGameIconsToStore (ref), useGameIconSelector (ref), useRouteName (ref), getFFlagIsSquadEnabled (ref), reactModule (ref), squadExternalContractContext (ref), getFFlagLuaAppEnableVirtualEventPlaceId (ref), usePlayButtonLaunchGameModule (ref), fFlagLuaAppPlayableUxTreatment (ref), usePlayButtonLaunchWithUxTreatmentModule (ref), usePlayButtonLaunchAfterSeventeenPlusUpsellModule (ref), useAgeVerificationOverlayCallbackModule (ref), roactNetworking (ref), fFlagLuaAppLaunchWhenLoadingForce (ref), fFlagLuaAppLaunchWhenLoadingEdp (ref), fFlagLuaAppPlayButtonPrivatePT (ref), discoveryEventErrorLogger (ref), launchPlaytestWithLoadingStateModule (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref), usePrivatePlaytestLaunchWithUpsellModule (ref), autoUpgradeEngineFeatureOnlyEngineFeature (ref), handleUpdate (ref), canPerformBinaryUpdateEnabledEngineFeature (ref), joinGamePlayButton (ref), playButtonReferralSourceModule (ref), gamePlayButtonShareLinkAnalyticsModule (ref), playButtonStatesModule (ref), closeCentralOverlay (ref), fetchGamePlayabilityAndProductInfo (ref), openCentralOverlayForPurchaseGameModule (ref), fFlagShipUnifiedPurchaseFlowToPaidAccess (ref), openCentralOverlayForUnifiedPurchasePromptModule (ref), productPurchaseSurface (ref), getIsUserEligibleForUnifiedPurchaseFlow (ref), apiPostPreparePurchaseModule (ref), unlockPlayIntent (ref), invalidPlayIntent (ref), fFlagLuaAppPlayButtonLoadingDurationTelemetry (ref), createExperienceInvite (ref), fFlagEnableSquadRegroupExperimentation (ref), squadExperienceInviteSource (ref), fFlagEnablePrivatePartyStartJoin (ref), squadExperienceInviteType (ref), includeWaitingForPartyInCondition (ref), fFlagEnableGameJoinEarlyAccess (ref)
	local var1 = useRoactService(roactAnalytics)
	local var2 = useRoactService(appUpdateService)
	local var3 = useRoactService(appEventIngestService)
	local var4 = useDispatch()
	local var5 = useSelector(function(p8)
		-- upvalues: p1 (ref)
		return p8.GameDetails[p1]
	end)
	local var6 = nil
	local var7 = nil
	
	if fFlagMigrateGameInfoToStore then
		var7 = gameHydrationReactModule.useGameInfo(p1)
	else
		var6 = useGameInfosSelector(p1)
	end
	local var8 = useGameProductInfoSelector(p1)
	local var9 = useSelector(function(p8)
		-- upvalues: p1 (ref)
		return p8.PlayabilityStatus[p1]
	end)
	local var10 = nil
	local var11 = nil
	
	if fFlagMigrateGameIconsToStore then
		var11 = gameHydrationReactModule.useGameIcon(p1)
	else
		var10 = useGameIconSelector(p1)
	end
	local rootPlaceId
	local var12 = useRouteName()
	local var13 = if getFFlagIsSquadEnabled() then reactModule.useContext(squadExternalContractContext) else nil
	
	if var5 then
		rootPlaceId = var5.rootPlaceId
		
		if not rootPlaceId then
			rootPlaceId = if fFlagMigrateGameInfoToStore then var7 and var7.rootPlaceId else var6 and var6.placeId
			rootPlaceId = rootPlaceId or nil
		end
		local name
		p6 = if getFFlagLuaAppEnableVirtualEventPlaceId() and p6 ~= "0" then p6 or rootPlaceId else rootPlaceId
		
		if var5 then
			name = var5.name
			
			if not name then
				name = if fFlagMigrateGameInfoToStore then var7 and var7.name else var6 and var6.name
				name = name or nil
			end
			local var14 = usePlayButtonLaunchGameModule(p1, p6, rootPlaceId, p2, p3, p4, p5)
			local var15 = usePlayButtonLaunchAfterSeventeenPlusUpsellModule(var9, p1, if fFlagLuaAppPlayableUxTreatment then if fFlagLuaAppPlayableUxTreatment then usePlayButtonLaunchWithUxTreatmentModule(var9, p1, var14, var12) else nil else var14, var12)
			local var16 = useAgeVerificationOverlayCallbackModule(p1, var14, var15)
			local var17 = useRoactService(roactNetworking)
			local fFlagLuaAppLaunchWhenLoadingForce_1 = fFlagLuaAppLaunchWhenLoadingForce or fFlagLuaAppLaunchWhenLoadingEdp and p7 == true
			local var18 = if fFlagLuaAppPlayButtonPrivatePT then usePrivatePlaytestLaunchWithUpsellModule(var9, tostring(p1), reactModule.useCallback(function(p8, p9)
				-- upvalues: p6 (write), discoveryEventErrorLogger (copy), p1 (ref), launchPlaytestWithLoadingStateModule (copy), p4 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy)
				local var19 = if p6 ~= nil then nil else tonumber(p6)
				
				if var19 == nil then
					discoveryEventErrorLogger.reportError("PlaytestLaunchMissingPlaceId", `Cannot launch private Playtest without a valid placeId for universeId {p1}`)
					
					return
				elseif launchPlaytestWithLoadingStateModule(var19, p4, true) and p8 ~= nil then
					p8(if fFlagLuaAppDemoModePlayButtonTelemetry then p9 else nil)
				end
			end, { p6, p4, p1 }), p3, var12) else nil
			local var20 = reactModule.useCallback(function(p10, p11)
				-- upvalues: var16 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy), var15 (ref), autoUpgradeEngineFeatureOnlyEngineFeature (copy), handleUpdate (copy), var4 (ref), var2 (ref), canPerformBinaryUpdateEnabledEngineFeature (copy), var1 (ref), p3 (ref)
				local _ = nil
				local var21 = if game:GetEngineFeature("VoiceChatSupported") then function()
					-- upvalues: var16 (copy), p10 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy), p11 (ref)
					var16(p10, if fFlagLuaAppDemoModePlayButtonTelemetry then p11 else nil)
				end else function()
					-- upvalues: var15 (copy), p10 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy), p11 (ref)
					var15(p10, if fFlagLuaAppDemoModePlayButtonTelemetry then p11 else nil)
				end
				
				if autoUpgradeEngineFeatureOnlyEngineFeature then
					handleUpdate(var4, var2, canPerformBinaryUpdateEnabledEngineFeature, var1, p3, var21)
					
					return
				end
				var21()
			end, {
				var1, var2, canPerformBinaryUpdateEnabledEngineFeature, p3, var16, var15,
				var4
			})
			
			return reactModule.useCallback(function(p10, p11, p12)
				-- upvalues: joinGamePlayButton (copy), var1 (ref), p2 (ref), rootPlaceId (ref), p3 (ref), playButtonReferralSourceModule (copy), gamePlayButtonShareLinkAnalyticsModule (copy), getFFlagLuaAppEnableVirtualEventPlaceId (copy), p6 (write), p1 (ref), playButtonStatesModule (copy), var20 (ref), var8 (ref), var4 (ref), closeCentralOverlay (copy), fetchGamePlayabilityAndProductInfo (copy), var17 (ref), openCentralOverlayForPurchaseGameModule (copy), name (ref), var12 (ref), fFlagShipUnifiedPurchaseFlowToPaidAccess (copy), openCentralOverlayForUnifiedPurchasePromptModule (copy), fFlagMigrateGameIconsToStore (copy), var11 (write), var10 (write), productPurchaseSurface (copy), getIsUserEligibleForUnifiedPurchaseFlow (copy), fFlagLuaAppDemoModePlayButtonTelemetry (copy), fFlagLuaAppPlayButtonPrivatePT (copy), var18 (write), apiPostPreparePurchaseModule (copy), unlockPlayIntent (copy), var3 (ref), var9 (ref), invalidPlayIntent (copy), fFlagLuaAppPlayButtonLoadingDurationTelemetry (copy), fFlagLuaAppLaunchWhenLoadingForce_1 (ref), getFFlagIsSquadEnabled (copy), createExperienceInvite (copy), var13 (ref), fFlagEnableSquadRegroupExperimentation (copy), squadExperienceInviteSource (copy), fFlagEnablePrivatePartyStartJoin (copy), squadExperienceInviteType (copy), includeWaitingForPartyInCondition (copy), fFlagEnableGameJoinEarlyAccess (copy)
				joinGamePlayButton(var1.InfluxDb, "playButtonClicked", {
					isUniversalApp = true,
					referralSource = p2,
					placeId = rootPlaceId,
					buttonState = p10 or "Invalid",
					ctx = p3
				})
				
				if p2 == playButtonReferralSourceModule.ExperienceDetailsLink then
					gamePlayButtonShareLinkAnalyticsModule(var1, {
						placeId = if getFFlagLuaAppEnableVirtualEventPlaceId() then p6 else rootPlaceId,
						playButtonState = p10,
						universeId = p1
					})
				end
				if p10 == playButtonStatesModule.Playable or p10 == playButtonStatesModule.ActionNeeded then
					var20(p11)
					
					return
				elseif p10 == playButtonStatesModule.PaidAccess then
					local var21 = if var8 then var8.price else nil
					local var22 = if var8 then var8.productId else nil
					local var23 = if var8 then var8.sellerId else nil
					local var24 = if var8 then var8.universeId else nil
					
					local function onFlowComplete()
						-- upvalues: var4 (copy), closeCentralOverlay (copy)
						var4(closeCentralOverlay())
					end
					
					local function onPurchaseSuccess()
						-- upvalues: var4 (copy), fetchGamePlayabilityAndProductInfo (copy), var17 (copy), var24 (ref)
						var4(fetchGamePlayabilityAndProductInfo.Fetch(var17, var24))
					end
					
					local function _()
						-- upvalues: var4 (copy), openCentralOverlayForPurchaseGameModule (copy), var24 (ref), name (copy), var21 (ref), var22 (ref), var23 (ref), var12 (copy)
						var4(openCentralOverlayForPurchaseGameModule(var24, name, var21, var22, var23, { var12 }))
					end
					
					if fFlagShipUnifiedPurchaseFlowToPaidAccess then
						var4(openCentralOverlayForUnifiedPurchasePromptModule({
							productPayload = {
								kind = "Experience",
								universeId = var24,
								experienceName = name,
								experienceIconUrl = if fFlagMigrateGameIconsToStore then var11 elseif var10 then var10.url else nil
							},
							purchaseCallbacks = {
								onFlowComplete = onFlowComplete,
								onPurchaseSuccess = onPurchaseSuccess
							},
							purchaseAnalyticsMetadata = { surface = productPurchaseSurface.PaidAccess }
						}))
						
						return
					end
					getIsUserEligibleForUnifiedPurchaseFlow(var17):andThen(function(p13)
						-- upvalues: var4 (copy), openCentralOverlayForUnifiedPurchasePromptModule (copy), var24 (ref), name (copy), fFlagMigrateGameIconsToStore (copy), var11 (copy), var10 (copy), onFlowComplete (ref), onPurchaseSuccess (ref), productPurchaseSurface (copy), openCentralOverlayForPurchaseGameModule (copy), var21 (ref), var22 (ref), var23 (ref), var12 (copy)
						if p13 then
							var4(openCentralOverlayForUnifiedPurchasePromptModule({
								productPayload = {
									kind = "Experience",
									universeId = var24,
									experienceName = name,
									experienceIconUrl = if fFlagMigrateGameIconsToStore then var11 elseif var10 then var10.url else nil
								},
								purchaseCallbacks = {
									onFlowComplete = onFlowComplete,
									onPurchaseSuccess = onPurchaseSuccess
								},
								purchaseAnalyticsMetadata = { surface = productPurchaseSurface.PaidAccess }
							}))
							
							return
						end
						var4(openCentralOverlayForPurchaseGameModule(var24, name, var21, var22, var23, { var12 }))
					end):catch(function(_)
						-- upvalues: var4 (copy), openCentralOverlayForPurchaseGameModule (copy), var24 (ref), name (copy), var21 (ref), var22 (ref), var23 (ref), var12 (copy)
						var4(openCentralOverlayForPurchaseGameModule(var24, name, var21, var22, var23, { var12 }))
					end)
					
					return
				elseif p10 == playButtonStatesModule.DemoMode then
					if fFlagLuaAppDemoModePlayButtonTelemetry then
						var20(p11, "DemoPlayButtonClick")
						
						return
					end
					var20(p11)
					
					return
				elseif fFlagLuaAppPlayButtonPrivatePT and p10 == playButtonStatesModule.Playtest then
					if var18 == nil then
						return
					else
						var18(p11, "PlaytestPlayButtonClick")
						
						return
					end
				elseif p10 == playButtonStatesModule.FiatPaidAccess then
					if rootPlaceId and var8 and var8.fiatBasePriceId then
						var4(apiPostPreparePurchaseModule.Fetch(var17, rootPlaceId, p1, var8.fiatBasePriceId))
						unlockPlayIntent(var3, {
							upsellName = "FiatPurchase",
							universeId = p1,
							playabilityStatus = if var9 then var9.playabilityStatus else nil,
							pageName = var12
						})
						
						return
					end
				elseif p10 == playButtonStatesModule.Loading then
					invalidPlayIntent(p3, {
						universeId = p1,
						playButtonState = p10,
						playabilityStatus = if var9 then var9.playabilityStatus else nil,
						pageName = if fFlagLuaAppPlayButtonLoadingDurationTelemetry then var12 else nil
					})
					
					if fFlagLuaAppLaunchWhenLoadingForce_1 then
						var20(p11)
					end
					return
				elseif getFFlagIsSquadEnabled() and p10 == playButtonStatesModule.PlayableWithParty then
					if not rootPlaceId then return end
					var4(createExperienceInvite(rootPlaceId, var13, if fFlagEnableSquadRegroupExperimentation then squadExperienceInviteSource.Default else nil, if fFlagEnablePrivatePartyStartJoin and p12 and p12.isPrivateParty then squadExperienceInviteType.PlayWithPartyInPrivatePartyServer else nil))
					
					return
				elseif includeWaitingForPartyInCondition and p10 == playButtonStatesModule.WaitingForParty then
					invalidPlayIntent(p3, {
						universeId = p1,
						playButtonState = p10,
						playabilityStatus = if var9 then var9.playabilityStatus else nil,
						pageName = if fFlagLuaAppPlayButtonLoadingDurationTelemetry then var12 else nil
					})
					
					return
				elseif p10 == playButtonStatesModule.UnplayableOther or fFlagEnableGameJoinEarlyAccess and p10 == playButtonStatesModule.EarlyAccessLocked then
					invalidPlayIntent(p3, {
						universeId = p1,
						playButtonState = p10,
						playabilityStatus = if var9 then var9.playabilityStatus else nil,
						pageName = if fFlagLuaAppPlayButtonLoadingDurationTelemetry then var12 else nil
					})
					
					return
				end
				error(`invalid play button state {p10}!`)
			end, {
				var1, var2, canPerformBinaryUpdateEnabledEngineFeature, p1,
				if getFFlagLuaAppEnableVirtualEventPlaceId() or fFlagLuaAppPlayButtonPrivatePT then p6 else nil,
				rootPlaceId, name, p2, p3, var20, var8, var12,
				if fFlagLuaAppPlayButtonPrivatePT then p4 else nil,
				if fFlagLuaAppPlayButtonPrivatePT then var18 else nil,
				if getFFlagIsSquadEnabled() then var13 else nil, var9, var4, var3,
				if fFlagMigrateGameIconsToStore then var11 else var10, var17,
				if fFlagLuaAppLaunchWhenLoadingForce or fFlagLuaAppLaunchWhenLoadingEdp then fFlagLuaAppLaunchWhenLoadingForce_1 else nil
			})
		end
	end
end