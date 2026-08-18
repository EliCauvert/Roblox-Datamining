local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local localizationModule = require(parent.Localization)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = localizationModule.Hooks.useLocalization
local useState = reactModule.useState
local useSignalState = signalsReactModule.useSignalState
local getCreationFlowStoreModule = require(momentsCreation.Stores.GetCreationFlowStore)
local fireAnalyticsEventModule = require(momentsCreation.Analytics.fireAnalyticsEvent)
local makeCreationEventFieldsModule = require(momentsCreation.Analytics.makeCreationEventFields)
local _ = require(script.Parent.GeneratedTextFeedbackView)
local eventNames = momentsCommonModule.Analytics.EventNames
local sessionManager = momentsCommonModule.Analytics.SessionManager
local funnelEventNames = momentsCommonModule.Analytics.FunnelEventNames
local t = {
	disclosure = "Feature.Moments.Description.GenerateTextFeedbackDisclosure"
}

local function _(p0) --[[ line: 35 | named "fireFeedbackEvent" ]]
	-- upvalues: sessionManager (ref), funnelEventNames (ref), fireAnalyticsEventModule (ref), makeCreationEventFieldsModule (ref)
	fireAnalyticsEventModule(p0, makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)))
end

return function(p1) --[[ line: 40 | named "useGeneratedTextFeedbackViewModel" ]]
	-- upvalues: getCreationFlowStoreModule (ref), useLocalization (ref), t (ref), useSignalState (ref), useState (ref), eventNames (ref), sessionManager (ref), funnelEventNames (ref), fireAnalyticsEventModule (ref), makeCreationEventFieldsModule (ref)
	local var9 = getCreationFlowStoreModule(false)
	local ok, status = pcall(useLocalization, t)
	local var10 = if ok then status else {}
	local var11 = useSignalState(var9.getDescription)
	local var12 = useSignalState(var9.getGeneratedDescription)
	local var13, var14 = useState(nil)
	local var15, var16 = useState(false)
	
	return {
		visible = var12 ~= nil and var12 == var11,
		layoutOrder = p1.layoutOrder,
		disclosureText = var10.disclosure or "",
		selectedAction = var13,
		showReasonDialog = var15,
		onThumbsUp = function() --[[ line: 52 ]]
			-- upvalues: var13 (ref), var14 (ref), eventNames (copy), sessionManager (copy), funnelEventNames (copy), fireAnalyticsEventModule (copy), makeCreationEventFieldsModule (copy)
			if var13 == "thumbs_up" then
				return
			end
			var14("thumbs_up")
			fireAnalyticsEventModule(eventNames.EditingFlowGenerateTextFeedbackThumbsUp, makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)))
		end,
		onThumbsDown = function() --[[ line: 60 ]]
			-- upvalues: var16 (ref)
			var16(true)
		end,
		onNotHelpful = function() --[[ line: 64 ]]
			-- upvalues: var14 (ref), var16 (ref), eventNames (copy), sessionManager (copy), funnelEventNames (copy), fireAnalyticsEventModule (copy), makeCreationEventFieldsModule (copy)
			var14("thumbs_down")
			var16(false)
			fireAnalyticsEventModule(eventNames.EditingFlowGenerateTextFeedbackThumbsDownNotHelpful, makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)))
		end,
		onPolicyViolation = function() --[[ line: 70 ]]
			-- upvalues: var14 (ref), var16 (ref), eventNames (copy), sessionManager (copy), funnelEventNames (copy), fireAnalyticsEventModule (copy), makeCreationEventFieldsModule (copy)
			var14("thumbs_down")
			var16(false)
			fireAnalyticsEventModule(eventNames.EditingFlowGenerateTextFeedbackThumbsDownPolicy, makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)))
		end,
		onDismissDialog = function() --[[ line: 78 ]]
			-- upvalues: var16 (ref)
			var16(false)
		end
	}
end