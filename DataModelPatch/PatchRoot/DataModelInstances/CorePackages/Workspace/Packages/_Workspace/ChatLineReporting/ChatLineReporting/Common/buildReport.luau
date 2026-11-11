local ChatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local FFlagExpChatPresetChatEnabled = require(ChatLineReporting.Parent.ExpChatShared).Flags.FFlagExpChatPresetChatEnabled
local FFlagChatLineReportingMessageIdEnabledModule = require(ChatLineReporting.Flags.FFlagChatLineReportingMessageIdEnabled)
local config = { Variant = { CLRv1 = "CLRv1" } }

function buildReport(p1, Data, Data1, Data2, Data3, Data4, Data5)
	-- upvalues: config (copy), FFlagChatLineReportingMessageIdEnabledModule (copy), FFlagExpChatPresetChatEnabled (copy)
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
	
	if FFlagChatLineReportingMessageIdEnabledModule and Data3 then
		config1.tags.REPORT_TARGET_MESSAGE_ID = { valueList = { { data = Data3 } } }
	end
	if FFlagExpChatPresetChatEnabled and Data4 and Data4 ~= "" then
		config1.tags.REPORT_TARGET_PRESET_ID = { valueList = { { data = Data4 } } }
		
		if Data5 and Data5 ~= "" then
			config1.tags.REPORT_TARGET_PRESET_VERSION = { valueList = { { data = Data5 } } }
		end
	end
	return config1
end

return buildReport