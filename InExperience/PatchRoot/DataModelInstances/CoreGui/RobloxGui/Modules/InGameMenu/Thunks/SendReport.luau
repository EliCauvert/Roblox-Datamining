local playersService = game:GetService("Players")
local runService = game:GetService("RunService")
local openReportSentDialogModule = require(script.Parent.Parent.Actions.OpenReportSentDialog)

return function(p1, p2, p3)
	-- upvalues: playersService (ref), openReportSentDialogModule (ref), runService (ref)
	return function(p4)
		-- upvalues: p3 (ref), playersService (copy), p1 (ref), p2 (ref), openReportSentDialogModule (copy), runService (copy)
		if p3 == nil then
			local state = p4:getState()
			local name = state.gameInfo.name
			local description = state.gameInfo.description
			
			if name ~= "" then
				local formattedText = string.format("User Report: \n    %s \nPlace Title: \n    %s \nPlaceId: \n    %s \nPlace Description: \n    %s \n", p2, name, tostring(game.PlaceId), description)
				coroutine.wrap(function()
					-- upvalues: runService (copy), playersService (copy), p1 (copy), formattedText (ref), p4 (ref), openReportSentDialogModule (copy)
					if not runService:IsStudio() then
						playersService:ReportAbuse(nil, p1, formattedText)
					end
					p4:dispatch(openReportSentDialogModule())
				end)()
			end
		else
			local var1 = playersService:GetPlayerByUserId(p3)
			
			if var1 then
				coroutine.wrap(function()
					-- upvalues: playersService (copy), var1 (ref), p1 (copy), p2 (copy), p4 (ref), openReportSentDialogModule (copy)
					playersService:ReportAbuse(var1, p1, p2)
					p4:dispatch(openReportSentDialogModule())
				end)()
				
				return
			end
		end
	end
end