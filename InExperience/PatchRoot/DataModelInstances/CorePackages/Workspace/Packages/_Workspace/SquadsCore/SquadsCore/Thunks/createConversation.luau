local httpService = game:GetService("HttpService")
local squadPromptTypeModule = require(script:FindFirstAncestor("SquadsCore").Enums.SquadPromptType)

return function(p1)
	-- upvalues: httpService (ref), squadPromptTypeModule (ref)
	return function(p2)
		-- upvalues: p1 (ref), httpService (copy), squadPromptTypeModule (copy)
		p2:dispatch(p1.squadContext.createConversation(p1.conversationType, p1.userIds, nil, p1.source)):andThen(function(p3)
			-- upvalues: p1 (copy)
			if p1.onSuccessCallback then
				p1.onSuccessCallback(p3.id)
			end
		end):catch(function(p3)
			-- upvalues: httpService (copy), p1 (copy), p2 (ref), squadPromptTypeModule (copy)
			local ok, status = pcall(function()
				-- upvalues: httpService (copy), p3 (ref)
				return httpService:JSONDecode(p3.Body)
			end)
			p1.squadContext.setSquadPrompt(p2, {
				hideCancelButton = true,
				promptType = if ok and status and status.reason_code == "participant_chat_disabled" then squadPromptTypeModule.ParticipantChatDisabled else squadPromptTypeModule.Error
			})
			
			if p1.onErrorCallback then
				p1.onErrorCallback()
			end
		end)
	end
end