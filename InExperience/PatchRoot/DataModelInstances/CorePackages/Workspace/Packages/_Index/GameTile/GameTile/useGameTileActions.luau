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
	local var5 = reactModule.useCallback(function(p1, p2)
		-- upvalues: var4 (ref), userSignalTypes (copy), fFlagLuaAppNotInterestedReportPlaceId (copy), p1 (ref), flaggedMutedError (copy), var1 (ref), openDynamicAbuseReportModule (copy), abuseVectorModule (copy), closeCentralOverlay (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy), setNetworkingErrorToast (copy), postSendUserSignal (copy), var2 (ref), httpService (copy), collectionId (ref), mutedError (copy), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), sendNotInterestedFeedbackFormAnalyticsModule (copy), fFlagLuaAppFixExplicitFeedbackTelemetry (copy)
		local var1 = false
		local t = {}
		
		for i, v in var4 do
			table.insert(t, { id = v.id, selected = p1[v.id] or false })
			
			if v.id == userSignalTypes.NotInterestedFeedbackItem.InappropriateContent and p1[v.id] then
				var1 = true
			end
		end
		if var1 then
			if fFlagLuaAppNotInterestedReportPlaceId and (not p1.placeId or p1.placeId == "") then
				flaggedMutedError("NotInterestedReportPlaceIdMissing", "Place report opened without a place id")
			else
				var1(openDynamicAbuseReportModule({
					abuseVector = abuseVectorModule.Place,
					targetId = if fFlagLuaAppNotInterestedReportPlaceId then p1.placeId else p1.universeId,
					onClose = function()
						-- upvalues: var1 (copy), closeCentralOverlay (copy)
						var1(closeCentralOverlay())
					end
				}))
			end
		end
		if not p1.appPage then
			default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedMissingAppPage, 1)
			var1(setNetworkingErrorToast())
			
			return
		end
		local ok, status = pcall(function()
			-- upvalues: postSendUserSignal (copy), var2 (copy), httpService (copy), userSignalTypes (copy), p2 (ref), t (ref), p1 (copy), collectionId (copy), var1 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
			postSendUserSignal(var2, {
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
				-- upvalues: var1 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
				var1(setNetworkingErrorToast(p1))
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
		var2, var4, var3, p1.universeId,
		if fFlagLuaAppNotInterestedReportPlaceId then p1.placeId else nil, p1.appPage,
		collectionId, var1, p1.isSponsored
	})
	local var1 = nil
	local var2 = nil
	
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
		var2 = reactModule.useCallback(function()
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
		-- upvalues: var3 (ref), var4 (ref), var5 (ref), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), var1 (write), fFlagLuaAppMakeDisclaimerOptInForFeedbackForm (copy)
		return {
			dialogTitle = var3.dialogTitle,
			dialogText = var3.dialogText,
			checkboxListTitle = var3.checkboxListTitle,
			checkboxItems = var4,
			onSubmit = var5,
			onClose = if fFlagLuaAppNotInterestedFeedbackFormTelemetry then var1 else nil,
			showTermsOfUseDisclaimer = if fFlagLuaAppMakeDisclaimerOptInForFeedbackForm then false else nil
		}
	end, {
		var3,
		var4,
		var5,
		if fFlagLuaAppNotInterestedFeedbackFormTelemetry then var1 else nil
	})
	local var1 = if fFlagLuaAppContinueSortInstantPlay then reactModule.useCallback(function()
		-- upvalues: p1 (ref), p2 (ref), tileOverflowMenuItems (copy)
		if p1.onGameDetailsActivated then
			p1.onGameDetailsActivated()
		end
		if p2 then
			p2(tileOverflowMenuItems.GameDetails)
		end
	end, { p1.onGameDetailsActivated, p2 }) else nil
	local var2 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy), var1 (ref), setNetworkingErrorToast (copy), setCentralOverlay (copy), centralOverlayType (copy), var1 (ref), iconName (copy), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), var2 (write), postSendUserSignal (copy), var2 (ref), userSignalTypes (copy), collectionId (ref), mutedError (copy), p2 (ref), tileOverflowMenuItems (copy)
		if not p1.appPage then
			default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedMissingAppPage, 1)
			var1(setNetworkingErrorToast())
			
			return
		end
		p1.setGameHidden(p1.universeId, true)
		var1(setCentralOverlay(centralOverlayType.ProvideFeedbackToast, {
			feedbackFormProps = var1,
			toastIcon = iconName.CircleMinus,
			onToastActivated = if fFlagLuaAppNotInterestedFeedbackFormTelemetry then var2 else nil
		}))
		local ok, status = pcall(function()
			-- upvalues: postSendUserSignal (copy), var2 (copy), p1 (copy), userSignalTypes (copy), collectionId (copy), var1 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
			postSendUserSignal(var2, { boolValue = true }, {
				id = p1.universeId,
				assetType = if p1.isSponsored then userSignalTypes.AssetType.SponsoredGame else userSignalTypes.AssetType.Game,
				signalOrigin = {
					productSurface = p1.appPage,
					topicId = collectionId,
					subIds = { collectionId }
				}
			}, userSignalTypes.SignalValueType.Bool, userSignalTypes.SignalType.NotInterested):catch(function(p1)
				-- upvalues: p1 (copy), var1 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
				p1.setGameHidden(p1.universeId, false)
				var1(setNetworkingErrorToast(p1))
				default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedUserSignalFailed, 1)
			end)
		end)
		
		if not ok then
			p1.setGameHidden(p1.universeId, false)
			mutedError(status)
		end
		if p2 then
			p2(tileOverflowMenuItems.NotInterested)
		end
	end, {
		var2, p1.setGameHidden, var1, var1, p1.universeId, collectionId, p1.appPage,
		p2, p1.isSponsored,
		if fFlagLuaAppNotInterestedFeedbackFormTelemetry then var2 else nil
	})
	local var1 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), setCentralOverlay (copy), centralOverlayType (copy), p1 (ref), fFlagLuaAppEnableHomepageOneByTwoTile (copy), p2 (ref), tileOverflowMenuItems (copy)
		var1(setCentralOverlay(centralOverlayType.WhyThisAdModal, {
			universeId = p1.universeId,
			payerName = p1.payerName,
			sponsoredUserCohort = p1.sponsoredUserCohort,
			contentType = if fFlagLuaAppEnableHomepageOneByTwoTile then p1.contentType else nil
		}))
		
		if p2 then
			p2(tileOverflowMenuItems.WhyThisAd)
		end
	end, {
		var1, p1.universeId, p1.payerName, p1.sponsoredUserCohort,
		if fFlagLuaAppEnableHomepageOneByTwoTile then p1.contentType else nil, p2
	})
	local var1 = if fFlagLuaAppEnableSponsoredReportAd then reactModule.useCallback(function()
		-- upvalues: p1 (ref), flaggedMutedError (copy), var1 (ref), openDynamicAbuseReportModule (copy), abuseVectorModule (copy), closeCentralOverlay (copy), p2 (ref), tileOverflowMenuItems (copy)
		if not p1.adId then
			flaggedMutedError("ReportSponsoredAdError", "Report ad clicked without valid target ad id")
			
			return
		end
		var1(openDynamicAbuseReportModule({
			abuseVector = abuseVectorModule.AdV2,
			targetId = p1.adId,
			onClose = function()
				-- upvalues: var1 (copy), closeCentralOverlay (copy)
				var1(closeCentralOverlay())
			end
		}))
		
		if p2 then
			p2(tileOverflowMenuItems.ReportAd)
		end
	end, { var1, p1.adId, p2 }) else nil
	
	return reactModule.useMemo(function()
		-- upvalues: fFlagLuaAppContinueSortInstantPlay (copy), p1 (ref), tileOverflowMenuItems (copy), var3 (ref), var1 (ref), var2 (ref), var1 (ref), fFlagLuaAppEnableSponsoredReportAd (copy), iconName (copy), var1 (ref)
		local t = {}
		
		if fFlagLuaAppContinueSortInstantPlay and p1.availableMenuItems[tileOverflowMenuItems.GameDetails] then
			table.insert(t, {
				icon = "icons/actions/info",
				id = tileOverflowMenuItems.GameDetails,
				text = var3.gameDetails,
				onActivated = var1
			})
		end
		if p1.availableMenuItems[tileOverflowMenuItems.NotInterested] then
			table.insert(t, {
				icon = "icons/actions/block",
				id = tileOverflowMenuItems.NotInterested,
				text = var3.notInterested,
				onActivated = var2
			})
		end
		if p1.availableMenuItems[tileOverflowMenuItems.WhyThisAd] then
			table.insert(t, {
				icon = "icons/actions/info",
				id = tileOverflowMenuItems.WhyThisAd,
				text = var3.whyThisAd,
				onActivated = var1
			})
		end
		if fFlagLuaAppEnableSponsoredReportAd and p1.availableMenuItems[tileOverflowMenuItems.ReportAd] then
			table.insert(t, {
				icon = iconName.Flag,
				id = tileOverflowMenuItems.ReportAd,
				text = var3.reportAd,
				onActivated = var1
			})
		end
		return t
	end, {
		if fFlagLuaAppContinueSortInstantPlay then var1 else nil, var2, var3, var1,
		p1.isSponsored, p1.availableMenuItems,
		if fFlagLuaAppEnableSponsoredReportAd then var1 else nil
	})
end