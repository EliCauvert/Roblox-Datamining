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
local fFlagSignalsNavP3hMisc = sharedFlagsModule.FFlagSignalsNavP3hMisc
local useSignalState = require(parent.SignalsReact).useSignalState
local var25 = if fFlagSignalsNavP3hMisc then require(parent.NavigationRodux).GetLegacyNavigationStore else nil
local luaAppMitigatePopoverPressedOutsideBug = game:DefineFastFlag("LuaAppMitigatePopoverPressedOutsideBug", false)
local fFlagLuaAppGameTileOverflowMenuTelemetry = sharedFlagsModule.FFlagLuaAppGameTileOverflowMenuTelemetry
local fFlagLuaAppMakeDisclaimerOptInForFeedbackForm = sharedFlagsModule.FFlagLuaAppMakeDisclaimerOptInForFeedbackForm
local fFlagLuaAppNotInterestedFeedbackFormTelemetry = sharedFlagsModule.FFlagLuaAppNotInterestedFeedbackFormTelemetry
local fFlagLuaAppFixExplicitFeedbackTelemetry = sharedFlagsModule.FFlagLuaAppFixExplicitFeedbackTelemetry
local fFlagLuaAppEnableWhyThisAdModal = sharedFlagsModule.FFlagLuaAppEnableWhyThisAdModal
local fFlagLuaAppEnableSponsoredReportAd = sharedFlagsModule.FFlagLuaAppEnableSponsoredReportAd
local luaAppAdjustOverflowMenuVisual = game:DefineFastFlag("LuaAppAdjustOverflowMenuVisual", false)
local fFlagLuaAppSupportSponsoredExplicitFeedback = sharedFlagsModule.FFlagLuaAppSupportSponsoredExplicitFeedback
local fFlagLuaAppUseSnackbarForProvideFeedbackToast = sharedFlagsModule.FFlagLuaAppUseSnackbarForProvideFeedbackToast
local fFlagLuaAppSduiBadgeDetailsComponents = sharedFlagsModule.FFlagLuaAppSduiBadgeDetailsComponents
local fFlagLuaAppFixExplicitFeedbackConsoleTelemetry = sharedFlagsModule.FFlagLuaAppFixExplicitFeedbackConsoleTelemetry

return reactModule.memo(function(p0) --[[ line: 98 | named "GameTileOverflowMenu" ]]
	-- upvalues: useDispatch (ref), useTokens (ref), useLastInput (ref), useRoactService (ref), roactNetworking (ref), useLocalization (ref), fFlagLuaAppEnableWhyThisAdModal (ref), fFlagLuaAppEnableSponsoredReportAd (ref), luaAppAdjustOverflowMenuVisual (ref), getOverflowMenuSignalStore (ref), fFlagLuaAppFixExplicitFeedbackConsoleTelemetry (ref), useGameTileOverflowMenuFocusNavigationModule (ref), reactModule (ref), userSignalTypes (ref), openDynamicAbuseReportModule (ref), abuseVectorModule (ref), closeCentralOverlay (ref), default (ref), notInterestedUserSignalTelemetryEventConfigsModule (ref), setNetworkingErrorToast (ref), postSendUserSignal (ref), httpService (ref), fFlagLuaAppSupportSponsoredExplicitFeedback (ref), mutedError (ref), fFlagLuaAppNotInterestedFeedbackFormTelemetry (ref), sendNotInterestedFeedbackFormAnalyticsModule (ref), fFlagLuaAppFixExplicitFeedbackTelemetry (ref), fFlagLuaAppMakeDisclaimerOptInForFeedbackForm (ref), fFlagLuaAppGameTileOverflowMenuTelemetry (ref), gameTileOverflowMenuAction (ref), setCentralOverlay (ref), centralOverlayType (ref), fFlagLuaAppUseSnackbarForProvideFeedbackToast (ref), enums (ref), images (ref), tileOverflowMenuItems (ref), flaggedMutedError (ref), iconName (ref), fFlagSignalsNavP3hMisc (ref), var25 (ref), useSignalState (ref), useSelector (ref), fFlagUseNavigationSelectors (ref), selectors (ref), luaAppMitigatePopoverPressedOutsideBug (ref), userInputService (ref), overflowMenu (ref), responsiveModule (ref), fFlagLuaAppSduiBadgeDetailsComponents (ref), iconSize (ref)
	local var28 = useDispatch()
	local var29 = useTokens()
	local var30 = useLastInput()
	local var31 = useRoactService(roactNetworking)
	local var32 = useLocalization({
		notInterested = "Feature.GameDetails.Action.NotInterested",
		dialogTitle = "Feature.GameDetails.Label.ProvideFeedbackTitle",
		dialogText = "Feature.GameDetails.Message.HelpImproveExperience",
		checkboxListTitle = "Feature.GameDetails.Message.HidingExperienceQuestion",
		tooRepetitive = "Feature.GameDetails.Label.TooRepetitive",
		dontLikeGame = "Feature.GameDetails.Label.DontLikeGame",
		dontLikeImage = "Feature.GameDetails.Label.DontLikeImage",
		inappropriateContent = "Feature.GameDetails.Label.InappropriateContent",
		somethingElse = "Feature.GameDetails.Label.SomethingElse",
		whyThisAd = if fFlagLuaAppEnableWhyThisAdModal then "Feature.GameDetails.Action.WhyThisAd" else nil,
		reportAd = if fFlagLuaAppEnableSponsoredReportAd then "Feature.GameDetails.Action.ReportAd" else nil
	})
	local collectionId = p0.collectionId or ""
	local menuKey = p0.menuKey
	local vector2 = Vector2.new(1, 0)
	local uDim2 = UDim2.new(1, if luaAppAdjustOverflowMenuVisual then -var29.Padding.Medium else -var29.Padding.Small, 0, if luaAppAdjustOverflowMenuVisual then var29.Padding.Medium else var29.Padding.Small)
	local var36 = getOverflowMenuSignalStore()
	local var37 = if not fFlagLuaAppFixExplicitFeedbackConsoleTelemetry then useGameTileOverflowMenuFocusNavigationModule(menuKey, p0.isSelected, p0.parentRef) else nil
	local var38 = reactModule.useMemo(function() --[[ line: 133 ]]
		-- upvalues: userSignalTypes (copy), var32 (ref)
		return {
			{
				id = userSignalTypes.NotInterestedFeedbackItem.TooRepetitive,
				text = var32.tooRepetitive
			},
			{
				id = userSignalTypes.NotInterestedFeedbackItem.DontLikeGame,
				text = var32.dontLikeGame
			},
			{
				id = userSignalTypes.NotInterestedFeedbackItem.DontLikeImage,
				text = var32.dontLikeImage
			},
			{
				id = userSignalTypes.NotInterestedFeedbackItem.InappropriateContent,
				text = var32.inappropriateContent
			},
			{
				triggersOtherTextbox = true,
				id = userSignalTypes.NotInterestedFeedbackItem.SomethingElse,
				text = var32.somethingElse
			}
		}
	end, { var32 })
	local var39 = reactModule.useCallback(function(p1, p2) --[[ line: 160 ]]
		-- upvalues: var38 (ref), userSignalTypes (copy), var28 (ref), openDynamicAbuseReportModule (copy), abuseVectorModule (copy), p0 (ref), closeCentralOverlay (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy), setNetworkingErrorToast (copy), postSendUserSignal (copy), var31 (ref), httpService (copy), fFlagLuaAppSupportSponsoredExplicitFeedback (copy), collectionId (ref), mutedError (copy), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), sendNotInterestedFeedbackFormAnalyticsModule (copy), fFlagLuaAppFixExplicitFeedbackTelemetry (copy)
		local var52 = false
		local t = {}
		
		for i, v in var38 do
			table.insert(t, { id = v.id, selected = p1[v.id] or false })
			
			if v.id == userSignalTypes.NotInterestedFeedbackItem.InappropriateContent and p1[v.id] then
				var52 = true
			end
		end
		if var52 then
			var28(openDynamicAbuseReportModule({
				abuseVector = abuseVectorModule.Place,
				targetId = p0.universeId,
				onClose = function() --[[ line: 179 ]]
					-- upvalues: var28 (copy), closeCentralOverlay (copy)
					var28(closeCentralOverlay())
				end
			}))
		end
		if not p0.appPage then
			default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedMissingAppPage, 1)
			var28(setNetworkingErrorToast())
			
			return
		end
		local ok, status = pcall(function() --[[ line: 194 ]]
			-- upvalues: postSendUserSignal (copy), var31 (copy), httpService (copy), userSignalTypes (copy), p2 (ref), t (ref), p0 (copy), fFlagLuaAppSupportSponsoredExplicitFeedback (copy), collectionId (copy), var28 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
			postSendUserSignal(var31, {
				stringValue = httpService:JSONEncode({
					formId = userSignalTypes.NotInterestedFeedbackFormId.NotInterestedFeedback1,
					titleId = userSignalTypes.NotInterestedFeedbackFormTitleId.WhyHideExperience,
					textResponse = p2,
					items = t
				})
			}, {
				id = p0.universeId,
				assetType = if fFlagLuaAppSupportSponsoredExplicitFeedback and p0.isSponsored then userSignalTypes.AssetType.SponsoredGame else userSignalTypes.AssetType.Game,
				signalOrigin = {
					productSurface = p0.appPage,
					topicId = collectionId,
					subIds = { collectionId }
				}
			}, userSignalTypes.SignalValueType.String, userSignalTypes.SignalType.NotInterestedFeedback):catch(function(p3) --[[ line: 213 ]]
				-- upvalues: var28 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
				var28(setNetworkingErrorToast(p3))
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
		var31, var38, var32, p0.universeId, p0.appPage, collectionId, var28,
		if fFlagLuaAppSupportSponsoredExplicitFeedback then p0.isSponsored else nil
	})
	local var40 = nil
	local var41 = nil
	
	if fFlagLuaAppNotInterestedFeedbackFormTelemetry then
		var40 = reactModule.useCallback(function(p4) --[[ line: 250 ]]
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
		var41 = reactModule.useCallback(function() --[[ line: 264 ]]
			-- upvalues: sendNotInterestedFeedbackFormAnalyticsModule (copy), fFlagLuaAppFixExplicitFeedbackTelemetry (copy), p0 (ref), collectionId (ref)
			sendNotInterestedFeedbackFormAnalyticsModule({
				actionType = "NotInterestedFeedbackFormOpened",
				ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p0.appPage,
				universeId = p0.universeId,
				sortId = collectionId
			}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p0.appPage else nil)
		end, { p0.appPage, p0.universeId, collectionId })
	end
	local joined
	local var42 = reactModule.useMemo(function() --[[ line: 274 ]]
		-- upvalues: var32 (ref), var38 (ref), var39 (ref), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), var40 (write), fFlagLuaAppMakeDisclaimerOptInForFeedbackForm (copy)
		return {
			dialogTitle = var32.dialogTitle,
			dialogText = var32.dialogText,
			checkboxListTitle = var32.checkboxListTitle,
			checkboxItems = var38,
			onSubmit = var39,
			onClose = if fFlagLuaAppNotInterestedFeedbackFormTelemetry then var40 else nil,
			showTermsOfUseDisclaimer = if fFlagLuaAppMakeDisclaimerOptInForFeedbackForm then false else nil
		}
	end, { var32, var38, var39 })
	local var43 = nil
	local var44 = nil
	
	if fFlagLuaAppGameTileOverflowMenuTelemetry then
		local _ = nil
		
		if fFlagLuaAppEnableWhyThisAdModal then
			local t = {}
			
			for i, v in p0.availableMenuItems do
				table.insert(t, i)
			end
			joined = table.concat(t, ",")
		else
			joined = "NotInterested"
		end
		var43 = reactModule.useCallback(function(p5) --[[ line: 299 ]]
			-- upvalues: p0 (ref), joined (write)
			if p0.onMenuOpenChanged then
				p0.onMenuOpenChanged(p5, joined)
			end
		end, { p0.onMenuOpenChanged, joined })
		var44 = reactModule.useCallback(function(p6) --[[ line: 305 ]]
			-- upvalues: fFlagLuaAppFixExplicitFeedbackTelemetry (copy), p0 (ref), collectionId (ref), joined (write), gameTileOverflowMenuAction (copy)
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
			var37 = useGameTileOverflowMenuFocusNavigationModule(menuKey, p0.isSelected, p0.parentRef, var43)
		end
	end
	joined = reactModule.useCallback(function() --[[ line: 328 ]]
		-- upvalues: p0 (ref), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy), var28 (ref), setNetworkingErrorToast (copy), setCentralOverlay (copy), centralOverlayType (copy), var42 (ref), fFlagLuaAppUseSnackbarForProvideFeedbackToast (copy), enums (copy), images (copy), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), var41 (write), postSendUserSignal (copy), var31 (ref), fFlagLuaAppSupportSponsoredExplicitFeedback (copy), userSignalTypes (copy), collectionId (ref), mutedError (copy), fFlagLuaAppGameTileOverflowMenuTelemetry (copy), var44 (write), tileOverflowMenuItems (copy)
		if not p0.appPage then
			default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedMissingAppPage, 1)
			var28(setNetworkingErrorToast())
			
			return
		end
		p0.setGameHidden(p0.universeId, true)
		var28(setCentralOverlay(centralOverlayType.ProvideFeedbackToast, {
			feedbackFormProps = var42,
			toastIcon = if fFlagLuaAppUseSnackbarForProvideFeedbackToast then enums.IconName.CircleMinus else images["icons/actions/edit/remove"],
			onToastActivated = if fFlagLuaAppNotInterestedFeedbackFormTelemetry then var41 else nil
		}))
		local ok, status = pcall(function() --[[ line: 347 ]]
			-- upvalues: postSendUserSignal (copy), var31 (copy), p0 (copy), fFlagLuaAppSupportSponsoredExplicitFeedback (copy), userSignalTypes (copy), collectionId (copy), var28 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
			postSendUserSignal(var31, { boolValue = true }, {
				id = p0.universeId,
				assetType = if fFlagLuaAppSupportSponsoredExplicitFeedback and p0.isSponsored then userSignalTypes.AssetType.SponsoredGame else userSignalTypes.AssetType.Game,
				signalOrigin = {
					productSurface = p0.appPage,
					topicId = collectionId,
					subIds = { collectionId }
				}
			}, userSignalTypes.SignalValueType.Bool, userSignalTypes.SignalType.NotInterested):catch(function(p7) --[[ line: 361 ]]
				-- upvalues: p0 (copy), var28 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
				p0.setGameHidden(p0.universeId, false)
				var28(setNetworkingErrorToast(p7))
				default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedUserSignalFailed, 1)
			end)
		end)
		
		if not ok then
			p0.setGameHidden(p0.universeId, false)
			mutedError(status)
		end
		if fFlagLuaAppGameTileOverflowMenuTelemetry then
			var44(tileOverflowMenuItems.NotInterested)
		end
	end, {
		var31, p0.setGameHidden, var28, var42, p0.universeId, collectionId, p0.appPage,
		if fFlagLuaAppGameTileOverflowMenuTelemetry then var44 else nil,
		if fFlagLuaAppSupportSponsoredExplicitFeedback then p0.isSponsored else nil
	})
	local var47 = if fFlagLuaAppEnableWhyThisAdModal then reactModule.useCallback(function() --[[ line: 396 ]]
		-- upvalues: var28 (ref), setCentralOverlay (copy), centralOverlayType (copy), p0 (ref), fFlagLuaAppGameTileOverflowMenuTelemetry (copy), var44 (write), tileOverflowMenuItems (copy)
		var28(setCentralOverlay(centralOverlayType.WhyThisAdModal, {
			universeId = p0.universeId,
			payerName = p0.payerName,
			sponsoredUserCohort = p0.sponsoredUserCohort
		}))
		
		if fFlagLuaAppGameTileOverflowMenuTelemetry then
			var44(tileOverflowMenuItems.WhyThisAd)
		end
	end, {
		var28,
		p0.universeId,
		p0.payerName,
		p0.sponsoredUserCohort,
		if fFlagLuaAppGameTileOverflowMenuTelemetry then var44 else nil
	}) else nil
	local var48 = if fFlagLuaAppEnableSponsoredReportAd then reactModule.useCallback(function() --[[ line: 419 ]]
		-- upvalues: p0 (ref), flaggedMutedError (copy), var28 (ref), openDynamicAbuseReportModule (copy), abuseVectorModule (copy), closeCentralOverlay (copy), fFlagLuaAppGameTileOverflowMenuTelemetry (copy), var44 (write), tileOverflowMenuItems (copy)
		if not p0.adId then
			flaggedMutedError("ReportSponsoredAdError", "Report ad clicked without valid target ad id")
			
			return
		end
		var28(openDynamicAbuseReportModule({
			abuseVector = abuseVectorModule.AdV2,
			targetId = p0.adId,
			onClose = function() --[[ line: 428 ]]
				-- upvalues: var28 (copy), closeCentralOverlay (copy)
				var28(closeCentralOverlay())
			end
		}))
		
		if fFlagLuaAppGameTileOverflowMenuTelemetry then
			var44(tileOverflowMenuItems.ReportAd)
		end
	end, {
		var28,
		p0.adId,
		if fFlagLuaAppGameTileOverflowMenuTelemetry then var44 else nil
	}) else nil
	local var49 = reactModule.useMemo(function() --[[ line: 446 ]]
		-- upvalues: fFlagLuaAppEnableWhyThisAdModal (copy), fFlagLuaAppSupportSponsoredExplicitFeedback (copy), p0 (ref), tileOverflowMenuItems (copy), var32 (ref), joined (ref), var47 (ref), fFlagLuaAppEnableSponsoredReportAd (copy), iconName (copy), var48 (ref)
		if not fFlagLuaAppEnableWhyThisAdModal then
			return {
				{
					icon = "icons/actions/block",
					id = tileOverflowMenuItems.NotInterested,
					text = var32.notInterested,
					onActivated = joined
				}
			}
		end
		local t = {}
		
		if fFlagLuaAppSupportSponsoredExplicitFeedback and p0.availableMenuItems[tileOverflowMenuItems.NotInterested] then
			table.insert(t, {
				icon = "icons/actions/block",
				id = tileOverflowMenuItems.NotInterested,
				text = var32.notInterested,
				onActivated = joined
			})
		end
		if p0.availableMenuItems[tileOverflowMenuItems.WhyThisAd] then
			table.insert(t, {
				icon = "icons/actions/info",
				id = tileOverflowMenuItems.WhyThisAd,
				text = var32.whyThisAd,
				onActivated = var47
			})
		end
		if fFlagLuaAppEnableSponsoredReportAd and p0.availableMenuItems[tileOverflowMenuItems.ReportAd] then
			table.insert(t, {
				icon = iconName.Flag,
				id = tileOverflowMenuItems.ReportAd,
				text = var32.reportAd,
				onActivated = var48
			})
		end
		if not fFlagLuaAppSupportSponsoredExplicitFeedback and p0.availableMenuItems[tileOverflowMenuItems.NotInterested] then
			table.insert(t, {
				icon = "icons/actions/block",
				id = tileOverflowMenuItems.NotInterested,
				text = var32.notInterested,
				onActivated = joined
			})
		end
		return t
	end, {
		joined,
		var32,
		if fFlagLuaAppEnableWhyThisAdModal then var47 else nil,
		if fFlagLuaAppEnableWhyThisAdModal then p0.isSponsored else nil,
		p0.availableMenuItems
	})
	local var50 = if fFlagSignalsNavP3hMisc then useSignalState(var25(false).getCurrentRoute).key or "" else useSelector(function(p8) --[[ line: 519 ]]
		-- upvalues: fFlagUseNavigationSelectors (copy), selectors (copy)
		return if fFlagUseNavigationSelectors then selectors.selectCurrentRoactNavigationRoute(p8).key or "" else p8.Navigation.currentRoute.key or ""
	end)
	local var51 = reactModule.useRef(var50)
	reactModule.useEffect(function() --[[ line: 528 ]]
		-- upvalues: var50 (write), var51 (ref), var36 (ref), menuKey (ref)
		if var50 ~= var51.current then
			var36.closeMenu(menuKey)
		end
	end, { var50, menuKey })
	
	if luaAppMitigatePopoverPressedOutsideBug then
		reactModule.useEffect(function() --[[ line: 535 ]]
			-- upvalues: p0 (ref), userInputService (copy), var36 (ref), menuKey (ref)
			local var55 = if p0.menuOpen then userInputService.InputBegan:Connect(function(p9, _) --[[ line: 539 ]]
				-- upvalues: p0 (copy), var36 (copy), menuKey (copy)
				if p9.UserInputType == Enum.UserInputType.MouseButton1 and not p0.isHovered then
					var36.closeMenu(menuKey)
				end
			end) else nil
			
			return function() --[[ line: 548 ]]
				-- upvalues: var55 (write)
				if var55 then
					var55:Disconnect()
				end
			end
		end, { p0.menuOpen, p0.isHovered, menuKey })
	end
	return reactModule.createElement(overflowMenu, {
		anchorPoint = vector2,
		anchorPosition = uDim2,
		menuItems = var49,
		hasOverflowButton = var30 == responsiveModule.Input.Pointer,
		shouldShowAnchor = p0.isHovered,
		buttonIconBackgroundStyle = if fFlagLuaAppSduiBadgeDetailsComponents then var29.Color.OverMedia.OverMedia_0 else nil,
		menuKey = menuKey,
		setFocusRef = var37,
		onMenuOpenChanged = if fFlagLuaAppGameTileOverflowMenuTelemetry then var43 else nil,
		buttonIconSize = if luaAppAdjustOverflowMenuVisual then iconSize.Small else nil
	})
end)