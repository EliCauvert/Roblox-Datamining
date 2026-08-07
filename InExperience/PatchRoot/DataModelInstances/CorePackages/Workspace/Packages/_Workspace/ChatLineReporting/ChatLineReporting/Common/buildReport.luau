local chatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local parent = chatLineReporting.Parent
local fFlagExpChatPresetChatEnabled = require(parent.ExpChatShared).Flags.FFlagExpChatPresetChatEnabled
local fFlagChatLineReportingMessageIdEnabledModule = require(chatLineReporting.Flags.FFlagChatLineReportingMessageIdEnabled)
local fFlagEnableChatReportingTextChannelTag = require(parent.SharedFlags).FFlagEnableChatReportingTextChannelTag
local t = { Variant = { CLRv1 = "CLRv1" } }

function buildReport(p0, p1, p2, p3, p4, p5, p6, p7) --[[ line: 14 ]]
	-- upvalues: t (ref), fFlagChatLineReportingMessageIdEnabledModule (ref), fFlagExpChatPresetChatEnabled (ref), fFlagEnableChatReportingTextChannelTag (ref)
	local t_1 = {
		tags = {
			ENTRY_POINT = { valueList = { { data = "in-experience" } } },
			SUBMITTER_USER_ID = { valueList = { { data = tostring(p0) } } },
			REPORTED_ABUSE_CATEGORY = { valueList = { { data = p2 } } },
			REPORTER_COMMENT = { valueList = { { data = p3 } } },
			REPORTED_ABUSE_VECTOR = { valueList = { { data = "chat" } } },
			REPORT_TARGET_USER_ID = { valueList = { { data = p1 } } },
			VARIANT = { valueList = { { data = t.Variant.CLRv1 } } }
		}
	}
	
	if fFlagChatLineReportingMessageIdEnabledModule and p4 then
		t_1.tags.REPORT_TARGET_MESSAGE_ID = { valueList = { { data = p4 } } }
	end
	if fFlagExpChatPresetChatEnabled and p5 and p5 ~= "" then
		t_1.tags.REPORT_TARGET_PRESET_ID = { valueList = { { data = p5 } } }
		
		if p6 and p6 ~= "" then
			t_1.tags.REPORT_TARGET_PRESET_VERSION = { valueList = { { data = p6 } } }
		end
	end
	if fFlagEnableChatReportingTextChannelTag then
		t_1.tags.IN_GAME_CHAT_TEXT_CHANNEL = { valueList = { { data = p7 or "RBXGlobal" } } }
	end
	return t_1
end

return buildReport