local httpService = game:GetService("HttpService")
local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local centralOverlayModule = require(parent.CentralOverlay)
local foundationModule = require(parent.Foundation)
local loggersModule = require(parent.Loggers)
local loggingProtocolModule = require(parent.LoggingProtocol)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local robloxAppToastsRoduxModule = require(parent.RobloxAppToastsRodux)
local sharedFlagsModule = require(parent.SharedFlags)
local userSignalsModule = require(parent.UserSignals)
local abuseVectorModule = require(parent.GenericAbuseReporting.AbuseVector)
local circleMinus = foundationModule.Enums.IconName.CircleMinus
local centralOverlayType = robloxAppEnumsModule.CentralOverlayType
local closeCentralOverlay = centralOverlayModule.Thunks.CloseCentralOverlay
local default = loggingProtocolModule.default
local openDynamicAbuseReportModule = require(parent.GenericAbuseReporting.OpenDynamicAbuseReport)
local postSendUserSignal = userSignalsModule.PostSendUserSignal
local setCentralOverlay = centralOverlayModule.Actions.SetCentralOverlay
local setNetworkingErrorToast = robloxAppToastsRoduxModule.Thunks.SetNetworkingErrorToast
local userSignalTypes = userSignalsModule.UserSignalTypes
local flaggedMutedError = loggersModule.flaggedMutedError
local mutedError = loggersModule.mutedError
local notInterestedUserSignalTelemetryEventConfigsModule = require(gameTile.NotInterestedUserSignalTelemetryEventConfigs)
local sendNotInterestedFeedbackFormAnalyticsModule = require(gameTile.sendNotInterestedFeedbackFormAnalytics)
local fFlagLuaAppFixExplicitFeedbackTelemetry = sharedFlagsModule.FFlagLuaAppFixExplicitFeedbackTelemetry
local fFlagLuaAppMakeDisclaimerOptInForFeedbackForm = sharedFlagsModule.FFlagLuaAppMakeDisclaimerOptInForFeedbackForm
local fFlagLuaAppNotInterestedFeedbackFormTelemetry = sharedFlagsModule.FFlagLuaAppNotInterestedFeedbackFormTelemetry
local fFlagLuaAppNotInterestedReportPlaceId = sharedFlagsModule.FFlagLuaAppNotInterestedReportPlaceId

local function _(p1, p2, p3, p4)
	-- upvalues: fFlagLuaAppNotInterestedFeedbackFormTelemetry (ref), sendNotInterestedFeedbackFormAnalyticsModule (ref), fFlagLuaAppFixExplicitFeedbackTelemetry (ref)
	if fFlagLuaAppNotInterestedFeedbackFormTelemetry then
		sendNotInterestedFeedbackFormAnalyticsModule({
			ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p1,
			universeId = p2,
			sortId = p3,
			actionType = p4
		}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p1 else nil)
		
		return
	end
end

local _ = function(p1, p2, p3, p4)
	-- upvalues: fFlagLuaAppNotInterestedFeedbackFormTelemetry (ref), sendNotInterestedFeedbackFormAnalyticsModule (ref), fFlagLuaAppFixExplicitFeedbackTelemetry (ref)
	if p1 then return end
	if fFlagLuaAppNotInterestedFeedbackFormTelemetry then
		sendNotInterestedFeedbackFormAnalyticsModule({
			actionType = "NotInterestedFeedbackFormClosedWithoutSubmit",
			ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p2,
			universeId = p3,
			sortId = p4
		}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p2 else nil)
		
		return
	end
end

local function onFeedbackFormSubmitted(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10)
	-- upvalues: userSignalTypes (ref), fFlagLuaAppNotInterestedReportPlaceId (ref), flaggedMutedError (ref), openDynamicAbuseReportModule (ref), abuseVectorModule (ref), closeCentralOverlay (ref), postSendUserSignal (ref), httpService (ref), setNetworkingErrorToast (ref), default (ref), notInterestedUserSignalTelemetryEventConfigsModule (ref), mutedError (ref), fFlagLuaAppNotInterestedFeedbackFormTelemetry (ref), sendNotInterestedFeedbackFormAnalyticsModule (ref), fFlagLuaAppFixExplicitFeedbackTelemetry (ref)
	local var1 = if p9 then userSignalTypes.AssetType.SponsoredGame else userSignalTypes.AssetType.Game
	local t = {}
	local var2 = false
	
	for i, v in p3 do
		local id = p1[v.id] or false
		table.insert(t, { id = v.id, selected = id })
		
		if v.id == userSignalTypes.NotInterestedFeedbackItem.InappropriateContent and id then
			var2 = true
		end
	end
	if var2 then
		if fFlagLuaAppNotInterestedReportPlaceId and (p8 == nil or p8 == "") then
			flaggedMutedError("NotInterestedReportPlaceIdMissing", "Place report opened without a place id")
		else
			p6(openDynamicAbuseReportModule({
				abuseVector = abuseVectorModule.Place,
				targetId = if fFlagLuaAppNotInterestedReportPlaceId then p8 else p10,
				onClose = function()
					-- upvalues: p6 (ref), closeCentralOverlay (copy)
					p6(closeCentralOverlay())
				end
			}))
		end
	end
	local ok, status = pcall(function()
		-- upvalues: postSendUserSignal (copy), p7 (ref), httpService (copy), userSignalTypes (copy), p2 (ref), t (ref), p10 (ref), var1 (ref), p4 (ref), p5 (ref), p6 (ref), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
		postSendUserSignal(p7, {
			stringValue = httpService:JSONEncode({
				formId = userSignalTypes.NotInterestedFeedbackFormId.NotInterestedFeedback1,
				titleId = userSignalTypes.NotInterestedFeedbackFormTitleId.WhyHideExperience,
				textResponse = p2,
				items = t
			})
		}, {
			id = p10,
			assetType = var1,
			signalOrigin = { productSurface = p4, topicId = p5, subIds = { p5 } }
		}, userSignalTypes.SignalValueType.String, userSignalTypes.SignalType.NotInterestedFeedback):catch(function(p11)
			-- upvalues: p6 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
			p6(setNetworkingErrorToast(p11))
			default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedUserSignalFailed, 1)
		end)
	end)
	
	if not ok then
		mutedError(status)
	end
	if fFlagLuaAppNotInterestedFeedbackFormTelemetry then
		sendNotInterestedFeedbackFormAnalyticsModule({
			actionType = "NotInterestedFeedbackFormSubmitted",
			ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p4,
			universeId = p10,
			sortId = p5
		}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p4 else nil)
		
		return
	end
end

return function(p11)
	-- upvalues: default (ref), notInterestedUserSignalTelemetryEventConfigsModule (ref), setNetworkingErrorToast (ref), userSignalTypes (ref), setCentralOverlay (ref), centralOverlayType (ref), onFeedbackFormSubmitted (ref), fFlagLuaAppNotInterestedFeedbackFormTelemetry (ref), sendNotInterestedFeedbackFormAnalyticsModule (ref), fFlagLuaAppFixExplicitFeedbackTelemetry (ref), fFlagLuaAppMakeDisclaimerOptInForFeedbackForm (ref), circleMinus (ref), postSendUserSignal (ref), mutedError (ref)
	local appPage = p11.appPage
	
	if not appPage then
		default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedMissingAppPage, 1)
		p11.dispatch(setNetworkingErrorToast())
		
		return false
	end
	local collectionId = p11.collectionId
	local dispatch = p11.dispatch
	local networking = p11.networking
	local placeId = p11.placeId
	local universeId = p11.universeId
	local var3 = if p11.isSponsored then userSignalTypes.AssetType.SponsoredGame else userSignalTypes.AssetType.Game
	local localizedStrings = p11.localizedStrings
	local list = {
		{
			id = userSignalTypes.NotInterestedFeedbackItem.TooRepetitive,
			text = localizedStrings.tooRepetitive
		},
		{
			id = userSignalTypes.NotInterestedFeedbackItem.DontLikeGame,
			text = localizedStrings.dontLikeGame
		},
		{
			id = userSignalTypes.NotInterestedFeedbackItem.DontLikeImage,
			text = localizedStrings.dontLikeImage
		},
		{
			id = userSignalTypes.NotInterestedFeedbackItem.InappropriateContent,
			text = localizedStrings.inappropriateContent
		},
		{
			triggersOtherTextbox = true,
			id = userSignalTypes.NotInterestedFeedbackItem.SomethingElse,
			text = localizedStrings.somethingElse
		}
	}
	p11.setGameHidden(universeId, true)
	dispatch(setCentralOverlay(centralOverlayType.ProvideFeedbackToast, {
		feedbackFormProps = {
			dialogTitle = localizedStrings.dialogTitle,
			dialogText = localizedStrings.dialogText,
			checkboxListTitle = localizedStrings.checkboxListTitle,
			checkboxItems = list,
			onSubmit = function(p12, p13)
				-- upvalues: onFeedbackFormSubmitted (copy), list (ref), appPage (ref), collectionId (ref), dispatch (ref), networking (ref), placeId (ref), p11 (ref), universeId (ref)
				onFeedbackFormSubmitted(p12, p13, list, appPage, collectionId, dispatch, networking, placeId, p11.isSponsored, universeId)
			end,
			onClose = if fFlagLuaAppNotInterestedFeedbackFormTelemetry then function(p12)
				-- upvalues: appPage (ref), universeId (ref), collectionId (ref), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), sendNotInterestedFeedbackFormAnalyticsModule (copy), fFlagLuaAppFixExplicitFeedbackTelemetry (copy)
				if p12 then return end
				if fFlagLuaAppNotInterestedFeedbackFormTelemetry then
					sendNotInterestedFeedbackFormAnalyticsModule({
						actionType = "NotInterestedFeedbackFormClosedWithoutSubmit",
						ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else appPage,
						universeId = universeId,
						sortId = collectionId
					}, if fFlagLuaAppFixExplicitFeedbackTelemetry then appPage else nil)
					
					return
				end
			end else nil,
			showTermsOfUseDisclaimer = if fFlagLuaAppMakeDisclaimerOptInForFeedbackForm then false else nil
		},
		toastIcon = circleMinus,
		onToastActivated = if fFlagLuaAppNotInterestedFeedbackFormTelemetry then function()
			-- upvalues: appPage (ref), universeId (ref), collectionId (ref), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), sendNotInterestedFeedbackFormAnalyticsModule (copy), fFlagLuaAppFixExplicitFeedbackTelemetry (copy)
			if fFlagLuaAppNotInterestedFeedbackFormTelemetry then
				sendNotInterestedFeedbackFormAnalyticsModule({
					actionType = "NotInterestedFeedbackFormOpened",
					ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else appPage,
					universeId = universeId,
					sortId = collectionId
				}, if fFlagLuaAppFixExplicitFeedbackTelemetry then appPage else nil)
				
				return
			end
		end else nil
	}))
	local ok, status = pcall(function()
		-- upvalues: postSendUserSignal (copy), networking (ref), universeId (ref), var3 (ref), appPage (ref), collectionId (ref), userSignalTypes (copy), p11 (ref), dispatch (ref), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
		postSendUserSignal(networking, { boolValue = true }, {
			id = universeId,
			assetType = var3,
			signalOrigin = {
				productSurface = appPage,
				topicId = collectionId,
				subIds = { collectionId }
			}
		}, userSignalTypes.SignalValueType.Bool, userSignalTypes.SignalType.NotInterested):catch(function(p12)
			-- upvalues: p11 (copy), universeId (copy), dispatch (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
			p11.setGameHidden(universeId, false)
			dispatch(setNetworkingErrorToast(p12))
			default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedUserSignalFailed, 1)
		end)
	end)
	
	if not ok then
		p11.setGameHidden(universeId, false)
		mutedError(status)
	end
	return true
end