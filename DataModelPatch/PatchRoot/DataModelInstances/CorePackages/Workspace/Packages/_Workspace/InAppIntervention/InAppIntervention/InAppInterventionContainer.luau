local InAppIntervention = script:FindFirstAncestor("InAppIntervention")
local Parent = InAppIntervention.Parent
local ReactModule = require(Parent.React)
local _ = require(InAppIntervention.Utils.Types)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local Constants = require(Parent.InterventionShared).Utils.Constants
local CloseCentralOverlayFunction = require(Parent.CentralOverlay).Thunks.CloseCentralOverlay
local InterventionPlacement = require(Parent.InterventionShared).Contexts.InterventionPlacement
local LayerCollectorProvider = require(Parent.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider
local InterventionOverlay = require(Parent.InterventionShared).Components.InterventionOverlay
local PartyChatNudgeCustomDialog = require(Parent.InterventionShared).Components.PartyChatNudgeCustomDialog
local PartyChatTimeoutCustomDialog = require(Parent.InterventionShared).Components.PartyChatTimeoutCustomDialog
local UniversalFeatureRestrictionDialog = require(Parent.InterventionShared).Components.UniversalFeatureRestrictionDialog
local FFlagUniversalFeatureRestrictionReceivers = require(Parent.SharedFlags).FFlagUniversalFeatureRestrictionReceivers
local MemoResult = ReactModule.memo(function(p1)
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), CloseCentralOverlayFunction (copy), FFlagUniversalFeatureRestrictionReceivers (copy), Constants (copy), InterventionOverlay (copy), PartyChatNudgeCustomDialog (copy), PartyChatTimeoutCustomDialog (copy), UniversalFeatureRestrictionDialog (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), CloseCentralOverlayFunction (upval)
		UseDispatchResult(CloseCentralOverlayFunction())
	end, { UseDispatchResult })
	local UiState = p1.uiState
	
	if UiState.isShown then
		local InterventionDetail = UiState.interventionDetail or {}
		local Options = if FFlagUniversalFeatureRestrictionReceivers then InterventionDetail.options else nil
		
		if UiState.treatmentType == Constants.TreatmentType.PartyChatNudgeDialog then
			return ReactModule.createElement(InterventionOverlay, { onDismiss = UseResult }, {
				Dialog = ReactModule.createElement(PartyChatNudgeCustomDialog, {
					evidence = InterventionDetail.evidence,
					eventId = InterventionDetail.decisionEventId,
					onDismiss = UseResult
				})
			})
		elseif UiState.treatmentType == Constants.TreatmentType.PartyChatTimeoutDialog then
			return ReactModule.createElement(InterventionOverlay, { onDismiss = UseResult }, {
				Dialog = ReactModule.createElement(PartyChatTimeoutCustomDialog, {
					endTimestamp = UiState.endTime,
					evidence = InterventionDetail.evidence,
					eventId = InterventionDetail.decisionEventId,
					durationForAnalytics = InterventionDetail.timeoutDurationSeconds,
					onDismiss = UseResult
				})
			})
		elseif FFlagUniversalFeatureRestrictionReceivers and UiState.treatmentType == Constants.TreatmentType.UniversalFeatureRestriction and InterventionDetail.moderationDetail then
			return ReactModule.createElement(UniversalFeatureRestrictionDialog, {
				onDismiss = UseResult,
				moderationDetail = InterventionDetail.moderationDetail,
				abuseVector = InterventionDetail.abuseVector,
				onDismissCallback = Options and Options.onDismiss,
				titleOverride = Options and Options.titleOverride,
				bodyOverride = Options and Options.bodyOverride,
				onAppeal = Options and Options.onAppeal
			})
		end
	end
	return nil
end)

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), InterventionPlacement (copy), Constants (copy), LayerCollectorProvider (copy), MemoResult (copy)
	return ReactModule.createElement(InterventionPlacement.Provider, { value = Constants.InterventionPlacementType.InApp }, {
		LayerCollectorProvider = ReactModule.createElement(LayerCollectorProvider, {}, {
			InAppInterventionDialogContainer = ReactModule.createElement(MemoResult, p1)
		})
	})
end)