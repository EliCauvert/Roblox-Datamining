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
local var10 = reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
local provider = require(parent.FocusNavigationUtils).FocusNavigableSurfaceRegistry.Provider
local constants = require(parent.InterventionShared).Utils.Constants
local _ = require(inExperienceIntervention.Utils.Types)
local getFFlagGameJoinTimeoutChatAttemptEnabled = require(parent.SharedFlags).GetFFlagGameJoinTimeoutChatAttemptEnabled
local fFlagFeatureRestrictionMiscFixes = require(parent.InterventionShared).Flags.FFlagFeatureRestrictionMiscFixes
local fFlagTemporaryAvatarKickWarningDialogModule = require(parent.InterventionShared.FFlagTemporaryAvatarKickWarningDialog)
local fFlagUniversalFeatureRestrictionReceivers = require(parent.SharedFlags).FFlagUniversalFeatureRestrictionReceivers
local SSUIMetaLuaEngineFeature = game:GetEngineFeature("SSUIMetaLua")
local var13 = reactModule.memo(function(p0) --[[ line: 40 ]]
	-- upvalues: reactModule (ref), reactFocusNavigationModule (ref), var10 (ref), fFlagFeatureRestrictionMiscFixes (ref), provider (ref), cursorProvider (ref)
	return reactModule.createElement(reactFocusNavigationModule.FocusNavigationContext.Provider, { value = var10 }, if fFlagFeatureRestrictionMiscFixes then {
		RegistryProvider = reactModule.createElement(provider, nil, {
			CursorProvider = reactModule.createElement(cursorProvider, {}, p0.children)
		})
	} else {
		CursorProvider = reactModule.createElement(cursorProvider, {}, p0.children)
	})
end)

function InExperienceInterventionDialogManager(p1) --[[ line: 58 ]]
	-- upvalues: reactModule (ref), constants (ref), fFlagUniversalFeatureRestrictionReceivers (ref), fFlagTemporaryAvatarKickWarningDialogModule (ref), SSUIMetaLuaEngineFeature (ref), chatNudgeCustomDialogModule (ref), chatTimeoutCustomDialogModule (ref), chatNudgeToastModule (ref), chatTimeoutToastModule (ref), getFFlagGameJoinTimeoutChatAttemptEnabled (ref), var13 (ref), partyChatNudgeCustomDialog (ref), partyChatTimeoutCustomDialog (ref), chatTimeoutCustomDialogV2Module (ref), chatNudgeCustomDialogV2Module (ref), universalFeatureRestrictionDialog (ref), temporaryAvatarKickWarningDialogModule (ref)
	local var14 = reactModule.useCallback(function() --[[ line: 59 ]]
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
	local var15 = if fFlagUniversalFeatureRestrictionReceivers and detail then detail.options else nil
	local var16 = if fFlagTemporaryAvatarKickWarningDialogModule and detail then detail.extras else nil
	reactModule.useEffect(function() --[[ line: 74 ]]
		-- upvalues: SSUIMetaLuaEngineFeature (copy), uiState (ref)
		if SSUIMetaLuaEngineFeature then
			pcall(function() --[[ line: 76 ]]
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
			onDismiss = var14,
			eventId = detail.decisionEventId
		}) elseif treatmentType == constants.TreatmentType.ChatTimeoutDialog and (detail.timeoutDurationSeconds or 0) > 0 then reactModule.createElement(chatTimeoutCustomDialogModule, {
			duration = detail.timeoutDurationSeconds,
			onDismiss = var14,
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
		}) elseif treatmentType == constants.TreatmentType.PartyChatNudgeDialog then reactModule.createElement(var13, {}, {
			dialog = reactModule.createElement(partyChatNudgeCustomDialog, {
				evidence = detail.evidence,
				eventId = detail.decisionEventId,
				onDismiss = var14
			})
		}) elseif treatmentType == constants.TreatmentType.PartyChatTimeoutDialog then reactModule.createElement(var13, {}, {
			reactModule.createElement(partyChatTimeoutCustomDialog, {
				endTimestamp = uiState.endTime,
				evidence = detail.evidence,
				eventId = detail.decisionEventId,
				durationForAnalytics = detail.timeoutDurationSeconds,
				onDismiss = var14
			})
		}) elseif treatmentType == constants.TreatmentType.ChatTimeoutDialogV2 and detail.moderationDetail then reactModule.createElement(var13, {}, {
			reactModule.createElement(chatTimeoutCustomDialogV2Module, {
				onDismiss = var14,
				moderationDetail = detail.moderationDetail
			})
		}) elseif treatmentType == constants.TreatmentType.ChatNudgeDialogV2 and detail.moderationDetail then reactModule.createElement(var13, {}, {
			reactModule.createElement(chatNudgeCustomDialogV2Module, {
				onDismiss = var14,
				moderationDetail = detail.moderationDetail
			})
		}) elseif fFlagUniversalFeatureRestrictionReceivers and treatmentType == constants.TreatmentType.UniversalFeatureRestriction and detail.moderationDetail then reactModule.createElement(var13, {}, {
			reactModule.createElement(universalFeatureRestrictionDialog, {
				onDismiss = var14,
				moderationDetail = detail.moderationDetail,
				abuseVector = detail.abuseVector,
				onDismissCallback = var15 and var15.onDismiss,
				titleOverride = var15 and var15.titleOverride,
				bodyOverride = var15 and var15.bodyOverride,
				onAppeal = var15 and var15.onAppeal
			})
		}) elseif fFlagTemporaryAvatarKickWarningDialogModule and treatmentType == constants.TreatmentType.TemporaryAvatarKickWarning then reactModule.createElement(var13, {}, {
			reactModule.createElement(temporaryAvatarKickWarningDialogModule, {
				avatarEntityId = var16 and var16.avatarEntityId,
				violationType = var16 and var16.violationType,
				placeId = var16 and var16.placeId,
				onDismiss = var14
			})
		}) else nil
	end
end

return InExperienceInterventionDialogManager