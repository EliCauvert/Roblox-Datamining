local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local reactRobloxModule = require(corePackagesService.Packages.ReactRoblox)
local voiceCallReceivedEventReceiverModule = require(corePackagesService.Workspace.Packages.FriendsCalling.VoiceCallReceivedEventReceiver)
local friendsCalling = Instance.new("Folder")
friendsCalling.Name = "FriendsCalling"
friendsCalling.Parent = coreGuiService
reactRobloxModule.createRoot(friendsCalling):render(reactModule.createElement(voiceCallReceivedEventReceiverModule))