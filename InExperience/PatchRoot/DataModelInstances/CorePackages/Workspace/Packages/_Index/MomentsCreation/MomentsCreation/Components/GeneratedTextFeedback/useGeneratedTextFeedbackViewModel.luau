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

local function _(p1)
	-- upvalues: sessionManager (ref), funnelEventNames (ref), fireAnalyticsEventModule (ref), makeCreationEventFieldsModule (ref)
	fireAnalyticsEventModule(p1, makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)))
end

return function(p1)
	-- upvalues: getCreationFlowStoreModule (ref), useCreationControllerModule (ref), useLocalization (ref), t (ref), useSignalState (ref), useState (ref), eventNames (ref), sessionManager (ref), funnelEventNames (ref), fireAnalyticsEventModule (ref), makeCreationEventFieldsModule (ref)
	local var1 = getCreationFlowStoreModule(false)
	local var2 = useCreationControllerModule()
	local ok, status = pcall(useLocalization, t)
	local var3 = if ok then status else {}
	local var4 = useSignalState(var1.getGeneratedDescription)
	local var5, var6 = useState(nil)
	local var7, var8 = useState(false)
	
	return {
		visible = var4 ~= nil,
		layoutOrder = p1.layoutOrder,
		disclosureText = var3.disclosure or "",
		selectedAction = var5,
		showReasonDialog = var7,
		onThumbsUp = function()
			-- upvalues: var5 (ref), var6 (ref), eventNames (copy), sessionManager (copy), funnelEventNames (copy), fireAnalyticsEventModule (copy), makeCreationEventFieldsModule (copy), var2 (ref)
			if var5 == "thumbs_up" then
				return
			end
			var6("thumbs_up")
			fireAnalyticsEventModule(eventNames.EditingFlowGenerateTextFeedbackThumbsUp, makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)))
			var2.submitGeneratedTextFeedback("thumbs_up")
		end,
		onThumbsDown = function()
			-- upvalues: var8 (ref)
			var8(true)
		end,
		onNotHelpful = function()
			-- upvalues: var6 (ref), var8 (ref), eventNames (copy), sessionManager (copy), funnelEventNames (copy), fireAnalyticsEventModule (copy), makeCreationEventFieldsModule (copy), var2 (ref)
			var6("thumbs_down")
			var8(false)
			fireAnalyticsEventModule(eventNames.EditingFlowGenerateTextFeedbackThumbsDownNotHelpful, makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)))
			var2.submitGeneratedTextFeedback("not_helpful")
		end,
		onPolicyViolation = function()
			-- upvalues: var6 (ref), var8 (ref), eventNames (copy), sessionManager (copy), funnelEventNames (copy), fireAnalyticsEventModule (copy), makeCreationEventFieldsModule (copy), var2 (ref)
			var6("thumbs_down")
			var8(false)
			fireAnalyticsEventModule(eventNames.EditingFlowGenerateTextFeedbackThumbsDownPolicy, makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)))
			var2.submitGeneratedTextFeedback("policy_violation")
		end,
		onDismissDialog = function()
			-- upvalues: var8 (ref)
			var8(false)
		end
	}
end