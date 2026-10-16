local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ReactRobloxModule = require(CorePackages.Packages.ReactRoblox)
local CallPipModule = require(CorePackages.Workspace.Packages.FriendsCalling.CallPip)
local CallPipDisplayOrderModule = require(CorePackages.Workspace.Packages.FriendsCalling.CallPipDisplayOrder)
local FFlagFriendsCallingCallPipModule = require(CorePackages.Workspace.Packages.FriendsCalling.FFlagFriendsCallingCallPip)
local VoiceCallReceivedEventReceiverModule = require(CorePackages.Workspace.Packages.FriendsCalling.VoiceCallReceivedEventReceiver)
local FriendsCalling = Instance.new("Folder")
FriendsCalling.Name = "FriendsCalling"
FriendsCalling.Parent = game:GetService("CoreGui")
local Host = {
	exposesTopSafeArea = true,
	followsAppColorMode = false,
	displayOrder = CallPipDisplayOrderModule.InExperience,
	screenInsets = Enum.ScreenInsets.None
}
ReactRobloxModule.createRoot(FriendsCalling):render(ReactModule.createElement(ReactModule.Fragment, nil, {
	CallPip = if FFlagFriendsCallingCallPipModule then ReactModule.createElement(CallPipModule, { host = Host }) else nil,
	VoiceCallReceivedEventReceiver = ReactModule.createElement(VoiceCallReceivedEventReceiverModule)
}))