local InExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local Parent = InExperienceIntervention.Parent
local ReactModule = require(Parent.React)
local ChatNudgeCustomDialogModule = require(InExperienceIntervention.Components.ChatNudgeCustomDialog)
local ChatNudgeCustomDialogV2Module = require(InExperienceIntervention.Components.ChatNudgeCustomDialogV2)
local ChatTimeoutCustomDialogModule = require(InExperienceIntervention.Components.ChatTimeoutCustomDialog)
local ChatNudgeToastModule = require(InExperienceIntervention.Components.ChatNudgeToast)
local ChatTimeoutToastModule = require(InExperienceIntervention.Components.ChatTimeoutToast)
local ChatTimeoutCustomDialogV2Module = require(InExperienceIntervention.Components.ChatTimeoutCustomDialogV2)
local DictationSafetyReminderToastModule = require(InExperienceIntervention.Components.DictationSafetyReminderToast)
local PartyChatNudgeCustomDialog = require(Parent.InterventionShared).Components.PartyChatNudgeCustomDialog
local PartyChatTimeoutCustomDialog = require(Parent.InterventionShared).Components.PartyChatTimeoutCustomDialog
local TemporaryAvatarKickWarningDialogModule = require(Parent.InterventionShared.TemporaryAvatarKickWarningDialog)
local UniversalFeatureRestrictionDialog = require(Parent.InterventionShared).Components.UniversalFeatureRestrictionDialog
local CursorProvider = require(Parent.UIBlox).App.SelectionCursor.CursorProvider
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local NewResult = ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
local Provider = require(Parent.FocusNavigationUtils).FocusNavigableSurfaceRegistry.Provider
local Constants = require(Parent.InterventionShared).Utils.Constants
local _ = require(InExperienceIntervention.Utils.Types)
local ReportChatSuspensionDialogVisibilityModule = require(InExperienceIntervention.Utils.reportChatSuspensionDialogVisibility)
local GetFFlagGameJoinTimeoutChatAttemptEnabledFunction = require(Parent.SharedFlags).GetFFlagGameJoinTimeoutChatAttemptEnabled
local FFlagTemporaryAvatarKickWarningDialogModule = require(Parent.InterventionShared.FFlagTemporaryAvatarKickWarningDialog)
local FFlagExpChatDictationContinuousSafetyReminder = require(Parent.SharedFlags).FFlagExpChatDictationContinuousSafetyReminder
local MemoResult = ReactModule.memo(function(p1) --[[ Line: 40 ]]
	-- upvalues: ReactModule (copy), ReactFocusNavigationModule (copy), NewResult (copy), Provider (copy), CursorProvider (copy)
	return ReactModule.createElement(ReactFocusNavigationModule.FocusNavigationContext.Provider, { value = NewResult }, {
		RegistryProvider = ReactModule.createElement(Provider, nil, {
			CursorProvider = ReactModule.createElement(CursorProvider, {}, p1.children)
		})
	})
end)

function InExperienceInterventionDialogManager(p1) --[[ Line: 50 ]]
	-- upvalues: ReactModule (copy), Constants (copy), FFlagTemporaryAvatarKickWarningDialogModule (copy), FFlagExpChatDictationContinuousSafetyReminder (copy), ReportChatSuspensionDialogVisibilityModule (copy), ChatNudgeCustomDialogModule (copy), ChatTimeoutCustomDialogModule (copy), ChatNudgeToastModule (copy), ChatTimeoutToastModule (copy), GetFFlagGameJoinTimeoutChatAttemptEnabledFunction (copy), MemoResult (copy), PartyChatNudgeCustomDialog (copy), PartyChatTimeoutCustomDialog (copy), ChatTimeoutCustomDialogV2Module (copy), ChatNudgeCustomDialogV2Module (copy), UniversalFeatureRestrictionDialog (copy), DictationSafetyReminderToastModule (copy), TemporaryAvatarKickWarningDialogModule (copy)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 51 ]]
		-- upvalues: p1 (copy), Constants (upval)
		p1.uiStateDispatch({
			isShown = false,
			type = Constants.UIStateActions.ToggleNotificationDialog,
			treatmentType = Constants.TreatmentType.None
		})
	end, { p1.uiStateDispatch })
	local UiState = p1.uiState
	local TreatmentType = UiState.treatmentType
	local Detail = UiState.detail
	local Options = if Detail then Detail.options else nil
	local Extras = if FFlagTemporaryAvatarKickWarningDialogModule and Detail then Detail.extras else nil
	local IsShown = (not FFlagExpChatDictationContinuousSafetyReminder or TreatmentType ~= Constants.TreatmentType.DictationSafetyReminderToast) and UiState.isShown
	ReactModule.useEffect(function() --[[ Line: 76 ]]
		-- upvalues: ReportChatSuspensionDialogVisibilityModule (upval), IsShown (ref)
		ReportChatSuspensionDialogVisibilityModule(IsShown)
	end, { IsShown })
	
	if UiState.isShown then
		if TreatmentType == Constants.TreatmentType.ChatNudgeDialog then
			return ReactModule.createElement(ChatNudgeCustomDialogModule, {
				violatingChatLine = Detail.evidence,
				onDismiss = UseResult,
				eventId = Detail.decisionEventId
			})
		elseif TreatmentType == Constants.TreatmentType.ChatTimeoutDialog and (Detail.timeoutDurationSeconds or 0) > 0 then
			return ReactModule.createElement(ChatTimeoutCustomDialogModule, {
				duration = Detail.timeoutDurationSeconds,
				onDismiss = UseResult,
				eventId = Detail.decisionEventId,
				violatingChatLine = Detail.evidence
			})
		elseif TreatmentType == Constants.TreatmentType.ChatNudgeToast then
			return ReactModule.createElement(ChatNudgeToastModule, {
				violatingChatLine = Detail.evidence,
				eventId = Detail.decisionEventId
			})
		elseif TreatmentType == Constants.TreatmentType.ChatTimeoutChatAttempt then
			return ReactModule.createElement(ChatTimeoutToastModule, {
				endTime = UiState.endTime,
				treatmentType = Constants.TreatmentType.ChatTimeoutChatAttempt,
				dispatchTimestamp = UiState.dispatchTimestamp
			})
		elseif GetFFlagGameJoinTimeoutChatAttemptEnabledFunction() and TreatmentType == Constants.TreatmentType.ChatTimeoutGameJoin then
			return ReactModule.createElement(ChatTimeoutToastModule, {
				endTime = UiState.endTime,
				treatmentType = Constants.TreatmentType.ChatTimeoutGameJoin,
				dispatchTimestamp = UiState.dispatchTimestamp
			})
		elseif TreatmentType == Constants.TreatmentType.PartyChatNudgeDialog then
			return ReactModule.createElement(MemoResult, {}, {
				dialog = ReactModule.createElement(PartyChatNudgeCustomDialog, {
					evidence = Detail.evidence,
					eventId = Detail.decisionEventId,
					onDismiss = UseResult
				})
			})
		elseif TreatmentType == Constants.TreatmentType.PartyChatTimeoutDialog then
			return ReactModule.createElement(MemoResult, {}, {
				ReactModule.createElement(PartyChatTimeoutCustomDialog, {
					endTimestamp = UiState.endTime,
					evidence = Detail.evidence,
					eventId = Detail.decisionEventId,
					durationForAnalytics = Detail.timeoutDurationSeconds,
					onDismiss = UseResult
				})
			})
		elseif TreatmentType == Constants.TreatmentType.ChatTimeoutDialogV2 and Detail.moderationDetail then
			return ReactModule.createElement(MemoResult, {}, {
				ReactModule.createElement(ChatTimeoutCustomDialogV2Module, {
					onDismiss = UseResult,
					moderationDetail = Detail.moderationDetail
				})
			})
		elseif TreatmentType == Constants.TreatmentType.ChatNudgeDialogV2 and Detail.moderationDetail then
			return ReactModule.createElement(MemoResult, {}, {
				ReactModule.createElement(ChatNudgeCustomDialogV2Module, {
					onDismiss = UseResult,
					moderationDetail = Detail.moderationDetail
				})
			})
		elseif TreatmentType == Constants.TreatmentType.UniversalFeatureRestriction and Detail.moderationDetail then
			return ReactModule.createElement(MemoResult, {}, {
				ReactModule.createElement(UniversalFeatureRestrictionDialog, {
					onDismiss = UseResult,
					moderationDetail = Detail.moderationDetail,
					abuseVector = Detail.abuseVector,
					onDismissCallback = Options and Options.onDismiss,
					titleOverride = Options and Options.titleOverride,
					bodyOverride = Options and Options.bodyOverride,
					onAppeal = Options and Options.onAppeal,
					onShownCallback = Options and Options.onShown,
					onAcknowledgementSuccess = Options and Options.onAcknowledgementSuccess,
					analyticsEventId = Options and Options.analyticsEventId
				})
			})
		elseif FFlagExpChatDictationContinuousSafetyReminder and TreatmentType == Constants.TreatmentType.DictationSafetyReminderToast then
			return ReactModule.createElement(DictationSafetyReminderToastModule)
		elseif FFlagTemporaryAvatarKickWarningDialogModule and TreatmentType == Constants.TreatmentType.TemporaryAvatarKickWarning then
			return ReactModule.createElement(MemoResult, {}, {
				ReactModule.createElement(TemporaryAvatarKickWarningDialogModule, {
					avatarEntityId = Extras and Extras.avatarEntityId,
					violationType = Extras and Extras.violationType,
					placeId = Extras and Extras.placeId,
					onDismiss = UseResult
				})
			})
		end
	end
	return nil
end

return InExperienceInterventionDialogManager