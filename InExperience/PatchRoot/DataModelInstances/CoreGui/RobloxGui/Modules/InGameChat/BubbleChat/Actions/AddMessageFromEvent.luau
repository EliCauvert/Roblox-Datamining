local playersService = game:GetService("Players")
local expChatModule = require(game:GetService("CorePackages").Workspace.Packages.ExpChat)
local typesModule = require(script.Parent.Parent.Types)
local maybeAssertModule = require(script.Parent.Parent.Helpers.maybeAssert)
local addMessageWithTimeoutModule = require(script.Parent.AddMessageWithTimeout)

return function(p0) --[[ line: 17 | named "addMessageFromEvent" ]]
	-- upvalues: maybeAssertModule (ref), typesModule (ref), playersService (ref), expChatModule (ref), addMessageWithTimeoutModule (ref)
	maybeAssertModule(typesModule.IMessageData(p0))
	
	return function(p1) --[[ line: 20 ]]
		-- upvalues: playersService (copy), p0 (ref), expChatModule (copy), addMessageWithTimeoutModule (copy)
		local ok, status = pcall(function() --[[ line: 21 ]]
			-- upvalues: playersService (copy), p0 (copy)
			return playersService:GetPlayerByUserId(p0.SpeakerUserId)
		end)
		
		if ok and status then
			local character = status.Character
			
			if character then
				local t = {
					id = tostring(p0.ID),
					userId = tostring(p0.SpeakerUserId),
					name = p0.FromSpeaker,
					text = p0.Message or "",
					timestamp = p0.Time,
					adornee = character
				}
				expChatModule.Events.LegacyBubbleCreated(t)
				
				return p1:dispatch(addMessageWithTimeoutModule(t))
			end
		end
	end
end