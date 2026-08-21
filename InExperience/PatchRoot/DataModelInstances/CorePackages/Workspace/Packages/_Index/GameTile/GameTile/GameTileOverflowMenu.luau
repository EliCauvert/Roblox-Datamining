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
local UIBloxModule = require(parent.UIBlox)
local userSignalsModule = require(parent.UserSignals)
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local selectors = require(parent.NavigationRodux).Selectors
local getOverflowMenuSignalStore = appBloxModule.getOverflowMenuSignalStore
local overflowMenu = appBloxModule.OverflowMenu
local closeCentralOverlay = centralOverlayModule.Thunks.CloseCentralOverlay
local setCentralOverlay = centralOverlayModule.Actions.SetCentralOverlay
local useTokens = foundationModule.Hooks.useTokens
local enums = foundationModule.Enums
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
local images = UIBloxModule.App.ImageSet.Images
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
local var26 = if fFlagSignalsNavP3fGameDetails then require(parent.NavigationRodux).GetLegacyNavigationStore else nil
local fFlagLuaAppMakeDisclaimerOptInForFeedbackForm = sharedFlagsModule.FFlagLuaAppMakeDisclaimerOptInForFeedbackForm
local fFlagLuaAppNotInterestedFeedbackFormTelemetry = sharedFlagsModule.FFlagLuaAppNotInterestedFeedbackFormTelemetry
local fFlagLuaAppFixExplicitFeedbackTelemetry = sharedFlagsModule.FFlagLuaAppFixExplicitFeedbackTelemetry
local fFlagLuaAppEnableSponsoredReportAd = sharedFlagsModule.FFlagLuaAppEnableSponsoredReportAd
local fFlagLuaAppAdjustOverflowMenuVisual = sharedFlagsModule.FFlagLuaAppAdjustOverflowMenuVisual
local fFlagLuaAppUseSnackbarForProvideFeedbackToast = sharedFlagsModule.FFlagLuaAppUseSnackbarForProvideFeedbackToast
local fFlagLuaAppContinueSortInstantPlay = sharedFlagsModule.FFlagLuaAppContinueSortInstantPlay
local fFlagLuaAppFixExplicitFeedbackConsoleTelemetry = sharedFlagsModule.FFlagLuaAppFixExplicitFeedbackConsoleTelemetry
local fFlagLuaAppNotInterestedReportPlaceId = sharedFlagsModule.FFlagLuaAppNotInterestedReportPlaceId
local fFlagLuaAppEnableHomepageOneByTwoTile = sharedFlagsModule.FFlagLuaAppEnableHomepageOneByTwoTile
local fFlagLuaAppGameTileNotInterestedDirectAction = sharedFlagsModule.FFlagLuaAppGameTileNotInterestedDirectAction

return reactModule.memo(function(p0) --[[ line: 109 | named "GameTileOverflowMenu" ]]
	-- upvalues: fFlagLuaAppGameTileNotInterestedDirectAction (ref), useTokens (ref), useLastInput (ref), fFlagLuaAppAdjustOverflowMenuVisual (ref), getOverflowMenuSignalStore (ref), reactModule (ref), fFlagLuaAppFixExplicitFeedbackTelemetry (ref), fFlagLuaAppEnableHomepageOneByTwoTile (ref), gameTileOverflowMenuAction (ref), fFlagLuaAppFixExplicitFeedbackConsoleTelemetry (ref), useGameTileOverflowMenuFocusNavigationModule (ref), useGameTileActionsModule (ref), fFlagSignalsNavP3fGameDetails (ref), useSignalState (ref), var26 (ref), useSelector (ref), fFlagUseNavigationSelectors (ref), selectors (ref), userInputService (ref), overflowMenu (ref), responsiveModule (ref), iconSize (ref), useDispatch (ref), useRoactService (ref), roactNetworking (ref), useLocalization (ref), fFlagLuaAppEnableSponsoredReportAd (ref), fFlagLuaAppContinueSortInstantPlay (ref), userSignalTypes (ref), fFlagLuaAppNotInterestedReportPlaceId (ref), flaggedMutedError (ref), openDynamicAbuseReportModule (ref), abuseVectorModule (ref), closeCentralOverlay (ref), default (ref), notInterestedUserSignalTelemetryEventConfigsModule (ref), setNetworkingErrorToast (ref), postSendUserSignal (ref), httpService (ref), mutedError (ref), fFlagLuaAppNotInterestedFeedbackFormTelemetry (ref), sendNotInterestedFeedbackFormAnalyticsModule (ref), fFlagLuaAppMakeDisclaimerOptInForFeedbackForm (ref), tileOverflowMenuItems (ref), setCentralOverlay (ref), centralOverlayType (ref), fFlagLuaAppUseSnackbarForProvideFeedbackToast (ref), enums (ref), images (ref), iconName (ref)
	local var38
	if fFlagLuaAppGameTileNotInterestedDirectAction then
		local var27 = useTokens()
		local var28 = useLastInput()
		local menuKey = p0.menuKey
		local vector2 = Vector2.new(1, 0)
		local uDim2 = UDim2.new(1, if fFlagLuaAppAdjustOverflowMenuVisual then -var27.Padding.Medium else -var27.Padding.Small, 0, if fFlagLuaAppAdjustOverflowMenuVisual then var27.Padding.Medium else var27.Padding.Small)
		local var31 = getOverflowMenuSignalStore()
		local collectionId = p0.collectionId or ""
		local t = {}
		
		for i, v in p0.availableMenuItems do
			table.insert(t, i)
		end
		local joined = table.concat(t, ",")
		local var35 = reactModule.useCallback(function(p1) --[[ line: 129 ]]
			-- upvalues: p0 (ref), joined (ref)
			if p0.onMenuOpenChanged then
				p0.onMenuOpenChanged(p1, joined)
			end
		end, { p0.onMenuOpenChanged, joined })
		local var36 = if not fFlagLuaAppFixExplicitFeedbackConsoleTelemetry then useGameTileOverflowMenuFocusNavigationModule(menuKey, p0.isSelected, p0.parentRef) else nil
		local var37 = useGameTileActionsModule(p0, reactModule.useCallback(function(p2) --[[ line: 136 ]]
			-- upvalues: fFlagLuaAppFixExplicitFeedbackTelemetry (copy), p0 (ref), collectionId (ref), joined (ref), fFlagLuaAppEnableHomepageOneByTwoTile (copy), gameTileOverflowMenuAction (copy)
			gameTileOverflowMenuAction({
				actionType = "GameTileOverflowMenuItemActivated",
				ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p0.appPage,
				universeId = p0.universeId,
				sortId = collectionId,
				menuItem = p2,
				availableMenuItems = joined,
				contentType = if fFlagLuaAppEnableHomepageOneByTwoTile then p0.contentType else nil
			}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p0.appPage else nil)
		end, {
			p0.appPage,
			p0.universeId,
			collectionId,
			joined,
			if fFlagLuaAppEnableHomepageOneByTwoTile then p0.contentType else nil
		}))
		
		if fFlagLuaAppFixExplicitFeedbackConsoleTelemetry then
			var36 = useGameTileOverflowMenuFocusNavigationModule(menuKey, p0.isSelected, p0.parentRef, var35)
		end
		var38 = if fFlagSignalsNavP3fGameDetails then useSignalState(var26(false).getCurrentRouteKey) else useSelector(function(p3) --[[ line: 177 ]]
			-- upvalues: fFlagUseNavigationSelectors (copy), selectors (copy)
			return if fFlagUseNavigationSelectors then selectors.selectCurrentRoactNavigationRoute(p3).key or "" else p3.Navigation.currentRoute.key or ""
		end)
		local var39 = reactModule.useRef(var38)
		reactModule.useEffect(function() --[[ line: 186 ]]
			-- upvalues: var38 (write), var39 (ref), var31 (ref), menuKey (ref)
			if var38 ~= var39.current then
				var31.closeMenu(menuKey)
			end
		end, { var38, menuKey, var31.closeMenu })
		reactModule.useEffect(function() --[[ line: 192 ]]
			-- upvalues: p0 (ref), userInputService (copy), var31 (ref), menuKey (ref)
			local var65 = if p0.menuOpen then userInputService.InputBegan:Connect(function(p4, _) --[[ line: 196 ]]
				-- upvalues: p0 (copy), var31 (copy), menuKey (copy)
				if p4.UserInputType == Enum.UserInputType.MouseButton1 and not p0.isHovered then
					var31.closeMenu(menuKey)
				end
			end) else nil
			
			return function() --[[ line: 205 ]]
				-- upvalues: var65 (write)
				if var65 then
					var65:Disconnect()
				end
			end
		end, { p0.menuOpen, p0.isHovered, menuKey, var31.closeMenu })
		
		return reactModule.createElement(overflowMenu, {
			anchorPoint = vector2,
			anchorPosition = uDim2,
			menuItems = var37,
			hasOverflowButton = var28 == responsiveModule.Input.Pointer,
			shouldShowAnchor = p0.isHovered,
			buttonIconBackgroundStyle = var27.Color.OverMedia.OverMedia_0,
			menuKey = menuKey,
			setFocusRef = var36,
			onMenuOpenChanged = var35,
			buttonIconSize = if fFlagLuaAppAdjustOverflowMenuVisual then iconSize.Small else nil
		})
	else
		local var40 = useDispatch()
		local var41 = useTokens()
		local var42 = useLastInput()
		local var43 = useRoactService(roactNetworking)
		local var44 = useLocalization({
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
		local collectionId = p0.collectionId or ""
		local menuKey = p0.menuKey
		local vector2 = Vector2.new(1, 0)
		local uDim2 = UDim2.new(1, if fFlagLuaAppAdjustOverflowMenuVisual then -var41.Padding.Medium else -var41.Padding.Small, 0, if fFlagLuaAppAdjustOverflowMenuVisual then var41.Padding.Medium else var41.Padding.Small)
		local var48 = getOverflowMenuSignalStore()
		local var49 = if not fFlagLuaAppFixExplicitFeedbackConsoleTelemetry then useGameTileOverflowMenuFocusNavigationModule(menuKey, p0.isSelected, p0.parentRef) else nil
		local var50 = reactModule.useMemo(function() --[[ line: 261 ]]
			-- upvalues: userSignalTypes (copy), var44 (ref)
			return {
				{
					id = userSignalTypes.NotInterestedFeedbackItem.TooRepetitive,
					text = var44.tooRepetitive
				},
				{
					id = userSignalTypes.NotInterestedFeedbackItem.DontLikeGame,
					text = var44.dontLikeGame
				},
				{
					id = userSignalTypes.NotInterestedFeedbackItem.DontLikeImage,
					text = var44.dontLikeImage
				},
				{
					id = userSignalTypes.NotInterestedFeedbackItem.InappropriateContent,
					text = var44.inappropriateContent
				},
				{
					triggersOtherTextbox = true,
					id = userSignalTypes.NotInterestedFeedbackItem.SomethingElse,
					text = var44.somethingElse
				}
			}
		end, { var44 })
		local var51 = reactModule.useCallback(function(p5, p6) --[[ line: 288 ]]
			-- upvalues: var50 (ref), userSignalTypes (copy), fFlagLuaAppNotInterestedReportPlaceId (copy), p0 (ref), flaggedMutedError (copy), var40 (ref), openDynamicAbuseReportModule (copy), abuseVectorModule (copy), closeCentralOverlay (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy), setNetworkingErrorToast (copy), postSendUserSignal (copy), var43 (ref), httpService (copy), collectionId (ref), mutedError (copy), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), sendNotInterestedFeedbackFormAnalyticsModule (copy), fFlagLuaAppFixExplicitFeedbackTelemetry (copy)
			local var66 = false
			local t = {}
			
			for i, v in var50 do
				table.insert(t, { id = v.id, selected = p5[v.id] or false })
				
				if v.id == userSignalTypes.NotInterestedFeedbackItem.InappropriateContent and p5[v.id] then
					var66 = true
				end
			end
			if var66 then
				if fFlagLuaAppNotInterestedReportPlaceId and (not p0.placeId or p0.placeId == "") then
					flaggedMutedError("NotInterestedReportPlaceIdMissing", "Place report opened without a place id")
				else
					var40(openDynamicAbuseReportModule({
						abuseVector = abuseVectorModule.Place,
						targetId = if fFlagLuaAppNotInterestedReportPlaceId then p0.placeId else p0.universeId,
						onClose = function() --[[ line: 312 ]]
							-- upvalues: var40 (copy), closeCentralOverlay (copy)
							var40(closeCentralOverlay())
						end
					}))
				end
			end
			if not p0.appPage then
				default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedMissingAppPage, 1)
				var40(setNetworkingErrorToast())
				
				return
			end
			local ok, status = pcall(function() --[[ line: 328 ]]
				-- upvalues: postSendUserSignal (copy), var43 (copy), httpService (copy), userSignalTypes (copy), p6 (ref), t (ref), p0 (copy), collectionId (copy), var40 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
				postSendUserSignal(var43, {
					stringValue = httpService:JSONEncode({
						formId = userSignalTypes.NotInterestedFeedbackFormId.NotInterestedFeedback1,
						titleId = userSignalTypes.NotInterestedFeedbackFormTitleId.WhyHideExperience,
						textResponse = p6,
						items = t
					})
				}, {
					id = p0.universeId,
					assetType = if p0.isSponsored then userSignalTypes.AssetType.SponsoredGame else userSignalTypes.AssetType.Game,
					signalOrigin = {
						productSurface = p0.appPage,
						topicId = collectionId,
						subIds = { collectionId }
					}
				}, userSignalTypes.SignalValueType.String, userSignalTypes.SignalType.NotInterestedFeedback):catch(function(p7) --[[ line: 347 ]]
					-- upvalues: var40 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
					var40(setNetworkingErrorToast(p7))
					default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedUserSignalFailed, 1)
				end)
			end)
			
			if not ok then
				mutedError(status)
			end
			if fFlagLuaAppNotInterestedFeedbackFormTelemetry then
				sendNotInterestedFeedbackFormAnalyticsModule({
					actionType = "NotInterestedFeedbackFormSubmitted",
					ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p0.appPage,
					universeId = p0.universeId,
					sortId = collectionId
				}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p0.appPage else nil)
			end
		end, {
			var43, var50, var44, p0.universeId,
			if fFlagLuaAppNotInterestedReportPlaceId then p0.placeId else nil, p0.appPage,
			collectionId, var40, p0.isSponsored
		})
		var38 = nil
		local var52 = nil
		
		if fFlagLuaAppNotInterestedFeedbackFormTelemetry then
			var38 = reactModule.useCallback(function(p8) --[[ line: 385 ]]
				-- upvalues: sendNotInterestedFeedbackFormAnalyticsModule (copy), fFlagLuaAppFixExplicitFeedbackTelemetry (copy), p0 (ref), collectionId (ref)
				if p8 then
					return
				end
				sendNotInterestedFeedbackFormAnalyticsModule({
					actionType = "NotInterestedFeedbackFormClosedWithoutSubmit",
					ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p0.appPage,
					universeId = p0.universeId,
					sortId = collectionId
				}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p0.appPage else nil)
			end, { p0.appPage, p0.universeId, collectionId })
			var52 = reactModule.useCallback(function() --[[ line: 399 ]]
				-- upvalues: sendNotInterestedFeedbackFormAnalyticsModule (copy), fFlagLuaAppFixExplicitFeedbackTelemetry (copy), p0 (ref), collectionId (ref)
				sendNotInterestedFeedbackFormAnalyticsModule({
					actionType = "NotInterestedFeedbackFormOpened",
					ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p0.appPage,
					universeId = p0.universeId,
					sortId = collectionId
				}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p0.appPage else nil)
			end, { p0.appPage, p0.universeId, collectionId })
		end
		local var53 = reactModule.useMemo(function() --[[ line: 409 ]]
			-- upvalues: var44 (ref), var50 (ref), var51 (ref), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), var38 (write), fFlagLuaAppMakeDisclaimerOptInForFeedbackForm (copy)
			return {
				dialogTitle = var44.dialogTitle,
				dialogText = var44.dialogText,
				checkboxListTitle = var44.checkboxListTitle,
				checkboxItems = var50,
				onSubmit = var51,
				onClose = if fFlagLuaAppNotInterestedFeedbackFormTelemetry then var38 else nil,
				showTermsOfUseDisclaimer = if fFlagLuaAppMakeDisclaimerOptInForFeedbackForm then false else nil
			}
		end, { var44, var50, var51 })
		local t = {}
		
		for i, v in p0.availableMenuItems do
			table.insert(t, i)
		end
		local joined = table.concat(t, ",")
		local var56 = reactModule.useCallback(function(p9) --[[ line: 427 ]]
			-- upvalues: p0 (ref), joined (ref)
			if p0.onMenuOpenChanged then
				p0.onMenuOpenChanged(p9, joined)
			end
		end, { p0.onMenuOpenChanged, joined })
		local var57 = reactModule.useCallback(function(p10) --[[ line: 434 ]]
			-- upvalues: fFlagLuaAppFixExplicitFeedbackTelemetry (copy), p0 (ref), collectionId (ref), joined (ref), fFlagLuaAppEnableHomepageOneByTwoTile (copy), gameTileOverflowMenuAction (copy)
			gameTileOverflowMenuAction({
				actionType = "GameTileOverflowMenuItemActivated",
				ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p0.appPage,
				universeId = p0.universeId,
				sortId = collectionId,
				menuItem = p10,
				availableMenuItems = joined,
				contentType = if fFlagLuaAppEnableHomepageOneByTwoTile then p0.contentType else nil
			}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p0.appPage else nil)
		end, {
			p0.appPage,
			p0.universeId,
			collectionId,
			joined,
			if fFlagLuaAppEnableHomepageOneByTwoTile then p0.contentType else nil
		})
		
		if fFlagLuaAppFixExplicitFeedbackConsoleTelemetry then
			var49 = useGameTileOverflowMenuFocusNavigationModule(menuKey, p0.isSelected, p0.parentRef, var56)
		end
		local var58 = if fFlagLuaAppContinueSortInstantPlay then reactModule.useCallback(function() --[[ line: 465 ]]
			-- upvalues: p0 (ref), var57 (ref), tileOverflowMenuItems (copy)
			if p0.onGameDetailsActivated then
				p0.onGameDetailsActivated()
			end
			var57(tileOverflowMenuItems.GameDetails)
		end, { p0.onGameDetailsActivated, var57 }) else nil
		local var59 = reactModule.useCallback(function() --[[ line: 475 ]]
			-- upvalues: p0 (ref), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy), var40 (ref), setNetworkingErrorToast (copy), setCentralOverlay (copy), centralOverlayType (copy), var53 (ref), fFlagLuaAppUseSnackbarForProvideFeedbackToast (copy), enums (copy), images (copy), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), var52 (write), postSendUserSignal (copy), var43 (ref), userSignalTypes (copy), collectionId (ref), mutedError (copy), var57 (ref), tileOverflowMenuItems (copy)
			if not p0.appPage then
				default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedMissingAppPage, 1)
				var40(setNetworkingErrorToast())
				
				return
			end
			p0.setGameHidden(p0.universeId, true)
			var40(setCentralOverlay(centralOverlayType.ProvideFeedbackToast, {
				feedbackFormProps = var53,
				toastIcon = if fFlagLuaAppUseSnackbarForProvideFeedbackToast then enums.IconName.CircleMinus else images["icons/actions/edit/remove"],
				onToastActivated = if fFlagLuaAppNotInterestedFeedbackFormTelemetry then var52 else nil
			}))
			local ok, status = pcall(function() --[[ line: 494 ]]
				-- upvalues: postSendUserSignal (copy), var43 (copy), p0 (copy), userSignalTypes (copy), collectionId (copy), var40 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
				postSendUserSignal(var43, { boolValue = true }, {
					id = p0.universeId,
					assetType = if p0.isSponsored then userSignalTypes.AssetType.SponsoredGame else userSignalTypes.AssetType.Game,
					signalOrigin = {
						productSurface = p0.appPage,
						topicId = collectionId,
						subIds = { collectionId }
					}
				}, userSignalTypes.SignalValueType.Bool, userSignalTypes.SignalType.NotInterested):catch(function(p11) --[[ line: 508 ]]
					-- upvalues: p0 (copy), var40 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
					p0.setGameHidden(p0.universeId, false)
					var40(setNetworkingErrorToast(p11))
					default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedUserSignalFailed, 1)
				end)
			end)
			
			if not ok then
				p0.setGameHidden(p0.universeId, false)
				mutedError(status)
			end
			var57(tileOverflowMenuItems.NotInterested)
		end, {
			var43, p0.setGameHidden, var40, var53, p0.universeId, collectionId, p0.appPage,
			var57, p0.isSponsored
		})
		local var60 = reactModule.useCallback(function() --[[ line: 540 ]]
			-- upvalues: var40 (ref), setCentralOverlay (copy), centralOverlayType (copy), p0 (ref), fFlagLuaAppEnableHomepageOneByTwoTile (copy), var57 (ref), tileOverflowMenuItems (copy)
			var40(setCentralOverlay(centralOverlayType.WhyThisAdModal, {
				universeId = p0.universeId,
				payerName = p0.payerName,
				sponsoredUserCohort = p0.sponsoredUserCohort,
				contentType = if fFlagLuaAppEnableHomepageOneByTwoTile then p0.contentType else nil
			}))
			var57(tileOverflowMenuItems.WhyThisAd)
		end, {
			var40, p0.universeId, p0.payerName, p0.sponsoredUserCohort,
			if fFlagLuaAppEnableHomepageOneByTwoTile then p0.contentType else nil, var57
		})
		local var61 = if fFlagLuaAppEnableSponsoredReportAd then reactModule.useCallback(function() --[[ line: 562 ]]
			-- upvalues: p0 (ref), flaggedMutedError (copy), var40 (ref), openDynamicAbuseReportModule (copy), abuseVectorModule (copy), closeCentralOverlay (copy), var57 (ref), tileOverflowMenuItems (copy)
			if p0.adId then
				var40(openDynamicAbuseReportModule({
					abuseVector = abuseVectorModule.AdV2,
					targetId = p0.adId,
					onClose = function() --[[ line: 571 ]]
						-- upvalues: var40 (copy), closeCentralOverlay (copy)
						var40(closeCentralOverlay())
					end
				}))
				var57(tileOverflowMenuItems.ReportAd)
				
				return
			end
			flaggedMutedError("ReportSponsoredAdError", "Report ad clicked without valid target ad id")
		end, { var40, p0.adId, var57 }) else nil
		local var62 = reactModule.useMemo(function() --[[ line: 587 ]]
			-- upvalues: fFlagLuaAppContinueSortInstantPlay (copy), p0 (ref), tileOverflowMenuItems (copy), var44 (ref), var58 (ref), var59 (ref), var60 (ref), fFlagLuaAppEnableSponsoredReportAd (copy), iconName (copy), var61 (ref)
			local t = {}
			
			if fFlagLuaAppContinueSortInstantPlay and p0.availableMenuItems[tileOverflowMenuItems.GameDetails] then
				table.insert(t, {
					icon = "icons/actions/info",
					id = tileOverflowMenuItems.GameDetails,
					text = var44.gameDetails,
					onActivated = var58
				})
			end
			if p0.availableMenuItems[tileOverflowMenuItems.NotInterested] then
				table.insert(t, {
					icon = "icons/actions/block",
					id = tileOverflowMenuItems.NotInterested,
					text = var44.notInterested,
					onActivated = var59
				})
			end
			if p0.availableMenuItems[tileOverflowMenuItems.WhyThisAd] then
				table.insert(t, {
					icon = "icons/actions/info",
					id = tileOverflowMenuItems.WhyThisAd,
					text = var44.whyThisAd,
					onActivated = var60
				})
			end
			if fFlagLuaAppEnableSponsoredReportAd and p0.availableMenuItems[tileOverflowMenuItems.ReportAd] then
				table.insert(t, {
					icon = iconName.Flag,
					id = tileOverflowMenuItems.ReportAd,
					text = var44.reportAd,
					onActivated = var61
				})
			end
			return t
		end, {
			if fFlagLuaAppContinueSortInstantPlay then var58 else nil, var59, var44, var60,
			p0.isSponsored, p0.availableMenuItems
		})
		local var63 = if fFlagSignalsNavP3fGameDetails then useSignalState(var26(false).getCurrentRouteKey) else useSelector(function(p12) --[[ line: 642 ]]
			-- upvalues: fFlagUseNavigationSelectors (copy), selectors (copy)
			return if fFlagUseNavigationSelectors then selectors.selectCurrentRoactNavigationRoute(p12).key or "" else p12.Navigation.currentRoute.key or ""
		end)
		local var64 = reactModule.useRef(var63)
		reactModule.useEffect(function() --[[ line: 651 ]]
			-- upvalues: var63 (write), var64 (ref), var48 (ref), menuKey (ref)
			if var63 ~= var64.current then
				var48.closeMenu(menuKey)
			end
		end, { var63, menuKey })
		reactModule.useEffect(function() --[[ line: 657 ]]
			-- upvalues: p0 (ref), userInputService (copy), var48 (ref), menuKey (ref)
			local var69 = if p0.menuOpen then userInputService.InputBegan:Connect(function(p13, _) --[[ line: 660 ]]
				-- upvalues: p0 (copy), var48 (copy), menuKey (copy)
				if p13.UserInputType == Enum.UserInputType.MouseButton1 and not p0.isHovered then
					var48.closeMenu(menuKey)
				end
			end) else nil
			
			return function() --[[ line: 668 ]]
				-- upvalues: var69 (write)
				if var69 then
					var69:Disconnect()
				end
			end
		end, { p0.menuOpen, p0.isHovered, menuKey })
		
		return reactModule.createElement(overflowMenu, {
			anchorPoint = vector2,
			anchorPosition = uDim2,
			menuItems = var62,
			hasOverflowButton = var42 == responsiveModule.Input.Pointer,
			shouldShowAnchor = p0.isHovered,
			buttonIconBackgroundStyle = var41.Color.OverMedia.OverMedia_0,
			menuKey = menuKey,
			setFocusRef = var49,
			onMenuOpenChanged = var56,
			buttonIconSize = if fFlagLuaAppAdjustOverflowMenuVisual then iconSize.Small else nil
		})
	end
end)