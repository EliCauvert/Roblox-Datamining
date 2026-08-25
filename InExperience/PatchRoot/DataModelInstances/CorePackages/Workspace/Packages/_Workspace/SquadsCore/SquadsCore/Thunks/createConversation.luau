local httpService = game:GetService("HttpService")
local squadPromptTypeModule = require(script:FindFirstAncestor("SquadsCore").Enums.SquadPromptType)

return function(p0)
	-- upvalues: httpService (ref), squadPromptTypeModule (ref)
	return function(p1)
		-- upvalues: p0 (ref), httpService (copy), squadPromptTypeModule (copy)
		p1:dispatch(p0.squadContext.createConversation(p0.conversationType, p0.userIds, nil, p0.source)):andThen(function(p3)
			-- upvalues: p0 (copy)
			if p0.onSuccessCallback then
				p0.onSuccessCallback(p3.id)
			end
		end):catch(function(p2)
			-- upvalues: httpService (copy), p0 (copy), p1 (ref), squadPromptTypeModule (copy)
			local ok, status = pcall(function()
				-- upvalues: httpService (copy), p2 (ref)
				return httpService:JSONDecode(p2.Body)
			end)
			p0.squadContext.setSquadPrompt(p1, {
				hideCancelButton = true,
				promptType = if ok and status and status.reason_code == "participant_chat_disabled" then squadPromptTypeModule.ParticipantChatDisabled else squadPromptTypeModule.Error
			})
			
			if p0.onErrorCallback then
				p0.onErrorCallback()
			end
		end)
	end
end