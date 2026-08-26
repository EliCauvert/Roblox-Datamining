local _ = game:GetService("Players")
local _ = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.VoiceChat.ReportAbuseLogic)
local parent = script.Parent.Parent
local constantsModule = require(parent.Resources.Constants)
local showToastModule = require(parent.Actions.ShowToast)
local openReportSentDialogModule = require(parent.Actions.OpenReportSentDialog)
local endReportFlowModule = require(parent.Actions.EndReportFlow)
local reportManagerModule = require(parent.Utility.ReportManager)

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: constantsModule (ref), reportManagerModule (ref), openReportSentDialogModule (ref), showToastModule (ref), endReportFlowModule (ref)
	return function(p8)
		-- upvalues: p1 (ref), constantsModule (copy), reportManagerModule (copy), p5 (ref), p2 (ref), p3 (ref), p4 (ref), openReportSentDialogModule (copy), showToastModule (copy), p6 (ref), p7 (ref), endReportFlowModule (copy)
		local state = p8:getState()
		
		if p1 == constantsModule.ReportType.Player then
			reportManagerModule.submitUserAbuseReport({
				reportCategory = p5,
				abusingPlayer = p2,
				reason = p3,
				comment = p4,
				beginningTimestamp = state.report.beginningTimestamp,
				sortedUserIds = state.report.sortedUserIds
			}, function()
				-- upvalues: p8 (ref), openReportSentDialogModule (copy), p1 (copy), p2 (copy)
				p8:dispatch(openReportSentDialogModule(p1, p2))
			end)
			
			return
		elseif p1 == constantsModule.ReportType.Place then
			reportManagerModule.submitPlaceAbuseReport({
				placeId = game.PlaceId,
				placeName = state.placeInfo.name,
				placeDescription = state.placeInfo.description,
				reason = p3,
				comment = p4
			}, function()
				-- upvalues: p8 (ref), showToastModule (copy), p6 (copy), p7 (copy)
				p8:dispatch(showToastModule(p6, p7))
			end)
			p8:dispatch(endReportFlowModule())
		end
	end
end