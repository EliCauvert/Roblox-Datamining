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
local useGameTileOverflowMenuFocusNavigationModule = require(gameTile.useGameTileOverflowMenuFocusNavigation)
local tileOverflowMenuItems = require(gameTile.GameTileConstants).TileOverflowMenuItems
local fFlagUseNavigationSelectors = sharedFlagsModule.FFlagUseNavigationSelectors
local fFlagSignalsNavP3fGameDetails = sharedFlagsModule.FFlagSignalsNavP3fGameDetails
local useSignalState = require(parent.SignalsReact).useSignalState
local var25 = if fFlagSignalsNavP3fGameDetails then require(parent.NavigationRodux).GetLegacyNavigationStore else nil
local fFlagLuaAppMakeDisclaimerOptInForFeedbackForm = sharedFlagsModule.FFlagLuaAppMakeDisclaimerOptInForFeedbackForm
local fFlagLuaAppNotInterestedFeedbackFormTelemetry = sharedFlagsModule.FFlagLuaAppNotInterestedFeedbackFormTelemetry
local fFlagLuaAppFixExplicitFeedbackTelemetry = sharedFlagsModule.FFlagLuaAppFixExplicitFeedbackTelemetry
local fFlagLuaAppEnableSponsoredReportAd = sharedFlagsModule.FFlagLuaAppEnableSponsoredReportAd
local luaAppAdjustOverflowMenuVisual = game:DefineFastFlag("LuaAppAdjustOverflowMenuVisual", false)
local fFlagLuaAppUseSnackbarForProvideFeedbackToast = sharedFlagsModule.FFlagLuaAppUseSnackbarForProvideFeedbackToast
local fFlagLuaAppFixExplicitFeedbackConsoleTelemetry = sharedFlagsModule.FFlagLuaAppFixExplicitFeedbackConsoleTelemetry

return reactModule.memo(function(p0) --[[ line: 93 | named "GameTileOverflowMenu" ]]
	-- upvalues: useDispatch (ref), useTokens (ref), useLastInput (ref), useRoactService (ref), roactNetworking (ref), useLocalization (ref), fFlagLuaAppEnableSponsoredReportAd (ref), luaAppAdjustOverflowMenuVisual (ref), getOverflowMenuSignalStore (ref), fFlagLuaAppFixExplicitFeedbackConsoleTelemetry (ref), useGameTileOverflowMenuFocusNavigationModule (ref), reactModule (ref), userSignalTypes (ref), openDynamicAbuseReportModule (ref), abuseVectorModule (ref), closeCentralOverlay (ref), default (ref), notInterestedUserSignalTelemetryEventConfigsModule (ref), setNetworkingErrorToast (ref), postSendUserSignal (ref), httpService (ref), mutedError (ref), fFlagLuaAppNotInterestedFeedbackFormTelemetry (ref), sendNotInterestedFeedbackFormAnalyticsModule (ref), fFlagLuaAppFixExplicitFeedbackTelemetry (ref), fFlagLuaAppMakeDisclaimerOptInForFeedbackForm (ref), gameTileOverflowMenuAction (ref), setCentralOverlay (ref), centralOverlayType (ref), fFlagLuaAppUseSnackbarForProvideFeedbackToast (ref), enums (ref), images (ref), tileOverflowMenuItems (ref), flaggedMutedError (ref), iconName (ref), fFlagSignalsNavP3fGameDetails (ref), useSignalState (ref), var25 (ref), useSelector (ref), fFlagUseNavigationSelectors (ref), selectors (ref), userInputService (ref), overflowMenu (ref), responsiveModule (ref), iconSize (ref)
	local var27 = useDispatch()
	local var28 = useTokens()
	local var29 = useLastInput()
	local var30 = useRoactService(roactNetworking)
	local var31 = useLocalization({
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
		reportAd = if fFlagLuaAppEnableSponsoredReportAd then "Feature.GameDetails.Action.ReportAd" else nil
	})
	local collectionId = p0.collectionId or ""
	local menuKey = p0.menuKey
	local vector2 = Vector2.new(1, 0)
	local uDim2 = UDim2.new(1, if luaAppAdjustOverflowMenuVisual then -var28.Padding.Medium else -var28.Padding.Small, 0, if luaAppAdjustOverflowMenuVisual then var28.Padding.Medium else var28.Padding.Small)
	local var35 = getOverflowMenuSignalStore()
	local var36 = if not fFlagLuaAppFixExplicitFeedbackConsoleTelemetry then useGameTileOverflowMenuFocusNavigationModule(menuKey, p0.isSelected, p0.parentRef) else nil
	local var37 = reactModule.useMemo(function() --[[ line: 128 ]]
		-- upvalues: userSignalTypes (copy), var31 (ref)
		return {
			{
				id = userSignalTypes.NotInterestedFeedbackItem.TooRepetitive,
				text = var31.tooRepetitive
			},
			{
				id = userSignalTypes.NotInterestedFeedbackItem.DontLikeGame,
				text = var31.dontLikeGame
			},
			{
				id = userSignalTypes.NotInterestedFeedbackItem.DontLikeImage,
				text = var31.dontLikeImage
			},
			{
				id = userSignalTypes.NotInterestedFeedbackItem.InappropriateContent,
				text = var31.inappropriateContent
			},
			{
				triggersOtherTextbox = true,
				id = userSignalTypes.NotInterestedFeedbackItem.SomethingElse,
				text = var31.somethingElse
			}
		}
	end, { var31 })
	local var38 = reactModule.useCallback(function(p1, p2) --[[ line: 155 ]]
		-- upvalues: var37 (ref), userSignalTypes (copy), var27 (ref), openDynamicAbuseReportModule (copy), abuseVectorModule (copy), p0 (ref), closeCentralOverlay (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy), setNetworkingErrorToast (copy), postSendUserSignal (copy), var30 (ref), httpService (copy), collectionId (ref), mutedError (copy), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), sendNotInterestedFeedbackFormAnalyticsModule (copy), fFlagLuaAppFixExplicitFeedbackTelemetry (copy)
		local var52 = false
		local t = {}
		
		for i, v in var37 do
			table.insert(t, { id = v.id, selected = p1[v.id] or false })
			
			if v.id == userSignalTypes.NotInterestedFeedbackItem.InappropriateContent and p1[v.id] then
				var52 = true
			end
		end
		if var52 then
			var27(openDynamicAbuseReportModule({
				abuseVector = abuseVectorModule.Place,
				targetId = p0.universeId,
				onClose = function() --[[ line: 174 ]]
					-- upvalues: var27 (copy), closeCentralOverlay (copy)
					var27(closeCentralOverlay())
				end
			}))
		end
		if not p0.appPage then
			default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedMissingAppPage, 1)
			var27(setNetworkingErrorToast())
			
			return
		end
		local ok, status = pcall(function() --[[ line: 189 ]]
			-- upvalues: postSendUserSignal (copy), var30 (copy), httpService (copy), userSignalTypes (copy), p2 (ref), t (ref), p0 (copy), collectionId (copy), var27 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
			postSendUserSignal(var30, {
				stringValue = httpService:JSONEncode({
					formId = userSignalTypes.NotInterestedFeedbackFormId.NotInterestedFeedback1,
					titleId = userSignalTypes.NotInterestedFeedbackFormTitleId.WhyHideExperience,
					textResponse = p2,
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
			}, userSignalTypes.SignalValueType.String, userSignalTypes.SignalType.NotInterestedFeedback):catch(function(p3) --[[ line: 208 ]]
				-- upvalues: var27 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
				var27(setNetworkingErrorToast(p3))
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
		var30, var37, var31, p0.universeId, p0.appPage, collectionId, var27,
		p0.isSponsored
	})
	local var39 = nil
	local var40 = nil
	
	if fFlagLuaAppNotInterestedFeedbackFormTelemetry then
		var39 = reactModule.useCallback(function(p4) --[[ line: 245 ]]
			-- upvalues: sendNotInterestedFeedbackFormAnalyticsModule (copy), fFlagLuaAppFixExplicitFeedbackTelemetry (copy), p0 (ref), collectionId (ref)
			if p4 then
				return
			end
			sendNotInterestedFeedbackFormAnalyticsModule({
				actionType = "NotInterestedFeedbackFormClosedWithoutSubmit",
				ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p0.appPage,
				universeId = p0.universeId,
				sortId = collectionId
			}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p0.appPage else nil)
		end, { p0.appPage, p0.universeId, collectionId })
		var40 = reactModule.useCallback(function() --[[ line: 259 ]]
			-- upvalues: sendNotInterestedFeedbackFormAnalyticsModule (copy), fFlagLuaAppFixExplicitFeedbackTelemetry (copy), p0 (ref), collectionId (ref)
			sendNotInterestedFeedbackFormAnalyticsModule({
				actionType = "NotInterestedFeedbackFormOpened",
				ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p0.appPage,
				universeId = p0.universeId,
				sortId = collectionId
			}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p0.appPage else nil)
		end, { p0.appPage, p0.universeId, collectionId })
	end
	local var41 = reactModule.useMemo(function() --[[ line: 269 ]]
		-- upvalues: var31 (ref), var37 (ref), var38 (ref), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), var39 (write), fFlagLuaAppMakeDisclaimerOptInForFeedbackForm (copy)
		return {
			dialogTitle = var31.dialogTitle,
			dialogText = var31.dialogText,
			checkboxListTitle = var31.checkboxListTitle,
			checkboxItems = var37,
			onSubmit = var38,
			onClose = if fFlagLuaAppNotInterestedFeedbackFormTelemetry then var39 else nil,
			showTermsOfUseDisclaimer = if fFlagLuaAppMakeDisclaimerOptInForFeedbackForm then false else nil
		}
	end, { var31, var37, var38 })
	local t = {}
	
	for i, v in p0.availableMenuItems do
		table.insert(t, i)
	end
	local joined = table.concat(t, ",")
	local var44 = reactModule.useCallback(function(p5) --[[ line: 287 ]]
		-- upvalues: p0 (ref), joined (ref)
		if p0.onMenuOpenChanged then
			p0.onMenuOpenChanged(p5, joined)
		end
	end, { p0.onMenuOpenChanged, joined })
	local var45 = reactModule.useCallback(function(p6) --[[ line: 293 ]]
		-- upvalues: fFlagLuaAppFixExplicitFeedbackTelemetry (copy), p0 (ref), collectionId (ref), joined (ref), gameTileOverflowMenuAction (copy)
		gameTileOverflowMenuAction({
			actionType = "GameTileOverflowMenuItemActivated",
			ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p0.appPage,
			universeId = p0.universeId,
			sortId = collectionId,
			menuItem = p6,
			availableMenuItems = joined
		}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p0.appPage else nil)
	end, { p0.appPage, p0.universeId, collectionId, joined })
	
	if fFlagLuaAppFixExplicitFeedbackConsoleTelemetry then
		var36 = useGameTileOverflowMenuFocusNavigationModule(menuKey, p0.isSelected, p0.parentRef, var44)
	end
	local var46 = reactModule.useCallback(function() --[[ line: 315 ]]
		-- upvalues: p0 (ref), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy), var27 (ref), setNetworkingErrorToast (copy), setCentralOverlay (copy), centralOverlayType (copy), var41 (ref), fFlagLuaAppUseSnackbarForProvideFeedbackToast (copy), enums (copy), images (copy), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), var40 (write), postSendUserSignal (copy), var30 (ref), userSignalTypes (copy), collectionId (ref), mutedError (copy), var45 (ref), tileOverflowMenuItems (copy)
		if not p0.appPage then
			default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedMissingAppPage, 1)
			var27(setNetworkingErrorToast())
			
			return
		end
		p0.setGameHidden(p0.universeId, true)
		var27(setCentralOverlay(centralOverlayType.ProvideFeedbackToast, {
			feedbackFormProps = var41,
			toastIcon = if fFlagLuaAppUseSnackbarForProvideFeedbackToast then enums.IconName.CircleMinus else images["icons/actions/edit/remove"],
			onToastActivated = if fFlagLuaAppNotInterestedFeedbackFormTelemetry then var40 else nil
		}))
		local ok, status = pcall(function() --[[ line: 334 ]]
			-- upvalues: postSendUserSignal (copy), var30 (copy), p0 (copy), userSignalTypes (copy), collectionId (copy), var27 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
			postSendUserSignal(var30, { boolValue = true }, {
				id = p0.universeId,
				assetType = if p0.isSponsored then userSignalTypes.AssetType.SponsoredGame else userSignalTypes.AssetType.Game,
				signalOrigin = {
					productSurface = p0.appPage,
					topicId = collectionId,
					subIds = { collectionId }
				}
			}, userSignalTypes.SignalValueType.Bool, userSignalTypes.SignalType.NotInterested):catch(function(p7) --[[ line: 348 ]]
				-- upvalues: p0 (copy), var27 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
				p0.setGameHidden(p0.universeId, false)
				var27(setNetworkingErrorToast(p7))
				default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedUserSignalFailed, 1)
			end)
		end)
		
		if not ok then
			p0.setGameHidden(p0.universeId, false)
			mutedError(status)
		end
		var45(tileOverflowMenuItems.NotInterested)
	end, {
		var30, p0.setGameHidden, var27, var41, p0.universeId, collectionId, p0.appPage,
		var45, p0.isSponsored
	})
	local var47 = reactModule.useCallback(function() --[[ line: 380 ]]
		-- upvalues: var27 (ref), setCentralOverlay (copy), centralOverlayType (copy), p0 (ref), var45 (ref), tileOverflowMenuItems (copy)
		var27(setCentralOverlay(centralOverlayType.WhyThisAdModal, {
			universeId = p0.universeId,
			payerName = p0.payerName,
			sponsoredUserCohort = p0.sponsoredUserCohort
		}))
		var45(tileOverflowMenuItems.WhyThisAd)
	end, {
		var27,
		p0.universeId,
		p0.payerName,
		p0.sponsoredUserCohort,
		var45
	})
	local var48 = if fFlagLuaAppEnableSponsoredReportAd then reactModule.useCallback(function() --[[ line: 400 ]]
		-- upvalues: p0 (ref), flaggedMutedError (copy), var27 (ref), openDynamicAbuseReportModule (copy), abuseVectorModule (copy), closeCentralOverlay (copy), var45 (ref), tileOverflowMenuItems (copy)
		if p0.adId then
			var27(openDynamicAbuseReportModule({
				abuseVector = abuseVectorModule.AdV2,
				targetId = p0.adId,
				onClose = function() --[[ line: 409 ]]
					-- upvalues: var27 (copy), closeCentralOverlay (copy)
					var27(closeCentralOverlay())
				end
			}))
			var45(tileOverflowMenuItems.ReportAd)
			
			return
		end
		flaggedMutedError("ReportSponsoredAdError", "Report ad clicked without valid target ad id")
	end, { var27, p0.adId, var45 }) else nil
	local var49 = reactModule.useMemo(function() --[[ line: 425 ]]
		-- upvalues: p0 (ref), tileOverflowMenuItems (copy), var31 (ref), var46 (ref), var47 (ref), fFlagLuaAppEnableSponsoredReportAd (copy), iconName (copy), var48 (ref)
		local t = {}
		
		if p0.availableMenuItems[tileOverflowMenuItems.NotInterested] then
			table.insert(t, {
				icon = "icons/actions/block",
				id = tileOverflowMenuItems.NotInterested,
				text = var31.notInterested,
				onActivated = var46
			})
		end
		if p0.availableMenuItems[tileOverflowMenuItems.WhyThisAd] then
			table.insert(t, {
				icon = "icons/actions/info",
				id = tileOverflowMenuItems.WhyThisAd,
				text = var31.whyThisAd,
				onActivated = var47
			})
		end
		if fFlagLuaAppEnableSponsoredReportAd and p0.availableMenuItems[tileOverflowMenuItems.ReportAd] then
			table.insert(t, {
				icon = iconName.Flag,
				id = tileOverflowMenuItems.ReportAd,
				text = var31.reportAd,
				onActivated = var48
			})
		end
		return t
	end, {
		var46,
		var31,
		var47,
		p0.isSponsored,
		p0.availableMenuItems
	})
	local var50 = if fFlagSignalsNavP3fGameDetails then useSignalState(var25(false).getCurrentRouteKey) else useSelector(function(p8) --[[ line: 470 ]]
		-- upvalues: fFlagUseNavigationSelectors (copy), selectors (copy)
		return if fFlagUseNavigationSelectors then selectors.selectCurrentRoactNavigationRoute(p8).key or "" else p8.Navigation.currentRoute.key or ""
	end)
	local var51 = reactModule.useRef(var50)
	reactModule.useEffect(function() --[[ line: 479 ]]
		-- upvalues: var50 (write), var51 (ref), var35 (ref), menuKey (ref)
		if var50 ~= var51.current then
			var35.closeMenu(menuKey)
		end
	end, { var50, menuKey })
	reactModule.useEffect(function() --[[ line: 485 ]]
		-- upvalues: p0 (ref), userInputService (copy), var35 (ref), menuKey (ref)
		local var55 = if p0.menuOpen then userInputService.InputBegan:Connect(function(p9, _) --[[ line: 488 ]]
			-- upvalues: p0 (copy), var35 (copy), menuKey (copy)
			if p9.UserInputType == Enum.UserInputType.MouseButton1 and not p0.isHovered then
				var35.closeMenu(menuKey)
			end
		end) else nil
		
		return function() --[[ line: 496 ]]
			-- upvalues: var55 (write)
			if var55 then
				var55:Disconnect()
			end
		end
	end, { p0.menuOpen, p0.isHovered, menuKey })
	
	return reactModule.createElement(overflowMenu, {
		anchorPoint = vector2,
		anchorPosition = uDim2,
		menuItems = var49,
		hasOverflowButton = var29 == responsiveModule.Input.Pointer,
		shouldShowAnchor = p0.isHovered,
		buttonIconBackgroundStyle = var28.Color.OverMedia.OverMedia_0,
		menuKey = menuKey,
		setFocusRef = var36,
		onMenuOpenChanged = var44,
		buttonIconSize = if luaAppAdjustOverflowMenuVisual then iconSize.Small else nil
	})
end)