local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local _ = require(game:GetService("CorePackages").Packages.Cryo)
local typesModule = require(script.Parent.Parent.Types)
local maybeAssertModule = require(script.Parent.Parent.Helpers.maybeAssert)
local addMessageModule = require(script.Parent.AddMessage)
local removeMessageModule = require(script.Parent.RemoveMessage)
local getSettingsForMessageModule = require(script.Parent.Parent.Helpers.getSettingsForMessage)
local bubbleChatAddMessageRolloutPercent = game:DefineFastInt("BubbleChatAddMessageRolloutPercent", 100)

return function(p0)
	-- upvalues: maybeAssertModule (ref), typesModule (ref), addMessageModule (ref), getSettingsForMessageModule (ref), removeMessageModule (ref), rbxAnalyticsService (ref), bubbleChatAddMessageRolloutPercent (ref)
	maybeAssertModule(typesModule.IMessage(p0))
	
	return function(p1)
		-- upvalues: addMessageModule (copy), p0 (ref), getSettingsForMessageModule (copy), removeMessageModule (copy), rbxAnalyticsService (copy), bubbleChatAddMessageRolloutPercent (copy)
		p1:dispatch(addMessageModule(p0))
		local var7 = getSettingsForMessageModule(p1:getState().chatSettings, p0)
		local userId = p1:getState().userMessages[p0.userId]
		local messages = p1:getState().messages
		
		for i = 1, #userId - var7.MaxBubbles do
			p1:dispatch(removeMessageModule(messages[userId[i]]))
		end
		rbxAnalyticsService:ReportCounter("RoactBubbleChat-MessagesSent")
		
		if math.random(1, 100) <= bubbleChatAddMessageRolloutPercent then
			rbxAnalyticsService:SendEventDeferred("client", "bubbleChatMetric", "messageAdded", { placeId = game.PlaceId, senderUserId = p0.userId })
		end
		wait(var7.BubbleDuration)
		p1:dispatch(removeMessageModule(p0))
	end
end