local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local promiseModule = require(parent.Promise)
local reactModule = require(parent.React)
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local computeImpactedUserCountModule = require(genericAbuseReporting.BeduiV2.Utils.computeImpactedUserCount)
local _ = require(genericAbuseReporting.BeduiV2.Loaders.LoaderContext)
local reportHelperModule = require(genericAbuseReporting.BeduiV2.Utils.reportHelper)
local useVoiceSnapshot = require(genericAbuseReporting.BeduiV2.Hooks.Enrichment.useVoiceSnapshot).useVoiceSnapshot
local _ = require(genericAbuseReporting.BeduiV2.Utils.appendReportAnythingTags)
local submitVoiceReport = reportHelperModule.submitVoiceReport
local submitChatReport = reportHelperModule.submitChatReport
local submitChatReportWithoutMessage = reportHelperModule.submitChatReportWithoutMessage
local submitAvatarReport = reportHelperModule.submitAvatarReport
local submitPlaceReport = reportHelperModule.submitPlaceReport

return {
	REPORT_MESSAGE_NOT_SHOWN_ITEM_ID = "__MSG_NOT_SHOWN_ID",
	useInExpCustomSubmit = function(p0) --[[ line: 41 ]]
		-- upvalues: useVoiceSnapshot (ref), reactModule (ref), computeImpactedUserCountModule (ref), submitVoiceReport (ref), promiseModule (ref), submitChatReportWithoutMessage (ref), submitChatReport (ref), submitAvatarReport (ref), submitPlaceReport (ref)
		local var5 = useVoiceSnapshot(p0.voiceChatServiceManager)
		
		return reactModule.useCallback(function(p1) --[[ line: 45 ]]
			-- upvalues: var5 (ref), computeImpactedUserCountModule (copy), p0 (ref), submitVoiceReport (copy), promiseModule (copy), submitChatReportWithoutMessage (copy), submitChatReport (copy), submitAvatarReport (copy), submitPlaceReport (copy)
			if not p1.endpoint then
				error("SubmissionConfig must have an endpoint")
			end
			if p1.endpoint == "voice" then
				local current = var5.current
				
				return submitVoiceReport(p1, {
					sortedPlayerListUserIds = current.sortedPlayerListUserIds,
					channelId = current.channelId,
					voiceUserCount = current.voiceUserCount,
					voiceImpactedUserCount = computeImpactedUserCountModule(p0.voiceChatServiceManager, p1.data.targetIdStr),
					menuOpenedUnixMilli = p0.menuOpenTimeRef.current
				})
			elseif p1.endpoint == "chat" then
				local inExpChatMessagesLoader = p0.inExpChatMessagesLoader
				
				if not inExpChatMessagesLoader then
					return promiseModule.reject("inExpChatMessagesLoader is required for chat reports")
				end
				local textChatMessageId = p1.data.custom and p1.data.custom.textChatMessageId
				
				return if textChatMessageId == "__MSG_NOT_SHOWN_ID" then submitChatReportWithoutMessage(p1) else inExpChatMessagesLoader.fetch({}):andThen(function(p2) --[[ line: 91 ]]
					-- upvalues: textChatMessageId (ref), submitChatReport (copy), p1 (ref)
					local t = {}
					local t_1 = {}
					
					for i, v in ipairs(p2 or {}) do
						for i_1, v_1 in ipairs(v.items or {}) do
							table.insert(t, { channel = v_1.meta.textChannel, messageId = v_1.id })
							
							if v_1.id == textChatMessageId then
								table.insert(t_1, {
									channel = v_1.meta.textChannel,
									messageId = v_1.id,
									presetId = v_1.meta.presetId,
									presetChatVersion = v_1.meta.presetChatVersion
								})
							end
						end
					end
					return submitChatReport(p1, { eligibleMessages = t, targetMessages = t_1 })
				end)
			else
				return if p1.endpoint == "avatar" then submitAvatarReport(p1, p0.reportAnythingSnapshotRef and p0.reportAnythingSnapshotRef.current) elseif p1.endpoint == "place" then submitPlaceReport(p1, p0.reportAnythingSnapshotRef and p0.reportAnythingSnapshotRef.current) else promiseModule.reject("Unknown in-experience submission endpoint: " .. tostring(p1.endpoint))
			end
		end, {
			p0.voiceChatServiceManager,
			p0.inExpChatMessagesLoader,
			p0.menuOpenTimeRef,
			p0.reportAnythingSnapshotRef
		})
	end
}