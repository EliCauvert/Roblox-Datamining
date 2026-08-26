local httpService = game:GetService("HttpService")
local userInputService = game:GetService("UserInputService")
local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local appBloxModule = require(parent.AppBlox)
local centralOverlayModule = require(parent.CentralOverlay)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local loggersModule = require(parent.Loggers)
local loggingProtocolModule = require(parent.LoggingProtocol)
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local roactServiceTagsModule = require(parent.RoactServiceTags)
local roactUtilsModule = require(parent.RoactUtils)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local robloxAppToastsRoduxModule = require(parent.RobloxAppToastsRodux)
local sharedFlagsModule = require(parent.SharedFlags)
local userSignalsModule = require(parent.UserSignals)
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local selectors = require(parent.NavigationRodux).Selectors
local getOverflowMenuSignalStore = appBloxModule.getOverflowMenuSignalStore
local overflowMenu = appBloxModule.OverflowMenu
local closeCentralOverlay = centralOverlayModule.Thunks.CloseCentralOverlay
local setCentralOverlay = centralOverlayModule.Actions.SetCentralOverlay
local useTokens = foundationModule.Hooks.useTokens
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local abuseVectorModule = require(parent.GenericAbuseReporting.AbuseVector)
local openDynamicAbuseReportModule = require(parent.GenericAbuseReporting.OpenDynamicAbuseReport)
local useLocalization = localizationModule.Hooks.useLocalization
local mutedError = loggersModule.mutedError
local flaggedMutedError = loggersModule.flaggedMutedError
local default = loggingProtocolModule.default
local useLastInput = responsiveModule.useLastInput
local roactNetworking = roactServiceTagsModule.RoactNetworking
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local centralOverlayType = robloxAppEnumsModule.CentralOverlayType
local useRoactService = robloxAppHooksModule.useRoactService
local setNetworkingErrorToast = robloxAppToastsRoduxModule.Thunks.SetNetworkingErrorToast
local postSendUserSignal = userSignalsModule.PostSendUserSignal
local userSignalTypes = userSignalsModule.UserSignalTypes
local gameTileOverflowMenuAction = discoveryAnalyticsModule.Events.gameTileOverflowMenuAction
local notInterestedUserSignalTelemetryEventConfigsModule = require(gameTile.NotInterestedUserSignalTelemetryEventConfigs)
local sendNotInterestedFeedbackFormAnalyticsModule = require(gameTile.sendNotInterestedFeedbackFormAnalytics)
local useGameTileActionsModule = require(gameTile.useGameTileActions)
local useGameTileOverflowMenuFocusNavigationModule = require(gameTile.useGameTileOverflowMenuFocusNavigation)
local tileOverflowMenuItems = require(gameTile.GameTileConstants).TileOverflowMenuItems
local fFlagUseNavigationSelectors = sharedFlagsModule.FFlagUseNavigationSelectors
local fFlagSignalsNavP3fGameDetails = sharedFlagsModule.FFlagSignalsNavP3fGameDetails
local useSignalState = require(parent.SignalsReact).useSignalState
local var1 = if fFlagSignalsNavP3fGameDetails then require(parent.NavigationRodux).GetLegacyNavigationStore else nil
local fFlagLuaAppMakeDisclaimerOptInForFeedbackForm = sharedFlagsModule.FFlagLuaAppMakeDisclaimerOptInForFeedbackForm
local fFlagLuaAppNotInterestedFeedbackFormTelemetry = sharedFlagsModule.FFlagLuaAppNotInterestedFeedbackFormTelemetry
local fFlagLuaAppFixExplicitFeedbackTelemetry = sharedFlagsModule.FFlagLuaAppFixExplicitFeedbackTelemetry
local fFlagLuaAppEnableSponsoredReportAd = sharedFlagsModule.FFlagLuaAppEnableSponsoredReportAd
local fFlagLuaAppContinueSortInstantPlay = sharedFlagsModule.FFlagLuaAppContinueSortInstantPlay
local fFlagLuaAppFixExplicitFeedbackConsoleTelemetry = sharedFlagsModule.FFlagLuaAppFixExplicitFeedbackConsoleTelemetry
local fFlagLuaAppNotInterestedReportPlaceId = sharedFlagsModule.FFlagLuaAppNotInterestedReportPlaceId
local fFlagLuaAppEnableHomepageOneByTwoTile = sharedFlagsModule.FFlagLuaAppEnableHomepageOneByTwoTile
local fFlagLuaAppGameTileNotInterestedDirectAction = sharedFlagsModule.FFlagLuaAppGameTileNotInterestedDirectAction

return reactModule.memo(function(p1)
	-- upvalues: fFlagLuaAppGameTileNotInterestedDirectAction (ref), useTokens (ref), useLastInput (ref), getOverflowMenuSignalStore (ref), reactModule (ref), fFlagLuaAppFixExplicitFeedbackTelemetry (ref), fFlagLuaAppEnableHomepageOneByTwoTile (ref), gameTileOverflowMenuAction (ref), fFlagLuaAppFixExplicitFeedbackConsoleTelemetry (ref), useGameTileOverflowMenuFocusNavigationModule (ref), useGameTileActionsModule (ref), fFlagSignalsNavP3fGameDetails (ref), useSignalState (ref), var1 (ref), useSelector (ref), fFlagUseNavigationSelectors (ref), selectors (ref), userInputService (ref), overflowMenu (ref), responsiveModule (ref), iconSize (ref), useDispatch (ref), useRoactService (ref), roactNetworking (ref), useLocalization (ref), fFlagLuaAppEnableSponsoredReportAd (ref), fFlagLuaAppContinueSortInstantPlay (ref), userSignalTypes (ref), fFlagLuaAppNotInterestedReportPlaceId (ref), flaggedMutedError (ref), openDynamicAbuseReportModule (ref), abuseVectorModule (ref), closeCentralOverlay (ref), default (ref), notInterestedUserSignalTelemetryEventConfigsModule (ref), setNetworkingErrorToast (ref), postSendUserSignal (ref), httpService (ref), mutedError (ref), fFlagLuaAppNotInterestedFeedbackFormTelemetry (ref), sendNotInterestedFeedbackFormAnalyticsModule (ref), fFlagLuaAppMakeDisclaimerOptInForFeedbackForm (ref), tileOverflowMenuItems (ref), setCentralOverlay (ref), centralOverlayType (ref), iconName (ref)
	local var2
	if fFlagLuaAppGameTileNotInterestedDirectAction then
		local var3 = useTokens()
		local var4 = useLastInput()
		local menuKey = p1.menuKey
		local vector2 = Vector2.new(1, 0)
		local uDim2 = UDim2.new(1, -var3.Padding.Medium, 0, var3.Padding.Medium)
		local var5 = getOverflowMenuSignalStore()
		local collectionId = p1.collectionId or ""
		local t = {}
		
		for i, v in p1.availableMenuItems do
			table.insert(t, i)
		end
		local joined = table.concat(t, ",")
		local var6 = reactModule.useCallback(function(p2)
			-- upvalues: p1 (ref), joined (ref)
			if p1.onMenuOpenChanged then
				p1.onMenuOpenChanged(p2, joined)
			end
		end, { p1.onMenuOpenChanged, joined })
		local var7 = if not fFlagLuaAppFixExplicitFeedbackConsoleTelemetry then useGameTileOverflowMenuFocusNavigationModule(menuKey, p1.isSelected, p1.parentRef) else nil
		local var8 = useGameTileActionsModule(p1, reactModule.useCallback(function(p2)
			-- upvalues: fFlagLuaAppFixExplicitFeedbackTelemetry (copy), p1 (ref), collectionId (ref), joined (ref), fFlagLuaAppEnableHomepageOneByTwoTile (copy), gameTileOverflowMenuAction (copy)
			gameTileOverflowMenuAction({
				actionType = "GameTileOverflowMenuItemActivated",
				ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p1.appPage,
				universeId = p1.universeId,
				sortId = collectionId,
				menuItem = p2,
				availableMenuItems = joined,
				contentType = if fFlagLuaAppEnableHomepageOneByTwoTile then p1.contentType else nil
			}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p1.appPage else nil)
		end, {
			p1.appPage,
			p1.universeId,
			collectionId,
			joined,
			if fFlagLuaAppEnableHomepageOneByTwoTile then p1.contentType else nil
		}))
		
		if fFlagLuaAppFixExplicitFeedbackConsoleTelemetry then
			var7 = useGameTileOverflowMenuFocusNavigationModule(menuKey, p1.isSelected, p1.parentRef, var6)
		end
		var2 = if fFlagSignalsNavP3fGameDetails then useSignalState(var1(false).getCurrentRouteKey) else useSelector(function(p2)
			-- upvalues: fFlagUseNavigationSelectors (copy), selectors (copy)
			return if fFlagUseNavigationSelectors then selectors.selectCurrentRoactNavigationRoute(p2).key or "" else p2.Navigation.currentRoute.key or ""
		end)
		local var9 = reactModule.useRef(var2)
		reactModule.useEffect(function()
			-- upvalues: var2 (write), var9 (ref), var5 (ref), menuKey (ref)
			if var2 ~= var9.current then
				var5.closeMenu(menuKey)
			end
		end, { var2, menuKey, var5.closeMenu })
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), userInputService (copy), var5 (ref), menuKey (ref)
			local var10 = if p1.menuOpen then userInputService.InputBegan:Connect(function(p2, _)
				-- upvalues: p1 (copy), var5 (copy), menuKey (copy)
				if p2.UserInputType == Enum.UserInputType.MouseButton1 and not p1.isHovered then
					var5.closeMenu(menuKey)
				end
			end) else nil
			
			return function()
				-- upvalues: var10 (write)
				if var10 then
					var10:Disconnect()
				end
			end
		end, { p1.menuOpen, p1.isHovered, menuKey, var5.closeMenu })
		
		return reactModule.createElement(overflowMenu, {
			anchorPoint = vector2,
			anchorPosition = uDim2,
			menuItems = var8,
			hasOverflowButton = var4 == responsiveModule.Input.Pointer,
			shouldShowAnchor = p1.isHovered,
			buttonIconBackgroundStyle = var3.Color.OverMedia.OverMedia_0,
			menuKey = menuKey,
			setFocusRef = var7,
			onMenuOpenChanged = var6,
			buttonIconSize = iconSize.Small
		})
	else
		local var10 = useDispatch()
		local var11 = useTokens()
		local var12 = useLastInput()
		local var13 = useRoactService(roactNetworking)
		local var14 = useLocalization({
			notInterested = "Feature.GameDetails.Action.NotInterested",
			whyThisAd = "Feature.GameDetails.Action.WhyThisAd",
			dialogTitle = "Feature.GameDetails.Label.ProvideFeedbackTitle",
			dialogText = "Feature.GameDetails.Message.HelpImproveExperience",
			checkboxListTitle = "Feature.GameDetails.Message.HidingExperienceQuestion",
			tooRepetitive = "Feature.GameDetails.Label.TooRepetitive",
			dontLikeGame = "Feature.GameDetails.Label.DontLikeGame",
			dontLikeImage = "Feature.GameDetails.Label.DontLikeImage",
			inappropriateContent = "Feature.GameDetails.Label.InappropriateContent",
			somethingElse = "Feature.GameDetails.Label.SomethingElse",
			reportAd = if fFlagLuaAppEnableSponsoredReportAd then "Feature.GameDetails.Action.ReportAd" else nil,
			gameDetails = if fFlagLuaAppContinueSortInstantPlay then "Feature.GameDetails.Action.GameDetails" else nil
		})
		local collectionId = p1.collectionId or ""
		local menuKey = p1.menuKey
		local vector2 = Vector2.new(1, 0)
		local uDim2 = UDim2.new(1, -var11.Padding.Medium, 0, var11.Padding.Medium)
		local var15 = getOverflowMenuSignalStore()
		local var16 = if not fFlagLuaAppFixExplicitFeedbackConsoleTelemetry then useGameTileOverflowMenuFocusNavigationModule(menuKey, p1.isSelected, p1.parentRef) else nil
		local var17 = reactModule.useMemo(function()
			-- upvalues: userSignalTypes (copy), var14 (ref)
			return {
				{
					id = userSignalTypes.NotInterestedFeedbackItem.TooRepetitive,
					text = var14.tooRepetitive
				},
				{
					id = userSignalTypes.NotInterestedFeedbackItem.DontLikeGame,
					text = var14.dontLikeGame
				},
				{
					id = userSignalTypes.NotInterestedFeedbackItem.DontLikeImage,
					text = var14.dontLikeImage
				},
				{
					id = userSignalTypes.NotInterestedFeedbackItem.InappropriateContent,
					text = var14.inappropriateContent
				},
				{
					triggersOtherTextbox = true,
					id = userSignalTypes.NotInterestedFeedbackItem.SomethingElse,
					text = var14.somethingElse
				}
			}
		end, { var14 })
		local var18 = reactModule.useCallback(function(p2, p3)
			-- upvalues: var17 (ref), userSignalTypes (copy), fFlagLuaAppNotInterestedReportPlaceId (copy), p1 (ref), flaggedMutedError (copy), var10 (ref), openDynamicAbuseReportModule (copy), abuseVectorModule (copy), closeCentralOverlay (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy), setNetworkingErrorToast (copy), postSendUserSignal (copy), var13 (ref), httpService (copy), collectionId (ref), mutedError (copy), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), sendNotInterestedFeedbackFormAnalyticsModule (copy), fFlagLuaAppFixExplicitFeedbackTelemetry (copy)
			local var19 = false
			local t = {}
			
			for i, v in var17 do
				table.insert(t, { id = v.id, selected = p2[v.id] or false })
				
				if v.id == userSignalTypes.NotInterestedFeedbackItem.InappropriateContent and p2[v.id] then
					var19 = true
				end
			end
			if var19 then
				if fFlagLuaAppNotInterestedReportPlaceId and (not p1.placeId or p1.placeId == "") then
					flaggedMutedError("NotInterestedReportPlaceIdMissing", "Place report opened without a place id")
				else
					var10(openDynamicAbuseReportModule({
						abuseVector = abuseVectorModule.Place,
						targetId = if fFlagLuaAppNotInterestedReportPlaceId then p1.placeId else p1.universeId,
						onClose = function()
							-- upvalues: var10 (copy), closeCentralOverlay (copy)
							var10(closeCentralOverlay())
						end
					}))
				end
			end
			if not p1.appPage then
				default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedMissingAppPage, 1)
				var10(setNetworkingErrorToast())
				
				return
			end
			local ok, status = pcall(function()
				-- upvalues: postSendUserSignal (copy), var13 (copy), httpService (copy), userSignalTypes (copy), p3 (ref), t (ref), p1 (copy), collectionId (copy), var10 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
				postSendUserSignal(var13, {
					stringValue = httpService:JSONEncode({
						formId = userSignalTypes.NotInterestedFeedbackFormId.NotInterestedFeedback1,
						titleId = userSignalTypes.NotInterestedFeedbackFormTitleId.WhyHideExperience,
						textResponse = p3,
						items = t
					})
				}, {
					id = p1.universeId,
					assetType = if p1.isSponsored then userSignalTypes.AssetType.SponsoredGame else userSignalTypes.AssetType.Game,
					signalOrigin = {
						productSurface = p1.appPage,
						topicId = collectionId,
						subIds = { collectionId }
					}
				}, userSignalTypes.SignalValueType.String, userSignalTypes.SignalType.NotInterestedFeedback):catch(function(p4)
					-- upvalues: var10 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
					var10(setNetworkingErrorToast(p4))
					default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedUserSignalFailed, 1)
				end)
			end)
			
			if not ok then
				mutedError(status)
			end
			if fFlagLuaAppNotInterestedFeedbackFormTelemetry then
				sendNotInterestedFeedbackFormAnalyticsModule({
					actionType = "NotInterestedFeedbackFormSubmitted",
					ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p1.appPage,
					universeId = p1.universeId,
					sortId = collectionId
				}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p1.appPage else nil)
			end
		end, {
			var13, var17, var14, p1.universeId,
			if fFlagLuaAppNotInterestedReportPlaceId then p1.placeId else nil, p1.appPage,
			collectionId, var10, p1.isSponsored
		})
		var2 = nil
		local var20 = nil
		
		if fFlagLuaAppNotInterestedFeedbackFormTelemetry then
			var2 = reactModule.useCallback(function(p4)
				-- upvalues: sendNotInterestedFeedbackFormAnalyticsModule (copy), fFlagLuaAppFixExplicitFeedbackTelemetry (copy), p1 (ref), collectionId (ref)
				if p4 then
					return
				end
				sendNotInterestedFeedbackFormAnalyticsModule({
					actionType = "NotInterestedFeedbackFormClosedWithoutSubmit",
					ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p1.appPage,
					universeId = p1.universeId,
					sortId = collectionId
				}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p1.appPage else nil)
			end, { p1.appPage, p1.universeId, collectionId })
			var20 = reactModule.useCallback(function()
				-- upvalues: sendNotInterestedFeedbackFormAnalyticsModule (copy), fFlagLuaAppFixExplicitFeedbackTelemetry (copy), p1 (ref), collectionId (ref)
				sendNotInterestedFeedbackFormAnalyticsModule({
					actionType = "NotInterestedFeedbackFormOpened",
					ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p1.appPage,
					universeId = p1.universeId,
					sortId = collectionId
				}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p1.appPage else nil)
			end, { p1.appPage, p1.universeId, collectionId })
		end
		local var21 = reactModule.useMemo(function()
			-- upvalues: var14 (ref), var17 (ref), var18 (ref), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), var2 (write), fFlagLuaAppMakeDisclaimerOptInForFeedbackForm (copy)
			return {
				dialogTitle = var14.dialogTitle,
				dialogText = var14.dialogText,
				checkboxListTitle = var14.checkboxListTitle,
				checkboxItems = var17,
				onSubmit = var18,
				onClose = if fFlagLuaAppNotInterestedFeedbackFormTelemetry then var2 else nil,
				showTermsOfUseDisclaimer = if fFlagLuaAppMakeDisclaimerOptInForFeedbackForm then false else nil
			}
		end, { var14, var17, var18 })
		local t = {}
		
		for i, v in p1.availableMenuItems do
			table.insert(t, i)
		end
		local joined = table.concat(t, ",")
		local var22 = reactModule.useCallback(function(p4)
			-- upvalues: p1 (ref), joined (ref)
			if p1.onMenuOpenChanged then
				p1.onMenuOpenChanged(p4, joined)
			end
		end, { p1.onMenuOpenChanged, joined })
		local var23 = reactModule.useCallback(function(p4)
			-- upvalues: fFlagLuaAppFixExplicitFeedbackTelemetry (copy), p1 (ref), collectionId (ref), joined (ref), fFlagLuaAppEnableHomepageOneByTwoTile (copy), gameTileOverflowMenuAction (copy)
			gameTileOverflowMenuAction({
				actionType = "GameTileOverflowMenuItemActivated",
				ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p1.appPage,
				universeId = p1.universeId,
				sortId = collectionId,
				menuItem = p4,
				availableMenuItems = joined,
				contentType = if fFlagLuaAppEnableHomepageOneByTwoTile then p1.contentType else nil
			}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p1.appPage else nil)
		end, {
			p1.appPage,
			p1.universeId,
			collectionId,
			joined,
			if fFlagLuaAppEnableHomepageOneByTwoTile then p1.contentType else nil
		})
		
		if fFlagLuaAppFixExplicitFeedbackConsoleTelemetry then
			var16 = useGameTileOverflowMenuFocusNavigationModule(menuKey, p1.isSelected, p1.parentRef, var22)
		end
		local var24 = if fFlagLuaAppContinueSortInstantPlay then reactModule.useCallback(function()
			-- upvalues: p1 (ref), var23 (ref), tileOverflowMenuItems (copy)
			if p1.onGameDetailsActivated then
				p1.onGameDetailsActivated()
			end
			var23(tileOverflowMenuItems.GameDetails)
		end, { p1.onGameDetailsActivated, var23 }) else nil
		local var25 = reactModule.useCallback(function()
			-- upvalues: p1 (ref), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy), var10 (ref), setNetworkingErrorToast (copy), setCentralOverlay (copy), centralOverlayType (copy), var21 (ref), iconName (copy), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), var20 (write), postSendUserSignal (copy), var13 (ref), userSignalTypes (copy), collectionId (ref), mutedError (copy), var23 (ref), tileOverflowMenuItems (copy)
			if not p1.appPage then
				default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedMissingAppPage, 1)
				var10(setNetworkingErrorToast())
				
				return
			end
			p1.setGameHidden(p1.universeId, true)
			var10(setCentralOverlay(centralOverlayType.ProvideFeedbackToast, {
				feedbackFormProps = var21,
				toastIcon = iconName.CircleMinus,
				onToastActivated = if fFlagLuaAppNotInterestedFeedbackFormTelemetry then var20 else nil
			}))
			local ok, status = pcall(function()
				-- upvalues: postSendUserSignal (copy), var13 (copy), p1 (copy), userSignalTypes (copy), collectionId (copy), var10 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
				postSendUserSignal(var13, { boolValue = true }, {
					id = p1.universeId,
					assetType = if p1.isSponsored then userSignalTypes.AssetType.SponsoredGame else userSignalTypes.AssetType.Game,
					signalOrigin = {
						productSurface = p1.appPage,
						topicId = collectionId,
						subIds = { collectionId }
					}
				}, userSignalTypes.SignalValueType.Bool, userSignalTypes.SignalType.NotInterested):catch(function(p4)
					-- upvalues: p1 (copy), var10 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
					p1.setGameHidden(p1.universeId, false)
					var10(setNetworkingErrorToast(p4))
					default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedUserSignalFailed, 1)
				end)
			end)
			
			if not ok then
				p1.setGameHidden(p1.universeId, false)
				mutedError(status)
			end
			var23(tileOverflowMenuItems.NotInterested)
		end, {
			var13, p1.setGameHidden, var10, var21, p1.universeId, collectionId, p1.appPage,
			var23, p1.isSponsored
		})
		local var26 = reactModule.useCallback(function()
			-- upvalues: var10 (ref), setCentralOverlay (copy), centralOverlayType (copy), p1 (ref), fFlagLuaAppEnableHomepageOneByTwoTile (copy), var23 (ref), tileOverflowMenuItems (copy)
			var10(setCentralOverlay(centralOverlayType.WhyThisAdModal, {
				universeId = p1.universeId,
				payerName = p1.payerName,
				sponsoredUserCohort = p1.sponsoredUserCohort,
				contentType = if fFlagLuaAppEnableHomepageOneByTwoTile then p1.contentType else nil
			}))
			var23(tileOverflowMenuItems.WhyThisAd)
		end, {
			var10, p1.universeId, p1.payerName, p1.sponsoredUserCohort,
			if fFlagLuaAppEnableHomepageOneByTwoTile then p1.contentType else nil, var23
		})
		local var27 = if fFlagLuaAppEnableSponsoredReportAd then reactModule.useCallback(function()
			-- upvalues: p1 (ref), flaggedMutedError (copy), var10 (ref), openDynamicAbuseReportModule (copy), abuseVectorModule (copy), closeCentralOverlay (copy), var23 (ref), tileOverflowMenuItems (copy)
			if p1.adId then
				var10(openDynamicAbuseReportModule({
					abuseVector = abuseVectorModule.AdV2,
					targetId = p1.adId,
					onClose = function()
						-- upvalues: var10 (copy), closeCentralOverlay (copy)
						var10(closeCentralOverlay())
					end
				}))
				var23(tileOverflowMenuItems.ReportAd)
				
				return
			end
			flaggedMutedError("ReportSponsoredAdError", "Report ad clicked without valid target ad id")
		end, { var10, p1.adId, var23 }) else nil
		local var28 = reactModule.useMemo(function()
			-- upvalues: fFlagLuaAppContinueSortInstantPlay (copy), p1 (ref), tileOverflowMenuItems (copy), var14 (ref), var24 (ref), var25 (ref), var26 (ref), fFlagLuaAppEnableSponsoredReportAd (copy), iconName (copy), var27 (ref)
			local t = {}
			
			if fFlagLuaAppContinueSortInstantPlay and p1.availableMenuItems[tileOverflowMenuItems.GameDetails] then
				table.insert(t, {
					icon = "icons/actions/info",
					id = tileOverflowMenuItems.GameDetails,
					text = var14.gameDetails,
					onActivated = var24
				})
			end
			if p1.availableMenuItems[tileOverflowMenuItems.NotInterested] then
				table.insert(t, {
					icon = "icons/actions/block",
					id = tileOverflowMenuItems.NotInterested,
					text = var14.notInterested,
					onActivated = var25
				})
			end
			if p1.availableMenuItems[tileOverflowMenuItems.WhyThisAd] then
				table.insert(t, {
					icon = "icons/actions/info",
					id = tileOverflowMenuItems.WhyThisAd,
					text = var14.whyThisAd,
					onActivated = var26
				})
			end
			if fFlagLuaAppEnableSponsoredReportAd and p1.availableMenuItems[tileOverflowMenuItems.ReportAd] then
				table.insert(t, {
					icon = iconName.Flag,
					id = tileOverflowMenuItems.ReportAd,
					text = var14.reportAd,
					onActivated = var27
				})
			end
			return t
		end, {
			if fFlagLuaAppContinueSortInstantPlay then var24 else nil, var25, var14, var26,
			p1.isSponsored, p1.availableMenuItems
		})
		local var29 = if fFlagSignalsNavP3fGameDetails then useSignalState(var1(false).getCurrentRouteKey) else useSelector(function(p4)
			-- upvalues: fFlagUseNavigationSelectors (copy), selectors (copy)
			return if fFlagUseNavigationSelectors then selectors.selectCurrentRoactNavigationRoute(p4).key or "" else p4.Navigation.currentRoute.key or ""
		end)
		local var30 = reactModule.useRef(var29)
		reactModule.useEffect(function()
			-- upvalues: var29 (write), var30 (ref), var15 (ref), menuKey (ref)
			if var29 ~= var30.current then
				var15.closeMenu(menuKey)
			end
		end, { var29, menuKey })
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), userInputService (copy), var15 (ref), menuKey (ref)
			local var31 = if p1.menuOpen then userInputService.InputBegan:Connect(function(p4, _)
				-- upvalues: p1 (copy), var15 (copy), menuKey (copy)
				if p4.UserInputType == Enum.UserInputType.MouseButton1 and not p1.isHovered then
					var15.closeMenu(menuKey)
				end
			end) else nil
			
			return function()
				-- upvalues: var31 (write)
				if var31 then
					var31:Disconnect()
				end
			end
		end, { p1.menuOpen, p1.isHovered, menuKey })
		
		return reactModule.createElement(overflowMenu, {
			anchorPoint = vector2,
			anchorPosition = uDim2,
			menuItems = var28,
			hasOverflowButton = var12 == responsiveModule.Input.Pointer,
			shouldShowAnchor = p1.isHovered,
			buttonIconBackgroundStyle = var11.Color.OverMedia.OverMedia_0,
			menuKey = menuKey,
			setFocusRef = var16,
			onMenuOpenChanged = var22,
			buttonIconSize = iconSize.Small
		})
	end
end)