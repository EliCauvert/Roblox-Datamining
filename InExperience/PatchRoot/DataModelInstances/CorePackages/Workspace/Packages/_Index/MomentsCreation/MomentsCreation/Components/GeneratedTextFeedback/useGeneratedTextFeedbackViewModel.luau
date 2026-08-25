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
local useCreationControllerModule = require(momentsCreation.CreationController.useCreationController)
local fireAnalyticsEventModule = require(momentsCreation.Analytics.fireAnalyticsEvent)
local makeCreationEventFieldsModule = require(momentsCreation.Analytics.makeCreationEventFields)
local _ = require(script.Parent.GeneratedTextFeedbackView)
local eventNames = momentsCommonModule.Analytics.EventNames
local sessionManager = momentsCommonModule.Analytics.SessionManager
local funnelEventNames = momentsCommonModule.Analytics.FunnelEventNames
local t = {
	disclosure = "Feature.Moments.Description.GenerateTextFeedbackDisclosure"
}

local function _(p0)
	-- upvalues: sessionManager (ref), funnelEventNames (ref), fireAnalyticsEventModule (ref), makeCreationEventFieldsModule (ref)
	fireAnalyticsEventModule(p0, makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)))
end

return function(p1)
	-- upvalues: getCreationFlowStoreModule (ref), useCreationControllerModule (ref), useLocalization (ref), t (ref), useSignalState (ref), useState (ref), eventNames (ref), sessionManager (ref), funnelEventNames (ref), fireAnalyticsEventModule (ref), makeCreationEventFieldsModule (ref)
	local var10 = getCreationFlowStoreModule(false)
	local var11 = useCreationControllerModule()
	local ok, status = pcall(useLocalization, t)
	local var12 = if ok then status else {}
	local var13 = useSignalState(var10.getGeneratedDescription)
	local var14, var15 = useState(nil)
	local var16, var17 = useState(false)
	
	return {
		visible = var13 ~= nil,
		layoutOrder = p1.layoutOrder,
		disclosureText = var12.disclosure or "",
		selectedAction = var14,
		showReasonDialog = var16,
		onThumbsUp = function()
			-- upvalues: var14 (ref), var15 (ref), eventNames (copy), sessionManager (copy), funnelEventNames (copy), fireAnalyticsEventModule (copy), makeCreationEventFieldsModule (copy), var11 (ref)
			if var14 == "thumbs_up" then
				return
			end
			var15("thumbs_up")
			fireAnalyticsEventModule(eventNames.EditingFlowGenerateTextFeedbackThumbsUp, makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)))
			var11.submitGeneratedTextFeedback("thumbs_up")
		end,
		onThumbsDown = function()
			-- upvalues: var17 (ref)
			var17(true)
		end,
		onNotHelpful = function()
			-- upvalues: var15 (ref), var17 (ref), eventNames (copy), sessionManager (copy), funnelEventNames (copy), fireAnalyticsEventModule (copy), makeCreationEventFieldsModule (copy), var11 (ref)
			var15("thumbs_down")
			var17(false)
			fireAnalyticsEventModule(eventNames.EditingFlowGenerateTextFeedbackThumbsDownNotHelpful, makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)))
			var11.submitGeneratedTextFeedback("not_helpful")
		end,
		onPolicyViolation = function()
			-- upvalues: var15 (ref), var17 (ref), eventNames (copy), sessionManager (copy), funnelEventNames (copy), fireAnalyticsEventModule (copy), makeCreationEventFieldsModule (copy), var11 (ref)
			var15("thumbs_down")
			var17(false)
			fireAnalyticsEventModule(eventNames.EditingFlowGenerateTextFeedbackThumbsDownPolicy, makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)))
			var11.submitGeneratedTextFeedback("policy_violation")
		end,
		onDismissDialog = function()
			-- upvalues: var17 (ref)
			var17(false)
		end
	}
end