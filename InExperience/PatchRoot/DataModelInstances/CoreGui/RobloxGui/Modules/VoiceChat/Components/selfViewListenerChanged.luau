local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")

return {
	selfViewVisibilityUpdatedSignal = require(robloxGui.Modules.SelfView.selfViewVisibilityUpdatedSignal),
	getSelfViewVisibility = require(robloxGui.Modules.SelfView.publicApi).getSelfViewIsOpenAndVisible
}