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
	useInExpCustomSubmit = function(p1) --[[ Line: 42 ]]
		-- upvalues: UseVoiceSnapshotFunction (copy), ReactModule (copy), ComputeImpactedUserCountModule (copy), SubmitVoiceReportFunction (copy), PromiseModule (copy), SubmitChatReportWithoutMessageFunction (copy), SubmitChatReportFunction (copy), SubmitAvatarReportFunction (copy), SubmitPlaceReportFunction (copy)
		local UseVoiceSnapshotResult = UseVoiceSnapshotFunction(p1.voiceChatServiceManager)
		
		return ReactModule.useCallback(function(p2) --[[ Line: 46 ]]
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
					
					return if TextChatMessageId == "__MSG_NOT_SHOWN_ID" then SubmitChatReportWithoutMessageFunction(p2) else InExpChatMessagesLoader.fetch({}):andThen(function(Result) --[[ Line: 92 ]]
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
	end,
	useInExpClientActionHandlers = function(p3) --[[ Line: 141 ]]
		-- upvalues: UseVoiceSnapshotFunction (copy), ReactModule (copy), ComputeImpactedUserCountModule (copy), SubmitVoiceReportFunction (copy), PromiseModule (copy), SubmitChatReportWithoutMessageFunction (copy), SubmitChatReportFunction (copy), SubmitAvatarReportFunction (copy), SubmitPlaceReportFunction (copy)
		local UseVoiceSnapshotResult = UseVoiceSnapshotFunction(p3.voiceChatServiceManager)
		local UseResult = ReactModule.useCallback(function(p4) --[[ Line: 145 ]]
			-- upvalues: UseVoiceSnapshotResult (copy), ComputeImpactedUserCountModule (upval), p3 (copy), SubmitVoiceReportFunction (upval)
			local Current = UseVoiceSnapshotResult.current
			
			return SubmitVoiceReportFunction(p4, {
				sortedPlayerListUserIds = Current.sortedPlayerListUserIds,
				channelId = Current.channelId,
				voiceUserCount = Current.voiceUserCount,
				voiceImpactedUserCount = ComputeImpactedUserCountModule(p3.voiceChatServiceManager, p4.data.targetIdStr),
				menuOpenedUnixMilli = p3.menuOpenTimeRef.current
			})
		end, { p3.voiceChatServiceManager, p3.menuOpenTimeRef })
		local UseResult1 = ReactModule.useCallback(function(p4) --[[ Line: 165 ]]
			-- upvalues: p3 (copy), PromiseModule (upval), SubmitChatReportWithoutMessageFunction (upval), SubmitChatReportFunction (upval)
			local InExpChatMessagesLoader = p3.inExpChatMessagesLoader
			
			if InExpChatMessagesLoader then
				local TextChatMessageId = p4.data.custom and p4.data.custom.textChatMessageId
				
				return if TextChatMessageId == "__MSG_NOT_SHOWN_ID" then SubmitChatReportWithoutMessageFunction(p4) else InExpChatMessagesLoader.fetch({}):andThen(function(Result) --[[ Line: 180 ]]
					-- upvalues: TextChatMessageId (copy), SubmitChatReportFunction (upval), p4 (copy)
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
					return SubmitChatReportFunction(p4, {
						eligibleMessages = EligibleMessages,
						targetMessages = TargetMessages
					})
				end)
			else
				return PromiseModule.reject("inExpChatMessagesLoader is required for chat reports")
			end
		end, { p3.inExpChatMessagesLoader })
		local UseResult2 = ReactModule.useCallback(function(p5) --[[ Line: 204 ]]
			-- upvalues: SubmitAvatarReportFunction (upval), p3 (copy)
			return SubmitAvatarReportFunction(p5, p3.reportAnythingSnapshotRef and p3.reportAnythingSnapshotRef.current)
		end, { p3.reportAnythingSnapshotRef })
		local UseResult3 = ReactModule.useCallback(function(p5) --[[ Line: 211 ]]
			-- upvalues: SubmitPlaceReportFunction (upval), p3 (copy)
			return SubmitPlaceReportFunction(p5, p3.reportAnythingSnapshotRef and p3.reportAnythingSnapshotRef.current)
		end, { p3.reportAnythingSnapshotRef })
		local UseResult4 = ReactModule.useCallback(function(p5) --[[ Line: 218 ]]
			-- upvalues: SubmitChatReportWithoutMessageFunction (upval)
			return SubmitChatReportWithoutMessageFunction(p5)
		end, {})
		
		return (ReactModule.useMemo(function() --[[ Line: 222 ]]
			-- upvalues: UseResult (copy), UseResult1 (copy), UseResult2 (copy), UseResult3 (copy), UseResult4 (copy)
			return {
				voice = UseResult,
				chat = UseResult1,
				avatar = UseResult2,
				place = UseResult3,
				legacyChat = UseResult4
			}
		end, {
			UseResult,
			UseResult1,
			UseResult2,
			UseResult3,
			UseResult4
		}))
	end
}