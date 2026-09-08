local inExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local parent = inExperienceIntervention.Parent
local reactModule = require(parent.React)
local chatNudgeCustomDialogModule = require(inExperienceIntervention.Components.ChatNudgeCustomDialog)
local chatNudgeCustomDialogV2Module = require(inExperienceIntervention.Components.ChatNudgeCustomDialogV2)
local chatTimeoutCustomDialogModule = require(inExperienceIntervention.Components.ChatTimeoutCustomDialog)
local chatNudgeToastModule = require(inExperienceIntervention.Components.ChatNudgeToast)
local chatTimeoutToastModule = require(inExperienceIntervention.Components.ChatTimeoutToast)
local chatTimeoutCustomDialogV2Module = require(inExperienceIntervention.Components.ChatTimeoutCustomDialogV2)
local partyChatNudgeCustomDialog = require(parent.InterventionShared).Components.PartyChatNudgeCustomDialog
local partyChatTimeoutCustomDialog = require(parent.InterventionShared).Components.PartyChatTimeoutCustomDialog
local temporaryAvatarKickWarningDialogModule = require(parent.InterventionShared.TemporaryAvatarKickWarningDialog)
local universalFeatureRestrictionDialog = require(parent.InterventionShared).Components.UniversalFeatureRestrictionDialog
local cursorProvider = require(parent.UIBlox).App.SelectionCursor.CursorProvider
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local var1 = reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
local provider = require(parent.FocusNavigationUtils).FocusNavigableSurfaceRegistry.Provider
local constants = require(parent.InterventionShared).Utils.Constants
local _ = require(inExperienceIntervention.Utils.Types)
local getFFlagGameJoinTimeoutChatAttemptEnabled = require(parent.SharedFlags).GetFFlagGameJoinTimeoutChatAttemptEnabled
local fFlagTemporaryAvatarKickWarningDialogModule = require(parent.InterventionShared.FFlagTemporaryAvatarKickWarningDialog)
local fFlagUniversalFeatureRestrictionReceivers = require(parent.SharedFlags).FFlagUniversalFeatureRestrictionReceivers
local SSUIMetaLuaEngineFeature = game:GetEngineFeature("SSUIMetaLua")
local var2 = reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), reactFocusNavigationModule (ref), var1 (ref), provider (ref), cursorProvider (ref)
	return reactModule.createElement(reactFocusNavigationModule.FocusNavigationContext.Provider, { value = var1 }, {
		RegistryProvider = reactModule.createElement(provider, nil, {
			CursorProvider = reactModule.createElement(cursorProvider, {}, p1.children)
		})
	})
end)

function InExperienceInterventionDialogManager(p1)
	-- upvalues: reactModule (ref), constants (ref), fFlagUniversalFeatureRestrictionReceivers (ref), fFlagTemporaryAvatarKickWarningDialogModule (ref), SSUIMetaLuaEngineFeature (ref), chatNudgeCustomDialogModule (ref), chatTimeoutCustomDialogModule (ref), chatNudgeToastModule (ref), chatTimeoutToastModule (ref), getFFlagGameJoinTimeoutChatAttemptEnabled (ref), var2 (ref), partyChatNudgeCustomDialog (ref), partyChatTimeoutCustomDialog (ref), chatTimeoutCustomDialogV2Module (ref), chatNudgeCustomDialogV2Module (ref), universalFeatureRestrictionDialog (ref), temporaryAvatarKickWarningDialogModule (ref)
	local var3 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), constants (copy)
		p1.uiStateDispatch({
			isShown = false,
			type = constants.UIStateActions.ToggleNotificationDialog,
			treatmentType = constants.TreatmentType.None
		})
	end, { p1.uiStateDispatch })
	local uiState = p1.uiState
	local treatmentType = uiState.treatmentType
	local detail = uiState.detail
	local var4 = if fFlagUniversalFeatureRestrictionReceivers and detail then detail.options else nil
	local var5 = if fFlagTemporaryAvatarKickWarningDialogModule and detail then detail.extras else nil
	reactModule.useEffect(function()
		-- upvalues: SSUIMetaLuaEngineFeature (copy), uiState (ref)
		if SSUIMetaLuaEngineFeature then
			pcall(function()
				-- upvalues: uiState (copy)
				local safetyService = game:GetService("SafetyService")
				
				if uiState.isShown then
					safetyService:ReportChatSuspensionDialogOpen()
					
					return
				end
				safetyService:ReportChatSuspensionDialogClose()
			end)
		end
	end, { uiState.isShown })
	
	if uiState.isShown then
		return if treatmentType == constants.TreatmentType.ChatNudgeDialog then reactModule.createElement(chatNudgeCustomDialogModule, {
			violatingChatLine = detail.evidence,
			onDismiss = var3,
			eventId = detail.decisionEventId
		}) elseif treatmentType == constants.TreatmentType.ChatTimeoutDialog and (detail.timeoutDurationSeconds or 0) > 0 then reactModule.createElement(chatTimeoutCustomDialogModule, {
			duration = detail.timeoutDurationSeconds,
			onDismiss = var3,
			eventId = detail.decisionEventId,
			violatingChatLine = detail.evidence
		}) elseif treatmentType == constants.TreatmentType.ChatNudgeToast then reactModule.createElement(chatNudgeToastModule, {
			violatingChatLine = detail.evidence,
			eventId = detail.decisionEventId
		}) elseif treatmentType == constants.TreatmentType.ChatTimeoutChatAttempt then reactModule.createElement(chatTimeoutToastModule, {
			endTime = uiState.endTime,
			treatmentType = constants.TreatmentType.ChatTimeoutChatAttempt,
			dispatchTimestamp = uiState.dispatchTimestamp
		}) elseif getFFlagGameJoinTimeoutChatAttemptEnabled() and treatmentType == constants.TreatmentType.ChatTimeoutGameJoin then reactModule.createElement(chatTimeoutToastModule, {
			endTime = uiState.endTime,
			treatmentType = constants.TreatmentType.ChatTimeoutGameJoin,
			dispatchTimestamp = uiState.dispatchTimestamp
		}) elseif treatmentType == constants.TreatmentType.PartyChatNudgeDialog then reactModule.createElement(var2, {}, {
			dialog = reactModule.createElement(partyChatNudgeCustomDialog, {
				evidence = detail.evidence,
				eventId = detail.decisionEventId,
				onDismiss = var3
			})
		}) elseif treatmentType == constants.TreatmentType.PartyChatTimeoutDialog then reactModule.createElement(var2, {}, {
			reactModule.createElement(partyChatTimeoutCustomDialog, {
				endTimestamp = uiState.endTime,
				evidence = detail.evidence,
				eventId = detail.decisionEventId,
				durationForAnalytics = detail.timeoutDurationSeconds,
				onDismiss = var3
			})
		}) elseif treatmentType == constants.TreatmentType.ChatTimeoutDialogV2 and detail.moderationDetail then reactModule.createElement(var2, {}, {
			reactModule.createElement(chatTimeoutCustomDialogV2Module, {
				onDismiss = var3,
				moderationDetail = detail.moderationDetail
			})
		}) elseif treatmentType == constants.TreatmentType.ChatNudgeDialogV2 and detail.moderationDetail then reactModule.createElement(var2, {}, {
			reactModule.createElement(chatNudgeCustomDialogV2Module, {
				onDismiss = var3,
				moderationDetail = detail.moderationDetail
			})
		}) elseif fFlagUniversalFeatureRestrictionReceivers and treatmentType == constants.TreatmentType.UniversalFeatureRestriction and detail.moderationDetail then reactModule.createElement(var2, {}, {
			reactModule.createElement(universalFeatureRestrictionDialog, {
				onDismiss = var3,
				moderationDetail = detail.moderationDetail,
				abuseVector = detail.abuseVector,
				onDismissCallback = var4 and var4.onDismiss,
				titleOverride = var4 and var4.titleOverride,
				bodyOverride = var4 and var4.bodyOverride,
				onAppeal = var4 and var4.onAppeal,
				onShownCallback = var4 and var4.onShown,
				onAcknowledgementSuccess = var4 and var4.onAcknowledgementSuccess,
				analyticsEventId = var4 and var4.analyticsEventId
			})
		}) elseif fFlagTemporaryAvatarKickWarningDialogModule and treatmentType == constants.TreatmentType.TemporaryAvatarKickWarning then reactModule.createElement(var2, {}, {
			reactModule.createElement(temporaryAvatarKickWarningDialogModule, {
				avatarEntityId = var5 and var5.avatarEntityId,
				violationType = var5 and var5.violationType,
				placeId = var5 and var5.placeId,
				onDismiss = var3
			})
		}) else nil
	end
end

return InExperienceInterventionDialogManager