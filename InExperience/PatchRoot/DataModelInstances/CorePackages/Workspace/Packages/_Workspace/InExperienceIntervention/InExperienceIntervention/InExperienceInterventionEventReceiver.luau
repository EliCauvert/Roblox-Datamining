local inExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local parent = inExperienceIntervention.Parent
local notificationService = game:GetService("NotificationService")
local httpService = game:GetService("HttpService")
local chatService = game:GetService("Chat")
local reactModule = require(parent.React)
local chatInputBoxDisabledPressedSignal = require(parent.InterventionShared).Signals.chatInputBoxDisabledPressedSignal
local constants = require(parent.InterventionShared).Utils.Constants
local featureRestrictionDisplaySignalModule = require(parent.UniversalFeatureRestrictions.featureRestrictionDisplaySignal)
local featureRestrictionDisplayDirectSignalModule = require(parent.UniversalFeatureRestrictions.featureRestrictionDisplayDirectSignal)
local getModerationDetail = require(parent.InterventionShared).Http.GetModerationDetail
local inExperienceInterventionAnalyticsModule = require(inExperienceIntervention.InExperienceInterventionAnalytics)
local interventionAnalytics = require(parent.InterventionShared).InterventionAnalytics
local interventionTreatmentConfigListModule = require(inExperienceIntervention.InterventionTreatmentConfigs.InterventionTreatmentConfigList)
local getFFlagGameJoinTimeoutChatAttemptEnabled = require(parent.SharedFlags).GetFFlagGameJoinTimeoutChatAttemptEnabled
local fFlagUniversalFeatureRestrictionReceivers = require(parent.SharedFlags).FFlagUniversalFeatureRestrictionReceivers
local fFlagTemporaryAvatarKickWarningDialogModule = require(parent.InterventionShared.FFlagTemporaryAvatarKickWarningDialog)
local featureRestrictionManagerService = game:GetService("FeatureRestrictionManager")

function InExperienceInterventionEventReceiver(p0) --[[ line: 32 ]]
	-- upvalues: reactModule (ref), notificationService (ref), constants (ref), httpService (ref), interventionTreatmentConfigListModule (ref), fFlagTemporaryAvatarKickWarningDialogModule (ref), chatService (ref), getFFlagGameJoinTimeoutChatAttemptEnabled (ref), featureRestrictionManagerService (ref), getModerationDetail (ref), inExperienceInterventionAnalyticsModule (ref), chatInputBoxDisabledPressedSignal (ref), fFlagUniversalFeatureRestrictionReceivers (ref), featureRestrictionDisplaySignalModule (ref), interventionAnalytics (ref), featureRestrictionDisplayDirectSignalModule (ref)
	reactModule.useEffect(function() --[[ line: 33 ]]
		-- upvalues: notificationService (copy), constants (copy), httpService (copy), interventionTreatmentConfigListModule (copy), p0 (ref), fFlagTemporaryAvatarKickWarningDialogModule (copy), chatService (copy), getFFlagGameJoinTimeoutChatAttemptEnabled (copy), featureRestrictionManagerService (copy), getModerationDetail (copy), inExperienceInterventionAnalyticsModule (copy), chatInputBoxDisabledPressedSignal (copy), fFlagUniversalFeatureRestrictionReceivers (copy), featureRestrictionDisplaySignalModule (copy), interventionAnalytics (copy), featureRestrictionDisplayDirectSignalModule (copy)
		local robloxEventReceivedConnection = notificationService.RobloxEventReceived:Connect(function(p1) --[[ line: 34 ]]
			-- upvalues: constants (copy), httpService (copy), interventionTreatmentConfigListModule (copy), p0 (copy), fFlagTemporaryAvatarKickWarningDialogModule (copy)
			if p1.namespace == constants.FEATURE_INTERV_SIGNAL_NAMESPACE then
				local ok, status = pcall(function() --[[ line: 36 ]]
					-- upvalues: httpService (copy), p1 (ref)
					return httpService:JSONDecode(p1.detail)
				end)
				
				if not ok then return end
				for i, v in interventionTreatmentConfigListModule do
					if v.shouldTriggerEventReceived(status) then
						v.onTriggerEventReceived(status)
					end
					if v.shouldTriggerVisualTreatment(status) then
						v.onTriggerVisualTreatment(p0.uiStateDispatch, status)
					end
					if v.shouldTriggerBehavioralTreatment(status) then
						v.onTriggerBehavioralTreatment(status)
					end
				end
				return
			elseif fFlagTemporaryAvatarKickWarningDialogModule and p1.namespace == constants.AVATAR_VIOLATION_SIGNAL_NAMESPACE then
				local ok, status = pcall(function() --[[ line: 60 ]]
					-- upvalues: httpService (copy), p1 (ref)
					return httpService:JSONDecode(p1.detail)
				end)
				
				if not ok then return end
				p0.uiStateDispatch({
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
		local timeoutChatAttemptConnection = chatService.TimeoutChatAttempt:Connect(function(_, p2) --[[ line: 83 ]]
			-- upvalues: p0 (copy), constants (copy)
			p0.uiStateDispatch({
				isShown = true,
				type = constants.UIStateActions.ToggleNotificationDialog,
				treatmentType = constants.TreatmentType.ChatTimeoutChatAttempt,
				endTime = p2
			})
		end)
		local var13 = if getFFlagGameJoinTimeoutChatAttemptEnabled() then featureRestrictionManagerService.TimeoutChatAttempt:Connect(function(_, p3) --[[ line: 95 ]]
			-- upvalues: p0 (copy), constants (copy)
			p0.uiStateDispatch({
				isShown = true,
				type = constants.UIStateActions.ToggleNotificationDialog,
				treatmentType = constants.TreatmentType.ChatTimeoutGameJoin,
				endTime = p3
			})
		end) else nil
		local featureTimeoutAttemptConnection = featureRestrictionManagerService.FeatureTimeoutAttempt:Connect(function(_, p4, p5, p6) --[[ line: 107 ]]
			-- upvalues: p0 (copy), constants (copy)
			if p6 == Enum.FeatureRestrictionAbuseVector.ExperienceChat then
				p0.uiStateDispatch({
					isShown = true,
					type = constants.UIStateActions.ToggleNotificationDialog,
					treatmentType = constants.TreatmentType.ChatTimeoutChatAttempt,
					endTime = p4 + p5
				})
			end
		end)
		local showFeatureInterventionDetailsConnection = featureRestrictionManagerService.ShowFeatureInterventionDetails:Connect(function(p7) --[[ line: 120 ]]
			-- upvalues: getModerationDetail (copy), constants (copy), inExperienceInterventionAnalyticsModule (copy), p0 (copy)
			if p7 == Enum.FeatureRestrictionAbuseVector.ExperienceChat then
				local var20 = nil
				getModerationDetail({ abuseVector = constants.AbuseVectorType.ExperienceChat }):andThen(function(p9) --[[ line: 125 ]]
					-- upvalues: var20 (write)
					var20 = p9
				end):catch(function(p8) --[[ line: 128 ]]
					-- upvalues: inExperienceInterventionAnalyticsModule (copy)
					inExperienceInterventionAnalyticsModule.sendAnalyticsEvent(inExperienceInterventionAnalyticsModule.Constants.EventTypes.GetModerationDetailFailed, nil, DateTime.now().UnixTimestampMillis, nil, nil, nil, p8.error)
				end):await()
				
				return
			end
		end)
		local featureTimeoutRestoredConnection = featureRestrictionManagerService.FeatureTimeoutRestored:Connect(function(p10) --[[ line: 177 ]]
			print("FeatureTimeoutRestored - Abuse Vector: ", p10)
		end)
		local var17 = chatInputBoxDisabledPressedSignal:connect(function(p11) --[[ line: 183 ]]
			-- upvalues: p0 (copy), constants (copy)
			p0.uiStateDispatch({
				isShown = true,
				detail = {
					decisionEventId = p11.decisionEventId,
					timeoutDurationSeconds = p11.duration
				},
				type = constants.UIStateActions.ToggleNotificationDialog,
				treatmentType = constants.TreatmentType.PartyChatTimeoutDialog,
				endTime = p11.endTimestamp
			})
		end)
		local var18 = if fFlagUniversalFeatureRestrictionReceivers then featureRestrictionDisplaySignalModule:connect(function(p12) --[[ line: 199 ]]
			-- upvalues: getModerationDetail (copy), interventionAnalytics (copy), constants (copy), p0 (copy)
			local abuseVector = p12.abuseVector
			local options = p12.options
			local var21 = nil
			getModerationDetail({ abuseVector = abuseVector }):andThen(function(p14) --[[ line: 205 ]]
				-- upvalues: var21 (write)
				var21 = p14
			end):catch(function(p13) --[[ line: 208 ]]
				-- upvalues: interventionAnalytics (copy), constants (copy), abuseVector (ref)
				interventionAnalytics.sendAnalyticsEvent(interventionAnalytics.TelemetryConfigs.GetModerationDetailFailed, {
					eventType = interventionAnalytics.Constants.EventTypes.GetModerationDetailFailed,
					placement = constants.InterventionPlacementType.InExperience,
					renderedTimestamp = DateTime.now().UnixTimestampMillis,
					error = p13.error,
					abuseVector = abuseVector
				})
			end):await()
		end) else nil
		local var19 = if fFlagUniversalFeatureRestrictionReceivers then featureRestrictionDisplayDirectSignalModule:connect(function(p15) --[[ line: 250 ]]
			-- upvalues: p0 (copy), constants (copy)
			local abuseVector = p15.abuseVector
			local moderationDetail = p15.moderationDetail
			local options = p15.options
			
			if moderationDetail then
				p0.uiStateDispatch({
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
		
		return function() --[[ line: 273 ]]
			-- upvalues: robloxEventReceivedConnection (ref), timeoutChatAttemptConnection (ref), getFFlagGameJoinTimeoutChatAttemptEnabled (copy), var13 (write), featureTimeoutAttemptConnection (ref), showFeatureInterventionDetailsConnection (ref), featureTimeoutRestoredConnection (ref), var17 (ref), fFlagUniversalFeatureRestrictionReceivers (copy), var18 (write), var19 (write)
			robloxEventReceivedConnection:Disconnect()
			timeoutChatAttemptConnection:Disconnect()
			
			if getFFlagGameJoinTimeoutChatAttemptEnabled() then
				var13:Disconnect()
			end
			featureTimeoutAttemptConnection:Disconnect()
			showFeatureInterventionDetailsConnection:Disconnect()
			featureTimeoutRestoredConnection:Disconnect()
			
			if var17 then
				var17:disconnect()
			end
			if fFlagUniversalFeatureRestrictionReceivers and var18 then
				var18:disconnect()
			end
			if fFlagUniversalFeatureRestrictionReceivers and var19 then
				var19:disconnect()
			end
		end
	end, {})
	
	return reactModule.createElement("Frame", { BackgroundTransparency = 1 })
end

return InExperienceInterventionEventReceiver