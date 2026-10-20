local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local DiscoveryAnalyticsModule = require(Parent.DiscoveryAnalytics)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local UserSignalsModule = require(Parent.UserSignals)
local ButtonVariant = require(Parent.Foundation).Enums.ButtonVariant
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local FindAnalyticsFieldInAncestorsFunction = SduiCoreSystemModule.findAnalyticsFieldInAncestors
local PostSendUserSignalFunction = UserSignalsModule.PostSendUserSignal
local UserSignalTypes = UserSignalsModule.UserSignalTypes
local AiOverviewSentimentFunction = DiscoveryAnalyticsModule.Events.aiOverviewSentiment
local AiOverviewExplicitFeedbackFunction = DiscoveryAnalyticsModule.Events.aiOverviewExplicitFeedback
local AiOverviewSentiment = DiscoveryAnalyticsModule.Constants.AiOverviewSentiment
local config = {
	[AiOverviewSentiment.ThumbsUp] = true,
	[AiOverviewSentiment.ThumbsDown] = true
}

local function _(p1, Message, PropName)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy)
	p1.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
		name = SduiActionType.AiOverviewFeedback,
		message = Message,
		propName = PropName
	}, p1.appPage)
end

local function sendUserSignal(p1, Networking, SearchSessionId, Unknown, AiOverviewExplicitFeedback, Input)
	-- upvalues: PostSendUserSignalFunction (copy), HttpService (copy), UserSignalTypes (copy), SduiErrorType (copy), SduiActionType (copy)
	local Success, Result = pcall(function()
		-- upvalues: PostSendUserSignalFunction (upval), Networking (copy), HttpService (upval), Input (copy), SearchSessionId (copy), UserSignalTypes (upval), Unknown (copy), AiOverviewExplicitFeedback (copy), p1 (copy), SduiErrorType (upval), SduiActionType (upval)
		PostSendUserSignalFunction(Networking, { stringValue = HttpService:JSONEncode(Input) }, {
			id = SearchSessionId,
			assetType = UserSignalTypes.AssetType.PowerSearch,
			signalOrigin = {
				topicId = "PowerSearch",
				productSurface = Unknown,
				subIds = { "PowerSearch" }
			}
		}, UserSignalTypes.SignalValueType.String, AiOverviewExplicitFeedback):catch(function(Err)
			-- upvalues: p1 (upval), SduiErrorType (upval), SduiActionType (upval)
			p1.dependencies.logger.reportError(SduiErrorType.ActionNetworkRequestFailed, {
				name = SduiActionType.AiOverviewFeedback,
				message = tostring(Err)
			}, p1.appPage)
		end)
	end)
	
	if not Success then
		p1.dependencies.logger.reportError(SduiErrorType.ActionNetworkRequestFailed, {
			name = SduiActionType.AiOverviewFeedback,
			message = tostring(Result)
		}, p1.appPage)
	end
end

return function(p1, p2, p3, _)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), config (copy), FindAnalyticsFieldInAncestorsFunction (copy), sendUserSignal (copy), UserSignalTypes (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), ButtonVariant (copy), AiOverviewExplicitFeedbackFunction (copy), AiOverviewSentimentFunction (copy)
	local ActionParams = if p1 then p1.actionParams else nil
	
	if ActionParams == nil then
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			propName = nil,
			name = SduiActionType.AiOverviewFeedback
		}, p3.appPage)
		
		return
	end
	local Sentiment = ActionParams.sentiment
	
	if typeof(Sentiment) == "string" and config[Sentiment] then
		local ProductSurface = ActionParams.productSurface
		local ProductSurface1 = if typeof(ProductSurface) == "string" and ProductSurface ~= "" then ProductSurface else "Unknown"
		local SearchSessionId = FindAnalyticsFieldInAncestorsFunction("searchSessionId", p2) or ""
		local SearchQuery = FindAnalyticsFieldInAncestorsFunction("searchQuery", p2) or ""
		local UniverseIds = FindAnalyticsFieldInAncestorsFunction("universeIds", p2)
		local AppPage = p3.appPage
		local Networking = p3.dependencies.networking
		sendUserSignal(p3, Networking, SearchSessionId, ProductSurface1, UserSignalTypes.SignalType.AiOverviewSentiment, {
			sentiment = Sentiment,
			query = SearchQuery,
			universe_ids = UniverseIds
		})
		p3.dependencies.dispatch(SetCentralOverlayFunction(CentralOverlayType.TextFeedbackFormModal, {
			showTermsOfUseDisclaimer = true,
			dialogTitle = ActionParams.dialogTitle or "",
			dialogText = ActionParams.dialogText,
			placeholderText = ActionParams.placeholderText,
			buttonVariant = ButtonVariant.Emphasis,
			onSubmit = function(FeedbackText)
				-- upvalues: sendUserSignal (upval), p3 (copy), Networking (copy), SearchSessionId (copy), ProductSurface1 (copy), UserSignalTypes (upval), Sentiment (copy), SearchQuery (copy), AiOverviewExplicitFeedbackFunction (upval), AppPage (copy)
				sendUserSignal(p3, Networking, SearchSessionId, ProductSurface1, UserSignalTypes.SignalType.AiOverviewExplicitFeedback, {
					sentiment = Sentiment,
					feedback_text = FeedbackText,
					query = SearchQuery
				})
				AiOverviewExplicitFeedbackFunction({
					didSubmit = true,
					sentiment = Sentiment,
					searchSessionId = SearchSessionId,
					query = SearchQuery,
					feedbackText = FeedbackText
				}, AppPage)
			end,
			onClose = function(p4)
				-- upvalues: sendUserSignal (upval), p3 (copy), Networking (copy), SearchSessionId (copy), ProductSurface1 (copy), UserSignalTypes (upval), Sentiment (copy), SearchQuery (copy), AiOverviewExplicitFeedbackFunction (upval), AppPage (copy)
				if not p4 then
					sendUserSignal(p3, Networking, SearchSessionId, ProductSurface1, UserSignalTypes.SignalType.AiOverviewExplicitFeedback, {
						feedback_text = "",
						sentiment = Sentiment,
						query = SearchQuery
					})
					AiOverviewExplicitFeedbackFunction({
						didSubmit = false,
						sentiment = Sentiment,
						searchSessionId = SearchSessionId,
						query = SearchQuery
					}, AppPage)
					
					return
				end
			end
		}))
		AiOverviewSentimentFunction({
			sentiment = Sentiment,
			searchSessionId = SearchSessionId,
			query = SearchQuery,
			universeIds = UniverseIds
		}, AppPage)
		
		return
	else
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "sentiment",
			name = SduiActionType.AiOverviewFeedback,
			message = `Invalid or missing sentiment: {tostring(Sentiment)}`
		}, p3.appPage)
	end
end