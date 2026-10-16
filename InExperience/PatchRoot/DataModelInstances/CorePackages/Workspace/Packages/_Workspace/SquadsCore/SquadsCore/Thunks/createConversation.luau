local HttpService = game:GetService("HttpService")
local SquadPromptTypeModule = require(script:FindFirstAncestor("SquadsCore").Enums.SquadPromptType)

return function(p1) --[[ Line: 7 ]]
	-- upvalues: HttpService (copy), SquadPromptTypeModule (copy)
	return function(p2) --[[ Line: 15 ]]
		-- upvalues: p1 (copy), HttpService (upval), SquadPromptTypeModule (upval)
		p2:dispatch(p1.squadContext.createConversation(p1.conversationType, p1.userIds, nil, p1.source)):andThen(function(Result) --[[ Line: 20 ]]
			-- upvalues: p1 (upval)
			if p1.onSuccessCallback then
				p1.onSuccessCallback(Result.id)
			end
		end):catch(function(Err) --[[ Line: 25 ]]
			-- upvalues: HttpService (upval), p1 (upval), p2 (copy), SquadPromptTypeModule (upval)
			local Success, Result = pcall(function() --[[ Line: 26 ]]
				-- upvalues: HttpService (upval), Err (copy)
				return HttpService:JSONDecode(Err.Body)
			end)
			p1.squadContext.setSquadPrompt(p2, {
				hideCancelButton = true,
				promptType = if Success and Result and Result.reason_code == "participant_chat_disabled" then SquadPromptTypeModule.ParticipantChatDisabled else SquadPromptTypeModule.Error
			})
			
			if p1.onErrorCallback then
				p1.onErrorCallback()
			end
		end)
	end
end