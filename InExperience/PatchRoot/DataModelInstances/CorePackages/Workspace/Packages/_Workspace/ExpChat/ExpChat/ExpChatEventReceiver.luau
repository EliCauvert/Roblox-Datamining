local chatService = game:GetService("Chat")
local parent = script:FindFirstAncestor("ExpChat").Parent
local reactModule = require(parent.React)
local socialUpsellEventReceiver = require(parent.SocialUpsell).SocialUpsellEventReceiver

return function()
	-- upvalues: reactModule (ref), chatService (ref), socialUpsellEventReceiver (ref)
	return reactModule.createElement(socialUpsellEventReceiver, {
		onAgeVerifiedChange = reactModule.useCallback(function()
			-- upvalues: chatService (copy)
			if game:GetEngineFeature("ChatReconcileAccess") then
				chatService:ReconcileCommunicationAccess()
			end
		end, {})
	})
end