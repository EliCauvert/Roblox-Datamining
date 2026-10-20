local InAppIntervention = script:FindFirstAncestor("InAppIntervention")
local Parent = InAppIntervention.Parent
local ReactModule = require(Parent.React)
local RealtimeDeliveryModule = require(Parent.RealtimeDelivery)
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local InterventionAnalytics = require(Parent.InterventionShared).InterventionAnalytics
local InterventionTreatmentConfigListModule = require(InAppIntervention.InterventionTreatmentConfigs.InterventionTreatmentConfigList)
local ChatInputBoxDisabledPressedSignal = require(Parent.InterventionShared).Signals.chatInputBoxDisabledPressedSignal
local FeatureRestrictionDisplaySignalModule = require(Parent.UniversalFeatureRestrictions.featureRestrictionDisplaySignal)
local FeatureRestrictionDisplayDirectSignalModule = require(Parent.UniversalFeatureRestrictions.featureRestrictionDisplayDirectSignal)
local GetModerationDetailFunction = require(Parent.InterventionShared).Http.GetModerationDetail
local Constants = require(Parent.InterventionShared).Utils.Constants
local UseIsUserInExperienceFunction = require(Parent.RobloxAppHooks).useIsUserInExperience
local FFlagUniversalFeatureRestrictionReceivers = require(Parent.SharedFlags).FFlagUniversalFeatureRestrictionReceivers

function InAppInterventionEventReceiver()
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), UseIsUserInExperienceFunction (copy), InterventionTreatmentConfigListModule (copy), RealtimeDeliveryModule (copy), ChatInputBoxDisabledPressedSignal (copy), Constants (copy), FFlagUniversalFeatureRestrictionReceivers (copy), FeatureRestrictionDisplaySignalModule (copy), GetModerationDetailFunction (copy), InterventionAnalytics (copy), FeatureRestrictionDisplayDirectSignalModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseResult = ReactModule.useCallback(function(UiState)
		-- upvalues: UseDispatchResult (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval)
		UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.InAppIntervention, { uiState = UiState }))
	end, { UseDispatchResult })
	local UseIsUserInExperienceResult = UseIsUserInExperienceFunction()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseIsUserInExperienceResult (copy)
		return { isUserInExperience = UseIsUserInExperienceResult }
	end, { UseIsUserInExperienceResult })
	local UseResult1 = ReactModule.useCallback(function(p1)
		-- upvalues: InterventionTreatmentConfigListModule (upval), UseMemoResult (copy), UseDispatchResult (copy), UseResult (copy)
		for _, value in InterventionTreatmentConfigListModule do
			if value.shouldTriggerEventReceived(p1, UseMemoResult) then
				value.onTriggerEventReceived(p1)
			end
			if value.shouldTriggerVisualTreatment(p1, UseMemoResult) then
				value.onTriggerVisualTreatment(UseDispatchResult, UseResult, p1)
			end
			if value.shouldTriggerBehavioralTreatment(p1, UseMemoResult) then
				value.onTriggerBehavioralTreatment(p1)
			end
		end
	end, {
		InterventionTreatmentConfigListModule,
		UseResult,
		UseMemoResult
	})
	RealtimeDeliveryModule.useRealtimeNamespace("FeatureIntervention", function(p2)
		-- upvalues: UseResult1 (copy)
		UseResult1(p2)
	end, { UseResult1 })
	ReactModule.useEffect(function()
		-- upvalues: ChatInputBoxDisabledPressedSignal (upval), UseResult (copy), Constants (upval), FFlagUniversalFeatureRestrictionReceivers (upval), FeatureRestrictionDisplaySignalModule (upval), GetModerationDetailFunction (upval), InterventionAnalytics (upval), FeatureRestrictionDisplayDirectSignalModule (upval)
		local Connection = ChatInputBoxDisabledPressedSignal:connect(function(p2)
			-- upvalues: UseResult (upval), Constants (upval)
			UseResult({
				isShown = true,
				interventionDetail = {
					decisionEventId = p2.decisionEventId,
					timeoutDurationSeconds = p2.duration
				},
				type = Constants.UIStateActions.ToggleNotificationDialog,
				treatmentType = Constants.TreatmentType.PartyChatTimeoutDialog,
				endTime = p2.endTimestamp
			})
		end)
		local Connection1 = if FFlagUniversalFeatureRestrictionReceivers then FeatureRestrictionDisplaySignalModule:connect(function(p2)
			-- upvalues: GetModerationDetailFunction (upval), InterventionAnalytics (upval), Constants (upval), UseResult (upval)
			local AbuseVector = p2.abuseVector
			local Options = p2.options
			local ModerationDetail = nil
			GetModerationDetailFunction({ abuseVector = AbuseVector }):andThen(function(Result)
				-- upvalues: ModerationDetail (ref)
				ModerationDetail = Result
			end):catch(function(Err)
				-- upvalues: InterventionAnalytics (upval), Constants (upval), AbuseVector (copy)
				InterventionAnalytics.sendAnalyticsEvent(InterventionAnalytics.TelemetryConfigs.GetModerationDetailFailed, {
					eventType = InterventionAnalytics.Constants.EventTypes.GetModerationDetailFailed,
					placement = Constants.InterventionPlacementType.InApp,
					renderedTimestamp = DateTime.now().UnixTimestampMillis,
					error = Err.error,
					abuseVector = AbuseVector
				})
			end):await()
			
			if not ModerationDetail then return end
			if ModerationDetail.acknowledgeable then
				UseResult({
					isShown = true,
					interventionDetail = {
						moderationDetail = ModerationDetail,
						options = Options,
						abuseVector = AbuseVector
					},
					type = Constants.UIStateActions.ToggleNotificationDialog,
					treatmentType = Constants.TreatmentType.UniversalFeatureRestriction
				})
				
				return
			end
		end) else nil
		local Connection2 = if FFlagUniversalFeatureRestrictionReceivers then FeatureRestrictionDisplayDirectSignalModule:connect(function(p2)
			-- upvalues: UseResult (upval), Constants (upval)
			local AbuseVector = p2.abuseVector
			local ModerationDetail = p2.moderationDetail
			local Options = p2.options
			
			if ModerationDetail then
				UseResult({
					isShown = true,
					interventionDetail = {
						moderationDetail = ModerationDetail,
						options = Options,
						abuseVector = AbuseVector
					},
					type = Constants.UIStateActions.ToggleNotificationDialog,
					treatmentType = Constants.TreatmentType.UniversalFeatureRestriction
				})
				
				return
			end
		end) else nil
		
		return function()
			-- upvalues: Connection (copy), FFlagUniversalFeatureRestrictionReceivers (upval), Connection1 (ref), Connection2 (ref)
			if Connection then
				Connection:disconnect()
			end
			if FFlagUniversalFeatureRestrictionReceivers and Connection1 then
				Connection1:disconnect()
			end
			if FFlagUniversalFeatureRestrictionReceivers and Connection2 then
				Connection2:disconnect()
			end
		end
	end, {})
	
	return nil
end

return InAppInterventionEventReceiver