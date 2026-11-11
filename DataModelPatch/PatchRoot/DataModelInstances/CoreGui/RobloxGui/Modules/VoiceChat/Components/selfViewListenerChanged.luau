local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")

return {
	selfViewVisibilityUpdatedSignal = require(RobloxGui.Modules.SelfView.selfViewVisibilityUpdatedSignal),
	getSelfViewVisibility = require(RobloxGui.Modules.SelfView.publicApi).getSelfViewIsOpenAndVisible
}