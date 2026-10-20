local HttpRbxApiService = game:GetService("HttpRbxApiService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local Players = game:GetService("Players")
local CorePackages = game:GetService("CorePackages")
local RunService = game:GetService("RunService")
local _ = require(CorePackages.Packages.Dash)
local Default = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local CreateVoiceAbuseReportRequestModule = require(RobloxGui.Modules.VoiceChat.createVoiceAbuseReportRequest)
local Url = require(CorePackages.Workspace.Packages.CoreScriptsCommon).Url
local Parent = script.Parent.Parent
local ConstantsModule = require(Parent.Resources.Constants)
local SendAnalyticsModule = require(Parent.Utility.SendAnalytics)
local SessionUtilityModule = require(Parent.Utility.SessionUtility)

function sendAnalytics(ReportType, p1, Reason, AbuseVector)
	-- upvalues: SendAnalyticsModule (copy), ConstantsModule (copy)
	SendAnalyticsModule(ReportType, ConstantsModule.Analytics.ReportSubmittedName, {
		reportType = ReportType,
		reportedEntityId = tostring(p1),
		reportSource = ConstantsModule.Analytics.ReportSourceInGame,
		reason = Reason,
		abuseVector = AbuseVector
	})
end

function getAbuseVectorFromReportCategory(Voice): string
	-- upvalues: ConstantsModule (copy)
	return if Voice == ConstantsModule.Category.Voice then "voice" elseif Voice == ConstantsModule.Category.Text then "chat" else "other"
end

function submitUserAbuseReport(p1, Callback)
	-- upvalues: ConstantsModule (copy), Players (copy), CreateVoiceAbuseReportRequestModule (copy), Default (copy), Url (copy), HttpRbxApiService (copy), SessionUtilityModule (copy)
	local IsReportCategoryMatch = p1.reportCategory == ConstantsModule.Category.Voice
	local LocalPlayer = Players.LocalPlayer
	
	if LocalPlayer then
		pcall(function()
			-- upvalues: p1 (copy), IsReportCategoryMatch (copy), CreateVoiceAbuseReportRequestModule (upval), Players (upval), Default (upval), LocalPlayer (copy), Url (upval), HttpRbxApiService (upval), ConstantsModule (upval), SessionUtilityModule (upval), Callback (copy)
			coroutine.wrap(function()
				-- upvalues: p1 (upval), IsReportCategoryMatch (upval), CreateVoiceAbuseReportRequestModule (upval), Players (upval), Default (upval), LocalPlayer (upval), Url (upval), HttpRbxApiService (upval), ConstantsModule (upval), SessionUtilityModule (upval), Callback (upval)
				local AbuseVectorFromReportCategory = getAbuseVectorFromReportCategory(p1.reportCategory)
				
				if IsReportCategoryMatch then
					local VoiceAbuseReportRequestModule = CreateVoiceAbuseReportRequestModule(Players, Default, {
						localUserId = LocalPlayer.UserId,
						abuserUserId = p1.abusingPlayer.UserId,
						abuseComment = p1.comment,
						abuseReason = p1.reason,
						inExpMenuOpenedUnixMilli = math.floor(p1.beginningTimestamp * 1000),
						sortedPlayerListUserIds = p1.sortedUserIds,
						abuseVector = AbuseVectorFromReportCategory
					})
					
					if game:GetEngineFeature("AbuseReportV3") then
						Players:ReportAbuseV3(LocalPlayer, VoiceAbuseReportRequestModule)
					else
						HttpRbxApiService:PostAsyncFullUrl(Url.APIS_URL .. "/abuse-reporting/v2/abuse-report", VoiceAbuseReportRequestModule)
					end
				else
					Players:ReportAbuse(p1.abusingPlayer, p1.reason, p1.comment)
				end
				sendAnalytics(ConstantsModule.Analytics.ReportTypeUser, p1.abusingPlayer.UserId, p1.reason, AbuseVectorFromReportCategory)
				SessionUtilityModule.endAbuseReportSession()
				
				if Callback then
					Callback()
				end
			end)()
		end)
	end
end

function submitPlaceAbuseReport(p1, Callback)
	-- upvalues: RunService (copy), Players (copy), ConstantsModule (copy), SessionUtilityModule (copy)
	if p1.placeName ~= "" then
		coroutine.wrap(function()
			-- upvalues: RunService (upval), p1 (copy), Players (upval), ConstantsModule (upval), SessionUtilityModule (upval), Callback (copy)
			if not RunService:IsStudio() then
				Players:ReportAbuse(nil, p1.reason, (string.format("User Report: \n    %s \nPlace Title: \n    %s \nPlaceId: \n    %s \nPlace Description: \n    %s \n", p1.comment, p1.placeName, tostring(p1.placeId), p1.placeDescription)))
			end
			sendAnalytics(ConstantsModule.Analytics.ReportTypeGame, p1.placeId, p1.reason)
			SessionUtilityModule.endAbuseReportSession()
			
			if Callback then
				Callback()
			end
		end)()
	end
end

return {
	submitUserAbuseReport = submitUserAbuseReport,
	submitPlaceAbuseReport = submitPlaceAbuseReport
}