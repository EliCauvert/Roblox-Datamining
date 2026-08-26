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

function sendAnalytics(p1, p2, p3, p4)
	-- upvalues: sendAnalyticsModule (ref), constantsModule (ref)
	sendAnalyticsModule(p1, constantsModule.Analytics.ReportSubmittedName, {
		reportType = p1,
		reportedEntityId = tostring(p2),
		reportSource = constantsModule.Analytics.ReportSourceInGame,
		reason = p3,
		abuseVector = p4
	})
end

function getAbuseVectorFromReportCategory(p1)
	-- upvalues: constantsModule (ref)
	return if p1 == constantsModule.Category.Voice then "voice" elseif p1 == constantsModule.Category.Text then "chat" else "other"
end

function submitUserAbuseReport(p1, p2)
	-- upvalues: constantsModule (ref), playersService (ref), createVoiceAbuseReportRequestModule (ref), default (ref), url (ref), httpRbxApiService (ref), sessionUtilityModule (ref)
	local var1 = p1.reportCategory == constantsModule.Category.Voice
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer then
		pcall(function()
			-- upvalues: p1 (ref), var1 (ref), createVoiceAbuseReportRequestModule (copy), playersService (copy), default (copy), localPlayer (ref), url (copy), httpRbxApiService (copy), constantsModule (copy), sessionUtilityModule (copy), p2 (ref)
			coroutine.wrap(function()
				-- upvalues: p1 (copy), var1 (copy), createVoiceAbuseReportRequestModule (copy), playersService (copy), default (copy), localPlayer (copy), url (copy), httpRbxApiService (copy), constantsModule (copy), sessionUtilityModule (copy), p2 (copy)
				local var2 = getAbuseVectorFromReportCategory(p1.reportCategory)
				
				if var1 then
					local var3 = createVoiceAbuseReportRequestModule(playersService, default, {
						localUserId = localPlayer.UserId,
						abuserUserId = p1.abusingPlayer.UserId,
						abuseComment = p1.comment,
						abuseReason = p1.reason,
						inExpMenuOpenedUnixMilli = math.floor(p1.beginningTimestamp * 1000),
						sortedPlayerListUserIds = p1.sortedUserIds,
						abuseVector = var2
					})
					
					if game:GetEngineFeature("AbuseReportV3") then
						playersService:ReportAbuseV3(localPlayer, var3)
					else
						httpRbxApiService:PostAsyncFullUrl(url.APIS_URL .. "/abuse-reporting/v2/abuse-report", var3)
					end
				else
					playersService:ReportAbuse(p1.abusingPlayer, p1.reason, p1.comment)
				end
				sendAnalytics(constantsModule.Analytics.ReportTypeUser, p1.abusingPlayer.UserId, p1.reason, var2)
				sessionUtilityModule.endAbuseReportSession()
				
				if p2 then
					p2()
				end
			end)()
		end)
	end
end

function submitPlaceAbuseReport(p1, p2)
	-- upvalues: runService (ref), playersService (ref), constantsModule (ref), sessionUtilityModule (ref)
	if p1.placeName ~= "" then
		coroutine.wrap(function()
			-- upvalues: runService (copy), p1 (ref), playersService (copy), constantsModule (copy), sessionUtilityModule (copy), p2 (ref)
			if not runService:IsStudio() then
				playersService:ReportAbuse(nil, p1.reason, string.format("User Report: \n    %s \nPlace Title: \n    %s \nPlaceId: \n    %s \nPlace Description: \n    %s \n", p1.comment, p1.placeName, tostring(p1.placeId), p1.placeDescription))
			end
			sendAnalytics(constantsModule.Analytics.ReportTypeGame, p1.placeId, p1.reason)
			sessionUtilityModule.endAbuseReportSession()
			
			if p2 then
				p2()
			end
		end)()
	end
end

return {
	submitUserAbuseReport = submitUserAbuseReport,
	submitPlaceAbuseReport = submitPlaceAbuseReport
}