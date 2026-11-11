local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local FFlagExpChatPresetChatEnabled = require(CorePackages.Workspace.Packages.ExpChatShared).Flags.FFlagExpChatPresetChatEnabled
local IsSystemMessageFunction = require(CorePackages.Workspace.Packages.ChatLineReporting).Helpers.isSystemMessage
local FFlagEnableGlobalChatAbuseReporting = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableGlobalChatAbuseReporting
local ConstantsModule = require(AbuseReportMenu.Components.Constants)
local _ = require(AbuseReportMenu.Components.Types)

local function buildReportTags(LocalPlayerUserId, Data, Data1, Data2, Data3, Data4, Data5)
	-- upvalues: ConstantsModule (copy), FFlagExpChatPresetChatEnabled (copy)
	local config = {
		tags = {
			ENTRY_POINT = { valueList = { { data = "in-experience" } } },
			SUBMITTER_USER_ID = { valueList = { { data = tostring(LocalPlayerUserId) } } },
			REPORTED_ABUSE_CATEGORY = { valueList = { { data = Data1 } } },
			REPORTER_COMMENT = { valueList = { { data = Data2 } } },
			REPORTED_ABUSE_VECTOR = { valueList = { { data = "chat" } } },
			REPORT_TARGET_USER_ID = { valueList = { { data = Data } } },
			VARIANT = {
				valueList = {
					{
						data = ConstantsModule.ChatLineReportingVariant.IGM_CLRv1
					}
				}
			}
		}
	}
	
	if Data3 then
		config.tags.REPORT_TARGET_MESSAGE_ID = { valueList = { { data = Data3 } } }
	end
	if FFlagExpChatPresetChatEnabled and Data4 and Data4 ~= "" then
		config.tags.REPORT_TARGET_PRESET_ID = { valueList = { { data = Data4 } } }
		
		if Data5 and Data5 ~= "" then
			config.tags.REPORT_TARGET_PRESET_VERSION = { valueList = { { data = Data5 } } }
		end
	end
	return config
end

return function(p1)
	-- upvalues: buildReportTags (copy), FFlagEnableGlobalChatAbuseReporting (copy), IsSystemMessageFunction (copy), Players (copy)
	local ReportTags = buildReportTags(p1.localPlayerUserId, p1.reportTargetUser, p1.abuseReason, p1.abuseDescription, p1.selectedMessage.messageId, p1.selectedMessage.presetId, p1.selectedMessage.presetChatVersion)
	local List = {}
	
	for _, orderedMessage in ipairs(p1.orderedMessages) do
		if orderedMessage.userId ~= nil and (orderedMessage.textChannel ~= nil or FFlagEnableGlobalChatAbuseReporting) then
			local config = {
				channel = orderedMessage.textChannel,
				messageId = orderedMessage.messageId
			}
			
			if not IsSystemMessageFunction({
				userId = orderedMessage.userId,
				textChannel = orderedMessage.textChannel
			}) then
				table.insert(List, config)
			end
		end
	end
	local TargetChatLines = {
		{
			channel = p1.selectedMessage.textChannel,
			messageId = p1.selectedMessage.messageId
		}
	}
	task.defer(function()
		-- upvalues: Players (upval), List (copy), TargetChatLines (copy), ReportTags (copy)
		Players:ReportChatAbuse(List, TargetChatLines, ReportTags)
	end)
end