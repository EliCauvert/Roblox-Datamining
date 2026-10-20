local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local _ = require(game:GetService("CorePackages").Packages.Cryo)
local TypesModule = require(script.Parent.Parent.Types)
local MaybeAssertModule = require(script.Parent.Parent.Helpers.maybeAssert)
local AddMessageModule = require(script.Parent.AddMessage)
local RemoveMessageModule = require(script.Parent.RemoveMessage)
local GetSettingsForMessageModule = require(script.Parent.Parent.Helpers.getSettingsForMessage)
local BubbleChatAddMessageRolloutPercent = game:DefineFastInt("BubbleChatAddMessageRolloutPercent", 100)

return function(p1)
	-- upvalues: MaybeAssertModule (copy), TypesModule (copy), AddMessageModule (copy), GetSettingsForMessageModule (copy), RemoveMessageModule (copy), RbxAnalyticsService (copy), BubbleChatAddMessageRolloutPercent (copy)
	MaybeAssertModule(TypesModule.IMessage(p1))
	
	return function(p2)
		-- upvalues: AddMessageModule (upval), p1 (copy), GetSettingsForMessageModule (upval), RemoveMessageModule (upval), RbxAnalyticsService (upval), BubbleChatAddMessageRolloutPercent (upval)
		p2:dispatch(AddMessageModule(p1))
		local SettingsForMessageModule = GetSettingsForMessageModule(p2:getState().chatSettings, p1)
		local UserMessage = p2:getState().userMessages[p1.userId]
		local Messages = p2:getState().messages
		
		for i = 1, #UserMessage - SettingsForMessageModule.MaxBubbles do
			p2:dispatch(RemoveMessageModule(Messages[UserMessage[i]]))
		end
		RbxAnalyticsService:ReportCounter("RoactBubbleChat-MessagesSent")
		
		if math.random(1, 100) <= BubbleChatAddMessageRolloutPercent then
			RbxAnalyticsService:SendEventDeferred("client", "bubbleChatMetric", "messageAdded", { placeId = game.PlaceId, senderUserId = p1.userId })
		end
		wait(SettingsForMessageModule.BubbleDuration)
		p2:dispatch(RemoveMessageModule(p1))
	end
end