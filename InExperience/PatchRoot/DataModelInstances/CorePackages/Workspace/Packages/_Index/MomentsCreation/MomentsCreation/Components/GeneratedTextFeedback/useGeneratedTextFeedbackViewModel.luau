local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local MomentsCommonModule = require(Parent.MomentsCommon)
local UseLocalization = require(Parent.Localization).Hooks.useLocalization
local UseStateFunction = require(Parent.React).useState
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local GetCreationFlowStoreModule = require(MomentsCreation.Stores.GetCreationFlowStore)
local UseCreationControllerModule = require(MomentsCreation.CreationController.useCreationController)
local FireAnalyticsEventModule = require(MomentsCreation.Analytics.fireAnalyticsEvent)
local MakeCreationEventFieldsModule = require(MomentsCreation.Analytics.makeCreationEventFields)
local _ = require(script.Parent.GeneratedTextFeedbackView)
local EventNames = MomentsCommonModule.Analytics.EventNames
local SessionManager = MomentsCommonModule.Analytics.SessionManager
local FunnelEventNames = MomentsCommonModule.Analytics.FunnelEventNames
local config = {
	disclosure = "Feature.Moments.Description.GenerateTextFeedbackDisclosure"
}

local function _(p1)
	-- upvalues: SessionManager (copy), FunnelEventNames (copy), FireAnalyticsEventModule (copy), MakeCreationEventFieldsModule (copy)
	FireAnalyticsEventModule(p1, MakeCreationEventFieldsModule.makeCreationBaseFields((SessionManager.getSessionId(FunnelEventNames.FunnelTypes.CreationFlow))))
end

return function(p1)
	-- upvalues: GetCreationFlowStoreModule (copy), UseCreationControllerModule (copy), UseLocalization (copy), config (copy), UseSignalStateFunction (copy), UseStateFunction (copy), EventNames (copy), SessionManager (copy), FunnelEventNames (copy), FireAnalyticsEventModule (copy), MakeCreationEventFieldsModule (copy)
	local CreationFlowStoreModule = GetCreationFlowStoreModule(false)
	local UseCreationControllerModuleResult = UseCreationControllerModule()
	local Success, Result = pcall(UseLocalization, config)
	local Result1 = if Success then Result else {}
	local UseSignalStateResult = UseSignalStateFunction(CreationFlowStoreModule.getGeneratedDescription)
	local UseStateResult, UseStateResult2 = UseStateFunction(nil)
	local UseStateResult1, UseStateResult2_1 = UseStateFunction(false)
	
	return {
		visible = UseSignalStateResult ~= nil,
		layoutOrder = p1.layoutOrder,
		disclosureText = Result1.disclosure or "",
		selectedAction = UseStateResult,
		showReasonDialog = UseStateResult1,
		onThumbsUp = function()
			-- upvalues: UseStateResult (copy), UseStateResult2 (copy), EventNames (upval), SessionManager (upval), FunnelEventNames (upval), FireAnalyticsEventModule (upval), MakeCreationEventFieldsModule (upval), UseCreationControllerModuleResult (copy)
			if UseStateResult ~= "thumbs_up" then
				UseStateResult2("thumbs_up")
				FireAnalyticsEventModule(EventNames.EditingFlowGenerateTextFeedbackThumbsUp, MakeCreationEventFieldsModule.makeCreationBaseFields((SessionManager.getSessionId(FunnelEventNames.FunnelTypes.CreationFlow))))
				UseCreationControllerModuleResult.submitGeneratedTextFeedback("thumbs_up")
				
				return
			end
		end,
		onThumbsDown = function()
			-- upvalues: UseStateResult2_1 (copy)
			UseStateResult2_1(true)
		end,
		onNotHelpful = function()
			-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy), EventNames (upval), SessionManager (upval), FunnelEventNames (upval), FireAnalyticsEventModule (upval), MakeCreationEventFieldsModule (upval), UseCreationControllerModuleResult (copy)
			UseStateResult2("thumbs_down")
			UseStateResult2_1(false)
			FireAnalyticsEventModule(EventNames.EditingFlowGenerateTextFeedbackThumbsDownNotHelpful, MakeCreationEventFieldsModule.makeCreationBaseFields((SessionManager.getSessionId(FunnelEventNames.FunnelTypes.CreationFlow))))
			UseCreationControllerModuleResult.submitGeneratedTextFeedback("not_helpful")
		end,
		onPolicyViolation = function()
			-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy), EventNames (upval), SessionManager (upval), FunnelEventNames (upval), FireAnalyticsEventModule (upval), MakeCreationEventFieldsModule (upval), UseCreationControllerModuleResult (copy)
			UseStateResult2("thumbs_down")
			UseStateResult2_1(false)
			FireAnalyticsEventModule(EventNames.EditingFlowGenerateTextFeedbackThumbsDownPolicy, MakeCreationEventFieldsModule.makeCreationBaseFields((SessionManager.getSessionId(FunnelEventNames.FunnelTypes.CreationFlow))))
			UseCreationControllerModuleResult.submitGeneratedTextFeedback("policy_violation")
		end,
		onDismissDialog = function()
			-- upvalues: UseStateResult2_1 (copy)
			UseStateResult2_1(false)
		end
	}
end