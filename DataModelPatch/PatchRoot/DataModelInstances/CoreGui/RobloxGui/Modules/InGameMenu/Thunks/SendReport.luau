local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local OpenReportSentDialogModule = require(script.Parent.Parent.Actions.OpenReportSentDialog)

return function(Reason, OptionalMessage, UserId)
	-- upvalues: Players (copy), OpenReportSentDialogModule (copy), RunService (copy)
	return function(p1)
		-- upvalues: UserId (copy), Players (upval), Reason (copy), OptionalMessage (copy), OpenReportSentDialogModule (upval), RunService (upval)
		if UserId == nil then
			local State = p1:getState()
			local Name = State.gameInfo.name
			local Description = State.gameInfo.description
			
			if Name ~= "" then
				local Formatted = string.format("User Report: \n    %s \nPlace Title: \n    %s \nPlaceId: \n    %s \nPlace Description: \n    %s \n", OptionalMessage, Name, tostring(game.PlaceId), Description)
				coroutine.wrap(function()
					-- upvalues: RunService (upval), Players (upval), Reason (upval), Formatted (copy), p1 (copy), OpenReportSentDialogModule (upval)
					if not RunService:IsStudio() then
						Players:ReportAbuse(nil, Reason, Formatted)
					end
					p1:dispatch(OpenReportSentDialogModule())
				end)()
			end
		else
			local Player = Players:GetPlayerByUserId(UserId)
			
			if Player then
				coroutine.wrap(function()
					-- upvalues: Players (upval), Player (copy), Reason (upval), OptionalMessage (upval), p1 (copy), OpenReportSentDialogModule (upval)
					Players:ReportAbuse(Player, Reason, OptionalMessage)
					p1:dispatch(OpenReportSentDialogModule())
				end)()
				
				return
			end
		end
	end
end