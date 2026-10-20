local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local PromiseModule = require(GenericAbuseReporting.Parent.Promise)
local _ = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local AppendReportAnythingTagsFunction = require(GenericAbuseReporting.BeduiV2.Utils.appendReportAnythingTags).appendReportAnythingTags

local function tag(AbuseVector)
	return if AbuseVector then { valueList = { { data = AbuseVector } } } else nil
end

local function buildVoiceReport(p1, p2)
	-- upvalues: Players (copy), HttpService (copy), tag (copy)
	local ValueList = {}
	
	if p2 then
		for _, sortedPlayerListUserId in ipairs(p2.sortedPlayerListUserIds) do
			table.insert(ValueList, { data = tostring(sortedPlayerListUserId) })
		end
	end
	local LocalPlayer = Players.LocalPlayer
	
	return HttpService:JSONEncode({
		tags = {
			ENTRY_POINT = tag("in-experience"),
			SUBMITTER_USER_ID = tag((tostring(LocalPlayer and LocalPlayer.UserId or 0))),
			REPORT_TARGET_USER_ID = tag(p1.data.targetIdStr),
			REPORTED_ABUSE_CATEGORY = tag(p1.data.category),
			REPORTER_COMMENT = tag(p1.data.comment or ""),
			IS_PLACE_VOICE_ENABLED = tag("true"),
			VOICE_USER_IDS_FROM_CLIENT = { valueList = ValueList },
			IN_EXP_MENU_OPENED_UNIX_MILLI = tag((tostring(p2 and p2.menuOpenedUnixMilli or 0))),
			VOICE_CHANNEL_ID = tag(p2 and p2.channelId or ""),
			VOICE_USER_COUNT = tag((tostring(p2 and p2.voiceUserCount or 0))),
			VOICE_IMPACTED_USER_COUNT = tag((tostring(p2 and p2.voiceImpactedUserCount or 0))),
			REPORTED_ABUSE_VECTOR = tag(p1.data.abuseVector)
		}
	})
end

local function buildChatReport(p3, p4)
	-- upvalues: Players (copy), tag (copy)
	local LocalPlayer = Players.LocalPlayer
	
	return {
		tags = {
			ENTRY_POINT = tag("in-experience"),
			SUBMITTER_USER_ID = tag((tostring(LocalPlayer and LocalPlayer.UserId or 0))),
			REPORT_TARGET_USER_ID = tag(p3.data.targetIdStr),
			REPORTED_ABUSE_CATEGORY = tag(p3.data.category),
			REPORTER_COMMENT = tag(p3.data.comment or ""),
			REPORTED_ABUSE_VECTOR = tag(p3.data.abuseVector),
			REPORT_TARGET_MESSAGE_ID = tag(p4.targetMessages and p4.targetMessages[1] and p4.targetMessages[1].messageId or ""),
			PRESET_ID = tag(p4.targetMessages and p4.targetMessages[1] and p4.targetMessages[1].presetId or nil),
			PRESET_CHAT_VERSION = tag(p4.targetMessages and p4.targetMessages[1] and p4.targetMessages[1].presetChatVersion or nil),
			VARIANT = tag("IGM_CLRv2")
		}
	}
end

local function buildAvatarReport(p3, p4)
	-- upvalues: Players (copy), tag (copy), AppendReportAnythingTagsFunction (copy)
	local LocalPlayer = Players.LocalPlayer
	local Tags = {
		ENTRY_POINT = tag("in-experience"),
		SUBMITTER_USER_ID = tag((tostring(LocalPlayer and LocalPlayer.UserId or 0))),
		REPORT_TARGET_USER_ID = tag(p3.data.targetIdStr),
		REPORTED_ABUSE_CATEGORY = tag(p3.data.category),
		REPORTER_COMMENT = tag(p3.data.comment or ""),
		REPORTED_ABUSE_VECTOR = tag(p3.data.abuseVector)
	}
	AppendReportAnythingTagsFunction(Tags, p4)
	
	return { tags = Tags }
end

local function buildPlaceReport(p3, p4)
	-- upvalues: Players (copy), tag (copy), AppendReportAnythingTagsFunction (copy), HttpService (copy)
	local LocalPlayer = Players.LocalPlayer
	local Tags = {
		ENTRY_POINT = tag("in-experience"),
		SUBMITTER_USER_ID = tag((tostring(LocalPlayer and LocalPlayer.UserId or 0))),
		PLACE_ID = tag((tostring(game.PlaceId))),
		REPORTED_ABUSE_CATEGORY = tag(p3.data.category),
		REPORTER_COMMENT = tag(p3.data.comment or ""),
		REPORTED_ABUSE_VECTOR = tag(p3.data.abuseVector)
	}
	AppendReportAnythingTagsFunction(Tags, p4)
	
	return HttpService:JSONEncode({ tags = Tags })
end

return {
	submitVoiceReport = function(p3, p4)
		-- upvalues: buildVoiceReport (copy), PromiseModule (copy), Players (copy)
		local VoiceReport = buildVoiceReport(p3, p4)
		
		return PromiseModule.try(function()
			-- upvalues: Players (upval), VoiceReport (copy)
			Players:ReportAbuseV3(Players.LocalPlayer, VoiceReport)
			
			return { responseBody = {} }
		end)
	end,
	submitChatReport = function(p3, p4)
		-- upvalues: buildChatReport (copy), PromiseModule (copy), Players (copy)
		local ChatReport = buildChatReport(p3, p4)
		
		return PromiseModule.try(function()
			-- upvalues: Players (upval), p4 (copy), ChatReport (copy)
			Players:ReportChatAbuse(p4.eligibleMessages, p4.targetMessages, ChatReport)
			
			return { responseBody = {} }
		end)
	end,
	submitChatReportWithoutMessage = function(p3)
		-- upvalues: PromiseModule (copy), Players (copy)
		return PromiseModule.try(function()
			-- upvalues: p3 (copy), Players (upval)
			local Number: number? = tonumber(p3.data.targetIdStr)
			Players:ReportAbuse(Number and Players:GetPlayerByUserId(Number), p3.data.category, p3.data.comment or "")
			
			return { responseBody = {} }
		end)
	end,
	submitAvatarReport = function(p3, p4)
		-- upvalues: buildAvatarReport (copy), PromiseModule (copy), Players (copy)
		local AvatarReport = buildAvatarReport(p3, p4)
		
		return PromiseModule.try(function()
			-- upvalues: Players (upval), p3 (copy), AvatarReport (copy)
			Players:ReportAvatarAbuse(tonumber(p3.data.targetIdStr), AvatarReport)
			
			return { responseBody = {} }
		end)
	end,
	submitPlaceReport = function(p3, p4)
		-- upvalues: buildPlaceReport (copy), PromiseModule (copy), Players (copy)
		local PlaceReport = buildPlaceReport(p3, p4)
		
		return PromiseModule.try(function()
			-- upvalues: Players (upval), PlaceReport (copy)
			Players:ReportAbuseV3(Players.LocalPlayer, PlaceReport)
			
			return { responseBody = {} }
		end)
	end,
	buildVoiceReport = buildVoiceReport,
	buildChatReport = buildChatReport,
	buildAvatarReport = buildAvatarReport,
	buildPlaceReport = buildPlaceReport
}