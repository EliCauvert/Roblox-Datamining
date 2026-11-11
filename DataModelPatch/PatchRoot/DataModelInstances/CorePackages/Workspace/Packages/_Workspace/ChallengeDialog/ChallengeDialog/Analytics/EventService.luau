local ChallengeDialog = script:FindFirstAncestor("ChallengeDialog")
local NewResult = require(ChallengeDialog.Parent.Analytics).AnalyticsReporters.EventIngest.new((game:GetService("EventIngestService")))
local EventConstantsModule = require(ChallengeDialog.Analytics.EventConstants)
local InteractionEventName = EventConstantsModule.interactionEventName

return {
	sendDialogOpenedEvent = function(Dialog_opened_type, Dialog_opened_type_internal_id, Dialog_opened_is_expired)
		-- upvalues: NewResult (copy), EventConstantsModule (copy), InteractionEventName (copy)
		NewResult:sendEventDeferred(EventConstantsModule.context.dialogOpened, InteractionEventName, {
			dialog_opened_type = Dialog_opened_type,
			dialog_opened_type_internal_id = Dialog_opened_type_internal_id,
			dialog_opened_is_expired = Dialog_opened_is_expired
		})
	end,
	sendDialogActionSelectedEvent = function(Dialog_action_selected_type, Dialog_action_selected_type_internal_id, Dialog_action_selected_action)
		-- upvalues: NewResult (copy), EventConstantsModule (copy), InteractionEventName (copy)
		NewResult:sendEventDeferred(EventConstantsModule.context.dialogActionSelected, InteractionEventName, {
			dialog_action_selected_type = Dialog_action_selected_type,
			dialog_action_selected_type_internal_id = Dialog_action_selected_type_internal_id,
			dialog_action_selected_action = Dialog_action_selected_action
		})
	end,
	sendDialogAbandonedEvent = function(Dialog_abandoned_type, Dialog_abandoned_type_internal_id)
		-- upvalues: NewResult (copy), EventConstantsModule (copy), InteractionEventName (copy)
		NewResult:sendEventDeferred(EventConstantsModule.context.dialogAbandoned, InteractionEventName, {
			dialog_abandoned_type = Dialog_abandoned_type,
			dialog_abandoned_type_internal_id = Dialog_abandoned_type_internal_id
		})
	end
}