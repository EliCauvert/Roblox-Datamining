local userInputService = game:GetService("UserInputService")
local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return require(purchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer(if userInputService:GetPlatform() ~= Enum.Platform.XBoxOne then if userInputService:GetPlatform() ~= Enum.Platform.PS4 then userInputService:GetPlatform() == Enum.Platform.PS5 else true else true, {
	[require(purchasePrompt.Actions.SetGamepadEnabled).name] = function(_, p0)
		return p0.enabled
	end
})