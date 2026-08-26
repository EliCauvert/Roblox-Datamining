local parent = script:FindFirstAncestor("ChatLineReporting").Parent
local fFlagExpChatPresetChatEnabled = require(parent.ExpChatShared).Flags.FFlagExpChatPresetChatEnabled
local fFlagEnableChatReportingTextChannelTag = require(parent.SharedFlags).FFlagEnableChatReportingTextChannelTag
local t = { Variant = { CLRv1 = "CLRv1" } }

function buildReport(p1, p2, p3, p4, p5, p6, p7, p8)
	-- upvalues: t (ref), fFlagExpChatPresetChatEnabled (ref), fFlagEnableChatReportingTextChannelTag (ref)
	local t_1 = {
		tags = {
			ENTRY_POINT = { valueList = { { data = "in-experience" } } },
			SUBMITTER_USER_ID = { valueList = { { data = tostring(p1) } } },
			REPORTED_ABUSE_CATEGORY = { valueList = { { data = p3 } } },
			REPORTER_COMMENT = { valueList = { { data = p4 } } },
			REPORTED_ABUSE_VECTOR = { valueList = { { data = "chat" } } },
			REPORT_TARGET_USER_ID = { valueList = { { data = p2 } } },
			VARIANT = { valueList = { { data = t.Variant.CLRv1 } } }
		}
	}
	
	if p5 then
		t_1.tags.REPORT_TARGET_MESSAGE_ID = { valueList = { { data = p5 } } }
	end
	if fFlagExpChatPresetChatEnabled and p6 and p6 ~= "" then
		t_1.tags.REPORT_TARGET_PRESET_ID = { valueList = { { data = p6 } } }
		
		if p7 and p7 ~= "" then
			t_1.tags.REPORT_TARGET_PRESET_VERSION = { valueList = { { data = p7 } } }
		end
	end
	if fFlagEnableChatReportingTextChannelTag then
		t_1.tags.IN_GAME_CHAT_TEXT_CHANNEL = { valueList = { { data = p8 or "RBXGlobal" } } }
	end
	return t_1
end

return buildReport