local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local reactRobloxModule = require(corePackagesService.Packages.ReactRoblox)
local callPipModule = require(corePackagesService.Workspace.Packages.FriendsCalling.CallPip)
local callPipDisplayOrderModule = require(corePackagesService.Workspace.Packages.FriendsCalling.CallPipDisplayOrder)
local fFlagFriendsCallingCallPipModule = require(corePackagesService.Workspace.Packages.FriendsCalling.FFlagFriendsCallingCallPip)
local voiceCallReceivedEventReceiverModule = require(corePackagesService.Workspace.Packages.FriendsCalling.VoiceCallReceivedEventReceiver)
local friendsCalling = Instance.new("Folder")
friendsCalling.Name = "FriendsCalling"
friendsCalling.Parent = coreGuiService
reactRobloxModule.createRoot(friendsCalling):render(reactModule.createElement(reactModule.Fragment, nil, {
	CallPip = if fFlagFriendsCallingCallPipModule then reactModule.createElement(callPipModule, {
		host = {
			followsAppColorMode = false,
			displayOrder = callPipDisplayOrderModule.InExperience
		}
	}) else nil,
	VoiceCallReceivedEventReceiver = reactModule.createElement(voiceCallReceivedEventReceiverModule)
}))