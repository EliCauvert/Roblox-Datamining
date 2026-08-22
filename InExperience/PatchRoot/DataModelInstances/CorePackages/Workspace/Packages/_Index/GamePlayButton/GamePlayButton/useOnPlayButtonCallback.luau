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
local fFlagLuaAppDemoModePlayButtonTelemetry = require(parent.SharedFlags).FFlagLuaAppDemoModePlayButtonTelemetry
local fFlagMigrateGameIconsToStore = require(parent.SharedFlags).FFlagMigrateGameIconsToStore
local fFlagMigrateGameInfoToStore = require(parent.SharedFlags).FFlagMigrateGameInfoToStore

return function(p0, p1, p2, _, p3, p4, p5, p6) --[[ line: 79 ]]
	-- upvalues: useRoactService (ref), roactAnalytics (ref), appUpdateService (ref), appEventIngestService (ref), useDispatch (ref), useSelector (ref), fFlagMigrateGameInfoToStore (ref), gameHydrationReactModule (ref), useGameInfosSelector (ref), useGameProductInfoSelector (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), fFlagMigrateGameIconsToStore (ref), useGameIconSelector (ref), useRouteName (ref), getFFlagIsSquadEnabled (ref), reactModule (ref), squadExternalContractContext (ref), getFFlagLuaAppEnableVirtualEventPlaceId (ref), usePlayButtonLaunchGameModule (ref), fFlagLuaAppPlayableUxTreatment (ref), usePlayButtonLaunchWithUxTreatmentModule (ref), usePlayButtonLaunchAfterSeventeenPlusUpsellModule (ref), useAgeVerificationOverlayCallbackModule (ref), roactNetworking (ref), fFlagLuaAppLaunchWhenLoadingForce (ref), fFlagLuaAppLaunchWhenLoadingEdp (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref), autoUpgradeEngineFeatureOnlyEngineFeature (ref), fFlagCheckForUpdatePromise (ref), handleUpdate (ref), canPerformBinaryUpdateEnabledEngineFeature (ref), checkForUpdate (ref), joinGamePlayButton (ref), playButtonReferralSourceModule (ref), gamePlayButtonShareLinkAnalyticsModule (ref), playButtonStatesModule (ref), closeCentralOverlay (ref), fetchGamePlayabilityAndProductInfo (ref), openCentralOverlayForPurchaseGameModule (ref), fFlagShipUnifiedPurchaseFlowToPaidAccess (ref), openCentralOverlayForUnifiedPurchasePromptModule (ref), productPurchaseSurface (ref), getIsUserEligibleForUnifiedPurchaseFlow (ref), apiPostPreparePurchaseModule (ref), unlockPlayIntent (ref), invalidPlayIntent (ref), fFlagLuaAppPlayButtonLoadingDurationTelemetry (ref), createExperienceInvite (ref), fFlagEnableSquadRegroupExperimentation (ref), squadExperienceInviteSource (ref), fFlagEnablePrivatePartyStartJoin (ref), squadExperienceInviteType (ref), includeWaitingForPartyInCondition (ref)
	local var20 = useRoactService(roactAnalytics)
	local var21 = useRoactService(appUpdateService)
	local var22 = useRoactService(appEventIngestService)
	local var23 = useDispatch()
	local var24 = useSelector(function(p7) --[[ line: 94 ]]
		-- upvalues: p0 (ref)
		return p7.GameDetails[p0]
	end)
	local var25 = nil
	local var26 = nil
	
	if fFlagMigrateGameInfoToStore then
		var26 = gameHydrationReactModule.useGameInfo(p0)
	else
		var25 = useGameInfosSelector(p0)
	end
	local var27 = useGameProductInfoSelector(p0)
	local var28 = useSelector(function(p8) --[[ line: 105 ]]
		-- upvalues: p0 (ref)
		return p8.PlayabilityStatus[p0]
	end)
	local var29 = nil
	local var30 = nil
	
	if fFlagEnableUnifiedProductPurchaseFlow then
		if fFlagMigrateGameIconsToStore then
			var30 = gameHydrationReactModule.useGameIcon(p0)
		else
			var29 = useGameIconSelector(p0)
		end
	end
	local rootPlaceId
	local var31 = useRouteName()
	local var32 = if getFFlagIsSquadEnabled() then reactModule.useContext(squadExternalContractContext) else nil
	
	if var24 then
		rootPlaceId = var24.rootPlaceId
		
		if not rootPlaceId then
			rootPlaceId = if fFlagMigrateGameInfoToStore then var26 and var26.rootPlaceId else var25 and var25.placeId
			rootPlaceId = rootPlaceId or nil
		end
		local name
		p5 = if getFFlagLuaAppEnableVirtualEventPlaceId() and p5 ~= "0" then p5 or rootPlaceId else rootPlaceId
		
		if var24 then
			name = var24.name
			
			if not name then
				name = if fFlagMigrateGameInfoToStore then var26 and var26.name else var25 and var25.name
				name = name or nil
			end
			local var33 = usePlayButtonLaunchGameModule(p0, p5, rootPlaceId, p1, p2, p3, p4)
			local var34 = usePlayButtonLaunchAfterSeventeenPlusUpsellModule(var28, p0, if fFlagLuaAppPlayableUxTreatment then if fFlagLuaAppPlayableUxTreatment then usePlayButtonLaunchWithUxTreatmentModule(var28, p0, var33, var31) else nil else var33, var31)
			local var35 = useAgeVerificationOverlayCallbackModule(p0, var33, var34)
			local var36 = useRoactService(roactNetworking)
			local fFlagLuaAppLaunchWhenLoadingForce_1 = fFlagLuaAppLaunchWhenLoadingForce or fFlagLuaAppLaunchWhenLoadingEdp and p6 == true
			local var38 = reactModule.useCallback(function(p9, p10) --[[ line: 173 ]]
				-- upvalues: var35 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy), var34 (ref), autoUpgradeEngineFeatureOnlyEngineFeature (copy), fFlagCheckForUpdatePromise (copy), handleUpdate (copy), var23 (ref), var21 (ref), canPerformBinaryUpdateEnabledEngineFeature (copy), var20 (ref), p2 (ref), checkForUpdate (copy)
				local _ = nil
				local var39 = if game:GetEngineFeature("VoiceChatSupported") then function() --[[ line: 176 ]]
					-- upvalues: var35 (copy), p9 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy), p10 (ref)
					var35(p9, if fFlagLuaAppDemoModePlayButtonTelemetry then p10 else nil)
				end else function() --[[ line: 183 ]]
					-- upvalues: var34 (copy), p9 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy), p10 (ref)
					var34(p9, if fFlagLuaAppDemoModePlayButtonTelemetry then p10 else nil)
				end
				
				if not autoUpgradeEngineFeatureOnlyEngineFeature then
					var39()
					
					return
				elseif fFlagCheckForUpdatePromise then
					handleUpdate(var23, var21, canPerformBinaryUpdateEnabledEngineFeature, var20, p2, var39)
					
					return
				end
				var23(checkForUpdate(var21, canPerformBinaryUpdateEnabledEngineFeature, var20, var39, { ctx = p2 }))
			end, {
				var20, var21, canPerformBinaryUpdateEnabledEngineFeature, p2, var35, var34,
				var23
			})
			
			return reactModule.useCallback(function(p11, p12, p13) --[[ line: 220 ]]
				-- upvalues: joinGamePlayButton (copy), var20 (ref), p1 (ref), rootPlaceId (ref), p2 (ref), playButtonReferralSourceModule (copy), gamePlayButtonShareLinkAnalyticsModule (copy), getFFlagLuaAppEnableVirtualEventPlaceId (copy), p5 (write), p0 (ref), playButtonStatesModule (copy), var38 (ref), var27 (ref), fFlagEnableUnifiedProductPurchaseFlow (copy), var23 (ref), closeCentralOverlay (copy), fetchGamePlayabilityAndProductInfo (copy), var36 (ref), openCentralOverlayForPurchaseGameModule (copy), name (ref), var31 (ref), fFlagShipUnifiedPurchaseFlowToPaidAccess (copy), openCentralOverlayForUnifiedPurchasePromptModule (copy), fFlagMigrateGameIconsToStore (copy), var30 (write), var29 (write), productPurchaseSurface (copy), getIsUserEligibleForUnifiedPurchaseFlow (copy), fFlagLuaAppDemoModePlayButtonTelemetry (copy), apiPostPreparePurchaseModule (copy), unlockPlayIntent (copy), var22 (ref), var28 (ref), invalidPlayIntent (copy), fFlagLuaAppPlayButtonLoadingDurationTelemetry (copy), fFlagLuaAppLaunchWhenLoadingForce_1 (ref), getFFlagIsSquadEnabled (copy), createExperienceInvite (copy), var32 (ref), fFlagEnableSquadRegroupExperimentation (copy), squadExperienceInviteSource (copy), fFlagEnablePrivatePartyStartJoin (copy), squadExperienceInviteType (copy), includeWaitingForPartyInCondition (copy)
				joinGamePlayButton(var20.InfluxDb, "playButtonClicked", {
					isUniversalApp = true,
					referralSource = p1,
					placeId = rootPlaceId,
					buttonState = p11 or "Invalid",
					ctx = p2
				})
				
				if p1 == playButtonReferralSourceModule.ExperienceDetailsLink then
					gamePlayButtonShareLinkAnalyticsModule(var20, {
						placeId = if getFFlagLuaAppEnableVirtualEventPlaceId() then p5 else rootPlaceId,
						playButtonState = p11,
						universeId = p0
					})
				end
				if p11 == playButtonStatesModule.Playable or p11 == playButtonStatesModule.ActionNeeded then
					var38(p12)
					
					return
				elseif p11 == playButtonStatesModule.PaidAccess then
					local var40 = if var27 then var27.price else nil
					local var41 = if var27 then var27.productId else nil
					local var42 = if var27 then var27.sellerId else nil
					
					if fFlagEnableUnifiedProductPurchaseFlow then
						local var43 = if var27 then var27.universeId else nil
						
						local function onFlowComplete() --[[ line: 245 ]]
							-- upvalues: var23 (copy), closeCentralOverlay (copy)
							var23(closeCentralOverlay())
						end
						
						local function onPurchaseSuccess() --[[ line: 248 ]]
							-- upvalues: var23 (copy), fetchGamePlayabilityAndProductInfo (copy), var36 (copy), var43 (ref)
							var23(fetchGamePlayabilityAndProductInfo.Fetch(var36, var43))
						end
						
						local function _() --[[ line: 251 | named "initiateLegacyPurchaseFlow" ]]
							-- upvalues: var23 (copy), openCentralOverlayForPurchaseGameModule (copy), var43 (ref), name (copy), var40 (ref), var41 (ref), var42 (ref), var31 (copy)
							var23(openCentralOverlayForPurchaseGameModule(var43, name, var40, var41, var42, { var31 }))
						end
						
						if fFlagShipUnifiedPurchaseFlowToPaidAccess then
							var23(openCentralOverlayForUnifiedPurchasePromptModule({
								productPayload = {
									kind = "Experience",
									universeId = var43,
									experienceName = name,
									experienceIconUrl = if fFlagMigrateGameIconsToStore then var30 elseif var29 then var29.url else nil
								},
								purchaseCallbacks = {
									onFlowComplete = onFlowComplete,
									onPurchaseSuccess = onPurchaseSuccess
								},
								purchaseAnalyticsMetadata = { surface = productPurchaseSurface.PaidAccess }
							}))
							
							return
						end
						getIsUserEligibleForUnifiedPurchaseFlow(var36):andThen(function(p14) --[[ line: 284 ]]
							-- upvalues: var23 (copy), openCentralOverlayForUnifiedPurchasePromptModule (copy), var43 (ref), name (copy), fFlagMigrateGameIconsToStore (copy), var30 (copy), var29 (copy), onFlowComplete (ref), onPurchaseSuccess (ref), productPurchaseSurface (copy), openCentralOverlayForPurchaseGameModule (copy), var40 (ref), var41 (ref), var42 (ref), var31 (copy)
							if p14 then
								var23(openCentralOverlayForUnifiedPurchasePromptModule({
									productPayload = {
										kind = "Experience",
										universeId = var43,
										experienceName = name,
										experienceIconUrl = if fFlagMigrateGameIconsToStore then var30 elseif var29 then var29.url else nil
									},
									purchaseCallbacks = {
										onFlowComplete = onFlowComplete,
										onPurchaseSuccess = onPurchaseSuccess
									},
									purchaseAnalyticsMetadata = { surface = productPurchaseSurface.PaidAccess }
								}))
								
								return
							end
							var23(openCentralOverlayForPurchaseGameModule(var43, name, var40, var41, var42, { var31 }))
						end):catch(function(_) --[[ line: 307 ]]
							-- upvalues: var23 (copy), openCentralOverlayForPurchaseGameModule (copy), var43 (ref), name (copy), var40 (ref), var41 (ref), var42 (ref), var31 (copy)
							var23(openCentralOverlayForPurchaseGameModule(var43, name, var40, var41, var42, { var31 }))
						end)
						
						return
					else
						var23(openCentralOverlayForPurchaseGameModule(p0, name, var40, var41, var42, { var31 }))
						
						return
					end
				elseif p11 == playButtonStatesModule.DemoMode then
					if fFlagLuaAppDemoModePlayButtonTelemetry then
						var38(p12, "DemoPlayButtonClick")
						
						return
					end
					var38(p12)
					
					return
				elseif p11 == playButtonStatesModule.FiatPaidAccess then
					if rootPlaceId and var27 and var27.fiatBasePriceId then
						var23(apiPostPreparePurchaseModule.Fetch(var36, rootPlaceId, p0, var27.fiatBasePriceId))
						unlockPlayIntent(var22, {
							upsellName = "FiatPurchase",
							universeId = p0,
							playabilityStatus = if var28 then var28.playabilityStatus else nil,
							pageName = var31
						})
						
						return
					end
				elseif p11 == playButtonStatesModule.Loading then
					invalidPlayIntent(p2, {
						universeId = p0,
						playButtonState = p11,
						playabilityStatus = if var28 then var28.playabilityStatus else nil,
						pageName = if fFlagLuaAppPlayButtonLoadingDurationTelemetry then var31 else nil
					})
					
					if fFlagLuaAppLaunchWhenLoadingForce_1 then
						var38(p12)
					end
					return
				elseif getFFlagIsSquadEnabled() and p11 == playButtonStatesModule.PlayableWithParty then
					if not rootPlaceId then return end
					var23(createExperienceInvite(rootPlaceId, var32, if fFlagEnableSquadRegroupExperimentation then squadExperienceInviteSource.Default else nil, if fFlagEnablePrivatePartyStartJoin and p13 and p13.isPrivateParty then squadExperienceInviteType.PlayWithPartyInPrivatePartyServer else nil))
					
					return
				elseif includeWaitingForPartyInCondition and p11 == playButtonStatesModule.WaitingForParty then
					invalidPlayIntent(p2, {
						universeId = p0,
						playButtonState = p11,
						playabilityStatus = if var28 then var28.playabilityStatus else nil,
						pageName = if fFlagLuaAppPlayButtonLoadingDurationTelemetry then var31 else nil
					})
					
					return
				elseif p11 == playButtonStatesModule.UnplayableOther then
					invalidPlayIntent(p2, {
						universeId = p0,
						playButtonState = p11,
						playabilityStatus = if var28 then var28.playabilityStatus else nil,
						pageName = if fFlagLuaAppPlayButtonLoadingDurationTelemetry then var31 else nil
					})
					
					return
				end
				error(`invalid play button state {p11}!`)
			end, {
				var20, var21, canPerformBinaryUpdateEnabledEngineFeature, p0,
				if getFFlagLuaAppEnableVirtualEventPlaceId() then p5 else nil, rootPlaceId,
				name, p1, p2, var38, var27, var31,
				if getFFlagIsSquadEnabled() then var32 else nil, var28, var23, var22,
				if fFlagMigrateGameIconsToStore then var30 else var29, var36,
				if fFlagLuaAppLaunchWhenLoadingForce or fFlagLuaAppLaunchWhenLoadingEdp then fFlagLuaAppLaunchWhenLoadingForce_1 else nil
			})
		end
	end
end