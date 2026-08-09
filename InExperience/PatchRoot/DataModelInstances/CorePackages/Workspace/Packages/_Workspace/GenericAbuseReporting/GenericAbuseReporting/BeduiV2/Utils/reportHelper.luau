local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local promiseModule = require(parent.Promise)
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local appendReportAnythingTags = require(genericAbuseReporting.BeduiV2.Utils.appendReportAnythingTags).appendReportAnythingTags

local function tag(p0) --[[ line: 46 ]]
	return if p0 then { valueList = { { data = p0 } } } else nil
end

local function buildVoiceReport(p1, p2) --[[ line: 53 ]]
	-- upvalues: playersService (ref), httpService (ref), tag (ref)
	local t = {}
	
	if p2 then
		for i, v in ipairs(p2.sortedPlayerListUserIds) do
			table.insert(t, { data = tostring(v) })
		end
	end
	local localPlayer = playersService.LocalPlayer
	
	return httpService:JSONEncode({
		tags = {
			ENTRY_POINT = tag("in-experience"),
			SUBMITTER_USER_ID = tag(tostring(if localPlayer then localPlayer.UserId else 0)),
			REPORT_TARGET_USER_ID = tag(p1.data.targetIdStr),
			REPORTED_ABUSE_CATEGORY = tag(p1.data.category),
			REPORTER_COMMENT = tag(p1.data.comment or ""),
			IS_PLACE_VOICE_ENABLED = tag("true"),
			VOICE_USER_IDS_FROM_CLIENT = { valueList = t },
			IN_EXP_MENU_OPENED_UNIX_MILLI = tag(tostring(if p2 then p2.menuOpenedUnixMilli else 0)),
			VOICE_CHANNEL_ID = tag(if p2 then p2.channelId else ""),
			VOICE_USER_COUNT = tag(tostring(if p2 then p2.voiceUserCount else 0)),
			VOICE_IMPACTED_USER_COUNT = tag(tostring(if p2 then p2.voiceImpactedUserCount else 0)),
			REPORTED_ABUSE_VECTOR = tag(p1.data.abuseVector)
		}
	})
end

local function buildChatReport(p3, p4) --[[ line: 82 ]]
	-- upvalues: playersService (ref), tag (ref)
	local localPlayer = playersService.LocalPlayer
	
	return {
		tags = {
			ENTRY_POINT = tag("in-experience"),
			SUBMITTER_USER_ID = tag(tostring(if localPlayer then localPlayer.UserId else 0)),
			REPORT_TARGET_USER_ID = tag(p3.data.targetIdStr),
			REPORTED_ABUSE_CATEGORY = tag(p3.data.category),
			REPORTER_COMMENT = tag(p3.data.comment or ""),
			REPORTED_ABUSE_VECTOR = tag(p3.data.abuseVector),
			REPORT_TARGET_MESSAGE_ID = tag(p4.targetMessages and (p4.targetMessages[1] and (p4.targetMessages[1].messageId or ""))),
			PRESET_ID = tag(p4.targetMessages and (p4.targetMessages[1] and (p4.targetMessages[1].presetId or nil))),
			PRESET_CHAT_VERSION = tag(p4.targetMessages and (p4.targetMessages[1] and (p4.targetMessages[1].presetChatVersion or nil))),
			VARIANT = tag("IGM_CLRv2")
		}
	}
end

local function buildAvatarReport(p5, p6) --[[ line: 112 ]]
	-- upvalues: playersService (ref), tag (ref), appendReportAnythingTags (ref)
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
	
	return { tags = t }
end

local function buildPlaceReport(p7, p8) --[[ line: 129 ]]
	-- upvalues: playersService (ref), tag (ref), appendReportAnythingTags (ref), httpService (ref)
	local localPlayer = playersService.LocalPlayer
	local t = {
		ENTRY_POINT = tag("in-experience"),
		SUBMITTER_USER_ID = tag(tostring(if localPlayer then localPlayer.UserId else 0)),
		PLACE_ID = tag(tostring(game.PlaceId)),
		REPORTED_ABUSE_CATEGORY = tag(p7.data.category),
		REPORTER_COMMENT = tag(p7.data.comment or ""),
		REPORTED_ABUSE_VECTOR = tag(p7.data.abuseVector)
	}
	appendReportAnythingTags(t, p8)
	
	return httpService:JSONEncode({ tags = t })
end

return {
	submitVoiceReport = function(p9, p10) --[[ line: 155 ]]
		-- upvalues: buildVoiceReport (ref), promiseModule (ref), playersService (ref)
		local var12 = buildVoiceReport(p9, p10)
		
		return promiseModule.try(function() --[[ line: 157 ]]
			-- upvalues: playersService (copy), var12 (ref)
			playersService:ReportAbuseV3(playersService.LocalPlayer, var12)
			
			return { responseBody = {} }
		end)
	end,
	submitChatReport = function(p11, p12) --[[ line: 163 ]]
		-- upvalues: buildChatReport (ref), promiseModule (ref), playersService (ref)
		local var13 = buildChatReport(p11, p12)
		
		return promiseModule.try(function() --[[ line: 165 ]]
			-- upvalues: playersService (copy), p12 (ref), var13 (ref)
			playersService:ReportChatAbuse(p12.eligibleMessages, p12.targetMessages, var13)
			
			return { responseBody = {} }
		end)
	end,
	submitChatReportWithoutMessage = function(p13) --[[ line: 171 ]]
		-- upvalues: promiseModule (ref), playersService (ref)
		return promiseModule.try(function() --[[ line: 172 ]]
			-- upvalues: p13 (ref), playersService (copy)
			local var14 = tonumber(p13.data.targetIdStr)
			playersService:ReportAbuse(var14 and playersService:GetPlayerByUserId(var14), p13.data.category, p13.data.comment or "")
			
			return { responseBody = {} }
		end)
	end,
	submitAvatarReport = function(p14, p15) --[[ line: 180 ]]
		-- upvalues: buildAvatarReport (ref), promiseModule (ref), playersService (ref)
		local var15 = buildAvatarReport(p14, p15)
		
		return promiseModule.try(function() --[[ line: 182 ]]
			-- upvalues: playersService (copy), p14 (ref), var15 (ref)
			playersService:ReportAvatarAbuse(tonumber(p14.data.targetIdStr), var15)
			
			return { responseBody = {} }
		end)
	end,
	submitPlaceReport = function(p16, p17) --[[ line: 188 ]]
		-- upvalues: buildPlaceReport (ref), promiseModule (ref), playersService (ref)
		local var16 = buildPlaceReport(p16, p17)
		
		return promiseModule.try(function() --[[ line: 190 ]]
			-- upvalues: playersService (copy), var16 (ref)
			playersService:ReportAbuseV3(playersService.LocalPlayer, var16)
			
			return { responseBody = {} }
		end)
	end,
	buildVoiceReport = buildVoiceReport,
	buildChatReport = buildChatReport,
	buildAvatarReport = buildAvatarReport,
	buildPlaceReport = buildPlaceReport
}