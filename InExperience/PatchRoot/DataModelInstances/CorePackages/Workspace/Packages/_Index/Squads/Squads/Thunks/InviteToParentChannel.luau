local HttpService = game:GetService("HttpService")
local SquadPromptType = require(script:FindFirstAncestor("Squads").Parent.SquadsCore.Enums).SquadPromptType

return function(p1) --[[ Line: 8 ]]
	-- upvalues: HttpService (copy), SquadPromptType (copy)
	return function(p2) --[[ Line: 16 ]]
		-- upvalues: p1 (copy), HttpService (upval), SquadPromptType (upval)
		return p1.squadExternalContext.inviteToParentChannel(p1.dispatch, p1.parentChannel, p1.userIds):andThen(function(Result) --[[ Line: 19 ]]
			-- upvalues: p1 (upval)
			if p1.onSuccessCallback then
				p1.onSuccessCallback(Result)
			end
		end):catch(function(Err) --[[ Line: 24 ]]
			-- upvalues: HttpService (upval), p1 (upval), p2 (copy), SquadPromptType (upval)
			local Success, Result = pcall(function() --[[ Line: 25 ]]
				-- upvalues: HttpService (upval), Err (copy)
				return HttpService:JSONDecode(Err.Body)
			end)
			p1.squadExternalContext.setSquadPrompt(p2, {
				hideCancelButton = true,
				promptType = if Success and Result and Result.reason_code == "participant_chat_disabled" then SquadPromptType.ParticipantChatDisabled else SquadPromptType.Error
			})
			
			if p1.onErrorCallback then
				p1.onErrorCallback()
			end
		end)
	end
end