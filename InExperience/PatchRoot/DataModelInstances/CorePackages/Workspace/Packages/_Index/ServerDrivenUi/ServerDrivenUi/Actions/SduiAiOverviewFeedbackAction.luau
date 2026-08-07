local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local centralOverlayModule = require(parent.CentralOverlay)
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local foundationModule = require(parent.Foundation)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local userSignalsModule = require(parent.UserSignals)
local buttonVariant = foundationModule.Enums.ButtonVariant
local centralOverlayType = robloxAppEnumsModule.CentralOverlayType
local setCentralOverlay = centralOverlayModule.Actions.SetCentralOverlay
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local findAnalyticsFieldInAncestors = sduiCoreSystemModule.findAnalyticsFieldInAncestors
local postSendUserSignal = userSignalsModule.PostSendUserSignal
local userSignalTypes = userSignalsModule.UserSignalTypes
local aiOverviewSentiment = discoveryAnalyticsModule.Events.aiOverviewSentiment
local aiOverviewExplicitFeedback = discoveryAnalyticsModule.Events.aiOverviewExplicitFeedback
local aiOverviewSentiment_1 = discoveryAnalyticsModule.Constants.AiOverviewSentiment
local t = {
	[aiOverviewSentiment_1.ThumbsUp] = true,
	[aiOverviewSentiment_1.ThumbsDown] = true
}

local function _(p0, p1, p2) --[[ line: 43 | named "reportInvalidParam" ]]
	-- upvalues: sduiErrorType (ref), sduiActionType (ref)
	p0.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
		name = sduiActionType.AiOverviewFeedback,
		message = p1,
		propName = p2
	}, p0.appPage)
end

local function sendUserSignal(value, p3, p4, p5, p6, p7) --[[ line: 51 ]]
	-- upvalues: postSendUserSignal (ref), httpService (ref), userSignalTypes (ref), sduiErrorType (ref), sduiActionType (ref)
	local ok, status = pcall(function() --[[ line: 59 ]]
		-- upvalues: postSendUserSignal (copy), p3 (ref), httpService (copy), p7 (ref), p4 (ref), userSignalTypes (copy), p5 (ref), p6 (ref), value (ref), sduiErrorType (copy), sduiActionType (copy)
		postSendUserSignal(p3, { stringValue = httpService:JSONEncode(p7) }, {
			id = p4,
			assetType = userSignalTypes.AssetType.PowerSearch,
			signalOrigin = {
				topicId = "PowerSearch",
				productSurface = p5,
				subIds = { "PowerSearch" }
			}
		}, userSignalTypes.SignalValueType.String, p6):catch(function(p8) --[[ line: 70 ]]
			-- upvalues: value (copy), sduiErrorType (copy), sduiActionType (copy)
			value.dependencies.logger.reportError(sduiErrorType.ActionNetworkRequestFailed, {
				name = sduiActionType.AiOverviewFeedback,
				message = tostring(p8)
			}, value.appPage)
		end)
	end)
	
	if not ok then
		value.dependencies.logger.reportError(sduiErrorType.ActionNetworkRequestFailed, {
			name = sduiActionType.AiOverviewFeedback,
			message = tostring(status)
		}, value.appPage)
	end
end

return function(p9, p10, p11, _) --[[ line: 86 | named "SduiAiOverviewFeedbackAction" ]]
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), t (ref), findAnalyticsFieldInAncestors (ref), sendUserSignal (ref), userSignalTypes (ref), setCentralOverlay (ref), centralOverlayType (ref), buttonVariant (ref), aiOverviewExplicitFeedback (ref), aiOverviewSentiment (ref)
	local var9 = if p9 then p9.actionParams else nil
	
	if var9 == nil then
		p11.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			propName = nil,
			name = sduiActionType.AiOverviewFeedback
		}, p11.appPage)
		
		return
	end
	local sentiment = var9.sentiment
	
	if typeof(sentiment) ~= "string" or not t[sentiment] then
		p11.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "sentiment",
			name = sduiActionType.AiOverviewFeedback,
			message = `Invalid or missing sentiment: {tostring(sentiment)}`
		}, p11.appPage)
		
		return
	end
	local productSurface = var9.productSurface
	local var10 = if typeof(productSurface) == "string" and productSurface ~= "" then productSurface else "Unknown"
	local searchSessionId = findAnalyticsFieldInAncestors("searchSessionId", p10) or ""
	local searchQuery = findAnalyticsFieldInAncestors("searchQuery", p10) or ""
	local var13 = findAnalyticsFieldInAncestors("universeIds", p10)
	local appPage = p11.appPage
	local networking = p11.dependencies.networking
	sendUserSignal(p11, networking, searchSessionId, var10, userSignalTypes.SignalType.AiOverviewSentiment, {
		sentiment = sentiment,
		query = searchQuery,
		universe_ids = var13
	})
	p11.dependencies.dispatch(setCentralOverlay(centralOverlayType.TextFeedbackFormModal, {
		showTermsOfUseDisclaimer = true,
		dialogTitle = var9.dialogTitle or "",
		dialogText = var9.dialogText,
		placeholderText = var9.placeholderText,
		buttonVariant = buttonVariant.Emphasis,
		onSubmit = function(p12) --[[ line: 135 ]]
			-- upvalues: sendUserSignal (copy), p11 (ref), networking (ref), searchSessionId (ref), var10 (ref), userSignalTypes (copy), sentiment (ref), searchQuery (ref), aiOverviewExplicitFeedback (copy), appPage (ref)
			sendUserSignal(p11, networking, searchSessionId, var10, userSignalTypes.SignalType.AiOverviewExplicitFeedback, {
				sentiment = sentiment,
				feedback_text = p12,
				query = searchQuery
			})
			aiOverviewExplicitFeedback({
				didSubmit = true,
				sentiment = sentiment,
				searchSessionId = searchSessionId,
				query = searchQuery,
				feedbackText = p12
			}, appPage)
		end,
		onClose = function(p13) --[[ line: 157 ]]
			-- upvalues: sendUserSignal (copy), p11 (ref), networking (ref), searchSessionId (ref), var10 (ref), userSignalTypes (copy), sentiment (ref), searchQuery (ref), aiOverviewExplicitFeedback (copy), appPage (ref)
			if p13 then
				return
			end
			sendUserSignal(p11, networking, searchSessionId, var10, userSignalTypes.SignalType.AiOverviewExplicitFeedback, {
				feedback_text = "",
				sentiment = sentiment,
				query = searchQuery
			})
			aiOverviewExplicitFeedback({
				didSubmit = false,
				sentiment = sentiment,
				searchSessionId = searchSessionId,
				query = searchQuery
			}, appPage)
		end
	}))
	aiOverviewSentiment({
		sentiment = sentiment,
		searchSessionId = searchSessionId,
		query = searchQuery,
		universeIds = var13
	}, appPage)
end