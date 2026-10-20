local InExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local Parent = InExperienceIntervention.Parent
local Chat = game:GetService("Chat")
local FeatureRestrictionManager = game:GetService("FeatureRestrictionManager")
local HttpService = game:GetService("HttpService")
local NotificationService = game:GetService("NotificationService")
local ReactModule = require(Parent.React)
local ChatInputBoxDisabledPressedSignal = require(Parent.InterventionShared).Signals.chatInputBoxDisabledPressedSignal
local DictationSafetyReminderSignal = require(Parent.InterventionShared).Signals.dictationSafetyReminderSignal
local ExperienceChatInterventionShownSignal = require(Parent.InterventionShared).Signals.experienceChatInterventionShownSignal
local Constants = require(Parent.InterventionShared).Utils.Constants
local DetermineUFRInterventionTypeFunction = require(Parent.InterventionShared).Utils.determineUFRInterventionType
local FeatureRestrictionDisplayDirectSignalModule = require(Parent.UniversalFeatureRestrictions.featureRestrictionDisplayDirectSignal)
local FeatureRestrictionDisplaySignalModule = require(Parent.UniversalFeatureRestrictions.featureRestrictionDisplaySignal)
local GetModerationDetailFunction = require(Parent.InterventionShared).Http.GetModerationDetail
local InExperienceInterventionAnalyticsModule = require(InExperienceIntervention.InExperienceInterventionAnalytics)
local InterventionAnalytics = require(Parent.InterventionShared).InterventionAnalytics
local InterventionTreatmentConfigListModule = require(InExperienceIntervention.InterventionTreatmentConfigs.InterventionTreatmentConfigList)
local InterventionTypes = InterventionAnalytics.Constants.InterventionTypes
local GetFFlagGameJoinTimeoutChatAttemptEnabledFunction = require(Parent.SharedFlags).GetFFlagGameJoinTimeoutChatAttemptEnabled
local FFlagAppChatUniversalFeatureRestriction = require(Parent.SharedFlags).FFlagAppChatUniversalFeatureRestriction
local FFlagUFRImprovementsModule = require(Parent.InterventionShared.FFlagUFRImprovements)
local FFlagUFRAppealsAndModNoteFixModule = require(Parent.InterventionShared.FFlagUFRAppealsAndModNoteFix)
local FFlagTemporaryAvatarKickWarningDialogModule = require(Parent.InterventionShared.FFlagTemporaryAvatarKickWarningDialog)
local FFlagExpChatDictationContinuousSafetyReminder = require(Parent.SharedFlags).FFlagExpChatDictationContinuousSafetyReminder
local FFlagExpChatDictationStopOnSafetyIntervention = require(Parent.SharedFlags).FFlagExpChatDictationStopOnSafetyIntervention

function InExperienceInterventionEventReceiver(p1)
	-- upvalues: ReactModule (copy), NotificationService (copy), Constants (copy), HttpService (copy), InterventionTreatmentConfigListModule (copy), FFlagTemporaryAvatarKickWarningDialogModule (copy), Chat (copy), FFlagExpChatDictationStopOnSafetyIntervention (copy), ExperienceChatInterventionShownSignal (copy), GetFFlagGameJoinTimeoutChatAttemptEnabledFunction (copy), FeatureRestrictionManager (copy), GetModerationDetailFunction (copy), InExperienceInterventionAnalyticsModule (copy), FFlagUFRImprovementsModule (copy), DetermineUFRInterventionTypeFunction (copy), InterventionTypes (copy), FFlagAppChatUniversalFeatureRestriction (copy), ChatInputBoxDisabledPressedSignal (copy), FFlagExpChatDictationContinuousSafetyReminder (copy), DictationSafetyReminderSignal (copy), FeatureRestrictionDisplaySignalModule (copy), InterventionAnalytics (copy), FFlagUFRAppealsAndModNoteFixModule (copy), FeatureRestrictionDisplayDirectSignalModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: NotificationService (upval), Constants (upval), HttpService (upval), InterventionTreatmentConfigListModule (upval), p1 (copy), FFlagTemporaryAvatarKickWarningDialogModule (upval), Chat (upval), FFlagExpChatDictationStopOnSafetyIntervention (upval), ExperienceChatInterventionShownSignal (upval), GetFFlagGameJoinTimeoutChatAttemptEnabledFunction (upval), FeatureRestrictionManager (upval), GetModerationDetailFunction (upval), InExperienceInterventionAnalyticsModule (upval), FFlagUFRImprovementsModule (upval), DetermineUFRInterventionTypeFunction (upval), InterventionTypes (upval), FFlagAppChatUniversalFeatureRestriction (upval), ChatInputBoxDisabledPressedSignal (upval), FFlagExpChatDictationContinuousSafetyReminder (upval), DictationSafetyReminderSignal (upval), FeatureRestrictionDisplaySignalModule (upval), InterventionAnalytics (upval), FFlagUFRAppealsAndModNoteFixModule (upval), FeatureRestrictionDisplayDirectSignalModule (upval)
		local RobloxEventReceivedConnection = NotificationService.RobloxEventReceived:Connect(function(EventData)
			-- upvalues: Constants (upval), HttpService (upval), InterventionTreatmentConfigListModule (upval), p1 (upval), FFlagTemporaryAvatarKickWarningDialogModule (upval)
			if EventData.namespace == Constants.FEATURE_INTERV_SIGNAL_NAMESPACE then
				local Success, Result = pcall(function()
					-- upvalues: HttpService (upval), EventData (copy)
					return HttpService:JSONDecode(EventData.detail)
				end)
				
				if not Success then return end
				for _, value in InterventionTreatmentConfigListModule do
					if value.shouldTriggerEventReceived(Result) then
						value.onTriggerEventReceived(Result)
					end
					if value.shouldTriggerVisualTreatment(Result) then
						value.onTriggerVisualTreatment(p1.uiStateDispatch, Result)
					end
					if value.shouldTriggerBehavioralTreatment(Result) then
						value.onTriggerBehavioralTreatment(Result)
					end
				end
				return
			elseif FFlagTemporaryAvatarKickWarningDialogModule and EventData.namespace == Constants.AVATAR_VIOLATION_SIGNAL_NAMESPACE then
				local Success1, Result1 = pcall(function()
					-- upvalues: HttpService (upval), EventData (copy)
					return HttpService:JSONDecode(EventData.detail)
				end)
				
				if not Success1 then return end
				p1.uiStateDispatch({
					isShown = true,
					type = Constants.UIStateActions.ToggleNotificationDialog,
					treatmentType = Constants.TreatmentType.TemporaryAvatarKickWarning,
					detail = {
						extras = {
							avatarEntityId = Result1.avatarEntityID,
							violationType = Result1.violationType,
							placeId = Result1.placeID
						}
					}
				})
			end
		end)
		local TimeoutChatAttemptConnection = Chat.TimeoutChatAttempt:Connect(function(_, EndTime)
			-- upvalues: p1 (upval), Constants (upval), FFlagExpChatDictationStopOnSafetyIntervention (upval), ExperienceChatInterventionShownSignal (upval)
			p1.uiStateDispatch({
				isShown = true,
				type = Constants.UIStateActions.ToggleNotificationDialog,
				treatmentType = Constants.TreatmentType.ChatTimeoutChatAttempt,
				endTime = EndTime
			})
			
			if FFlagExpChatDictationStopOnSafetyIntervention then
				ExperienceChatInterventionShownSignal:fire()
			end
		end)
		local TimeoutChatAttemptConnection1 = if GetFFlagGameJoinTimeoutChatAttemptEnabledFunction() then FeatureRestrictionManager.TimeoutChatAttempt:Connect(function(_, EndTime)
			-- upvalues: p1 (upval), Constants (upval), FFlagExpChatDictationStopOnSafetyIntervention (upval), ExperienceChatInterventionShownSignal (upval)
			p1.uiStateDispatch({
				isShown = true,
				type = Constants.UIStateActions.ToggleNotificationDialog,
				treatmentType = Constants.TreatmentType.ChatTimeoutGameJoin,
				endTime = EndTime
			})
			
			if FFlagExpChatDictationStopOnSafetyIntervention then
				ExperienceChatInterventionShownSignal:fire()
			end
		end) else nil
		local FeatureTimeoutAttemptConnection = FeatureRestrictionManager.FeatureTimeoutAttempt:Connect(function(_, StartTime, Duration, FeatureRestrictionAbuseVector)
			-- upvalues: p1 (upval), Constants (upval), FFlagExpChatDictationStopOnSafetyIntervention (upval), ExperienceChatInterventionShownSignal (upval)
			if FeatureRestrictionAbuseVector == Enum.FeatureRestrictionAbuseVector.ExperienceChat then
				p1.uiStateDispatch({
					isShown = true,
					type = Constants.UIStateActions.ToggleNotificationDialog,
					treatmentType = Constants.TreatmentType.ChatTimeoutChatAttempt,
					endTime = StartTime + Duration
				})
				
				if FFlagExpChatDictationStopOnSafetyIntervention then
					ExperienceChatInterventionShownSignal:fire()
				end
			end
		end)
		local ShowFeatureInterventionDetailsConnection = FeatureRestrictionManager.ShowFeatureInterventionDetails:Connect(function(FeatureRestrictionAbuseVector)
			-- upvalues: GetModerationDetailFunction (upval), Constants (upval), InExperienceInterventionAnalyticsModule (upval), FFlagExpChatDictationStopOnSafetyIntervention (upval), ExperienceChatInterventionShownSignal (upval), FFlagUFRImprovementsModule (upval), DetermineUFRInterventionTypeFunction (upval), InterventionTypes (upval), p1 (upval)
			if FeatureRestrictionAbuseVector == Enum.FeatureRestrictionAbuseVector.ExperienceChat then
				local ModerationDetail = nil
				GetModerationDetailFunction({ abuseVector = Constants.AbuseVectorType.ExperienceChat }):andThen(function(Result)
					-- upvalues: ModerationDetail (ref)
					ModerationDetail = Result
				end):catch(function(Err)
					-- upvalues: InExperienceInterventionAnalyticsModule (upval)
					InExperienceInterventionAnalyticsModule.sendAnalyticsEvent(InExperienceInterventionAnalyticsModule.Constants.EventTypes.GetModerationDetailFailed, nil, DateTime.now().UnixTimestampMillis, nil, nil, nil, Err.error)
				end):await()
				
				if not ModerationDetail then return end
				if not ModerationDetail.acknowledgeable then return end
				if FFlagExpChatDictationStopOnSafetyIntervention then
					ExperienceChatInterventionShownSignal:fire()
				end
				local PunishmentTypeDescription = ModerationDetail.punishmentTypeDescription
				
				if FFlagUFRImprovementsModule then
					local DetermineUFRInterventionTypeResult = DetermineUFRInterventionTypeFunction(PunishmentTypeDescription)
					
					if DetermineUFRInterventionTypeResult == InterventionTypes.UFRTimeout then
						p1.uiStateDispatch({
							isShown = true,
							type = Constants.UIStateActions.ToggleNotificationDialog,
							treatmentType = Constants.TreatmentType.ChatTimeoutDialogV2,
							detail = { moderationDetail = ModerationDetail }
						})
					elseif DetermineUFRInterventionTypeResult == InterventionTypes.UFRNudge then
						p1.uiStateDispatch({
							isShown = true,
							type = Constants.UIStateActions.ToggleNotificationDialog,
							treatmentType = Constants.TreatmentType.ChatNudgeDialogV2,
							detail = { moderationDetail = ModerationDetail }
						})
					end
				elseif PunishmentTypeDescription == Constants.PunishmentTypeDescription.ChatTimeout then
					p1.uiStateDispatch({
						isShown = true,
						type = Constants.UIStateActions.ToggleNotificationDialog,
						treatmentType = Constants.TreatmentType.ChatTimeoutDialogV2,
						detail = { moderationDetail = ModerationDetail }
					})
				elseif PunishmentTypeDescription == Constants.PunishmentTypeDescription.ChatNudge then
					p1.uiStateDispatch({
						isShown = true,
						type = Constants.UIStateActions.ToggleNotificationDialog,
						treatmentType = Constants.TreatmentType.ChatNudgeDialogV2,
						detail = { moderationDetail = ModerationDetail }
					})
				end
			end
		end)
		local FeatureTimeoutRestoredConnection = FeatureRestrictionManager.FeatureTimeoutRestored:Connect(function(FeatureRestrictionAbuseVector)
			print("FeatureTimeoutRestored - Abuse Vector: ", FeatureRestrictionAbuseVector)
		end)
		local Connection = if FFlagAppChatUniversalFeatureRestriction then nil else ChatInputBoxDisabledPressedSignal:connect(function(p2)
			-- upvalues: p1 (upval), Constants (upval)
			p1.uiStateDispatch({
				isShown = true,
				detail = {
					decisionEventId = p2.decisionEventId,
					timeoutDurationSeconds = p2.duration
				},
				type = Constants.UIStateActions.ToggleNotificationDialog,
				treatmentType = Constants.TreatmentType.PartyChatTimeoutDialog,
				endTime = p2.endTimestamp
			})
		end)
		local Connection1 = if FFlagExpChatDictationContinuousSafetyReminder then DictationSafetyReminderSignal:connect(function()
			-- upvalues: p1 (upval), Constants (upval)
			p1.uiStateDispatch({
				isShown = true,
				type = Constants.UIStateActions.ToggleNotificationDialog,
				treatmentType = Constants.TreatmentType.DictationSafetyReminderToast
			})
		end) else nil
		local Connection2 = FeatureRestrictionDisplaySignalModule:connect(function(p2)
			-- upvalues: GetModerationDetailFunction (upval), InterventionAnalytics (upval), Constants (upval), FFlagUFRAppealsAndModNoteFixModule (upval), p1 (upval)
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
					placement = Constants.InterventionPlacementType.InExperience,
					renderedTimestamp = DateTime.now().UnixTimestampMillis,
					error = Err.error,
					abuseVector = AbuseVector
				})
			end):await()
			
			if ModerationDetail and (not FFlagUFRAppealsAndModNoteFixModule or next(ModerationDetail) ~= nil) then
				p1.uiStateDispatch({
					isShown = true,
					type = Constants.UIStateActions.ToggleNotificationDialog,
					treatmentType = Constants.TreatmentType.UniversalFeatureRestriction,
					detail = {
						moderationDetail = ModerationDetail,
						options = Options,
						abuseVector = AbuseVector
					}
				})
				
				return
			end
		end)
		local Connection3 = FeatureRestrictionDisplayDirectSignalModule:connect(function(p2)
			-- upvalues: p1 (upval), Constants (upval)
			local AbuseVector = p2.abuseVector
			local ModerationDetail = p2.moderationDetail
			local Options = p2.options
			
			if ModerationDetail then
				p1.uiStateDispatch({
					isShown = true,
					type = Constants.UIStateActions.ToggleNotificationDialog,
					treatmentType = Constants.TreatmentType.UniversalFeatureRestriction,
					detail = {
						moderationDetail = ModerationDetail,
						options = Options,
						abuseVector = AbuseVector
					}
				})
				
				return
			end
		end)
		
		return function()
			-- upvalues: RobloxEventReceivedConnection (copy), TimeoutChatAttemptConnection (copy), GetFFlagGameJoinTimeoutChatAttemptEnabledFunction (upval), TimeoutChatAttemptConnection1 (ref), FeatureTimeoutAttemptConnection (copy), ShowFeatureInterventionDetailsConnection (copy), FeatureTimeoutRestoredConnection (copy), Connection (ref), Connection1 (ref), Connection2 (copy), Connection3 (copy)
			RobloxEventReceivedConnection:Disconnect()
			TimeoutChatAttemptConnection:Disconnect()
			
			if GetFFlagGameJoinTimeoutChatAttemptEnabledFunction() then
				TimeoutChatAttemptConnection1:Disconnect()
			end
			FeatureTimeoutAttemptConnection:Disconnect()
			ShowFeatureInterventionDetailsConnection:Disconnect()
			FeatureTimeoutRestoredConnection:Disconnect()
			
			if Connection then
				Connection:disconnect()
			end
			if Connection1 then
				Connection1:disconnect()
			end
			Connection2:disconnect()
			Connection3:disconnect()
		end
	end, {})
	
	return ReactModule.createElement("Frame", { BackgroundTransparency = 1 })
end

return InExperienceInterventionEventReceiver