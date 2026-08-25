local _ = game:GetService("Players")
local _ = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.VoiceChat.ReportAbuseLogic)
local parent = script.Parent.Parent
local constantsModule = require(parent.Resources.Constants)
local showToastModule = require(parent.Actions.ShowToast)
local openReportSentDialogModule = require(parent.Actions.OpenReportSentDialog)
local endReportFlowModule = require(parent.Actions.EndReportFlow)
local reportManagerModule = require(parent.Utility.ReportManager)

return function(p0, p1, p2, p3, p4, p5, p6)
	-- upvalues: constantsModule (ref), reportManagerModule (ref), openReportSentDialogModule (ref), showToastModule (ref), endReportFlowModule (ref)
	return function(p7)
		-- upvalues: p0 (ref), constantsModule (copy), reportManagerModule (copy), p4 (ref), p1 (ref), p2 (ref), p3 (ref), openReportSentDialogModule (copy), showToastModule (copy), p5 (ref), p6 (ref), endReportFlowModule (copy)
		local state = p7:getState()
		
		if p0 == constantsModule.ReportType.Player then
			reportManagerModule.submitUserAbuseReport({
				reportCategory = p4,
				abusingPlayer = p1,
				reason = p2,
				comment = p3,
				beginningTimestamp = state.report.beginningTimestamp,
				sortedUserIds = state.report.sortedUserIds
			}, function()
				-- upvalues: p7 (ref), openReportSentDialogModule (copy), p0 (copy), p1 (copy)
				p7:dispatch(openReportSentDialogModule(p0, p1))
			end)
			
			return
		elseif p0 == constantsModule.ReportType.Place then
			reportManagerModule.submitPlaceAbuseReport({
				placeId = game.PlaceId,
				placeName = state.placeInfo.name,
				placeDescription = state.placeInfo.description,
				reason = p2,
				comment = p3
			}, function()
				-- upvalues: p7 (ref), showToastModule (copy), p5 (copy), p6 (copy)
				p7:dispatch(showToastModule(p5, p6))
			end)
			p7:dispatch(endReportFlowModule())
		end
	end
end