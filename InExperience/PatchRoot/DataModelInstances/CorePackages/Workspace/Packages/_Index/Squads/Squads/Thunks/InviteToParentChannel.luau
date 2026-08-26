local httpService = game:GetService("HttpService")
local squadPromptType = require(script:FindFirstAncestor("Squads").Parent.SquadsCore.Enums).SquadPromptType

return function(p1)
	-- upvalues: httpService (ref), squadPromptType (ref)
	return function(p2)
		-- upvalues: p1 (ref), httpService (copy), squadPromptType (copy)
		return p1.squadExternalContext.inviteToParentChannel(p1.dispatch, p1.parentChannel, p1.userIds):andThen(function(p3)
			-- upvalues: p1 (copy)
			if p1.onSuccessCallback then
				p1.onSuccessCallback(p3)
			end
		end):catch(function(p3)
			-- upvalues: httpService (copy), p1 (copy), p2 (ref), squadPromptType (copy)
			local ok, status = pcall(function()
				-- upvalues: httpService (copy), p3 (ref)
				return httpService:JSONDecode(p3.Body)
			end)
			p1.squadExternalContext.setSquadPrompt(p2, {
				hideCancelButton = true,
				promptType = if ok and status and status.reason_code == "participant_chat_disabled" then squadPromptType.ParticipantChatDisabled else squadPromptType.Error
			})
			
			if p1.onErrorCallback then
				p1.onErrorCallback()
			end
		end)
	end
end