local Players = game:GetService("Players")
local ExpChatModule = require(game:GetService("CorePackages").Workspace.Packages.ExpChat)
local TypesModule = require(script.Parent.Parent.Types)
local MaybeAssertModule = require(script.Parent.Parent.Helpers.maybeAssert)
local AddMessageWithTimeoutModule = require(script.Parent.AddMessageWithTimeout)

return function(p1) --[[ Line: 17 | Named "addMessageFromEvent" ]]
	-- upvalues: MaybeAssertModule (copy), TypesModule (copy), Players (copy), ExpChatModule (copy), AddMessageWithTimeoutModule (copy)
	MaybeAssertModule(TypesModule.IMessageData(p1))
	
	return function(p2) --[[ Line: 20 ]]
		-- upvalues: Players (upval), p1 (copy), ExpChatModule (upval), AddMessageWithTimeoutModule (upval)
		local Success, Result = pcall(function() --[[ Line: 21 ]]
			-- upvalues: Players (upval), p1 (upval)
			return Players:GetPlayerByUserId(p1.SpeakerUserId)
		end)
		
		if Success and Result then
			local Character = Result.Character
			
			if Character then
				local config = {
					id = tostring(p1.ID),
					userId = tostring(p1.SpeakerUserId),
					name = p1.FromSpeaker,
					text = p1.Message or "",
					timestamp = p1.Time,
					adornee = Character
				}
				ExpChatModule.Events.LegacyBubbleCreated(config)
				
				return p2:dispatch(AddMessageWithTimeoutModule(config))
			end
		end
	end
end