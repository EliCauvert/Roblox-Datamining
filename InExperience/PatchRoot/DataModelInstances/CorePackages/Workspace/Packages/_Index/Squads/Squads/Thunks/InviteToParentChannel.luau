local httpService = game:GetService("HttpService")
local squadPromptType = require(script:FindFirstAncestor("Squads").Parent.SquadsCore.Enums).SquadPromptType

return function(p0) --[[ line: 8 ]]
	-- upvalues: httpService (ref), squadPromptType (ref)
	return function(p1) --[[ line: 16 ]]
		-- upvalues: p0 (ref), httpService (copy), squadPromptType (copy)
		return p0.squadExternalContext.inviteToParentChannel(p0.dispatch, p0.parentChannel, p0.userIds):andThen(function(p3) --[[ line: 19 ]]
			-- upvalues: p0 (copy)
			if p0.onSuccessCallback then
				p0.onSuccessCallback(p3)
			end
		end):catch(function(p2) --[[ line: 24 ]]
			-- upvalues: httpService (copy), p0 (copy), p1 (ref), squadPromptType (copy)
			local ok, status = pcall(function() --[[ line: 25 ]]
				-- upvalues: httpService (copy), p2 (ref)
				return httpService:JSONDecode(p2.Body)
			end)
			p0.squadExternalContext.setSquadPrompt(p1, {
				hideCancelButton = true,
				promptType = if ok and status and status.reason_code == "participant_chat_disabled" then squadPromptType.ParticipantChatDisabled else squadPromptType.Error
			})
			
			if p0.onErrorCallback then
				p0.onErrorCallback()
			end
		end)
	end
end