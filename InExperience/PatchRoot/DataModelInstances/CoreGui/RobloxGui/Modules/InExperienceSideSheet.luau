local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")

return require(game:GetService("CorePackages").Workspace.Packages.InExperienceSideSheet).SideSheet.createSideSheet({
	require(robloxGui.Modules.VoiceChat.VoiceStateContext).Provider
}, { ChatSelector = require(robloxGui.Modules.ChatSelector) }, require(robloxGui.Modules.TopBar).store)