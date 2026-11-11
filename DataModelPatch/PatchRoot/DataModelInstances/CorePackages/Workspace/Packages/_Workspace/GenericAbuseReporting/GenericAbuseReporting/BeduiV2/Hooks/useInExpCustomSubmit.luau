local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local PromiseModule = require(Parent.Promise)
local ReactModule = require(Parent.React)
local _ = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local ComputeImpactedUserCountModule = require(GenericAbuseReporting.BeduiV2.Utils.computeImpactedUserCount)
local _ = require(GenericAbuseReporting.BeduiV2.Loaders.LoaderContext)
local ReportHelperModule = require(GenericAbuseReporting.BeduiV2.Utils.reportHelper)
local UseVoiceSnapshotFunction = require(GenericAbuseReporting.BeduiV2.Hooks.Enrichment.useVoiceSnapshot).useVoiceSnapshot
local _ = require(GenericAbuseReporting.BeduiV2.Utils.appendReportAnythingTags)
local SubmitVoiceReportFunction = ReportHelperModule.submitVoiceReport
local SubmitChatReportFunction = ReportHelperModule.submitChatReport
local SubmitChatReportWithoutMessageFunction = ReportHelperModule.submitChatReportWithoutMessage
local SubmitAvatarReportFunction = ReportHelperModule.submitAvatarReport
local SubmitPlaceReportFunction = ReportHelperModule.submitPlaceReport

return {
	REPORT_MESSAGE_NOT_SHOWN_ITEM_ID = "__MSG_NOT_SHOWN_ID",
	useInExpCustomSubmit = function(p1)
		-- upvalues: UseVoiceSnapshotFunction (copy), ReactModule (copy), ComputeImpactedUserCountModule (copy), SubmitVoiceReportFunction (copy), PromiseModule (copy), SubmitChatReportWithoutMessageFunction (copy), SubmitChatReportFunction (copy), SubmitAvatarReportFunction (copy), SubmitPlaceReportFunction (copy)
		local UseVoiceSnapshotResult = UseVoiceSnapshotFunction(p1.voiceChatServiceManager)
		
		return ReactModule.useCallback(function(p2)
			-- upvalues: UseVoiceSnapshotResult (copy), ComputeImpactedUserCountModule (upval), p1 (copy), SubmitVoiceReportFunction (upval), PromiseModule (upval), SubmitChatReportWithoutMessageFunction (upval), SubmitChatReportFunction (upval), SubmitAvatarReportFunction (upval), SubmitPlaceReportFunction (upval)
			if not p2.endpoint then
				error("SubmissionConfig must have an endpoint")
			end
			if p2.endpoint == "voice" then
				local Current = UseVoiceSnapshotResult.current
				
				return SubmitVoiceReportFunction(p2, {
					sortedPlayerListUserIds = Current.sortedPlayerListUserIds,
					channelId = Current.channelId,
					voiceUserCount = Current.voiceUserCount,
					voiceImpactedUserCount = ComputeImpactedUserCountModule(p1.voiceChatServiceManager, p2.data.targetIdStr),
					menuOpenedUnixMilli = p1.menuOpenTimeRef.current
				})
			elseif p2.endpoint ~= "chat" then
				return if p2.endpoint == "avatar" then SubmitAvatarReportFunction(p2, p1.reportAnythingSnapshotRef and p1.reportAnythingSnapshotRef.current) elseif p2.endpoint == "place" then SubmitPlaceReportFunction(p2, p1.reportAnythingSnapshotRef and p1.reportAnythingSnapshotRef.current) else PromiseModule.reject("Unknown in-experience submission endpoint: " .. tostring(p2.endpoint))
			else
				local InExpChatMessagesLoader = p1.inExpChatMessagesLoader
				
				if InExpChatMessagesLoader then
					local TextChatMessageId = p2.data.custom and p2.data.custom.textChatMessageId
					
					return if TextChatMessageId == "__MSG_NOT_SHOWN_ID" then SubmitChatReportWithoutMessageFunction(p2) else InExpChatMessagesLoader.fetch({}):andThen(function(Result)
						-- upvalues: TextChatMessageId (copy), SubmitChatReportFunction (upval), p2 (copy)
						local EligibleMessages = {}
						local TargetMessages = {}
						local Iterator = ipairs
						local Result1 = Result or {}
						for _, value in Iterator(Result1) do
							local Iterator1 = ipairs
							local Items = value.items or {}
							for _, value1 in Iterator1(Items) do
								table.insert(EligibleMessages, { channel = value1.meta.textChannel, messageId = value1.id })
								
								if value1.id == TextChatMessageId then
									table.insert(TargetMessages, {
										channel = value1.meta.textChannel,
										messageId = value1.id,
										presetId = value1.meta.presetId,
										presetChatVersion = value1.meta.presetChatVersion
									})
								end
							end
						end
						return SubmitChatReportFunction(p2, {
							eligibleMessages = EligibleMessages,
							targetMessages = TargetMessages
						})
					end)
				else
					return PromiseModule.reject("inExpChatMessagesLoader is required for chat reports")
				end
			end
		end, {
			p1.voiceChatServiceManager,
			p1.inExpChatMessagesLoader,
			p1.menuOpenTimeRef,
			p1.reportAnythingSnapshotRef
		})
	end
}