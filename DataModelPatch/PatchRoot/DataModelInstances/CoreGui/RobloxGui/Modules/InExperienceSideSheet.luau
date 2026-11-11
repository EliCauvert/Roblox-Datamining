local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")

return (require(game:GetService("CorePackages").Workspace.Packages.InExperienceSideSheet).SideSheet.createSideSheet({
	require(RobloxGui.Modules.VoiceChat.VoiceStateContext).Provider
}, { ChatSelector = require(RobloxGui.Modules.ChatSelector) }, require(RobloxGui.Modules.TopBar).store))