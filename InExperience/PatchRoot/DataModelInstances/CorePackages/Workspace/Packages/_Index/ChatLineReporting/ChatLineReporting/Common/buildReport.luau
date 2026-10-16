local Parent = script:FindFirstAncestor("ChatLineReporting").Parent
local FFlagExpChatPresetChatEnabled = require(Parent.ExpChatShared).Flags.FFlagExpChatPresetChatEnabled
local FFlagEnableChatReportingTextChannelTag = require(Parent.SharedFlags).FFlagEnableChatReportingTextChannelTag
local ChangePresetTagName = game:DefineFastFlag("ChangePresetTagName", false)
local config = { Variant = { CLRv1 = "CLRv1" } }

function buildReport(p1, Data, Data1, Data2, Data3, Data4, Data5, p2) --[[ Line: 15 ]]
	-- upvalues: config (copy), FFlagExpChatPresetChatEnabled (copy), ChangePresetTagName (copy), FFlagEnableChatReportingTextChannelTag (copy)
	local config1 = {
		tags = {
			ENTRY_POINT = { valueList = { { data = "in-experience" } } },
			SUBMITTER_USER_ID = { valueList = { { data = tostring(p1) } } },
			REPORTED_ABUSE_CATEGORY = { valueList = { { data = Data1 } } },
			REPORTER_COMMENT = { valueList = { { data = Data2 } } },
			REPORTED_ABUSE_VECTOR = { valueList = { { data = "chat" } } },
			REPORT_TARGET_USER_ID = { valueList = { { data = Data } } },
			VARIANT = { valueList = { { data = config.Variant.CLRv1 } } }
		}
	}
	
	if Data3 then
		config1.tags.REPORT_TARGET_MESSAGE_ID = { valueList = { { data = Data3 } } }
	end
	if FFlagExpChatPresetChatEnabled and Data4 and Data4 ~= "" then
		if ChangePresetTagName then
			config1.tags.PRESET_ID = { valueList = { { data = Data4 } } }
		else
			config1.tags.REPORT_TARGET_PRESET_ID = { valueList = { { data = Data4 } } }
		end
		if Data5 and Data5 ~= "" then
			if ChangePresetTagName then
				config1.tags.PRESET_CHAT_VERSION = { valueList = { { data = Data5 } } }
			else
				config1.tags.REPORT_TARGET_PRESET_VERSION = { valueList = { { data = Data5 } } }
			end
		end
	end
	if FFlagEnableChatReportingTextChannelTag then
		config1.tags.IN_GAME_CHAT_TEXT_CHANNEL = { valueList = { { data = p2 or "RBXGlobal" } } }
	end
	return config1
end

return buildReport