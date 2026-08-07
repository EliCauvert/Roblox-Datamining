local playersService = game:GetService("Players")
local runService = game:GetService("RunService")
local openReportSentDialogModule = require(script.Parent.Parent.Actions.OpenReportSentDialog)

return function(p0, p1, p2) --[[ line: 7 ]]
	-- upvalues: playersService (ref), openReportSentDialogModule (ref), runService (ref)
	return function(p3) --[[ line: 8 ]]
		-- upvalues: p2 (ref), playersService (copy), p0 (ref), p1 (ref), openReportSentDialogModule (copy), runService (copy)
		if p2 == nil then
			local state = p3:getState()
			local name = state.gameInfo.name
			local description = state.gameInfo.description
			
			if name ~= "" then
				local formattedText = string.format("User Report: \n    %s \nPlace Title: \n    %s \nPlaceId: \n    %s \nPlace Description: \n    %s \n", p1, name, tostring(game.PlaceId), description)
				coroutine.wrap(function() --[[ line: 31 ]]
					-- upvalues: runService (copy), playersService (copy), p0 (copy), formattedText (ref), p3 (ref), openReportSentDialogModule (copy)
					if not runService:IsStudio() then
						playersService:ReportAbuse(nil, p0, formattedText)
					end
					p3:dispatch(openReportSentDialogModule())
				end)()
			end
		else
			local var3 = playersService:GetPlayerByUserId(p2)
			
			if var3 then
				coroutine.wrap(function() --[[ line: 12 ]]
					-- upvalues: playersService (copy), var3 (ref), p0 (copy), p1 (copy), p3 (ref), openReportSentDialogModule (copy)
					playersService:ReportAbuse(var3, p0, p1)
					p3:dispatch(openReportSentDialogModule())
				end)()
				
				return
			end
		end
	end
end