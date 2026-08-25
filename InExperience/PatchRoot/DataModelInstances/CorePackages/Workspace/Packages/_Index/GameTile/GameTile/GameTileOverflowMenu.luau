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
	local var1
	if fFlagLuaAppGameTileNotInterestedDirectAction then
		local var2 = useTokens()
		local var3 = useLastInput()
		local menuKey = p1.menuKey
		local vector2 = Vector2.new(1, 0)
		local uDim2 = UDim2.new(1, if fFlagLuaAppAdjustOverflowMenuVisual then -var2.Padding.Medium else -var2.Padding.Small, 0, if fFlagLuaAppAdjustOverflowMenuVisual then var2.Padding.Medium else var2.Padding.Small)
		local var4 = getOverflowMenuSignalStore()
		local collectionId = p1.collectionId or ""
		local t = {}
		
		for i, v in p1.availableMenuItems do
			table.insert(t, i)
		end
		local joined = table.concat(t, ",")
		local var5 = reactModule.useCallback(function(p1)
			-- upvalues: p1 (ref), joined (ref)
			if p1.onMenuOpenChanged then
				p1.onMenuOpenChanged(p1, joined)
			end
		end, { p1.onMenuOpenChanged, joined })
		local var6 = if not fFlagLuaAppFixExplicitFeedbackConsoleTelemetry then useGameTileOverflowMenuFocusNavigationModule(menuKey, p1.isSelected, p1.parentRef) else nil
		local var7 = useGameTileActionsModule(p1, reactModule.useCallback(function(p1)
			-- upvalues: fFlagLuaAppFixExplicitFeedbackTelemetry (copy), p1 (ref), collectionId (ref), joined (ref), fFlagLuaAppEnableHomepageOneByTwoTile (copy), gameTileOverflowMenuAction (copy)
			gameTileOverflowMenuAction({
				actionType = "GameTileOverflowMenuItemActivated",
				ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p1.appPage,
				universeId = p1.universeId,
				sortId = collectionId,
				menuItem = p1,
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
			var6 = useGameTileOverflowMenuFocusNavigationModule(menuKey, p1.isSelected, p1.parentRef, var5)
		end
		var1 = if fFlagSignalsNavP3fGameDetails then useSignalState(var1(false).getCurrentRouteKey) else useSelector(function(p1)
			-- upvalues: fFlagUseNavigationSelectors (copy), selectors (copy)
			return if fFlagUseNavigationSelectors then selectors.selectCurrentRoactNavigationRoute(p1).key or "" else p1.Navigation.currentRoute.key or ""
		end)
		local var1 = reactModule.useRef(var1)
		reactModule.useEffect(function()
			-- upvalues: var1 (write), var1 (ref), var4 (ref), menuKey (ref)
			if var1 ~= var1.current then
				var4.closeMenu(menuKey)
			end
		end, { var1, menuKey, var4.closeMenu })
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), userInputService (copy), var4 (ref), menuKey (ref)
			local var1 = if p1.menuOpen then userInputService.InputBegan:Connect(function(p1, _)
				-- upvalues: p1 (copy), var4 (copy), menuKey (copy)
				if p1.UserInputType == Enum.UserInputType.MouseButton1 and not p1.isHovered then
					var4.closeMenu(menuKey)
				end
			end) else nil
			
			return function()
				-- upvalues: var1 (write)
				if var1 then
					var1:Disconnect()
				end
			end
		end, { p1.menuOpen, p1.isHovered, menuKey, var4.closeMenu })
		
		return reactModule.createElement(overflowMenu, {
			anchorPoint = vector2,
			anchorPosition = uDim2,
			menuItems = var7,
			hasOverflowButton = var3 == responsiveModule.Input.Pointer,
			shouldShowAnchor = p1.isHovered,
			buttonIconBackgroundStyle = var2.Color.OverMedia.OverMedia_0,
			menuKey = menuKey,
			setFocusRef = var6,
			onMenuOpenChanged = var5,
			buttonIconSize = if fFlagLuaAppAdjustOverflowMenuVisual then iconSize.Small else nil
		})
	else
		local var2 = useDispatch()
		local var3 = useTokens()
		local var4 = useLastInput()
		local var5 = useRoactService(roactNetworking)
		local var6 = useLocalization({
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
		local uDim2 = UDim2.new(1, if fFlagLuaAppAdjustOverflowMenuVisual then -var3.Padding.Medium else -var3.Padding.Small, 0, if fFlagLuaAppAdjustOverflowMenuVisual then var3.Padding.Medium else var3.Padding.Small)
		local var7 = getOverflowMenuSignalStore()
		local var8 = if not fFlagLuaAppFixExplicitFeedbackConsoleTelemetry then useGameTileOverflowMenuFocusNavigationModule(menuKey, p1.isSelected, p1.parentRef) else nil
		local var9 = reactModule.useMemo(function()
			-- upvalues: userSignalTypes (copy), var6 (ref)
			return {
				{
					id = userSignalTypes.NotInterestedFeedbackItem.TooRepetitive,
					text = var6.tooRepetitive
				},
				{
					id = userSignalTypes.NotInterestedFeedbackItem.DontLikeGame,
					text = var6.dontLikeGame
				},
				{
					id = userSignalTypes.NotInterestedFeedbackItem.DontLikeImage,
					text = var6.dontLikeImage
				},
				{
					id = userSignalTypes.NotInterestedFeedbackItem.InappropriateContent,
					text = var6.inappropriateContent
				},
				{
					triggersOtherTextbox = true,
					id = userSignalTypes.NotInterestedFeedbackItem.SomethingElse,
					text = var6.somethingElse
				}
			}
		end, { var6 })
		local var10 = reactModule.useCallback(function(p1, p2)
			-- upvalues: var9 (ref), userSignalTypes (copy), fFlagLuaAppNotInterestedReportPlaceId (copy), p1 (ref), flaggedMutedError (copy), var2 (ref), openDynamicAbuseReportModule (copy), abuseVectorModule (copy), closeCentralOverlay (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy), setNetworkingErrorToast (copy), postSendUserSignal (copy), var5 (ref), httpService (copy), collectionId (ref), mutedError (copy), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), sendNotInterestedFeedbackFormAnalyticsModule (copy), fFlagLuaAppFixExplicitFeedbackTelemetry (copy)
			local var1 = false
			local t = {}
			
			for i, v in var9 do
				table.insert(t, { id = v.id, selected = p1[v.id] or false })
				
				if v.id == userSignalTypes.NotInterestedFeedbackItem.InappropriateContent and p1[v.id] then
					var1 = true
				end
			end
			if var1 then
				if fFlagLuaAppNotInterestedReportPlaceId and (not p1.placeId or p1.placeId == "") then
					flaggedMutedError("NotInterestedReportPlaceIdMissing", "Place report opened without a place id")
				else
					var2(openDynamicAbuseReportModule({
						abuseVector = abuseVectorModule.Place,
						targetId = if fFlagLuaAppNotInterestedReportPlaceId then p1.placeId else p1.universeId,
						onClose = function()
							-- upvalues: var2 (copy), closeCentralOverlay (copy)
							var2(closeCentralOverlay())
						end
					}))
				end
			end
			if not p1.appPage then
				default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedMissingAppPage, 1)
				var2(setNetworkingErrorToast())
				
				return
			end
			local ok, status = pcall(function()
				-- upvalues: postSendUserSignal (copy), var5 (copy), httpService (copy), userSignalTypes (copy), p2 (ref), t (ref), p1 (copy), collectionId (copy), var2 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
				postSendUserSignal(var5, {
					stringValue = httpService:JSONEncode({
						formId = userSignalTypes.NotInterestedFeedbackFormId.NotInterestedFeedback1,
						titleId = userSignalTypes.NotInterestedFeedbackFormTitleId.WhyHideExperience,
						textResponse = p2,
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
				}, userSignalTypes.SignalValueType.String, userSignalTypes.SignalType.NotInterestedFeedback):catch(function(p1)
					-- upvalues: var2 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
					var2(setNetworkingErrorToast(p1))
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
			var5, var9, var6, p1.universeId,
			if fFlagLuaAppNotInterestedReportPlaceId then p1.placeId else nil, p1.appPage,
			collectionId, var2, p1.isSponsored
		})
		var1 = nil
		local var1 = nil
		
		if fFlagLuaAppNotInterestedFeedbackFormTelemetry then
			var1 = reactModule.useCallback(function(p1)
				-- upvalues: sendNotInterestedFeedbackFormAnalyticsModule (copy), fFlagLuaAppFixExplicitFeedbackTelemetry (copy), p1 (ref), collectionId (ref)
				if p1 then
					return
				end
				sendNotInterestedFeedbackFormAnalyticsModule({
					actionType = "NotInterestedFeedbackFormClosedWithoutSubmit",
					ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p1.appPage,
					universeId = p1.universeId,
					sortId = collectionId
				}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p1.appPage else nil)
			end, { p1.appPage, p1.universeId, collectionId })
			var1 = reactModule.useCallback(function()
				-- upvalues: sendNotInterestedFeedbackFormAnalyticsModule (copy), fFlagLuaAppFixExplicitFeedbackTelemetry (copy), p1 (ref), collectionId (ref)
				sendNotInterestedFeedbackFormAnalyticsModule({
					actionType = "NotInterestedFeedbackFormOpened",
					ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p1.appPage,
					universeId = p1.universeId,
					sortId = collectionId
				}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p1.appPage else nil)
			end, { p1.appPage, p1.universeId, collectionId })
		end
		local var1 = reactModule.useMemo(function()
			-- upvalues: var6 (ref), var9 (ref), var10 (ref), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), var1 (write), fFlagLuaAppMakeDisclaimerOptInForFeedbackForm (copy)
			return {
				dialogTitle = var6.dialogTitle,
				dialogText = var6.dialogText,
				checkboxListTitle = var6.checkboxListTitle,
				checkboxItems = var9,
				onSubmit = var10,
				onClose = if fFlagLuaAppNotInterestedFeedbackFormTelemetry then var1 else nil,
				showTermsOfUseDisclaimer = if fFlagLuaAppMakeDisclaimerOptInForFeedbackForm then false else nil
			}
		end, { var6, var9, var10 })
		local t = {}
		
		for i, v in p1.availableMenuItems do
			table.insert(t, i)
		end
		local joined = table.concat(t, ",")
		local var1 = reactModule.useCallback(function(p1)
			-- upvalues: p1 (ref), joined (ref)
			if p1.onMenuOpenChanged then
				p1.onMenuOpenChanged(p1, joined)
			end
		end, { p1.onMenuOpenChanged, joined })
		local var2 = reactModule.useCallback(function(p1)
			-- upvalues: fFlagLuaAppFixExplicitFeedbackTelemetry (copy), p1 (ref), collectionId (ref), joined (ref), fFlagLuaAppEnableHomepageOneByTwoTile (copy), gameTileOverflowMenuAction (copy)
			gameTileOverflowMenuAction({
				actionType = "GameTileOverflowMenuItemActivated",
				ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p1.appPage,
				universeId = p1.universeId,
				sortId = collectionId,
				menuItem = p1,
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
			var8 = useGameTileOverflowMenuFocusNavigationModule(menuKey, p1.isSelected, p1.parentRef, var1)
		end
		local var1 = if fFlagLuaAppContinueSortInstantPlay then reactModule.useCallback(function()
			-- upvalues: p1 (ref), var2 (ref), tileOverflowMenuItems (copy)
			if p1.onGameDetailsActivated then
				p1.onGameDetailsActivated()
			end
			var2(tileOverflowMenuItems.GameDetails)
		end, { p1.onGameDetailsActivated, var2 }) else nil
		local var2 = reactModule.useCallback(function()
			-- upvalues: p1 (ref), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy), var2 (ref), setNetworkingErrorToast (copy), setCentralOverlay (copy), centralOverlayType (copy), var1 (ref), iconName (copy), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), var1 (write), postSendUserSignal (copy), var5 (ref), userSignalTypes (copy), collectionId (ref), mutedError (copy), var2 (ref), tileOverflowMenuItems (copy)
			if not p1.appPage then
				default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedMissingAppPage, 1)
				var2(setNetworkingErrorToast())
				
				return
			end
			p1.setGameHidden(p1.universeId, true)
			var2(setCentralOverlay(centralOverlayType.ProvideFeedbackToast, {
				feedbackFormProps = var1,
				toastIcon = iconName.CircleMinus,
				onToastActivated = if fFlagLuaAppNotInterestedFeedbackFormTelemetry then var1 else nil
			}))
			local ok, status = pcall(function()
				-- upvalues: postSendUserSignal (copy), var5 (copy), p1 (copy), userSignalTypes (copy), collectionId (copy), var2 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
				postSendUserSignal(var5, { boolValue = true }, {
					id = p1.universeId,
					assetType = if p1.isSponsored then userSignalTypes.AssetType.SponsoredGame else userSignalTypes.AssetType.Game,
					signalOrigin = {
						productSurface = p1.appPage,
						topicId = collectionId,
						subIds = { collectionId }
					}
				}, userSignalTypes.SignalValueType.Bool, userSignalTypes.SignalType.NotInterested):catch(function(p1)
					-- upvalues: p1 (copy), var2 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
					p1.setGameHidden(p1.universeId, false)
					var2(setNetworkingErrorToast(p1))
					default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedUserSignalFailed, 1)
				end)
			end)
			
			if not ok then
				p1.setGameHidden(p1.universeId, false)
				mutedError(status)
			end
			var2(tileOverflowMenuItems.NotInterested)
		end, {
			var5, p1.setGameHidden, var2, var1, p1.universeId, collectionId, p1.appPage,
			var2, p1.isSponsored
		})
		local var1 = reactModule.useCallback(function()
			-- upvalues: var2 (ref), setCentralOverlay (copy), centralOverlayType (copy), p1 (ref), fFlagLuaAppEnableHomepageOneByTwoTile (copy), var2 (ref), tileOverflowMenuItems (copy)
			var2(setCentralOverlay(centralOverlayType.WhyThisAdModal, {
				universeId = p1.universeId,
				payerName = p1.payerName,
				sponsoredUserCohort = p1.sponsoredUserCohort,
				contentType = if fFlagLuaAppEnableHomepageOneByTwoTile then p1.contentType else nil
			}))
			var2(tileOverflowMenuItems.WhyThisAd)
		end, {
			var2, p1.universeId, p1.payerName, p1.sponsoredUserCohort,
			if fFlagLuaAppEnableHomepageOneByTwoTile then p1.contentType else nil, var2
		})
		local var1 = if fFlagLuaAppEnableSponsoredReportAd then reactModule.useCallback(function()
			-- upvalues: p1 (ref), flaggedMutedError (copy), var2 (ref), openDynamicAbuseReportModule (copy), abuseVectorModule (copy), closeCentralOverlay (copy), var2 (ref), tileOverflowMenuItems (copy)
			if p1.adId then
				var2(openDynamicAbuseReportModule({
					abuseVector = abuseVectorModule.AdV2,
					targetId = p1.adId,
					onClose = function()
						-- upvalues: var2 (copy), closeCentralOverlay (copy)
						var2(closeCentralOverlay())
					end
				}))
				var2(tileOverflowMenuItems.ReportAd)
				
				return
			end
			flaggedMutedError("ReportSponsoredAdError", "Report ad clicked without valid target ad id")
		end, { var2, p1.adId, var2 }) else nil
		local var2 = reactModule.useMemo(function()
			-- upvalues: fFlagLuaAppContinueSortInstantPlay (copy), p1 (ref), tileOverflowMenuItems (copy), var6 (ref), var1 (ref), var2 (ref), var1 (ref), fFlagLuaAppEnableSponsoredReportAd (copy), iconName (copy), var1 (ref)
			local t = {}
			
			if fFlagLuaAppContinueSortInstantPlay and p1.availableMenuItems[tileOverflowMenuItems.GameDetails] then
				table.insert(t, {
					icon = "icons/actions/info",
					id = tileOverflowMenuItems.GameDetails,
					text = var6.gameDetails,
					onActivated = var1
				})
			end
			if p1.availableMenuItems[tileOverflowMenuItems.NotInterested] then
				table.insert(t, {
					icon = "icons/actions/block",
					id = tileOverflowMenuItems.NotInterested,
					text = var6.notInterested,
					onActivated = var2
				})
			end
			if p1.availableMenuItems[tileOverflowMenuItems.WhyThisAd] then
				table.insert(t, {
					icon = "icons/actions/info",
					id = tileOverflowMenuItems.WhyThisAd,
					text = var6.whyThisAd,
					onActivated = var1
				})
			end
			if fFlagLuaAppEnableSponsoredReportAd and p1.availableMenuItems[tileOverflowMenuItems.ReportAd] then
				table.insert(t, {
					icon = iconName.Flag,
					id = tileOverflowMenuItems.ReportAd,
					text = var6.reportAd,
					onActivated = var1
				})
			end
			return t
		end, {
			if fFlagLuaAppContinueSortInstantPlay then var1 else nil, var2, var6, var1,
			p1.isSponsored, p1.availableMenuItems
		})
		local var3 = if fFlagSignalsNavP3fGameDetails then useSignalState(var1(false).getCurrentRouteKey) else useSelector(function(p1)
			-- upvalues: fFlagUseNavigationSelectors (copy), selectors (copy)
			return if fFlagUseNavigationSelectors then selectors.selectCurrentRoactNavigationRoute(p1).key or "" else p1.Navigation.currentRoute.key or ""
		end)
		local var1 = reactModule.useRef(var3)
		reactModule.useEffect(function()
			-- upvalues: var3 (write), var1 (ref), var7 (ref), menuKey (ref)
			if var3 ~= var1.current then
				var7.closeMenu(menuKey)
			end
		end, { var3, menuKey })
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), userInputService (copy), var7 (ref), menuKey (ref)
			local var1 = if p1.menuOpen then userInputService.InputBegan:Connect(function(p1, _)
				-- upvalues: p1 (copy), var7 (copy), menuKey (copy)
				if p1.UserInputType == Enum.UserInputType.MouseButton1 and not p1.isHovered then
					var7.closeMenu(menuKey)
				end
			end) else nil
			
			return function()
				-- upvalues: var1 (write)
				if var1 then
					var1:Disconnect()
				end
			end
		end, { p1.menuOpen, p1.isHovered, menuKey })
		
		return reactModule.createElement(overflowMenu, {
			anchorPoint = vector2,
			anchorPosition = uDim2,
			menuItems = var2,
			hasOverflowButton = var4 == responsiveModule.Input.Pointer,
			shouldShowAnchor = p1.isHovered,
			buttonIconBackgroundStyle = var3.Color.OverMedia.OverMedia_0,
			menuKey = menuKey,
			setFocusRef = var8,
			onMenuOpenChanged = var1,
			buttonIconSize = if fFlagLuaAppAdjustOverflowMenuVisual then iconSize.Small else nil
		})
	end
end)