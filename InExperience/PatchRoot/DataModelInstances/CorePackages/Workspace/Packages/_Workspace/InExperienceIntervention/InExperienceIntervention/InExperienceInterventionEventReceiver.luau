local inExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local parent = inExperienceIntervention.Parent
local chatService = game:GetService("Chat")
local featureRestrictionManagerService = game:GetService("FeatureRestrictionManager")
local httpService = game:GetService("HttpService")
local notificationService = game:GetService("NotificationService")
local reactModule = require(parent.React)
local chatInputBoxDisabledPressedSignal = require(parent.InterventionShared).Signals.chatInputBoxDisabledPressedSignal
local constants = require(parent.InterventionShared).Utils.Constants
local determineUFRInterventionType = require(parent.InterventionShared).Utils.determineUFRInterventionType
local featureRestrictionDisplayDirectSignalModule = require(parent.UniversalFeatureRestrictions.featureRestrictionDisplayDirectSignal)
local featureRestrictionDisplaySignalModule = require(parent.UniversalFeatureRestrictions.featureRestrictionDisplaySignal)
local getModerationDetail = require(parent.InterventionShared).Http.GetModerationDetail
local inExperienceInterventionAnalyticsModule = require(inExperienceIntervention.InExperienceInterventionAnalytics)
local interventionAnalytics = require(parent.InterventionShared).InterventionAnalytics
local interventionTreatmentConfigListModule = require(inExperienceIntervention.InterventionTreatmentConfigs.InterventionTreatmentConfigList)
local interventionTypes = interventionAnalytics.Constants.InterventionTypes
local getFFlagGameJoinTimeoutChatAttemptEnabled = require(parent.SharedFlags).GetFFlagGameJoinTimeoutChatAttemptEnabled
local fFlagAppChatUniversalFeatureRestriction = require(parent.SharedFlags).FFlagAppChatUniversalFeatureRestriction
local fFlagUFRImprovementsModule = require(parent.InterventionShared.FFlagUFRImprovements)
local fFlagUniversalFeatureRestrictionReceivers = require(parent.SharedFlags).FFlagUniversalFeatureRestrictionReceivers
local fFlagTemporaryAvatarKickWarningDialogModule = require(parent.InterventionShared.FFlagTemporaryAvatarKickWarningDialog)

function InExperienceInterventionEventReceiver(p1)
	-- upvalues: reactModule (ref), notificationService (ref), constants (ref), httpService (ref), interventionTreatmentConfigListModule (ref), fFlagTemporaryAvatarKickWarningDialogModule (ref), chatService (ref), getFFlagGameJoinTimeoutChatAttemptEnabled (ref), featureRestrictionManagerService (ref), getModerationDetail (ref), inExperienceInterventionAnalyticsModule (ref), fFlagUFRImprovementsModule (ref), determineUFRInterventionType (ref), interventionTypes (ref), fFlagAppChatUniversalFeatureRestriction (ref), chatInputBoxDisabledPressedSignal (ref), fFlagUniversalFeatureRestrictionReceivers (ref), featureRestrictionDisplaySignalModule (ref), interventionAnalytics (ref), featureRestrictionDisplayDirectSignalModule (ref)
	reactModule.useEffect(function()
		-- upvalues: notificationService (copy), constants (copy), httpService (copy), interventionTreatmentConfigListModule (copy), p1 (ref), fFlagTemporaryAvatarKickWarningDialogModule (copy), chatService (copy), getFFlagGameJoinTimeoutChatAttemptEnabled (copy), featureRestrictionManagerService (copy), getModerationDetail (copy), inExperienceInterventionAnalyticsModule (copy), fFlagUFRImprovementsModule (copy), determineUFRInterventionType (copy), interventionTypes (copy), fFlagAppChatUniversalFeatureRestriction (copy), chatInputBoxDisabledPressedSignal (copy), fFlagUniversalFeatureRestrictionReceivers (copy), featureRestrictionDisplaySignalModule (copy), interventionAnalytics (copy), featureRestrictionDisplayDirectSignalModule (copy)
		local robloxEventReceivedConnection = notificationService.RobloxEventReceived:Connect(function(p2)
			-- upvalues: constants (copy), httpService (copy), interventionTreatmentConfigListModule (copy), p1 (copy), fFlagTemporaryAvatarKickWarningDialogModule (copy)
			if p2.namespace == constants.FEATURE_INTERV_SIGNAL_NAMESPACE then
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), p2 (ref)
					return httpService:JSONDecode(p2.detail)
				end)
				
				if not ok then return end
				for i, v in interventionTreatmentConfigListModule do
					if v.shouldTriggerEventReceived(status) then
						v.onTriggerEventReceived(status)
					end
					if v.shouldTriggerVisualTreatment(status) then
						v.onTriggerVisualTreatment(p1.uiStateDispatch, status)
					end
					if v.shouldTriggerBehavioralTreatment(status) then
						v.onTriggerBehavioralTreatment(status)
					end
				end
				return
			elseif fFlagTemporaryAvatarKickWarningDialogModule and p2.namespace == constants.AVATAR_VIOLATION_SIGNAL_NAMESPACE then
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), p2 (ref)
					return httpService:JSONDecode(p2.detail)
				end)
				
				if not ok then return end
				p1.uiStateDispatch({
					isShown = true,
					type = constants.UIStateActions.ToggleNotificationDialog,
					treatmentType = constants.TreatmentType.TemporaryAvatarKickWarning,
					detail = {
						extras = {
							avatarEntityId = status.avatarEntityID,
							violationType = status.violationType,
							placeId = status.placeID
						}
					}
				})
			end
		end)
		local timeoutChatAttemptConnection = chatService.TimeoutChatAttempt:Connect(function(_, p3)
			-- upvalues: p1 (copy), constants (copy)
			p1.uiStateDispatch({
				isShown = true,
				type = constants.UIStateActions.ToggleNotificationDialog,
				treatmentType = constants.TreatmentType.ChatTimeoutChatAttempt,
				endTime = p3
			})
		end)
		local var1 = if getFFlagGameJoinTimeoutChatAttemptEnabled() then featureRestrictionManagerService.TimeoutChatAttempt:Connect(function(_, p3)
			-- upvalues: p1 (copy), constants (copy)
			p1.uiStateDispatch({
				isShown = true,
				type = constants.UIStateActions.ToggleNotificationDialog,
				treatmentType = constants.TreatmentType.ChatTimeoutGameJoin,
				endTime = p3
			})
		end) else nil
		local featureTimeoutAttemptConnection = featureRestrictionManagerService.FeatureTimeoutAttempt:Connect(function(_, p3, p4, p5)
			-- upvalues: p1 (copy), constants (copy)
			if p5 == Enum.FeatureRestrictionAbuseVector.ExperienceChat then
				p1.uiStateDispatch({
					isShown = true,
					type = constants.UIStateActions.ToggleNotificationDialog,
					treatmentType = constants.TreatmentType.ChatTimeoutChatAttempt,
					endTime = p3 + p4
				})
			end
		end)
		local showFeatureInterventionDetailsConnection = featureRestrictionManagerService.ShowFeatureInterventionDetails:Connect(function(p3)
			-- upvalues: getModerationDetail (copy), constants (copy), inExperienceInterventionAnalyticsModule (copy), fFlagUFRImprovementsModule (copy), determineUFRInterventionType (copy), interventionTypes (copy), p1 (copy)
			if p3 == Enum.FeatureRestrictionAbuseVector.ExperienceChat then
				local var2 = nil
				getModerationDetail({ abuseVector = constants.AbuseVectorType.ExperienceChat }):andThen(function(p4)
					-- upvalues: var2 (write)
					var2 = p4
				end):catch(function(p4)
					-- upvalues: inExperienceInterventionAnalyticsModule (copy)
					inExperienceInterventionAnalyticsModule.sendAnalyticsEvent(inExperienceInterventionAnalyticsModule.Constants.EventTypes.GetModerationDetailFailed, nil, DateTime.now().UnixTimestampMillis, nil, nil, nil, p4.error)
				end):await()
				
				return
			end
		end)
		local featureTimeoutRestoredConnection = featureRestrictionManagerService.FeatureTimeoutRestored:Connect(function(p3)
			print("FeatureTimeoutRestored - Abuse Vector: ", p3)
		end)
		local var2 = if not fFlagAppChatUniversalFeatureRestriction then chatInputBoxDisabledPressedSignal:connect(function(p3)
			-- upvalues: p1 (copy), constants (copy)
			p1.uiStateDispatch({
				isShown = true,
				detail = {
					decisionEventId = p3.decisionEventId,
					timeoutDurationSeconds = p3.duration
				},
				type = constants.UIStateActions.ToggleNotificationDialog,
				treatmentType = constants.TreatmentType.PartyChatTimeoutDialog,
				endTime = p3.endTimestamp
			})
		end) else nil
		local var3 = if fFlagUniversalFeatureRestrictionReceivers then featureRestrictionDisplaySignalModule:connect(function(p3)
			-- upvalues: getModerationDetail (copy), interventionAnalytics (copy), constants (copy), p1 (copy)
			local abuseVector = p3.abuseVector
			local options = p3.options
			local var4 = nil
			getModerationDetail({ abuseVector = abuseVector }):andThen(function(p4)
				-- upvalues: var4 (write)
				var4 = p4
			end):catch(function(p4)
				-- upvalues: interventionAnalytics (copy), constants (copy), abuseVector (ref)
				interventionAnalytics.sendAnalyticsEvent(interventionAnalytics.TelemetryConfigs.GetModerationDetailFailed, {
					eventType = interventionAnalytics.Constants.EventTypes.GetModerationDetailFailed,
					placement = constants.InterventionPlacementType.InExperience,
					renderedTimestamp = DateTime.now().UnixTimestampMillis,
					error = p4.error,
					abuseVector = abuseVector
				})
			end):await()
		end) else nil
		local var4 = if fFlagUniversalFeatureRestrictionReceivers then featureRestrictionDisplayDirectSignalModule:connect(function(p3)
			-- upvalues: p1 (copy), constants (copy)
			local abuseVector = p3.abuseVector
			local moderationDetail = p3.moderationDetail
			local options = p3.options
			
			if moderationDetail then
				p1.uiStateDispatch({
					isShown = true,
					type = constants.UIStateActions.ToggleNotificationDialog,
					treatmentType = constants.TreatmentType.UniversalFeatureRestriction,
					detail = {
						moderationDetail = moderationDetail,
						options = options,
						abuseVector = abuseVector
					}
				})
				
				return
			end
		end) else nil
		
		return function()
			-- upvalues: robloxEventReceivedConnection (ref), timeoutChatAttemptConnection (ref), getFFlagGameJoinTimeoutChatAttemptEnabled (copy), var1 (write), featureTimeoutAttemptConnection (ref), showFeatureInterventionDetailsConnection (ref), featureTimeoutRestoredConnection (ref), var2 (write), fFlagUniversalFeatureRestrictionReceivers (copy), var3 (write), var4 (write)
			robloxEventReceivedConnection:Disconnect()
			timeoutChatAttemptConnection:Disconnect()
			
			if getFFlagGameJoinTimeoutChatAttemptEnabled() then
				var1:Disconnect()
			end
			featureTimeoutAttemptConnection:Disconnect()
			showFeatureInterventionDetailsConnection:Disconnect()
			featureTimeoutRestoredConnection:Disconnect()
			
			if var2 then
				var2:disconnect()
			end
			if fFlagUniversalFeatureRestrictionReceivers and var3 then
				var3:disconnect()
			end
			if fFlagUniversalFeatureRestrictionReceivers and var4 then
				var4:disconnect()
			end
		end
	end, {})
	
	return reactModule.createElement("Frame", { BackgroundTransparency = 1 })
end

return InExperienceInterventionEventReceiver