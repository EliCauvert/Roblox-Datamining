local Chat = game:GetService("Chat")
local Parent = script:FindFirstAncestor("ExpChat").Parent
local ReactModule = require(Parent.React)
local SocialUpsellEventReceiver = require(Parent.SocialUpsell).SocialUpsellEventReceiver

return function()
	-- upvalues: ReactModule (copy), Chat (copy), SocialUpsellEventReceiver (copy)
	return ReactModule.createElement(SocialUpsellEventReceiver, {
		onAgeVerifiedChange = ReactModule.useCallback(function()
			-- upvalues: Chat (upval)
			if game:GetEngineFeature("ChatReconcileAccess") then
				Chat:ReconcileCommunicationAccess()
			end
		end, {})
	})
end