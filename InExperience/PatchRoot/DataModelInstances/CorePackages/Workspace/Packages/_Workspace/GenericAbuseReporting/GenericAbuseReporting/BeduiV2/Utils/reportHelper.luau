local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local PromiseModule = require(Parent.Promise)
local FFlagEnableChatReportingTextChannelTag = require(Parent.SharedFlags).FFlagEnableChatReportingTextChannelTag
local _ = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local FFlagAbuseReportForwardCustomTagFieldsModule = require(GenericAbuseReporting.Flags.FFlagAbuseReportForwardCustomTagFields)
local AppendReportAnythingTagsFunction = require(GenericAbuseReporting.BeduiV2.Utils.appendReportAnythingTags).appendReportAnythingTags

local function tag(AbuseVector)
	return if AbuseVector then { valueList = { { data = AbuseVector } } } else nil
end

local function _(Text: string): boolean
	return typeof(Text) == "string" and string.match(Text, "^[A-Z_][A-Z0-9_]*$") ~= nil
end

local function appendCustomTagFields(Tags, p1)
	-- upvalues: tag (copy)
	local Custom = p1.data.custom
	
	if not Custom then return end
	for i, value in pairs(Custom) do
		if typeof(i) == "string" and string.match(i, "^[A-Z_][A-Z0-9_]*$") ~= nil then
			local ValueType = typeof(value)
			
			if ValueType == "string" or ValueType == "number" or ValueType == "boolean" then
				Tags[i] = tag((tostring(value)))
			end
		end
	end
end

local function buildVoiceReport(p2, p3)
	-- upvalues: Players (copy), tag (copy), FFlagAbuseReportForwardCustomTagFieldsModule (copy), appendCustomTagFields (copy), HttpService (copy)
	local ValueList = {}
	
	if p3 then
		for _, sortedPlayerListUserId in ipairs(p3.sortedPlayerListUserIds) do
			table.insert(ValueList, { data = tostring(sortedPlayerListUserId) })
		end
	end
	local LocalPlayer = Players.LocalPlayer
	local Tags = {
		ENTRY_POINT = tag("in-experience"),
		SUBMITTER_USER_ID = tag((tostring(LocalPlayer and LocalPlayer.UserId or 0))),
		REPORT_TARGET_USER_ID = tag(p2.data.targetIdStr),
		REPORTED_ABUSE_CATEGORY = tag(p2.data.category),
		REPORTER_COMMENT = tag(p2.data.comment or ""),
		IS_PLACE_VOICE_ENABLED = tag("true"),
		VOICE_USER_IDS_FROM_CLIENT = { valueList = ValueList },
		IN_EXP_MENU_OPENED_UNIX_MILLI = tag((tostring(p3 and p3.menuOpenedUnixMilli or 0))),
		VOICE_CHANNEL_ID = tag(p3 and p3.channelId or ""),
		VOICE_USER_COUNT = tag((tostring(p3 and p3.voiceUserCount or 0))),
		VOICE_IMPACTED_USER_COUNT = tag((tostring(p3 and p3.voiceImpactedUserCount or 0))),
		REPORTED_ABUSE_VECTOR = tag(p2.data.abuseVector)
	}
	
	if FFlagAbuseReportForwardCustomTagFieldsModule then
		appendCustomTagFields(Tags, p2)
	end
	return HttpService:JSONEncode({ tags = Tags })
end

local function buildChatReport(p4, p5)
	-- upvalues: Players (copy), tag (copy), FFlagEnableChatReportingTextChannelTag (copy), FFlagAbuseReportForwardCustomTagFieldsModule (copy), appendCustomTagFields (copy)
	local LocalPlayer = Players.LocalPlayer
	local config = {
		tags = {
			ENTRY_POINT = tag("in-experience"),
			SUBMITTER_USER_ID = tag((tostring(LocalPlayer and LocalPlayer.UserId or 0))),
			REPORT_TARGET_USER_ID = tag(p4.data.targetIdStr),
			REPORTED_ABUSE_CATEGORY = tag(p4.data.category),
			REPORTER_COMMENT = tag(p4.data.comment or ""),
			REPORTED_ABUSE_VECTOR = tag(p4.data.abuseVector),
			REPORT_TARGET_MESSAGE_ID = tag(p5.targetMessages and p5.targetMessages[1] and p5.targetMessages[1].messageId or ""),
			PRESET_ID = tag(p5.targetMessages and p5.targetMessages[1] and p5.targetMessages[1].presetId or nil),
			PRESET_CHAT_VERSION = tag(p5.targetMessages and p5.targetMessages[1] and p5.targetMessages[1].presetChatVersion or nil),
			VARIANT = tag("IGM_CLRv2")
		}
	}
	
	if FFlagEnableChatReportingTextChannelTag then
		local Channel = p5.targetMessages and (p5.targetMessages[1] and p5.targetMessages[1].channel)
		config.tags.IN_GAME_CHAT_TEXT_CHANNEL = tag(if Channel then Channel.Name else "RBXGlobal")
	end
	if FFlagAbuseReportForwardCustomTagFieldsModule then
		appendCustomTagFields(config.tags, p4)
	end
	return config
end

local function buildAvatarReport(p4, p5)
	-- upvalues: Players (copy), tag (copy), AppendReportAnythingTagsFunction (copy), FFlagAbuseReportForwardCustomTagFieldsModule (copy), appendCustomTagFields (copy)
	local LocalPlayer = Players.LocalPlayer
	local Tags = {
		ENTRY_POINT = tag("in-experience"),
		SUBMITTER_USER_ID = tag((tostring(LocalPlayer and LocalPlayer.UserId or 0))),
		REPORT_TARGET_USER_ID = tag(p4.data.targetIdStr),
		REPORTED_ABUSE_CATEGORY = tag(p4.data.category),
		REPORTER_COMMENT = tag(p4.data.comment or ""),
		REPORTED_ABUSE_VECTOR = tag(p4.data.abuseVector)
	}
	AppendReportAnythingTagsFunction(Tags, p5)
	
	if FFlagAbuseReportForwardCustomTagFieldsModule then
		appendCustomTagFields(Tags, p4)
	end
	return { tags = Tags }
end

local function buildPlaceReport(p4, p5)
	-- upvalues: Players (copy), tag (copy), AppendReportAnythingTagsFunction (copy), FFlagAbuseReportForwardCustomTagFieldsModule (copy), appendCustomTagFields (copy), HttpService (copy)
	local LocalPlayer = Players.LocalPlayer
	local Tags = {
		ENTRY_POINT = tag("in-experience"),
		SUBMITTER_USER_ID = tag((tostring(LocalPlayer and LocalPlayer.UserId or 0))),
		PLACE_ID = tag((tostring(game.PlaceId))),
		REPORTED_ABUSE_CATEGORY = tag(p4.data.category),
		REPORTER_COMMENT = tag(p4.data.comment or ""),
		REPORTED_ABUSE_VECTOR = tag(p4.data.abuseVector)
	}
	AppendReportAnythingTagsFunction(Tags, p5)
	
	if FFlagAbuseReportForwardCustomTagFieldsModule then
		appendCustomTagFields(Tags, p4)
	end
	return HttpService:JSONEncode({ tags = Tags })
end

return {
	submitVoiceReport = function(p4, p5)
		-- upvalues: buildVoiceReport (copy), PromiseModule (copy), Players (copy)
		local VoiceReport = buildVoiceReport(p4, p5)
		
		return PromiseModule.try(function()
			-- upvalues: Players (upval), VoiceReport (copy)
			Players:ReportAbuseV3(Players.LocalPlayer, VoiceReport)
			
			return { responseBody = {} }
		end)
	end,
	submitChatReport = function(p4, p5)
		-- upvalues: buildChatReport (copy), PromiseModule (copy), Players (copy)
		local ChatReport = buildChatReport(p4, p5)
		
		return PromiseModule.try(function()
			-- upvalues: Players (upval), p5 (copy), ChatReport (copy)
			Players:ReportChatAbuse(p5.eligibleMessages, p5.targetMessages, ChatReport)
			
			return { responseBody = {} }
		end)
	end,
	submitChatReportWithoutMessage = function(p4)
		-- upvalues: PromiseModule (copy), Players (copy)
		return PromiseModule.try(function()
			-- upvalues: p4 (copy), Players (upval)
			local Number: number? = tonumber(p4.data.targetIdStr)
			Players:ReportAbuse(Number and Players:GetPlayerByUserId(Number), p4.data.category, p4.data.comment or "")
			
			return { responseBody = {} }
		end)
	end,
	submitAvatarReport = function(p4, p5)
		-- upvalues: buildAvatarReport (copy), PromiseModule (copy), Players (copy)
		local AvatarReport = buildAvatarReport(p4, p5)
		
		return PromiseModule.try(function()
			-- upvalues: Players (upval), p4 (copy), AvatarReport (copy)
			Players:ReportAvatarAbuse(tonumber(p4.data.targetIdStr), AvatarReport)
			
			return { responseBody = {} }
		end)
	end,
	submitPlaceReport = function(p4, p5)
		-- upvalues: buildPlaceReport (copy), PromiseModule (copy), Players (copy)
		local PlaceReport = buildPlaceReport(p4, p5)
		
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