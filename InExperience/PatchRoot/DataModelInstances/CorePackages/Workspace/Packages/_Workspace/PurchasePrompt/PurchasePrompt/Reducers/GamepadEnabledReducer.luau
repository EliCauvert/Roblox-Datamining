local UserInputService = game:GetService("UserInputService")
local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return (require(PurchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer(UserInputService:GetPlatform() == Enum.Platform.XBoxOne or (UserInputService:GetPlatform() == Enum.Platform.PS4 or UserInputService:GetPlatform() == Enum.Platform.PS5), {
	[require(PurchasePrompt.Actions.SetGamepadEnabled).name] = function(_, p1) --[[ Line: 15 ]]
		return p1.enabled
	end
}))