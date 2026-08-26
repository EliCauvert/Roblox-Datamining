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
local userSignalsModule = require(parent.UserSignals)
local abuseVectorModule = require(parent.GenericAbuseReporting.AbuseVector)
local openDynamicAbuseReportModule = require(parent.GenericAbuseReporting.OpenDynamicAbuseReport)
local notInterestedUserSignalTelemetryEventConfigsModule = require(gameTile.NotInterestedUserSignalTelemetryEventConfigs)
local sendNotInterestedFeedbackFormAnalyticsModule = require(gameTile.sendNotInterestedFeedbackFormAnalytics)
local tileOverflowMenuItems = require(gameTile.GameTileConstants).TileOverflowMenuItems
local closeCentralOverlay = centralOverlayModule.Thunks.CloseCentralOverlay
local setCentralOverlay = centralOverlayModule.Actions.SetCentralOverlay
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
local postSendUserSignal = userSignalsModule.PostSendUserSignal
local userSignalTypes = userSignalsModule.UserSignalTypes
local fFlagLuaAppMakeDisclaimerOptInForFeedbackForm = sharedFlagsModule.FFlagLuaAppMakeDisclaimerOptInForFeedbackForm
local fFlagLuaAppNotInterestedFeedbackFormTelemetry = sharedFlagsModule.FFlagLuaAppNotInterestedFeedbackFormTelemetry
local fFlagLuaAppFixExplicitFeedbackTelemetry = sharedFlagsModule.FFlagLuaAppFixExplicitFeedbackTelemetry
local fFlagLuaAppEnableSponsoredReportAd = sharedFlagsModule.FFlagLuaAppEnableSponsoredReportAd
local fFlagLuaAppNotInterestedReportPlaceId = sharedFlagsModule.FFlagLuaAppNotInterestedReportPlaceId
local fFlagLuaAppEnableHomepageOneByTwoTile = sharedFlagsModule.FFlagLuaAppEnableHomepageOneByTwoTile
local fFlagLuaAppContinueSortInstantPlay = sharedFlagsModule.FFlagLuaAppContinueSortInstantPlay

return function(p1, p2)
	-- upvalues: useDispatch (ref), useRoactService (ref), roactNetworking (ref), useLocalization (ref), fFlagLuaAppEnableSponsoredReportAd (ref), fFlagLuaAppContinueSortInstantPlay (ref), reactModule (ref), userSignalTypes (ref), fFlagLuaAppNotInterestedReportPlaceId (ref), flaggedMutedError (ref), openDynamicAbuseReportModule (ref), abuseVectorModule (ref), closeCentralOverlay (ref), default (ref), notInterestedUserSignalTelemetryEventConfigsModule (ref), setNetworkingErrorToast (ref), postSendUserSignal (ref), httpService (ref), mutedError (ref), fFlagLuaAppNotInterestedFeedbackFormTelemetry (ref), sendNotInterestedFeedbackFormAnalyticsModule (ref), fFlagLuaAppFixExplicitFeedbackTelemetry (ref), fFlagLuaAppMakeDisclaimerOptInForFeedbackForm (ref), tileOverflowMenuItems (ref), setCentralOverlay (ref), centralOverlayType (ref), iconName (ref), fFlagLuaAppEnableHomepageOneByTwoTile (ref)
	local var1 = useDispatch()
	local var2 = useRoactService(roactNetworking)
	local var3 = useLocalization({
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
	local var4 = reactModule.useMemo(function()
		-- upvalues: userSignalTypes (copy), var3 (ref)
		return {
			{
				id = userSignalTypes.NotInterestedFeedbackItem.TooRepetitive,
				text = var3.tooRepetitive
			},
			{
				id = userSignalTypes.NotInterestedFeedbackItem.DontLikeGame,
				text = var3.dontLikeGame
			},
			{
				id = userSignalTypes.NotInterestedFeedbackItem.DontLikeImage,
				text = var3.dontLikeImage
			},
			{
				id = userSignalTypes.NotInterestedFeedbackItem.InappropriateContent,
				text = var3.inappropriateContent
			},
			{
				triggersOtherTextbox = true,
				id = userSignalTypes.NotInterestedFeedbackItem.SomethingElse,
				text = var3.somethingElse
			}
		}
	end, { var3 })
	local var5 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var4 (ref), userSignalTypes (copy), fFlagLuaAppNotInterestedReportPlaceId (copy), p3 (ref), flaggedMutedError (copy), var1 (ref), openDynamicAbuseReportModule (copy), abuseVectorModule (copy), closeCentralOverlay (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy), setNetworkingErrorToast (copy), postSendUserSignal (copy), var2 (ref), httpService (copy), collectionId (ref), mutedError (copy), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), sendNotInterestedFeedbackFormAnalyticsModule (copy), fFlagLuaAppFixExplicitFeedbackTelemetry (copy)
		local var6 = false
		local t = {}
		
		for i, v in var4 do
			table.insert(t, { id = v.id, selected = p3[v.id] or false })
			
			if v.id == userSignalTypes.NotInterestedFeedbackItem.InappropriateContent and p3[v.id] then
				var6 = true
			end
		end
		if var6 then
			if fFlagLuaAppNotInterestedReportPlaceId and (not p3.placeId or p3.placeId == "") then
				flaggedMutedError("NotInterestedReportPlaceIdMissing", "Place report opened without a place id")
			else
				var6(openDynamicAbuseReportModule({
					abuseVector = abuseVectorModule.Place,
					targetId = if fFlagLuaAppNotInterestedReportPlaceId then p3.placeId else p3.universeId,
					onClose = function()
						-- upvalues: var6 (copy), closeCentralOverlay (copy)
						var6(closeCentralOverlay())
					end
				}))
			end
		end
		if not p3.appPage then
			default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedMissingAppPage, 1)
			var6(setNetworkingErrorToast())
			
			return
		end
		local ok, status = pcall(function()
			-- upvalues: postSendUserSignal (copy), var2 (copy), httpService (copy), userSignalTypes (copy), p4 (ref), t (ref), p3 (copy), collectionId (copy), var6 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
			postSendUserSignal(var2, {
				stringValue = httpService:JSONEncode({
					formId = userSignalTypes.NotInterestedFeedbackFormId.NotInterestedFeedback1,
					titleId = userSignalTypes.NotInterestedFeedbackFormTitleId.WhyHideExperience,
					textResponse = p4,
					items = t
				})
			}, {
				id = p3.universeId,
				assetType = if p3.isSponsored then userSignalTypes.AssetType.SponsoredGame else userSignalTypes.AssetType.Game,
				signalOrigin = {
					productSurface = p3.appPage,
					topicId = collectionId,
					subIds = { collectionId }
				}
			}, userSignalTypes.SignalValueType.String, userSignalTypes.SignalType.NotInterestedFeedback):catch(function(p5)
				-- upvalues: var6 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
				var6(setNetworkingErrorToast(p5))
				default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedUserSignalFailed, 1)
			end)
		end)
		
		if not ok then
			mutedError(status)
		end
		if fFlagLuaAppNotInterestedFeedbackFormTelemetry then
			sendNotInterestedFeedbackFormAnalyticsModule({
				actionType = "NotInterestedFeedbackFormSubmitted",
				ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p3.appPage,
				universeId = p3.universeId,
				sortId = collectionId
			}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p3.appPage else nil)
		end
	end, {
		var2, var4, var3, p3.universeId,
		if fFlagLuaAppNotInterestedReportPlaceId then p3.placeId else nil, p3.appPage,
		collectionId, var6, p3.isSponsored
	})
	local var6 = nil
	local var7 = nil
	
	if fFlagLuaAppNotInterestedFeedbackFormTelemetry then
		var6 = reactModule.useCallback(function(p5)
			-- upvalues: sendNotInterestedFeedbackFormAnalyticsModule (copy), fFlagLuaAppFixExplicitFeedbackTelemetry (copy), p5 (ref), collectionId (ref)
			if p5 then
				return
			end
			sendNotInterestedFeedbackFormAnalyticsModule({
				actionType = "NotInterestedFeedbackFormClosedWithoutSubmit",
				ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p5.appPage,
				universeId = p5.universeId,
				sortId = collectionId
			}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p5.appPage else nil)
		end, { p3.appPage, p3.universeId, collectionId })
		var7 = reactModule.useCallback(function()
			-- upvalues: sendNotInterestedFeedbackFormAnalyticsModule (copy), fFlagLuaAppFixExplicitFeedbackTelemetry (copy), p3 (ref), collectionId (ref)
			sendNotInterestedFeedbackFormAnalyticsModule({
				actionType = "NotInterestedFeedbackFormOpened",
				ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p3.appPage,
				universeId = p3.universeId,
				sortId = collectionId
			}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p3.appPage else nil)
		end, { p3.appPage, p3.universeId, collectionId })
	end
	local var6 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), var4 (ref), var5 (ref), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), var6 (write), fFlagLuaAppMakeDisclaimerOptInForFeedbackForm (copy)
		return {
			dialogTitle = var3.dialogTitle,
			dialogText = var3.dialogText,
			checkboxListTitle = var3.checkboxListTitle,
			checkboxItems = var4,
			onSubmit = var5,
			onClose = if fFlagLuaAppNotInterestedFeedbackFormTelemetry then var6 else nil,
			showTermsOfUseDisclaimer = if fFlagLuaAppMakeDisclaimerOptInForFeedbackForm then false else nil
		}
	end, {
		var3,
		var4,
		var5,
		if fFlagLuaAppNotInterestedFeedbackFormTelemetry then var6 else nil
	})
	local var6 = if fFlagLuaAppContinueSortInstantPlay then reactModule.useCallback(function()
		-- upvalues: p3 (ref), p4 (ref), tileOverflowMenuItems (copy)
		if p3.onGameDetailsActivated then
			p3.onGameDetailsActivated()
		end
		if p4 then
			p4(tileOverflowMenuItems.GameDetails)
		end
	end, { p3.onGameDetailsActivated, p4 }) else nil
	local var7 = reactModule.useCallback(function()
		-- upvalues: p3 (ref), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy), var6 (ref), setNetworkingErrorToast (copy), setCentralOverlay (copy), centralOverlayType (copy), var6 (ref), iconName (copy), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), var7 (write), postSendUserSignal (copy), var7 (ref), userSignalTypes (copy), collectionId (ref), mutedError (copy), p4 (ref), tileOverflowMenuItems (copy)
		if not p3.appPage then
			default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedMissingAppPage, 1)
			var6(setNetworkingErrorToast())
			
			return
		end
		p3.setGameHidden(p3.universeId, true)
		var6(setCentralOverlay(centralOverlayType.ProvideFeedbackToast, {
			feedbackFormProps = var6,
			toastIcon = iconName.CircleMinus,
			onToastActivated = if fFlagLuaAppNotInterestedFeedbackFormTelemetry then var7 else nil
		}))
		local ok, status = pcall(function()
			-- upvalues: postSendUserSignal (copy), var7 (copy), p3 (copy), userSignalTypes (copy), collectionId (copy), var6 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
			postSendUserSignal(var7, { boolValue = true }, {
				id = p3.universeId,
				assetType = if p3.isSponsored then userSignalTypes.AssetType.SponsoredGame else userSignalTypes.AssetType.Game,
				signalOrigin = {
					productSurface = p3.appPage,
					topicId = collectionId,
					subIds = { collectionId }
				}
			}, userSignalTypes.SignalValueType.Bool, userSignalTypes.SignalType.NotInterested):catch(function(p5)
				-- upvalues: p5 (copy), var6 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
				p5.setGameHidden(p5.universeId, false)
				var6(setNetworkingErrorToast(p5))
				default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedUserSignalFailed, 1)
			end)
		end)
		
		if not ok then
			p3.setGameHidden(p3.universeId, false)
			mutedError(status)
		end
		if p4 then
			p4(tileOverflowMenuItems.NotInterested)
		end
	end, {
		var7, p3.setGameHidden, var6, var6, p3.universeId, collectionId, p3.appPage,
		p4, p3.isSponsored,
		if fFlagLuaAppNotInterestedFeedbackFormTelemetry then var7 else nil
	})
	local var6 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), setCentralOverlay (copy), centralOverlayType (copy), p3 (ref), fFlagLuaAppEnableHomepageOneByTwoTile (copy), p4 (ref), tileOverflowMenuItems (copy)
		var6(setCentralOverlay(centralOverlayType.WhyThisAdModal, {
			universeId = p3.universeId,
			payerName = p3.payerName,
			sponsoredUserCohort = p3.sponsoredUserCohort,
			contentType = if fFlagLuaAppEnableHomepageOneByTwoTile then p3.contentType else nil
		}))
		
		if p4 then
			p4(tileOverflowMenuItems.WhyThisAd)
		end
	end, {
		var6, p3.universeId, p3.payerName, p3.sponsoredUserCohort,
		if fFlagLuaAppEnableHomepageOneByTwoTile then p3.contentType else nil, p4
	})
	local var6 = if fFlagLuaAppEnableSponsoredReportAd then reactModule.useCallback(function()
		-- upvalues: p3 (ref), flaggedMutedError (copy), var6 (ref), openDynamicAbuseReportModule (copy), abuseVectorModule (copy), closeCentralOverlay (copy), p4 (ref), tileOverflowMenuItems (copy)
		if not p3.adId then
			flaggedMutedError("ReportSponsoredAdError", "Report ad clicked without valid target ad id")
			
			return
		end
		var6(openDynamicAbuseReportModule({
			abuseVector = abuseVectorModule.AdV2,
			targetId = p3.adId,
			onClose = function()
				-- upvalues: var6 (copy), closeCentralOverlay (copy)
				var6(closeCentralOverlay())
			end
		}))
		
		if p4 then
			p4(tileOverflowMenuItems.ReportAd)
		end
	end, { var6, p3.adId, p4 }) else nil
	
	return reactModule.useMemo(function()
		-- upvalues: fFlagLuaAppContinueSortInstantPlay (copy), p3 (ref), tileOverflowMenuItems (copy), var3 (ref), var6 (ref), var7 (ref), var6 (ref), fFlagLuaAppEnableSponsoredReportAd (copy), iconName (copy), var6 (ref)
		local t = {}
		
		if fFlagLuaAppContinueSortInstantPlay and p3.availableMenuItems[tileOverflowMenuItems.GameDetails] then
			table.insert(t, {
				icon = "icons/actions/info",
				id = tileOverflowMenuItems.GameDetails,
				text = var3.gameDetails,
				onActivated = var6
			})
		end
		if p3.availableMenuItems[tileOverflowMenuItems.NotInterested] then
			table.insert(t, {
				icon = "icons/actions/block",
				id = tileOverflowMenuItems.NotInterested,
				text = var3.notInterested,
				onActivated = var7
			})
		end
		if p3.availableMenuItems[tileOverflowMenuItems.WhyThisAd] then
			table.insert(t, {
				icon = "icons/actions/info",
				id = tileOverflowMenuItems.WhyThisAd,
				text = var3.whyThisAd,
				onActivated = var6
			})
		end
		if fFlagLuaAppEnableSponsoredReportAd and p3.availableMenuItems[tileOverflowMenuItems.ReportAd] then
			table.insert(t, {
				icon = iconName.Flag,
				id = tileOverflowMenuItems.ReportAd,
				text = var3.reportAd,
				onActivated = var6
			})
		end
		return t
	end, {
		if fFlagLuaAppContinueSortInstantPlay then var6 else nil, var7, var3, var6,
		p3.isSponsored, p3.availableMenuItems,
		if fFlagLuaAppEnableSponsoredReportAd then var6 else nil
	})
end