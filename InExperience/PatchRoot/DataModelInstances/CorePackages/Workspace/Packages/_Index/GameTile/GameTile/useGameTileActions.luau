local httpService = game:GetService("HttpService")
local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local _ = require(parent.AppBlox)
local centralOverlayModule = require(parent.CentralOverlay)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local loggersModule = require(parent.Loggers)
local loggingProtocolModule = require(parent.LoggingProtocol)
local reactModule = require(parent.React)
local roactServiceTagsModule = require(parent.RoactServiceTags)
local roactUtilsModule = require(parent.RoactUtils)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local robloxAppToastsRoduxModule = require(parent.RobloxAppToastsRodux)
local sharedFlagsModule = require(parent.SharedFlags)
local UIBloxModule = require(parent.UIBlox)
local userSignalsModule = require(parent.UserSignals)
local abuseVectorModule = require(parent.GenericAbuseReporting.AbuseVector)
local openDynamicAbuseReportModule = require(parent.GenericAbuseReporting.OpenDynamicAbuseReport)
local notInterestedUserSignalTelemetryEventConfigsModule = require(gameTile.NotInterestedUserSignalTelemetryEventConfigs)
local sendNotInterestedFeedbackFormAnalyticsModule = require(gameTile.sendNotInterestedFeedbackFormAnalytics)
local tileOverflowMenuItems = require(gameTile.GameTileConstants).TileOverflowMenuItems
local closeCentralOverlay = centralOverlayModule.Thunks.CloseCentralOverlay
local setCentralOverlay = centralOverlayModule.Actions.SetCentralOverlay
local enums = foundationModule.Enums
local iconName = foundationModule.Enums.IconName
local useLocalization = localizationModule.Hooks.useLocalization
local flaggedMutedError = loggersModule.flaggedMutedError
local mutedError = loggersModule.mutedError
local default = loggingProtocolModule.default
local roactNetworking = roactServiceTagsModule.RoactNetworking
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local centralOverlayType = robloxAppEnumsModule.CentralOverlayType
local useRoactService = robloxAppHooksModule.useRoactService
local setNetworkingErrorToast = robloxAppToastsRoduxModule.Thunks.SetNetworkingErrorToast
local images = UIBloxModule.App.ImageSet.Images
local postSendUserSignal = userSignalsModule.PostSendUserSignal
local userSignalTypes = userSignalsModule.UserSignalTypes
local fFlagLuaAppMakeDisclaimerOptInForFeedbackForm = sharedFlagsModule.FFlagLuaAppMakeDisclaimerOptInForFeedbackForm
local fFlagLuaAppNotInterestedFeedbackFormTelemetry = sharedFlagsModule.FFlagLuaAppNotInterestedFeedbackFormTelemetry
local fFlagLuaAppFixExplicitFeedbackTelemetry = sharedFlagsModule.FFlagLuaAppFixExplicitFeedbackTelemetry
local fFlagLuaAppEnableSponsoredReportAd = sharedFlagsModule.FFlagLuaAppEnableSponsoredReportAd
local fFlagLuaAppUseSnackbarForProvideFeedbackToast = sharedFlagsModule.FFlagLuaAppUseSnackbarForProvideFeedbackToast
local fFlagLuaAppNotInterestedReportPlaceId = sharedFlagsModule.FFlagLuaAppNotInterestedReportPlaceId
local fFlagLuaAppEnableHomepageOneByTwoTile = sharedFlagsModule.FFlagLuaAppEnableHomepageOneByTwoTile
local fFlagLuaAppContinueSortInstantPlay = sharedFlagsModule.FFlagLuaAppContinueSortInstantPlay

return function(p0, p1) --[[ line: 81 | named "useGameTileActions" ]]
	-- upvalues: useDispatch (ref), useRoactService (ref), roactNetworking (ref), useLocalization (ref), fFlagLuaAppEnableSponsoredReportAd (ref), fFlagLuaAppContinueSortInstantPlay (ref), reactModule (ref), userSignalTypes (ref), fFlagLuaAppNotInterestedReportPlaceId (ref), flaggedMutedError (ref), openDynamicAbuseReportModule (ref), abuseVectorModule (ref), closeCentralOverlay (ref), default (ref), notInterestedUserSignalTelemetryEventConfigsModule (ref), setNetworkingErrorToast (ref), postSendUserSignal (ref), httpService (ref), mutedError (ref), fFlagLuaAppNotInterestedFeedbackFormTelemetry (ref), sendNotInterestedFeedbackFormAnalyticsModule (ref), fFlagLuaAppFixExplicitFeedbackTelemetry (ref), fFlagLuaAppMakeDisclaimerOptInForFeedbackForm (ref), tileOverflowMenuItems (ref), setCentralOverlay (ref), centralOverlayType (ref), fFlagLuaAppUseSnackbarForProvideFeedbackToast (ref), enums (ref), images (ref), fFlagLuaAppEnableHomepageOneByTwoTile (ref), iconName (ref)
	local var20 = useDispatch()
	local var21 = useRoactService(roactNetworking)
	local var22 = useLocalization({
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
	local var24 = reactModule.useMemo(function() --[[ line: 101 ]]
		-- upvalues: userSignalTypes (copy), var22 (ref)
		return {
			{
				id = userSignalTypes.NotInterestedFeedbackItem.TooRepetitive,
				text = var22.tooRepetitive
			},
			{
				id = userSignalTypes.NotInterestedFeedbackItem.DontLikeGame,
				text = var22.dontLikeGame
			},
			{
				id = userSignalTypes.NotInterestedFeedbackItem.DontLikeImage,
				text = var22.dontLikeImage
			},
			{
				id = userSignalTypes.NotInterestedFeedbackItem.InappropriateContent,
				text = var22.inappropriateContent
			},
			{
				triggersOtherTextbox = true,
				id = userSignalTypes.NotInterestedFeedbackItem.SomethingElse,
				text = var22.somethingElse
			}
		}
	end, { var22 })
	local var25 = reactModule.useCallback(function(p2, p3) --[[ line: 128 ]]
		-- upvalues: var24 (ref), userSignalTypes (copy), fFlagLuaAppNotInterestedReportPlaceId (copy), p0 (ref), flaggedMutedError (copy), var20 (ref), openDynamicAbuseReportModule (copy), abuseVectorModule (copy), closeCentralOverlay (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy), setNetworkingErrorToast (copy), postSendUserSignal (copy), var21 (ref), httpService (copy), collectionId (ref), mutedError (copy), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), sendNotInterestedFeedbackFormAnalyticsModule (copy), fFlagLuaAppFixExplicitFeedbackTelemetry (copy)
		local var33 = false
		local t = {}
		
		for i, v in var24 do
			table.insert(t, { id = v.id, selected = p2[v.id] or false })
			
			if v.id == userSignalTypes.NotInterestedFeedbackItem.InappropriateContent and p2[v.id] then
				var33 = true
			end
		end
		if var33 then
			if fFlagLuaAppNotInterestedReportPlaceId and (not p0.placeId or p0.placeId == "") then
				flaggedMutedError("NotInterestedReportPlaceIdMissing", "Place report opened without a place id")
			else
				var20(openDynamicAbuseReportModule({
					abuseVector = abuseVectorModule.Place,
					targetId = if fFlagLuaAppNotInterestedReportPlaceId then p0.placeId else p0.universeId,
					onClose = function() --[[ line: 152 ]]
						-- upvalues: var20 (copy), closeCentralOverlay (copy)
						var20(closeCentralOverlay())
					end
				}))
			end
		end
		if not p0.appPage then
			default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedMissingAppPage, 1)
			var20(setNetworkingErrorToast())
			
			return
		end
		local ok, status = pcall(function() --[[ line: 168 ]]
			-- upvalues: postSendUserSignal (copy), var21 (copy), httpService (copy), userSignalTypes (copy), p3 (ref), t (ref), p0 (copy), collectionId (copy), var20 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
			postSendUserSignal(var21, {
				stringValue = httpService:JSONEncode({
					formId = userSignalTypes.NotInterestedFeedbackFormId.NotInterestedFeedback1,
					titleId = userSignalTypes.NotInterestedFeedbackFormTitleId.WhyHideExperience,
					textResponse = p3,
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
			}, userSignalTypes.SignalValueType.String, userSignalTypes.SignalType.NotInterestedFeedback):catch(function(p4) --[[ line: 187 ]]
				-- upvalues: var20 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
				var20(setNetworkingErrorToast(p4))
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
		var21, var24, var22, p0.universeId,
		if fFlagLuaAppNotInterestedReportPlaceId then p0.placeId else nil, p0.appPage,
		collectionId, var20, p0.isSponsored
	})
	local var26 = nil
	local var27 = nil
	
	if fFlagLuaAppNotInterestedFeedbackFormTelemetry then
		var26 = reactModule.useCallback(function(p5) --[[ line: 225 ]]
			-- upvalues: sendNotInterestedFeedbackFormAnalyticsModule (copy), fFlagLuaAppFixExplicitFeedbackTelemetry (copy), p0 (ref), collectionId (ref)
			if p5 then
				return
			end
			sendNotInterestedFeedbackFormAnalyticsModule({
				actionType = "NotInterestedFeedbackFormClosedWithoutSubmit",
				ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p0.appPage,
				universeId = p0.universeId,
				sortId = collectionId
			}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p0.appPage else nil)
		end, { p0.appPage, p0.universeId, collectionId })
		var27 = reactModule.useCallback(function() --[[ line: 238 ]]
			-- upvalues: sendNotInterestedFeedbackFormAnalyticsModule (copy), fFlagLuaAppFixExplicitFeedbackTelemetry (copy), p0 (ref), collectionId (ref)
			sendNotInterestedFeedbackFormAnalyticsModule({
				actionType = "NotInterestedFeedbackFormOpened",
				ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p0.appPage,
				universeId = p0.universeId,
				sortId = collectionId
			}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p0.appPage else nil)
		end, { p0.appPage, p0.universeId, collectionId })
	end
	local var28 = reactModule.useMemo(function() --[[ line: 249 ]]
		-- upvalues: var22 (ref), var24 (ref), var25 (ref), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), var26 (write), fFlagLuaAppMakeDisclaimerOptInForFeedbackForm (copy)
		return {
			dialogTitle = var22.dialogTitle,
			dialogText = var22.dialogText,
			checkboxListTitle = var22.checkboxListTitle,
			checkboxItems = var24,
			onSubmit = var25,
			onClose = if fFlagLuaAppNotInterestedFeedbackFormTelemetry then var26 else nil,
			showTermsOfUseDisclaimer = if fFlagLuaAppMakeDisclaimerOptInForFeedbackForm then false else nil
		}
	end, {
		var22,
		var24,
		var25,
		if fFlagLuaAppNotInterestedFeedbackFormTelemetry then var26 else nil
	})
	local var29 = if fFlagLuaAppContinueSortInstantPlay then reactModule.useCallback(function() --[[ line: 269 ]]
		-- upvalues: p0 (ref), p1 (ref), tileOverflowMenuItems (copy)
		if p0.onGameDetailsActivated then
			p0.onGameDetailsActivated()
		end
		if p1 then
			p1(tileOverflowMenuItems.GameDetails)
		end
	end, { p0.onGameDetailsActivated, p1 }) else nil
	local var30 = reactModule.useCallback(function() --[[ line: 281 ]]
		-- upvalues: p0 (ref), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy), var20 (ref), setNetworkingErrorToast (copy), setCentralOverlay (copy), centralOverlayType (copy), var28 (ref), fFlagLuaAppUseSnackbarForProvideFeedbackToast (copy), enums (copy), images (copy), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), var27 (write), postSendUserSignal (copy), var21 (ref), userSignalTypes (copy), collectionId (ref), mutedError (copy), p1 (ref), tileOverflowMenuItems (copy)
		if not p0.appPage then
			default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedMissingAppPage, 1)
			var20(setNetworkingErrorToast())
			
			return
		end
		p0.setGameHidden(p0.universeId, true)
		var20(setCentralOverlay(centralOverlayType.ProvideFeedbackToast, {
			feedbackFormProps = var28,
			toastIcon = if fFlagLuaAppUseSnackbarForProvideFeedbackToast then enums.IconName.CircleMinus else images["icons/actions/edit/remove"],
			onToastActivated = if fFlagLuaAppNotInterestedFeedbackFormTelemetry then var27 else nil
		}))
		local ok, status = pcall(function() --[[ line: 300 ]]
			-- upvalues: postSendUserSignal (copy), var21 (copy), p0 (copy), userSignalTypes (copy), collectionId (copy), var20 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
			postSendUserSignal(var21, { boolValue = true }, {
				id = p0.universeId,
				assetType = if p0.isSponsored then userSignalTypes.AssetType.SponsoredGame else userSignalTypes.AssetType.Game,
				signalOrigin = {
					productSurface = p0.appPage,
					topicId = collectionId,
					subIds = { collectionId }
				}
			}, userSignalTypes.SignalValueType.Bool, userSignalTypes.SignalType.NotInterested):catch(function(p6) --[[ line: 314 ]]
				-- upvalues: p0 (copy), var20 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
				p0.setGameHidden(p0.universeId, false)
				var20(setNetworkingErrorToast(p6))
				default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedUserSignalFailed, 1)
			end)
		end)
		
		if not ok then
			p0.setGameHidden(p0.universeId, false)
			mutedError(status)
		end
		if p1 then
			p1(tileOverflowMenuItems.NotInterested)
		end
	end, {
		var21, p0.setGameHidden, var20, var28, p0.universeId, collectionId, p0.appPage,
		p1, p0.isSponsored,
		if fFlagLuaAppNotInterestedFeedbackFormTelemetry then var27 else nil
	})
	local var31 = reactModule.useCallback(function() --[[ line: 349 ]]
		-- upvalues: var20 (ref), setCentralOverlay (copy), centralOverlayType (copy), p0 (ref), fFlagLuaAppEnableHomepageOneByTwoTile (copy), p1 (ref), tileOverflowMenuItems (copy)
		var20(setCentralOverlay(centralOverlayType.WhyThisAdModal, {
			universeId = p0.universeId,
			payerName = p0.payerName,
			sponsoredUserCohort = p0.sponsoredUserCohort,
			contentType = if fFlagLuaAppEnableHomepageOneByTwoTile then p0.contentType else nil
		}))
		
		if p1 then
			p1(tileOverflowMenuItems.WhyThisAd)
		end
	end, {
		var20, p0.universeId, p0.payerName, p0.sponsoredUserCohort,
		if fFlagLuaAppEnableHomepageOneByTwoTile then p0.contentType else nil, p1
	})
	local var32 = if fFlagLuaAppEnableSponsoredReportAd then reactModule.useCallback(function() --[[ line: 373 ]]
		-- upvalues: p0 (ref), flaggedMutedError (copy), var20 (ref), openDynamicAbuseReportModule (copy), abuseVectorModule (copy), closeCentralOverlay (copy), p1 (ref), tileOverflowMenuItems (copy)
		if not p0.adId then
			flaggedMutedError("ReportSponsoredAdError", "Report ad clicked without valid target ad id")
			
			return
		end
		var20(openDynamicAbuseReportModule({
			abuseVector = abuseVectorModule.AdV2,
			targetId = p0.adId,
			onClose = function() --[[ line: 382 ]]
				-- upvalues: var20 (copy), closeCentralOverlay (copy)
				var20(closeCentralOverlay())
			end
		}))
		
		if p1 then
			p1(tileOverflowMenuItems.ReportAd)
		end
	end, { var20, p0.adId, p1 }) else nil
	
	return reactModule.useMemo(function() --[[ line: 400 ]]
		-- upvalues: fFlagLuaAppContinueSortInstantPlay (copy), p0 (ref), tileOverflowMenuItems (copy), var22 (ref), var29 (ref), var30 (ref), var31 (ref), fFlagLuaAppEnableSponsoredReportAd (copy), iconName (copy), var32 (ref)
		local t = {}
		
		if fFlagLuaAppContinueSortInstantPlay and p0.availableMenuItems[tileOverflowMenuItems.GameDetails] then
			table.insert(t, {
				icon = "icons/actions/info",
				id = tileOverflowMenuItems.GameDetails,
				text = var22.gameDetails,
				onActivated = var29
			})
		end
		if p0.availableMenuItems[tileOverflowMenuItems.NotInterested] then
			table.insert(t, {
				icon = "icons/actions/block",
				id = tileOverflowMenuItems.NotInterested,
				text = var22.notInterested,
				onActivated = var30
			})
		end
		if p0.availableMenuItems[tileOverflowMenuItems.WhyThisAd] then
			table.insert(t, {
				icon = "icons/actions/info",
				id = tileOverflowMenuItems.WhyThisAd,
				text = var22.whyThisAd,
				onActivated = var31
			})
		end
		if fFlagLuaAppEnableSponsoredReportAd and p0.availableMenuItems[tileOverflowMenuItems.ReportAd] then
			table.insert(t, {
				icon = iconName.Flag,
				id = tileOverflowMenuItems.ReportAd,
				text = var22.reportAd,
				onActivated = var32
			})
		end
		return t
	end, {
		if fFlagLuaAppContinueSortInstantPlay then var29 else nil, var30, var22, var31,
		p0.isSponsored, p0.availableMenuItems,
		if fFlagLuaAppEnableSponsoredReportAd then var32 else nil
	})
end