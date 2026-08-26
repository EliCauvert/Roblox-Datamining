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
local fFlagLuaAppAdjustOverflowMenuVisual = sharedFlagsModule.FFlagLuaAppAdjustOverflowMenuVisual
local fFlagLuaAppContinueSortInstantPlay = sharedFlagsModule.FFlagLuaAppContinueSortInstantPlay
local fFlagLuaAppFixExplicitFeedbackConsoleTelemetry = sharedFlagsModule.FFlagLuaAppFixExplicitFeedbackConsoleTelemetry
local fFlagLuaAppNotInterestedReportPlaceId = sharedFlagsModule.FFlagLuaAppNotInterestedReportPlaceId
local fFlagLuaAppEnableHomepageOneByTwoTile = sharedFlagsModule.FFlagLuaAppEnableHomepageOneByTwoTile
local fFlagLuaAppGameTileNotInterestedDirectAction = sharedFlagsModule.FFlagLuaAppGameTileNotInterestedDirectAction

return reactModule.memo(function(p1)
	-- upvalues: fFlagLuaAppGameTileNotInterestedDirectAction (ref), useTokens (ref), useLastInput (ref), fFlagLuaAppAdjustOverflowMenuVisual (ref), getOverflowMenuSignalStore (ref), reactModule (ref), fFlagLuaAppFixExplicitFeedbackTelemetry (ref), fFlagLuaAppEnableHomepageOneByTwoTile (ref), gameTileOverflowMenuAction (ref), fFlagLuaAppFixExplicitFeedbackConsoleTelemetry (ref), useGameTileOverflowMenuFocusNavigationModule (ref), useGameTileActionsModule (ref), fFlagSignalsNavP3fGameDetails (ref), useSignalState (ref), var1 (ref), useSelector (ref), fFlagUseNavigationSelectors (ref), selectors (ref), userInputService (ref), overflowMenu (ref), responsiveModule (ref), iconSize (ref), useDispatch (ref), useRoactService (ref), roactNetworking (ref), useLocalization (ref), fFlagLuaAppEnableSponsoredReportAd (ref), fFlagLuaAppContinueSortInstantPlay (ref), userSignalTypes (ref), fFlagLuaAppNotInterestedReportPlaceId (ref), flaggedMutedError (ref), openDynamicAbuseReportModule (ref), abuseVectorModule (ref), closeCentralOverlay (ref), default (ref), notInterestedUserSignalTelemetryEventConfigsModule (ref), setNetworkingErrorToast (ref), postSendUserSignal (ref), httpService (ref), mutedError (ref), fFlagLuaAppNotInterestedFeedbackFormTelemetry (ref), sendNotInterestedFeedbackFormAnalyticsModule (ref), fFlagLuaAppMakeDisclaimerOptInForFeedbackForm (ref), tileOverflowMenuItems (ref), setCentralOverlay (ref), centralOverlayType (ref), iconName (ref)
	local var2
	if fFlagLuaAppGameTileNotInterestedDirectAction then
		local var3 = useTokens()
		local var4 = useLastInput()
		local menuKey = p1.menuKey
		local vector2 = Vector2.new(1, 0)
		local uDim2 = UDim2.new(1, if fFlagLuaAppAdjustOverflowMenuVisual then -var3.Padding.Medium else -var3.Padding.Small, 0, if fFlagLuaAppAdjustOverflowMenuVisual then var3.Padding.Medium else var3.Padding.Small)
		local var5 = getOverflowMenuSignalStore()
		local collectionId = p1.collectionId or ""
		local t = {}
		
		for i, v in p1.availableMenuItems do
			table.insert(t, i)
		end
		local joined = table.concat(t, ",")
		local var6 = reactModule.useCallback(function(p2)
			-- upvalues: p2 (ref), joined (ref)
			if p2.onMenuOpenChanged then
				p2.onMenuOpenChanged(p2, joined)
			end
		end, { p1.onMenuOpenChanged, joined })
		local var7 = if not fFlagLuaAppFixExplicitFeedbackConsoleTelemetry then useGameTileOverflowMenuFocusNavigationModule(menuKey, p1.isSelected, p1.parentRef) else nil
		local var8 = useGameTileActionsModule(p1, reactModule.useCallback(function(p2)
			-- upvalues: fFlagLuaAppFixExplicitFeedbackTelemetry (copy), p2 (ref), collectionId (ref), joined (ref), fFlagLuaAppEnableHomepageOneByTwoTile (copy), gameTileOverflowMenuAction (copy)
			gameTileOverflowMenuAction({
				actionType = "GameTileOverflowMenuItemActivated",
				ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p2.appPage,
				universeId = p2.universeId,
				sortId = collectionId,
				menuItem = p2,
				availableMenuItems = joined,
				contentType = if fFlagLuaAppEnableHomepageOneByTwoTile then p2.contentType else nil
			}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p2.appPage else nil)
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
		var2 = if fFlagSignalsNavP3fGameDetails then useSignalState(var2(false).getCurrentRouteKey) else useSelector(function(p2)
			-- upvalues: fFlagUseNavigationSelectors (copy), selectors (copy)
			return if fFlagUseNavigationSelectors then selectors.selectCurrentRoactNavigationRoute(p2).key or "" else p2.Navigation.currentRoute.key or ""
		end)
		local var2 = reactModule.useRef(var2)
		reactModule.useEffect(function()
			-- upvalues: var2 (write), var2 (ref), var5 (ref), menuKey (ref)
			if var2 ~= var2.current then
				var5.closeMenu(menuKey)
			end
		end, { var2, menuKey, var5.closeMenu })
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), userInputService (copy), var5 (ref), menuKey (ref)
			local var9 = if p1.menuOpen then userInputService.InputBegan:Connect(function(p2, _)
				-- upvalues: p2 (copy), var5 (copy), menuKey (copy)
				if p2.UserInputType == Enum.UserInputType.MouseButton1 and not p2.isHovered then
					var5.closeMenu(menuKey)
				end
			end) else nil
			
			return function()
				-- upvalues: var9 (write)
				if var9 then
					var9:Disconnect()
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
			buttonIconSize = if fFlagLuaAppAdjustOverflowMenuVisual then iconSize.Small else nil
		})
	else
		local var3 = useDispatch()
		local var4 = useTokens()
		local var5 = useLastInput()
		local var6 = useRoactService(roactNetworking)
		local var7 = useLocalization({
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
		local uDim2 = UDim2.new(1, if fFlagLuaAppAdjustOverflowMenuVisual then -var4.Padding.Medium else -var4.Padding.Small, 0, if fFlagLuaAppAdjustOverflowMenuVisual then var4.Padding.Medium else var4.Padding.Small)
		local var8 = getOverflowMenuSignalStore()
		local var9 = if not fFlagLuaAppFixExplicitFeedbackConsoleTelemetry then useGameTileOverflowMenuFocusNavigationModule(menuKey, p1.isSelected, p1.parentRef) else nil
		local var10 = reactModule.useMemo(function()
			-- upvalues: userSignalTypes (copy), var7 (ref)
			return {
				{
					id = userSignalTypes.NotInterestedFeedbackItem.TooRepetitive,
					text = var7.tooRepetitive
				},
				{
					id = userSignalTypes.NotInterestedFeedbackItem.DontLikeGame,
					text = var7.dontLikeGame
				},
				{
					id = userSignalTypes.NotInterestedFeedbackItem.DontLikeImage,
					text = var7.dontLikeImage
				},
				{
					id = userSignalTypes.NotInterestedFeedbackItem.InappropriateContent,
					text = var7.inappropriateContent
				},
				{
					triggersOtherTextbox = true,
					id = userSignalTypes.NotInterestedFeedbackItem.SomethingElse,
					text = var7.somethingElse
				}
			}
		end, { var7 })
		local var11 = reactModule.useCallback(function(p2, p3)
			-- upvalues: var10 (ref), userSignalTypes (copy), fFlagLuaAppNotInterestedReportPlaceId (copy), p2 (ref), flaggedMutedError (copy), var3 (ref), openDynamicAbuseReportModule (copy), abuseVectorModule (copy), closeCentralOverlay (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy), setNetworkingErrorToast (copy), postSendUserSignal (copy), var6 (ref), httpService (copy), collectionId (ref), mutedError (copy), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), sendNotInterestedFeedbackFormAnalyticsModule (copy), fFlagLuaAppFixExplicitFeedbackTelemetry (copy)
			local var12 = false
			local t = {}
			
			for i, v in var10 do
				table.insert(t, { id = v.id, selected = p2[v.id] or false })
				
				if v.id == userSignalTypes.NotInterestedFeedbackItem.InappropriateContent and p2[v.id] then
					var12 = true
				end
			end
			if var12 then
				if fFlagLuaAppNotInterestedReportPlaceId and (not p2.placeId or p2.placeId == "") then
					flaggedMutedError("NotInterestedReportPlaceIdMissing", "Place report opened without a place id")
				else
					var3(openDynamicAbuseReportModule({
						abuseVector = abuseVectorModule.Place,
						targetId = if fFlagLuaAppNotInterestedReportPlaceId then p2.placeId else p2.universeId,
						onClose = function()
							-- upvalues: var3 (copy), closeCentralOverlay (copy)
							var3(closeCentralOverlay())
						end
					}))
				end
			end
			if not p2.appPage then
				default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedMissingAppPage, 1)
				var3(setNetworkingErrorToast())
				
				return
			end
			local ok, status = pcall(function()
				-- upvalues: postSendUserSignal (copy), var6 (copy), httpService (copy), userSignalTypes (copy), p3 (ref), t (ref), p2 (copy), collectionId (copy), var3 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
				postSendUserSignal(var6, {
					stringValue = httpService:JSONEncode({
						formId = userSignalTypes.NotInterestedFeedbackFormId.NotInterestedFeedback1,
						titleId = userSignalTypes.NotInterestedFeedbackFormTitleId.WhyHideExperience,
						textResponse = p3,
						items = t
					})
				}, {
					id = p2.universeId,
					assetType = if p2.isSponsored then userSignalTypes.AssetType.SponsoredGame else userSignalTypes.AssetType.Game,
					signalOrigin = {
						productSurface = p2.appPage,
						topicId = collectionId,
						subIds = { collectionId }
					}
				}, userSignalTypes.SignalValueType.String, userSignalTypes.SignalType.NotInterestedFeedback):catch(function(p4)
					-- upvalues: var3 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
					var3(setNetworkingErrorToast(p4))
					default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedUserSignalFailed, 1)
				end)
			end)
			
			if not ok then
				mutedError(status)
			end
			if fFlagLuaAppNotInterestedFeedbackFormTelemetry then
				sendNotInterestedFeedbackFormAnalyticsModule({
					actionType = "NotInterestedFeedbackFormSubmitted",
					ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p2.appPage,
					universeId = p2.universeId,
					sortId = collectionId
				}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p2.appPage else nil)
			end
		end, {
			var6, var10, var7, p2.universeId,
			if fFlagLuaAppNotInterestedReportPlaceId then p2.placeId else nil, p2.appPage,
			collectionId, var3, p2.isSponsored
		})
		var12 = nil
		local var12 = nil
		
		if fFlagLuaAppNotInterestedFeedbackFormTelemetry then
			var12 = reactModule.useCallback(function(p4)
				-- upvalues: sendNotInterestedFeedbackFormAnalyticsModule (copy), fFlagLuaAppFixExplicitFeedbackTelemetry (copy), p4 (ref), collectionId (ref)
				if p4 then
					return
				end
				sendNotInterestedFeedbackFormAnalyticsModule({
					actionType = "NotInterestedFeedbackFormClosedWithoutSubmit",
					ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p4.appPage,
					universeId = p4.universeId,
					sortId = collectionId
				}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p4.appPage else nil)
			end, { p2.appPage, p2.universeId, collectionId })
			var12 = reactModule.useCallback(function()
				-- upvalues: sendNotInterestedFeedbackFormAnalyticsModule (copy), fFlagLuaAppFixExplicitFeedbackTelemetry (copy), p2 (ref), collectionId (ref)
				sendNotInterestedFeedbackFormAnalyticsModule({
					actionType = "NotInterestedFeedbackFormOpened",
					ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p2.appPage,
					universeId = p2.universeId,
					sortId = collectionId
				}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p2.appPage else nil)
			end, { p2.appPage, p2.universeId, collectionId })
		end
		local var12 = reactModule.useMemo(function()
			-- upvalues: var7 (ref), var10 (ref), var11 (ref), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), var12 (write), fFlagLuaAppMakeDisclaimerOptInForFeedbackForm (copy)
			return {
				dialogTitle = var7.dialogTitle,
				dialogText = var7.dialogText,
				checkboxListTitle = var7.checkboxListTitle,
				checkboxItems = var10,
				onSubmit = var11,
				onClose = if fFlagLuaAppNotInterestedFeedbackFormTelemetry then var12 else nil,
				showTermsOfUseDisclaimer = if fFlagLuaAppMakeDisclaimerOptInForFeedbackForm then false else nil
			}
		end, { var7, var10, var11 })
		local t = {}
		
		for i, v in p2.availableMenuItems do
			table.insert(t, i)
		end
		local joined = table.concat(t, ",")
		local var12 = reactModule.useCallback(function(p4)
			-- upvalues: p4 (ref), joined (ref)
			if p4.onMenuOpenChanged then
				p4.onMenuOpenChanged(p4, joined)
			end
		end, { p2.onMenuOpenChanged, joined })
		local var13 = reactModule.useCallback(function(p4)
			-- upvalues: fFlagLuaAppFixExplicitFeedbackTelemetry (copy), p4 (ref), collectionId (ref), joined (ref), fFlagLuaAppEnableHomepageOneByTwoTile (copy), gameTileOverflowMenuAction (copy)
			gameTileOverflowMenuAction({
				actionType = "GameTileOverflowMenuItemActivated",
				ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p4.appPage,
				universeId = p4.universeId,
				sortId = collectionId,
				menuItem = p4,
				availableMenuItems = joined,
				contentType = if fFlagLuaAppEnableHomepageOneByTwoTile then p4.contentType else nil
			}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p4.appPage else nil)
		end, {
			p2.appPage,
			p2.universeId,
			collectionId,
			joined,
			if fFlagLuaAppEnableHomepageOneByTwoTile then p2.contentType else nil
		})
		
		if fFlagLuaAppFixExplicitFeedbackConsoleTelemetry then
			var9 = useGameTileOverflowMenuFocusNavigationModule(menuKey, p2.isSelected, p2.parentRef, var12)
		end
		local var12 = if fFlagLuaAppContinueSortInstantPlay then reactModule.useCallback(function()
			-- upvalues: p2 (ref), var13 (ref), tileOverflowMenuItems (copy)
			if p2.onGameDetailsActivated then
				p2.onGameDetailsActivated()
			end
			var13(tileOverflowMenuItems.GameDetails)
		end, { p2.onGameDetailsActivated, var13 }) else nil
		local var13 = reactModule.useCallback(function()
			-- upvalues: p2 (ref), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy), var13 (ref), setNetworkingErrorToast (copy), setCentralOverlay (copy), centralOverlayType (copy), var12 (ref), iconName (copy), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), var12 (write), postSendUserSignal (copy), var6 (ref), userSignalTypes (copy), collectionId (ref), mutedError (copy), var13 (ref), tileOverflowMenuItems (copy)
			if not p2.appPage then
				default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedMissingAppPage, 1)
				var13(setNetworkingErrorToast())
				
				return
			end
			p2.setGameHidden(p2.universeId, true)
			var13(setCentralOverlay(centralOverlayType.ProvideFeedbackToast, {
				feedbackFormProps = var12,
				toastIcon = iconName.CircleMinus,
				onToastActivated = if fFlagLuaAppNotInterestedFeedbackFormTelemetry then var12 else nil
			}))
			local ok, status = pcall(function()
				-- upvalues: postSendUserSignal (copy), var6 (copy), p2 (copy), userSignalTypes (copy), collectionId (copy), var13 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
				postSendUserSignal(var6, { boolValue = true }, {
					id = p2.universeId,
					assetType = if p2.isSponsored then userSignalTypes.AssetType.SponsoredGame else userSignalTypes.AssetType.Game,
					signalOrigin = {
						productSurface = p2.appPage,
						topicId = collectionId,
						subIds = { collectionId }
					}
				}, userSignalTypes.SignalValueType.Bool, userSignalTypes.SignalType.NotInterested):catch(function(p4)
					-- upvalues: p4 (copy), var13 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
					p4.setGameHidden(p4.universeId, false)
					var13(setNetworkingErrorToast(p4))
					default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedUserSignalFailed, 1)
				end)
			end)
			
			if not ok then
				p2.setGameHidden(p2.universeId, false)
				mutedError(status)
			end
			var13(tileOverflowMenuItems.NotInterested)
		end, {
			var6, p2.setGameHidden, var13, var12, p2.universeId, collectionId, p2.appPage,
			var13, p2.isSponsored
		})
		local var12 = reactModule.useCallback(function()
			-- upvalues: var13 (ref), setCentralOverlay (copy), centralOverlayType (copy), p2 (ref), fFlagLuaAppEnableHomepageOneByTwoTile (copy), var13 (ref), tileOverflowMenuItems (copy)
			var13(setCentralOverlay(centralOverlayType.WhyThisAdModal, {
				universeId = p2.universeId,
				payerName = p2.payerName,
				sponsoredUserCohort = p2.sponsoredUserCohort,
				contentType = if fFlagLuaAppEnableHomepageOneByTwoTile then p2.contentType else nil
			}))
			var13(tileOverflowMenuItems.WhyThisAd)
		end, {
			var13, p2.universeId, p2.payerName, p2.sponsoredUserCohort,
			if fFlagLuaAppEnableHomepageOneByTwoTile then p2.contentType else nil, var13
		})
		local var12 = if fFlagLuaAppEnableSponsoredReportAd then reactModule.useCallback(function()
			-- upvalues: p2 (ref), flaggedMutedError (copy), var13 (ref), openDynamicAbuseReportModule (copy), abuseVectorModule (copy), closeCentralOverlay (copy), var13 (ref), tileOverflowMenuItems (copy)
			if p2.adId then
				var13(openDynamicAbuseReportModule({
					abuseVector = abuseVectorModule.AdV2,
					targetId = p2.adId,
					onClose = function()
						-- upvalues: var13 (copy), closeCentralOverlay (copy)
						var13(closeCentralOverlay())
					end
				}))
				var13(tileOverflowMenuItems.ReportAd)
				
				return
			end
			flaggedMutedError("ReportSponsoredAdError", "Report ad clicked without valid target ad id")
		end, { var13, p2.adId, var13 }) else nil
		local var13 = reactModule.useMemo(function()
			-- upvalues: fFlagLuaAppContinueSortInstantPlay (copy), p2 (ref), tileOverflowMenuItems (copy), var7 (ref), var12 (ref), var13 (ref), var12 (ref), fFlagLuaAppEnableSponsoredReportAd (copy), iconName (copy), var12 (ref)
			local t = {}
			
			if fFlagLuaAppContinueSortInstantPlay and p2.availableMenuItems[tileOverflowMenuItems.GameDetails] then
				table.insert(t, {
					icon = "icons/actions/info",
					id = tileOverflowMenuItems.GameDetails,
					text = var7.gameDetails,
					onActivated = var12
				})
			end
			if p2.availableMenuItems[tileOverflowMenuItems.NotInterested] then
				table.insert(t, {
					icon = "icons/actions/block",
					id = tileOverflowMenuItems.NotInterested,
					text = var7.notInterested,
					onActivated = var13
				})
			end
			if p2.availableMenuItems[tileOverflowMenuItems.WhyThisAd] then
				table.insert(t, {
					icon = "icons/actions/info",
					id = tileOverflowMenuItems.WhyThisAd,
					text = var7.whyThisAd,
					onActivated = var12
				})
			end
			if fFlagLuaAppEnableSponsoredReportAd and p2.availableMenuItems[tileOverflowMenuItems.ReportAd] then
				table.insert(t, {
					icon = iconName.Flag,
					id = tileOverflowMenuItems.ReportAd,
					text = var7.reportAd,
					onActivated = var12
				})
			end
			return t
		end, {
			if fFlagLuaAppContinueSortInstantPlay then var12 else nil, var13, var7, var12,
			p2.isSponsored, p2.availableMenuItems
		})
		local var14 = if fFlagSignalsNavP3fGameDetails then useSignalState(var12(false).getCurrentRouteKey) else useSelector(function(p4)
			-- upvalues: fFlagUseNavigationSelectors (copy), selectors (copy)
			return if fFlagUseNavigationSelectors then selectors.selectCurrentRoactNavigationRoute(p4).key or "" else p4.Navigation.currentRoute.key or ""
		end)
		local var12 = reactModule.useRef(var14)
		reactModule.useEffect(function()
			-- upvalues: var14 (write), var12 (ref), var8 (ref), menuKey (ref)
			if var14 ~= var12.current then
				var8.closeMenu(menuKey)
			end
		end, { var14, menuKey })
		reactModule.useEffect(function()
			-- upvalues: p2 (ref), userInputService (copy), var8 (ref), menuKey (ref)
			local var15 = if p2.menuOpen then userInputService.InputBegan:Connect(function(p4, _)
				-- upvalues: p4 (copy), var8 (copy), menuKey (copy)
				if p4.UserInputType == Enum.UserInputType.MouseButton1 and not p4.isHovered then
					var8.closeMenu(menuKey)
				end
			end) else nil
			
			return function()
				-- upvalues: var15 (write)
				if var15 then
					var15:Disconnect()
				end
			end
		end, { p2.menuOpen, p2.isHovered, menuKey })
		
		return reactModule.createElement(overflowMenu, {
			anchorPoint = vector2,
			anchorPosition = uDim2,
			menuItems = var13,
			hasOverflowButton = var5 == responsiveModule.Input.Pointer,
			shouldShowAnchor = p2.isHovered,
			buttonIconBackgroundStyle = var14.Color.OverMedia.OverMedia_0,
			menuKey = menuKey,
			setFocusRef = var9,
			onMenuOpenChanged = var12,
			buttonIconSize = if fFlagLuaAppAdjustOverflowMenuVisual then iconSize.Small else nil
		})
	end
end)