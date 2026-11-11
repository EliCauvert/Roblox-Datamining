local _ = game:GetService("Players")
local _ = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.VoiceChat.ReportAbuseLogic)
local Parent = script.Parent.Parent
local ConstantsModule = require(Parent.Resources.Constants)
local ShowToastModule = require(Parent.Actions.ShowToast)
local OpenReportSentDialogModule = require(Parent.Actions.OpenReportSentDialog)
local EndReportFlowModule = require(Parent.Actions.EndReportFlow)
local ReportManagerModule = require(Parent.Utility.ReportManager)

return function(Place, AbusingPlayer, Reason, Comment, ReportCategory, p1, p2)
	-- upvalues: ConstantsModule (copy), ReportManagerModule (copy), OpenReportSentDialogModule (copy), ShowToastModule (copy), EndReportFlowModule (copy)
	return function(p3)
		-- upvalues: Place (copy), ConstantsModule (upval), ReportManagerModule (upval), ReportCategory (copy), AbusingPlayer (copy), Reason (copy), Comment (copy), OpenReportSentDialogModule (upval), ShowToastModule (upval), p1 (copy), p2 (copy), EndReportFlowModule (upval)
		local State = p3:getState()
		
		if Place == ConstantsModule.ReportType.Player then
			ReportManagerModule.submitUserAbuseReport({
				reportCategory = ReportCategory,
				abusingPlayer = AbusingPlayer,
				reason = Reason,
				comment = Comment,
				beginningTimestamp = State.report.beginningTimestamp,
				sortedUserIds = State.report.sortedUserIds
			}, function()
				-- upvalues: p3 (copy), OpenReportSentDialogModule (upval), Place (upval), AbusingPlayer (upval)
				p3:dispatch(OpenReportSentDialogModule(Place, AbusingPlayer))
			end)
			
			return
		end
		if Place == ConstantsModule.ReportType.Place then
			ReportManagerModule.submitPlaceAbuseReport({
				placeId = game.PlaceId,
				placeName = State.placeInfo.name,
				placeDescription = State.placeInfo.description,
				reason = Reason,
				comment = Comment
			}, function()
				-- upvalues: p3 (copy), ShowToastModule (upval), p1 (upval), p2 (upval)
				p3:dispatch(ShowToastModule(p1, p2))
			end)
			p3:dispatch(EndReportFlowModule())
		end
	end
end