local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local fFlagExpChatPresetChatEnabled = require(corePackagesService.Workspace.Packages.ExpChatShared).Flags.FFlagExpChatPresetChatEnabled
local isSystemMessage = require(corePackagesService.Workspace.Packages.ChatLineReporting).Helpers.isSystemMessage
local fFlagEnableGlobalChatAbuseReporting = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableGlobalChatAbuseReporting
local constantsModule = require(abuseReportMenu.Components.Constants)
local _ = require(abuseReportMenu.Components.Types)

local function buildReportTags(p0, p1, p2, p3, p4, p5, p6) --[[ line: 17 ]]
	-- upvalues: constantsModule (ref), fFlagExpChatPresetChatEnabled (ref)
	local t = {
		tags = {
			ENTRY_POINT = { valueList = { { data = "in-experience" } } },
			SUBMITTER_USER_ID = { valueList = { { data = tostring(p0) } } },
			REPORTED_ABUSE_CATEGORY = { valueList = { { data = p2 } } },
			REPORTER_COMMENT = { valueList = { { data = p3 } } },
			REPORTED_ABUSE_VECTOR = { valueList = { { data = "chat" } } },
			REPORT_TARGET_USER_ID = { valueList = { { data = p1 } } },
			VARIANT = {
				valueList = {
					{
						data = constantsModule.ChatLineReportingVariant.IGM_CLRv1
					}
				}
			}
		}
	}
	
	if p4 then
		t.tags.REPORT_TARGET_MESSAGE_ID = { valueList = { { data = p4 } } }
	end
	if fFlagExpChatPresetChatEnabled and p5 and p5 ~= "" then
		t.tags.REPORT_TARGET_PRESET_ID = { valueList = { { data = p5 } } }
		
		if p6 and p6 ~= "" then
			t.tags.REPORT_TARGET_PRESET_VERSION = { valueList = { { data = p6 } } }
		end
	end
	return t
end

return function(p7) --[[ line: 106 ]]
	-- upvalues: buildReportTags (ref), fFlagEnableGlobalChatAbuseReporting (ref), isSystemMessage (ref), playersService (ref)
	local var6 = buildReportTags(p7.localPlayerUserId, p7.reportTargetUser, p7.abuseReason, p7.abuseDescription, p7.selectedMessage.messageId, p7.selectedMessage.presetId, p7.selectedMessage.presetChatVersion)
	local t = {}
	
	for i, v in ipairs(p7.orderedMessages) do
		if v.userId ~= nil and (if v.textChannel == nil then fFlagEnableGlobalChatAbuseReporting else true) then
			local t_1 = { channel = v.textChannel, messageId = v.messageId }
			
			if not isSystemMessage({ userId = v.userId, textChannel = v.textChannel }) then
				table.insert(t, t_1)
			end
		end
	end
	local list = {
		{
			channel = p7.selectedMessage.textChannel,
			messageId = p7.selectedMessage.messageId
		}
	}
	task.defer(function() --[[ line: 144 ]]
		-- upvalues: playersService (copy), t (ref), list (ref), var6 (ref)
		playersService:ReportChatAbuse(t, list, var6)
	end)
end