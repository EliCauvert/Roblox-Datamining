local httpRbxApiService = game:GetService("HttpRbxApiService")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local playersService = game:GetService("Players")
local corePackagesService = game:GetService("CorePackages")
local runService = game:GetService("RunService")
local _ = require(corePackagesService.Packages.Dash)
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local createVoiceAbuseReportRequestModule = require(robloxGui.Modules.VoiceChat.createVoiceAbuseReportRequest)
local url = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).Url
local parent = script.Parent.Parent
local constantsModule = require(parent.Resources.Constants)
local sendAnalyticsModule = require(parent.Utility.SendAnalytics)
local sessionUtilityModule = require(parent.Utility.SessionUtility)

function sendAnalytics(p0, p1, p2, p3)
	-- upvalues: sendAnalyticsModule (ref), constantsModule (ref)
	sendAnalyticsModule(p0, constantsModule.Analytics.ReportSubmittedName, {
		reportType = p0,
		reportedEntityId = tostring(p1),
		reportSource = constantsModule.Analytics.ReportSourceInGame,
		reason = p2,
		abuseVector = p3
	})
end

function getAbuseVectorFromReportCategory(p4)
	-- upvalues: constantsModule (ref)
	return if p4 == constantsModule.Category.Voice then "voice" elseif p4 == constantsModule.Category.Text then "chat" else "other"
end

function submitUserAbuseReport(p5, p6)
	-- upvalues: constantsModule (ref), playersService (ref), createVoiceAbuseReportRequestModule (ref), default (ref), url (ref), httpRbxApiService (ref), sessionUtilityModule (ref)
	local var9 = p5.reportCategory == constantsModule.Category.Voice
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer then
		pcall(function()
			-- upvalues: p5 (ref), var9 (ref), createVoiceAbuseReportRequestModule (copy), playersService (copy), default (copy), localPlayer (ref), url (copy), httpRbxApiService (copy), constantsModule (copy), sessionUtilityModule (copy), p6 (ref)
			coroutine.wrap(function()
				-- upvalues: p5 (copy), var9 (copy), createVoiceAbuseReportRequestModule (copy), playersService (copy), default (copy), localPlayer (copy), url (copy), httpRbxApiService (copy), constantsModule (copy), sessionUtilityModule (copy), p6 (copy)
				local var10 = getAbuseVectorFromReportCategory(p5.reportCategory)
				
				if var9 then
					local var11 = createVoiceAbuseReportRequestModule(playersService, default, {
						localUserId = localPlayer.UserId,
						abuserUserId = p5.abusingPlayer.UserId,
						abuseComment = p5.comment,
						abuseReason = p5.reason,
						inExpMenuOpenedUnixMilli = math.floor(p5.beginningTimestamp * 1000),
						sortedPlayerListUserIds = p5.sortedUserIds,
						abuseVector = var10
					})
					
					if game:GetEngineFeature("AbuseReportV3") then
						playersService:ReportAbuseV3(localPlayer, var11)
					else
						httpRbxApiService:PostAsyncFullUrl(url.APIS_URL .. "/abuse-reporting/v2/abuse-report", var11)
					end
				else
					playersService:ReportAbuse(p5.abusingPlayer, p5.reason, p5.comment)
				end
				sendAnalytics(constantsModule.Analytics.ReportTypeUser, p5.abusingPlayer.UserId, p5.reason, var10)
				sessionUtilityModule.endAbuseReportSession()
				
				if p6 then
					p6()
				end
			end)()
		end)
	end
end

function submitPlaceAbuseReport(p7, p8)
	-- upvalues: runService (ref), playersService (ref), constantsModule (ref), sessionUtilityModule (ref)
	if p7.placeName ~= "" then
		coroutine.wrap(function()
			-- upvalues: runService (copy), p7 (ref), playersService (copy), constantsModule (copy), sessionUtilityModule (copy), p8 (ref)
			if not runService:IsStudio() then
				playersService:ReportAbuse(nil, p7.reason, string.format("User Report: \n    %s \nPlace Title: \n    %s \nPlaceId: \n    %s \nPlace Description: \n    %s \n", p7.comment, p7.placeName, tostring(p7.placeId), p7.placeDescription))
			end
			sendAnalytics(constantsModule.Analytics.ReportTypeGame, p7.placeId, p7.reason)
			sessionUtilityModule.endAbuseReportSession()
			
			if p8 then
				p8()
			end
		end)()
	end
end

return {
	submitUserAbuseReport = submitUserAbuseReport,
	submitPlaceAbuseReport = submitPlaceAbuseReport
}