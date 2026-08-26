local playersService = game:GetService("Players")
local expChatModule = require(game:GetService("CorePackages").Workspace.Packages.ExpChat)
local typesModule = require(script.Parent.Parent.Types)
local maybeAssertModule = require(script.Parent.Parent.Helpers.maybeAssert)
local addMessageWithTimeoutModule = require(script.Parent.AddMessageWithTimeout)

return function(p1)
	-- upvalues: maybeAssertModule (ref), typesModule (ref), playersService (ref), expChatModule (ref), addMessageWithTimeoutModule (ref)
	maybeAssertModule(typesModule.IMessageData(p1))
	
	return function(p2)
		-- upvalues: playersService (copy), p1 (ref), expChatModule (copy), addMessageWithTimeoutModule (copy)
		local ok, status = pcall(function()
			-- upvalues: playersService (copy), p1 (copy)
			return playersService:GetPlayerByUserId(p1.SpeakerUserId)
		end)
		
		if ok and status then
			local character = status.Character
			
			if character then
				local t = {
					id = tostring(p1.ID),
					userId = tostring(p1.SpeakerUserId),
					name = p1.FromSpeaker,
					text = p1.Message or "",
					timestamp = p1.Time,
					adornee = character
				}
				expChatModule.Events.LegacyBubbleCreated(t)
				
				return p2:dispatch(addMessageWithTimeoutModule(t))
			end
		end
	end
end