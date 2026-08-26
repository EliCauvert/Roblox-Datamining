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

local function _(p1, p2, p3)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref)
	p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
		name = sduiActionType.AiOverviewFeedback,
		message = p2,
		propName = p3
	}, p1.appPage)
end

local function sendUserSignal(value, p1, p2, p3, p4, p5)
	-- upvalues: postSendUserSignal (ref), httpService (ref), userSignalTypes (ref), sduiErrorType (ref), sduiActionType (ref)
	local ok, status = pcall(function()
		-- upvalues: postSendUserSignal (copy), p1 (ref), httpService (copy), p5 (ref), p2 (ref), userSignalTypes (copy), p3 (ref), p4 (ref), value (ref), sduiErrorType (copy), sduiActionType (copy)
		postSendUserSignal(p1, { stringValue = httpService:JSONEncode(p5) }, {
			id = p2,
			assetType = userSignalTypes.AssetType.PowerSearch,
			signalOrigin = {
				topicId = "PowerSearch",
				productSurface = p3,
				subIds = { "PowerSearch" }
			}
		}, userSignalTypes.SignalValueType.String, p4):catch(function(p6)
			-- upvalues: value (copy), sduiErrorType (copy), sduiActionType (copy)
			value.dependencies.logger.reportError(sduiErrorType.ActionNetworkRequestFailed, {
				name = sduiActionType.AiOverviewFeedback,
				message = tostring(p6)
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

return function(p1, p2, p3, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), t (ref), findAnalyticsFieldInAncestors (ref), sendUserSignal (ref), userSignalTypes (ref), setCentralOverlay (ref), centralOverlayType (ref), buttonVariant (ref), aiOverviewExplicitFeedback (ref), aiOverviewSentiment (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			propName = nil,
			name = sduiActionType.AiOverviewFeedback
		}, p3.appPage)
		
		return
	end
	local sentiment = var1.sentiment
	
	if typeof(sentiment) ~= "string" or not t[sentiment] then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "sentiment",
			name = sduiActionType.AiOverviewFeedback,
			message = `Invalid or missing sentiment: {tostring(sentiment)}`
		}, p3.appPage)
		
		return
	end
	local productSurface = var1.productSurface
	local var2 = if typeof(productSurface) == "string" and productSurface ~= "" then productSurface else "Unknown"
	local searchSessionId = findAnalyticsFieldInAncestors("searchSessionId", p2) or ""
	local searchQuery = findAnalyticsFieldInAncestors("searchQuery", p2) or ""
	local var3 = findAnalyticsFieldInAncestors("universeIds", p2)
	local appPage = p3.appPage
	local networking = p3.dependencies.networking
	sendUserSignal(p3, networking, searchSessionId, var2, userSignalTypes.SignalType.AiOverviewSentiment, {
		sentiment = sentiment,
		query = searchQuery,
		universe_ids = var3
	})
	p3.dependencies.dispatch(setCentralOverlay(centralOverlayType.TextFeedbackFormModal, {
		showTermsOfUseDisclaimer = true,
		dialogTitle = var1.dialogTitle or "",
		dialogText = var1.dialogText,
		placeholderText = var1.placeholderText,
		buttonVariant = buttonVariant.Emphasis,
		onSubmit = function(p4)
			-- upvalues: sendUserSignal (copy), p3 (ref), networking (ref), searchSessionId (ref), var2 (ref), userSignalTypes (copy), sentiment (ref), searchQuery (ref), aiOverviewExplicitFeedback (copy), appPage (ref)
			sendUserSignal(p3, networking, searchSessionId, var2, userSignalTypes.SignalType.AiOverviewExplicitFeedback, {
				sentiment = sentiment,
				feedback_text = p4,
				query = searchQuery
			})
			aiOverviewExplicitFeedback({
				didSubmit = true,
				sentiment = sentiment,
				searchSessionId = searchSessionId,
				query = searchQuery,
				feedbackText = p4
			}, appPage)
		end,
		onClose = function(p4)
			-- upvalues: sendUserSignal (copy), p3 (ref), networking (ref), searchSessionId (ref), var2 (ref), userSignalTypes (copy), sentiment (ref), searchQuery (ref), aiOverviewExplicitFeedback (copy), appPage (ref)
			if p4 then
				return
			end
			sendUserSignal(p3, networking, searchSessionId, var2, userSignalTypes.SignalType.AiOverviewExplicitFeedback, {
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
		universeIds = var3
	}, appPage)
end