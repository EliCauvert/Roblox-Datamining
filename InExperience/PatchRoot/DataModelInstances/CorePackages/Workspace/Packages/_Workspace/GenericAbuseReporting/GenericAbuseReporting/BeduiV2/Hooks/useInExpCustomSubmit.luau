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
	useInExpCustomSubmit = function(p1)
		-- upvalues: useVoiceSnapshot (ref), reactModule (ref), computeImpactedUserCountModule (ref), submitVoiceReport (ref), promiseModule (ref), submitChatReportWithoutMessage (ref), submitChatReport (ref), submitAvatarReport (ref), submitPlaceReport (ref)
		local var1 = useVoiceSnapshot(p1.voiceChatServiceManager)
		
		return reactModule.useCallback(function(p2)
			-- upvalues: var1 (ref), computeImpactedUserCountModule (copy), p1 (ref), submitVoiceReport (copy), promiseModule (copy), submitChatReportWithoutMessage (copy), submitChatReport (copy), submitAvatarReport (copy), submitPlaceReport (copy)
			if not p2.endpoint then
				error("SubmissionConfig must have an endpoint")
			end
			if p2.endpoint == "voice" then
				local current = var1.current
				
				return submitVoiceReport(p2, {
					sortedPlayerListUserIds = current.sortedPlayerListUserIds,
					channelId = current.channelId,
					voiceUserCount = current.voiceUserCount,
					voiceImpactedUserCount = computeImpactedUserCountModule(p1.voiceChatServiceManager, p2.data.targetIdStr),
					menuOpenedUnixMilli = p1.menuOpenTimeRef.current
				})
			elseif p2.endpoint == "chat" then
				local inExpChatMessagesLoader = p1.inExpChatMessagesLoader
				
				if not inExpChatMessagesLoader then
					return promiseModule.reject("inExpChatMessagesLoader is required for chat reports")
				end
				local textChatMessageId = p2.data.custom and p2.data.custom.textChatMessageId
				
				return if textChatMessageId == "__MSG_NOT_SHOWN_ID" then submitChatReportWithoutMessage(p2) else inExpChatMessagesLoader.fetch({}):andThen(function(p3)
					-- upvalues: textChatMessageId (ref), submitChatReport (copy), p2 (ref)
					local t = {}
					local t_1 = {}
					
					for i, v in ipairs(p3 or {}) do
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
					return submitChatReport(p2, { eligibleMessages = t, targetMessages = t_1 })
				end)
			else
				return if p2.endpoint == "avatar" then submitAvatarReport(p2, p1.reportAnythingSnapshotRef and p1.reportAnythingSnapshotRef.current) elseif p2.endpoint == "place" then submitPlaceReport(p2, p1.reportAnythingSnapshotRef and p1.reportAnythingSnapshotRef.current) else promiseModule.reject("Unknown in-experience submission endpoint: " .. tostring(p2.endpoint))
			end
		end, {
			p1.voiceChatServiceManager,
			p1.inExpChatMessagesLoader,
			p1.menuOpenTimeRef,
			p1.reportAnythingSnapshotRef
		})
	end,
	useInExpClientActionHandlers = function(p3)
		-- upvalues: useVoiceSnapshot (ref), reactModule (ref), computeImpactedUserCountModule (ref), submitVoiceReport (ref), promiseModule (ref), submitChatReportWithoutMessage (ref), submitChatReport (ref), submitAvatarReport (ref), submitPlaceReport (ref)
		local var2 = useVoiceSnapshot(p3.voiceChatServiceManager)
		local var3 = reactModule.useCallback(function(p4)
			-- upvalues: var2 (ref), computeImpactedUserCountModule (copy), p3 (ref), submitVoiceReport (copy)
			local current = var2.current
			
			return submitVoiceReport(p4, {
				sortedPlayerListUserIds = current.sortedPlayerListUserIds,
				channelId = current.channelId,
				voiceUserCount = current.voiceUserCount,
				voiceImpactedUserCount = computeImpactedUserCountModule(p3.voiceChatServiceManager, p4.data.targetIdStr),
				menuOpenedUnixMilli = p3.menuOpenTimeRef.current
			})
		end, { p3.voiceChatServiceManager, p3.menuOpenTimeRef })
		local var4 = reactModule.useCallback(function(p4)
			-- upvalues: p3 (ref), promiseModule (copy), submitChatReportWithoutMessage (copy), submitChatReport (copy)
			local inExpChatMessagesLoader = p3.inExpChatMessagesLoader
			
			if not inExpChatMessagesLoader then
				return promiseModule.reject("inExpChatMessagesLoader is required for chat reports")
			end
			local textChatMessageId = p4.data.custom and p4.data.custom.textChatMessageId
			
			return if textChatMessageId == "__MSG_NOT_SHOWN_ID" then submitChatReportWithoutMessage(p4) else inExpChatMessagesLoader.fetch({}):andThen(function(p5)
				-- upvalues: textChatMessageId (ref), submitChatReport (copy), p4 (ref)
				local t = {}
				local t_1 = {}
				
				for i, v in ipairs(p5 or {}) do
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
				return submitChatReport(p4, { eligibleMessages = t, targetMessages = t_1 })
			end)
		end, { p3.inExpChatMessagesLoader })
		local var5 = reactModule.useCallback(function(p6)
			-- upvalues: submitAvatarReport (copy), p3 (ref)
			return submitAvatarReport(p6, p3.reportAnythingSnapshotRef and p3.reportAnythingSnapshotRef.current)
		end, { p3.reportAnythingSnapshotRef })
		local var6 = reactModule.useCallback(function(p6)
			-- upvalues: submitPlaceReport (copy), p3 (ref)
			return submitPlaceReport(p6, p3.reportAnythingSnapshotRef and p3.reportAnythingSnapshotRef.current)
		end, { p3.reportAnythingSnapshotRef })
		
		return reactModule.useMemo(function()
			-- upvalues: var3 (ref), var4 (ref), var5 (ref), var6 (ref)
			return {
				voice = var3,
				chat = var4,
				avatar = var5,
				place = var6
			}
		end, { var3, var4, var5, var6 })
	end
}