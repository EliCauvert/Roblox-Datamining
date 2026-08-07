local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local promiseModule = require(parent.Promise)
local fFlagEnableChatReportingTextChannelTag = require(parent.SharedFlags).FFlagEnableChatReportingTextChannelTag
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local fFlagAbuseReportForwardCustomTagFieldsModule = require(genericAbuseReporting.Flags.FFlagAbuseReportForwardCustomTagFields)
local appendReportAnythingTags = require(genericAbuseReporting.BeduiV2.Utils.appendReportAnythingTags).appendReportAnythingTags

local function tag(p0) --[[ line: 49 ]]
	return if p0 then { valueList = { { data = p0 } } } else nil
end

local function _(p1) --[[ line: 56 | named "isAllCapsKey" ]]
	return typeof(p1) == "string" and string.match(p1, "^[A-Z_][A-Z0-9_]*$") ~= nil
end

local function appendCustomTagFields(p2, p3) --[[ line: 60 ]]
	-- upvalues: tag (ref)
	local custom = p3.data.custom
	
	if not custom then return end
	for i, v in pairs(custom) do
		if typeof(i) == "string" and string.match(i, "^[A-Z_][A-Z0-9_]*$") ~= nil then
			local var11 = typeof(v)
			
			if var11 == "string" or var11 == "number" or var11 == "boolean" then
				p2[i] = tag(tostring(v))
			end
		end
	end
end

local function buildVoiceReport(p4, p5) --[[ line: 77 ]]
	-- upvalues: playersService (ref), tag (ref), fFlagAbuseReportForwardCustomTagFieldsModule (ref), appendCustomTagFields (ref), httpService (ref)
	local t = {}
	
	if p5 then
		for i, v in ipairs(p5.sortedPlayerListUserIds) do
			table.insert(t, { data = tostring(v) })
		end
	end
	local localPlayer = playersService.LocalPlayer
	local t_1 = {
		ENTRY_POINT = tag("in-experience"),
		SUBMITTER_USER_ID = tag(tostring(if localPlayer then localPlayer.UserId else 0)),
		REPORT_TARGET_USER_ID = tag(p4.data.targetIdStr),
		REPORTED_ABUSE_CATEGORY = tag(p4.data.category),
		REPORTER_COMMENT = tag(p4.data.comment or ""),
		IS_PLACE_VOICE_ENABLED = tag("true"),
		VOICE_USER_IDS_FROM_CLIENT = { valueList = t },
		IN_EXP_MENU_OPENED_UNIX_MILLI = tag(tostring(if p5 then p5.menuOpenedUnixMilli else 0)),
		VOICE_CHANNEL_ID = tag(if p5 then p5.channelId else ""),
		VOICE_USER_COUNT = tag(tostring(if p5 then p5.voiceUserCount else 0)),
		VOICE_IMPACTED_USER_COUNT = tag(tostring(if p5 then p5.voiceImpactedUserCount else 0)),
		REPORTED_ABUSE_VECTOR = tag(p4.data.abuseVector)
	}
	
	if fFlagAbuseReportForwardCustomTagFieldsModule then
		appendCustomTagFields(t_1, p4)
	end
	return httpService:JSONEncode({ tags = t_1 })
end

local function buildChatReport(p6, p7) --[[ line: 108 ]]
	-- upvalues: playersService (ref), tag (ref), fFlagEnableChatReportingTextChannelTag (ref), fFlagAbuseReportForwardCustomTagFieldsModule (ref), appendCustomTagFields (ref)
	local localPlayer = playersService.LocalPlayer
	local t = {
		tags = {
			ENTRY_POINT = tag("in-experience"),
			SUBMITTER_USER_ID = tag(tostring(if localPlayer then localPlayer.UserId else 0)),
			REPORT_TARGET_USER_ID = tag(p6.data.targetIdStr),
			REPORTED_ABUSE_CATEGORY = tag(p6.data.category),
			REPORTER_COMMENT = tag(p6.data.comment or ""),
			REPORTED_ABUSE_VECTOR = tag(p6.data.abuseVector),
			REPORT_TARGET_MESSAGE_ID = tag(p7.targetMessages and (p7.targetMessages[1] and (p7.targetMessages[1].messageId or ""))),
			PRESET_ID = tag(p7.targetMessages and (p7.targetMessages[1] and (p7.targetMessages[1].presetId or nil))),
			PRESET_CHAT_VERSION = tag(p7.targetMessages and (p7.targetMessages[1] and (p7.targetMessages[1].presetChatVersion or nil))),
			VARIANT = tag("IGM_CLRv2")
		}
	}
	
	if fFlagEnableChatReportingTextChannelTag then
		local channel = p7.targetMessages and (p7.targetMessages[1] and p7.targetMessages[1].channel)
		t.tags.IN_GAME_CHAT_TEXT_CHANNEL = tag(if channel then channel.Name else "RBXGlobal")
	end
	if fFlagAbuseReportForwardCustomTagFieldsModule then
		appendCustomTagFields(t.tags, p6)
	end
	return t
end

local function buildAvatarReport(p8, p9) --[[ line: 151 ]]
	-- upvalues: playersService (ref), tag (ref), appendReportAnythingTags (ref), fFlagAbuseReportForwardCustomTagFieldsModule (ref), appendCustomTagFields (ref)
	local localPlayer = playersService.LocalPlayer
	local t = {
		ENTRY_POINT = tag("in-experience"),
		SUBMITTER_USER_ID = tag(tostring(if localPlayer then localPlayer.UserId else 0)),
		REPORT_TARGET_USER_ID = tag(p8.data.targetIdStr),
		REPORTED_ABUSE_CATEGORY = tag(p8.data.category),
		REPORTER_COMMENT = tag(p8.data.comment or ""),
		REPORTED_ABUSE_VECTOR = tag(p8.data.abuseVector)
	}
	appendReportAnythingTags(t, p9)
	
	if fFlagAbuseReportForwardCustomTagFieldsModule then
		appendCustomTagFields(t, p8)
	end
	return { tags = t }
end

local function buildPlaceReport(p10, p11) --[[ line: 171 ]]
	-- upvalues: playersService (ref), tag (ref), appendReportAnythingTags (ref), fFlagAbuseReportForwardCustomTagFieldsModule (ref), appendCustomTagFields (ref), httpService (ref)
	local localPlayer = playersService.LocalPlayer
	local t = {
		ENTRY_POINT = tag("in-experience"),
		SUBMITTER_USER_ID = tag(tostring(if localPlayer then localPlayer.UserId else 0)),
		PLACE_ID = tag(tostring(game.PlaceId)),
		REPORTED_ABUSE_CATEGORY = tag(p10.data.category),
		REPORTER_COMMENT = tag(p10.data.comment or ""),
		REPORTED_ABUSE_VECTOR = tag(p10.data.abuseVector)
	}
	appendReportAnythingTags(t, p11)
	
	if fFlagAbuseReportForwardCustomTagFieldsModule then
		appendCustomTagFields(t, p10)
	end
	return httpService:JSONEncode({ tags = t })
end

return {
	submitVoiceReport = function(p12, p13) --[[ line: 200 ]]
		-- upvalues: buildVoiceReport (ref), promiseModule (ref), playersService (ref)
		local var18 = buildVoiceReport(p12, p13)
		
		return promiseModule.try(function() --[[ line: 202 ]]
			-- upvalues: playersService (copy), var18 (ref)
			playersService:ReportAbuseV3(playersService.LocalPlayer, var18)
			
			return { responseBody = {} }
		end)
	end,
	submitChatReport = function(p14, p15) --[[ line: 208 ]]
		-- upvalues: buildChatReport (ref), promiseModule (ref), playersService (ref)
		local var19 = buildChatReport(p14, p15)
		
		return promiseModule.try(function() --[[ line: 210 ]]
			-- upvalues: playersService (copy), p15 (ref), var19 (ref)
			playersService:ReportChatAbuse(p15.eligibleMessages, p15.targetMessages, var19)
			
			return { responseBody = {} }
		end)
	end,
	submitChatReportWithoutMessage = function(p16) --[[ line: 216 ]]
		-- upvalues: promiseModule (ref), playersService (ref)
		return promiseModule.try(function() --[[ line: 217 ]]
			-- upvalues: p16 (ref), playersService (copy)
			local var20 = tonumber(p16.data.targetIdStr)
			playersService:ReportAbuse(var20 and playersService:GetPlayerByUserId(var20), p16.data.category, p16.data.comment or "")
			
			return { responseBody = {} }
		end)
	end,
	submitAvatarReport = function(p17, p18) --[[ line: 225 ]]
		-- upvalues: buildAvatarReport (ref), promiseModule (ref), playersService (ref)
		local var21 = buildAvatarReport(p17, p18)
		
		return promiseModule.try(function() --[[ line: 227 ]]
			-- upvalues: playersService (copy), p17 (ref), var21 (ref)
			playersService:ReportAvatarAbuse(tonumber(p17.data.targetIdStr), var21)
			
			return { responseBody = {} }
		end)
	end,
	submitPlaceReport = function(p19, p20) --[[ line: 233 ]]
		-- upvalues: buildPlaceReport (ref), promiseModule (ref), playersService (ref)
		local var22 = buildPlaceReport(p19, p20)
		
		return promiseModule.try(function() --[[ line: 235 ]]
			-- upvalues: playersService (copy), var22 (ref)
			playersService:ReportAbuseV3(playersService.LocalPlayer, var22)
			
			return { responseBody = {} }
		end)
	end,
	buildVoiceReport = buildVoiceReport,
	buildChatReport = buildChatReport,
	buildAvatarReport = buildAvatarReport,
	buildPlaceReport = buildPlaceReport
}