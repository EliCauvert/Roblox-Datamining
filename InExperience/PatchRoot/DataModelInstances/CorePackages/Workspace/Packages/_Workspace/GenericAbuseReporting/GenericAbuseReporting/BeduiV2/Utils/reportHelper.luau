local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local promiseModule = require(parent.Promise)
local fFlagEnableChatReportingTextChannelTag = require(parent.SharedFlags).FFlagEnableChatReportingTextChannelTag
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local fFlagAbuseReportForwardCustomTagFieldsModule = require(genericAbuseReporting.Flags.FFlagAbuseReportForwardCustomTagFields)
local appendReportAnythingTags = require(genericAbuseReporting.BeduiV2.Utils.appendReportAnythingTags).appendReportAnythingTags

local function tag(p1)
	return if p1 then { valueList = { { data = p1 } } } else nil
end

local function _(p1)
	return typeof(p1) == "string" and string.match(p1, "^[A-Z_][A-Z0-9_]*$") ~= nil
end

local function appendCustomTagFields(p1, p2)
	-- upvalues: tag (ref)
	local custom = p2.data.custom
	
	if not custom then return end
	for i, v in pairs(custom) do
		if typeof(i) == "string" and string.match(i, "^[A-Z_][A-Z0-9_]*$") ~= nil then
			local var1 = typeof(v)
			
			if var1 == "string" or var1 == "number" or var1 == "boolean" then
				p1[i] = tag(tostring(v))
			end
		end
	end
end

local function buildVoiceReport(p3, p4)
	-- upvalues: playersService (ref), tag (ref), fFlagAbuseReportForwardCustomTagFieldsModule (ref), appendCustomTagFields (ref), httpService (ref)
	local t = {}
	
	if p4 then
		for i, v in ipairs(p4.sortedPlayerListUserIds) do
			table.insert(t, { data = tostring(v) })
		end
	end
	local localPlayer = playersService.LocalPlayer
	local t_1 = {
		ENTRY_POINT = tag("in-experience"),
		SUBMITTER_USER_ID = tag(tostring(if localPlayer then localPlayer.UserId else 0)),
		REPORT_TARGET_USER_ID = tag(p3.data.targetIdStr),
		REPORTED_ABUSE_CATEGORY = tag(p3.data.category),
		REPORTER_COMMENT = tag(p3.data.comment or ""),
		IS_PLACE_VOICE_ENABLED = tag("true"),
		VOICE_USER_IDS_FROM_CLIENT = { valueList = t },
		IN_EXP_MENU_OPENED_UNIX_MILLI = tag(tostring(if p4 then p4.menuOpenedUnixMilli else 0)),
		VOICE_CHANNEL_ID = tag(if p4 then p4.channelId else ""),
		VOICE_USER_COUNT = tag(tostring(if p4 then p4.voiceUserCount else 0)),
		VOICE_IMPACTED_USER_COUNT = tag(tostring(if p4 then p4.voiceImpactedUserCount else 0)),
		REPORTED_ABUSE_VECTOR = tag(p3.data.abuseVector)
	}
	
	if fFlagAbuseReportForwardCustomTagFieldsModule then
		appendCustomTagFields(t_1, p3)
	end
	return httpService:JSONEncode({ tags = t_1 })
end

local function buildChatReport(p5, p6)
	-- upvalues: playersService (ref), tag (ref), fFlagEnableChatReportingTextChannelTag (ref), fFlagAbuseReportForwardCustomTagFieldsModule (ref), appendCustomTagFields (ref)
	local localPlayer = playersService.LocalPlayer
	local t = {
		tags = {
			ENTRY_POINT = tag("in-experience"),
			SUBMITTER_USER_ID = tag(tostring(if localPlayer then localPlayer.UserId else 0)),
			REPORT_TARGET_USER_ID = tag(p5.data.targetIdStr),
			REPORTED_ABUSE_CATEGORY = tag(p5.data.category),
			REPORTER_COMMENT = tag(p5.data.comment or ""),
			REPORTED_ABUSE_VECTOR = tag(p5.data.abuseVector),
			REPORT_TARGET_MESSAGE_ID = tag(p6.targetMessages and (p6.targetMessages[1] and (p6.targetMessages[1].messageId or ""))),
			PRESET_ID = tag(p6.targetMessages and (p6.targetMessages[1] and (p6.targetMessages[1].presetId or nil))),
			PRESET_CHAT_VERSION = tag(p6.targetMessages and (p6.targetMessages[1] and (p6.targetMessages[1].presetChatVersion or nil))),
			VARIANT = tag("IGM_CLRv2")
		}
	}
	
	if fFlagEnableChatReportingTextChannelTag then
		local channel = p6.targetMessages and (p6.targetMessages[1] and p6.targetMessages[1].channel)
		t.tags.IN_GAME_CHAT_TEXT_CHANNEL = tag(if channel then channel.Name else "RBXGlobal")
	end
	if fFlagAbuseReportForwardCustomTagFieldsModule then
		appendCustomTagFields(t.tags, p5)
	end
	return t
end

local function buildAvatarReport(p5, p6)
	-- upvalues: playersService (ref), tag (ref), appendReportAnythingTags (ref), fFlagAbuseReportForwardCustomTagFieldsModule (ref), appendCustomTagFields (ref)
	local localPlayer = playersService.LocalPlayer
	local t = {
		ENTRY_POINT = tag("in-experience"),
		SUBMITTER_USER_ID = tag(tostring(if localPlayer then localPlayer.UserId else 0)),
		REPORT_TARGET_USER_ID = tag(p5.data.targetIdStr),
		REPORTED_ABUSE_CATEGORY = tag(p5.data.category),
		REPORTER_COMMENT = tag(p5.data.comment or ""),
		REPORTED_ABUSE_VECTOR = tag(p5.data.abuseVector)
	}
	appendReportAnythingTags(t, p6)
	
	if fFlagAbuseReportForwardCustomTagFieldsModule then
		appendCustomTagFields(t, p5)
	end
	return { tags = t }
end

local function buildPlaceReport(p5, p6)
	-- upvalues: playersService (ref), tag (ref), appendReportAnythingTags (ref), fFlagAbuseReportForwardCustomTagFieldsModule (ref), appendCustomTagFields (ref), httpService (ref)
	local localPlayer = playersService.LocalPlayer
	local t = {
		ENTRY_POINT = tag("in-experience"),
		SUBMITTER_USER_ID = tag(tostring(if localPlayer then localPlayer.UserId else 0)),
		PLACE_ID = tag(tostring(game.PlaceId)),
		REPORTED_ABUSE_CATEGORY = tag(p5.data.category),
		REPORTER_COMMENT = tag(p5.data.comment or ""),
		REPORTED_ABUSE_VECTOR = tag(p5.data.abuseVector)
	}
	appendReportAnythingTags(t, p6)
	
	if fFlagAbuseReportForwardCustomTagFieldsModule then
		appendCustomTagFields(t, p5)
	end
	return httpService:JSONEncode({ tags = t })
end

return {
	submitVoiceReport = function(p5, p6)
		-- upvalues: buildVoiceReport (ref), promiseModule (ref), playersService (ref)
		local var2 = buildVoiceReport(p5, p6)
		
		return promiseModule.try(function()
			-- upvalues: playersService (copy), var2 (ref)
			playersService:ReportAbuseV3(playersService.LocalPlayer, var2)
			
			return { responseBody = {} }
		end)
	end,
	submitChatReport = function(p5, p6)
		-- upvalues: buildChatReport (ref), promiseModule (ref), playersService (ref)
		local var2 = buildChatReport(p5, p6)
		
		return promiseModule.try(function()
			-- upvalues: playersService (copy), p6 (ref), var2 (ref)
			playersService:ReportChatAbuse(p6.eligibleMessages, p6.targetMessages, var2)
			
			return { responseBody = {} }
		end)
	end,
	submitChatReportWithoutMessage = function(p5)
		-- upvalues: promiseModule (ref), playersService (ref)
		return promiseModule.try(function()
			-- upvalues: p5 (ref), playersService (copy)
			local var2 = tonumber(p5.data.targetIdStr)
			playersService:ReportAbuse(var2 and playersService:GetPlayerByUserId(var2), p5.data.category, p5.data.comment or "")
			
			return { responseBody = {} }
		end)
	end,
	submitAvatarReport = function(p5, p6)
		-- upvalues: buildAvatarReport (ref), promiseModule (ref), playersService (ref)
		local var2 = buildAvatarReport(p5, p6)
		
		return promiseModule.try(function()
			-- upvalues: playersService (copy), p5 (ref), var2 (ref)
			playersService:ReportAvatarAbuse(tonumber(p5.data.targetIdStr), var2)
			
			return { responseBody = {} }
		end)
	end,
	submitPlaceReport = function(p5, p6)
		-- upvalues: buildPlaceReport (ref), promiseModule (ref), playersService (ref)
		local var2 = buildPlaceReport(p5, p6)
		
		return promiseModule.try(function()
			-- upvalues: playersService (copy), var2 (ref)
			playersService:ReportAbuseV3(playersService.LocalPlayer, var2)
			
			return { responseBody = {} }
		end)
	end,
	buildVoiceReport = buildVoiceReport,
	buildChatReport = buildChatReport,
	buildAvatarReport = buildAvatarReport,
	buildPlaceReport = buildPlaceReport
}