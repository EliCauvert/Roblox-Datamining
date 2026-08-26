local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local _ = require(game:GetService("CorePackages").Packages.Cryo)
local typesModule = require(script.Parent.Parent.Types)
local maybeAssertModule = require(script.Parent.Parent.Helpers.maybeAssert)
local addMessageModule = require(script.Parent.AddMessage)
local removeMessageModule = require(script.Parent.RemoveMessage)
local getSettingsForMessageModule = require(script.Parent.Parent.Helpers.getSettingsForMessage)
local bubbleChatAddMessageRolloutPercent = game:DefineFastInt("BubbleChatAddMessageRolloutPercent", 100)

return function(p1)
	-- upvalues: maybeAssertModule (ref), typesModule (ref), addMessageModule (ref), getSettingsForMessageModule (ref), removeMessageModule (ref), rbxAnalyticsService (ref), bubbleChatAddMessageRolloutPercent (ref)
	maybeAssertModule(typesModule.IMessage(p1))
	
	return function(p2)
		-- upvalues: addMessageModule (copy), p1 (ref), getSettingsForMessageModule (copy), removeMessageModule (copy), rbxAnalyticsService (copy), bubbleChatAddMessageRolloutPercent (copy)
		p2:dispatch(addMessageModule(p1))
		local var1 = getSettingsForMessageModule(p2:getState().chatSettings, p1)
		local userId = p2:getState().userMessages[p1.userId]
		local messages = p2:getState().messages
		
		for i = 1, #userId - var1.MaxBubbles do
			p2:dispatch(removeMessageModule(messages[userId[i]]))
		end
		rbxAnalyticsService:ReportCounter("RoactBubbleChat-MessagesSent")
		
		if math.random(1, 100) <= bubbleChatAddMessageRolloutPercent then
			rbxAnalyticsService:SendEventDeferred("client", "bubbleChatMetric", "messageAdded", { placeId = game.PlaceId, senderUserId = p1.userId })
		end
		wait(var1.BubbleDuration)
		p2:dispatch(removeMessageModule(p1))
	end
end