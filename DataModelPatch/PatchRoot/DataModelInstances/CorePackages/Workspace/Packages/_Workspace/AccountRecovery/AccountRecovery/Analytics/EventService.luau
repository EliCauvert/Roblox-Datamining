local AccountRecovery = script:FindFirstAncestor("AccountRecovery")
local TelemetryService = game:GetService("TelemetryService")
local NewResult = require(AccountRecovery.Parent.Analytics).AnalyticsReporters.EventIngest.new((game:GetService("EventIngestService")))
local EventConstantsModule = require(AccountRecovery.Analytics.EventConstants)
local RecoveryMethodInputTypeModule = require(AccountRecovery.Enums.RecoveryMethodInputType)
local RecoveryEventName = EventConstantsModule.recoveryEventName
local config = {
	throttlingPercentage = 10000,
	description = "Event fired when update password to iOS Keychain is attempted after recovery",
	links = "",
	eventName = EventConstantsModule.context.passwordUpdateAttempted,
	backends = { "EventIngest" },
	lastUpdated = { 2026, 2, 4 }
}
local config1 = {
	throttlingPercentage = 10000,
	description = "Event fired when update password to iOS Keychain succeeds after recovery",
	links = "",
	eventName = EventConstantsModule.context.passwordUpdateSuccess,
	backends = { "EventIngest" },
	lastUpdated = { 2026, 2, 4 }
}
local config2 = {
	throttlingPercentage = 10000,
	description = "Event fired when update password to iOS Keychain fails after recovery",
	links = "",
	eventName = EventConstantsModule.context.passwordUpdateFailure,
	backends = { "EventIngest" },
	lastUpdated = { 2026, 2, 4 }
}
local config3 = {
	throttlingPercentage = 10000,
	description = "Event fired when update password to iOS Keychain is skipped after recovery",
	links = "",
	eventName = EventConstantsModule.context.passwordUpdateSkipped,
	backends = { "EventIngest" },
	lastUpdated = { 2026, 2, 4 }
}

return {
	sendPageLoadEvent = function()
		-- upvalues: NewResult (copy), EventConstantsModule (copy), RecoveryEventName (copy)
		NewResult:sendEventDeferred(EventConstantsModule.context.pageLoad, RecoveryEventName, { is_luafied = true })
	end,
	sendRecoveryInitializedFromAutofillEvent = function(Recovery_session_id, Identifier_type, Next_component)
		-- upvalues: NewResult (copy), EventConstantsModule (copy), RecoveryEventName (copy)
		NewResult:sendEventDeferred(EventConstantsModule.context.recoveryInitializedFromAutofill, RecoveryEventName, {
			is_luafied = true,
			recovery_session_id = Recovery_session_id,
			identifier_type = Identifier_type,
			next_component = Next_component
		})
	end,
	sendIdentifierSentEvent = function(Recovery_session_id, Identifier_type, Next_component)
		-- upvalues: NewResult (copy), EventConstantsModule (copy), RecoveryEventName (copy)
		NewResult:sendEventDeferred(EventConstantsModule.context.identifierSent, RecoveryEventName, {
			is_luafied = true,
			recovery_session_id = Recovery_session_id,
			identifier_type = Identifier_type,
			next_component = Next_component
		})
	end,
	sendContactMethodSentEvent = function(Recovery_session_id, Contact_method_type)
		-- upvalues: NewResult (copy), EventConstantsModule (copy), RecoveryEventName (copy)
		NewResult:sendEventDeferred(EventConstantsModule.context.contactMethodSent, RecoveryEventName, {
			is_luafied = true,
			recovery_session_id = Recovery_session_id,
			contact_method_type = Contact_method_type
		})
	end,
	sendUserSelectedEvent = function(Recovery_session_id)
		-- upvalues: NewResult (copy), EventConstantsModule (copy), RecoveryEventName (copy)
		NewResult:sendEventDeferred(EventConstantsModule.context.userSelected, RecoveryEventName, {
			is_luafied = true,
			recovery_session_id = Recovery_session_id
		})
	end,
	sendPasswordResetEvent = function(Recovery_session_id, Redirect_after_reset)
		-- upvalues: NewResult (copy), EventConstantsModule (copy), RecoveryEventName (copy)
		NewResult:sendEventDeferred(EventConstantsModule.context.passwordReset, RecoveryEventName, {
			is_luafied = true,
			recovery_session_id = Recovery_session_id,
			redirect_after_reset = Redirect_after_reset
		})
	end,
	sendSwitchedInputEvent = function(Recovery_session_id, p1, Current_component)
		-- upvalues: EventConstantsModule (copy), NewResult (copy), RecoveryEventName (copy)
		NewResult:sendEventDeferred(p1 and EventConstantsModule.context.switchedToPhoneInput or EventConstantsModule.context.switchedToEmailInput, RecoveryEventName, {
			is_luafied = true,
			recovery_session_id = Recovery_session_id,
			current_component = Current_component
		})
	end,
	sendRecoveryMethodInputSwitchEvent = function(Recovery_session_id, BackupCode, Current_component)
		-- upvalues: RecoveryMethodInputTypeModule (copy), EventConstantsModule (copy), NewResult (copy), RecoveryEventName (copy)
		NewResult:sendEventDeferred(if BackupCode == RecoveryMethodInputTypeModule.Phone then EventConstantsModule.context.switchedToPhoneInput elseif BackupCode == RecoveryMethodInputTypeModule.BackupCode then EventConstantsModule.context.switchedToBackupCodeInput else EventConstantsModule.context.switchedToEmailInput, RecoveryEventName, {
			is_luafied = true,
			recovery_session_id = Recovery_session_id,
			current_component = Current_component
		})
	end,
	sendBackButtonClickedEvent = function(Recovery_session_id, Current_component)
		-- upvalues: NewResult (copy), EventConstantsModule (copy), RecoveryEventName (copy)
		NewResult:sendEventDeferred(EventConstantsModule.context.backButtonClicked, RecoveryEventName, {
			is_luafied = true,
			recovery_session_id = Recovery_session_id,
			current_component = Current_component
		})
	end,
	sendPasswordUpdateAttemptedEvent = function(Recovery_session_id, Username)
		-- upvalues: TelemetryService (copy), config (copy)
		TelemetryService:LogEvent(config, {
			customFields = {
				is_luafied = true,
				recovery_session_id = Recovery_session_id,
				username = Username
			}
		})
	end,
	sendPasswordUpdateSuccessEvent = function(Recovery_session_id, Username)
		-- upvalues: TelemetryService (copy), config1 (copy)
		TelemetryService:LogEvent(config1, {
			customFields = {
				is_luafied = true,
				recovery_session_id = Recovery_session_id,
				username = Username
			}
		})
	end,
	sendPasswordUpdateFailureEvent = function(Recovery_session_id, Username, p1)
		-- upvalues: TelemetryService (copy), config2 (copy)
		TelemetryService:LogEvent(config2, {
			customFields = {
				is_luafied = true,
				recovery_session_id = Recovery_session_id,
				username = Username,
				error_message = p1 or "unknown"
			}
		})
	end,
	sendPasswordUpdateSkippedEvent = function(Recovery_session_id, Skip_reason)
		-- upvalues: TelemetryService (copy), config3 (copy)
		TelemetryService:LogEvent(config3, {
			customFields = {
				is_luafied = true,
				recovery_session_id = Recovery_session_id,
				skip_reason = Skip_reason
			}
		})
	end
}