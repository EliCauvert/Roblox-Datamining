local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local RobloxGui = CoreGui:WaitForChild("RobloxGui")
local EnabledFunction = require(CorePackages.Workspace.Packages.Chrome).Enabled
local CapturesInExperienceModule = require(CorePackages.Workspace.Packages.CapturesInExperience)
local App = CapturesInExperienceModule.App.createApp()
local ScreenshotsCarousel = Instance.new("ScreenGui")
ScreenshotsCarousel.DisplayOrder = CapturesInExperienceModule.Constants.CarouselDisplayOrder
ScreenshotsCarousel.Name = "ScreenshotsCarousel"
ScreenshotsCarousel.ResetOnSpawn = false
ScreenshotsCarousel.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
ScreenshotsCarousel.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenshotsCarousel.Parent = CoreGui
local CaptureManager = Instance.new("ScreenGui")
CaptureManager.DisplayOrder = CapturesInExperienceModule.Constants.CarouselDisplayOrder
CaptureManager.Name = "CaptureManager"
CaptureManager.ResetOnSpawn = false
CaptureManager.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
CaptureManager.Parent = CoreGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.DisplayOrder = CapturesInExperienceModule.Constants.OverlayDisplayOrder
ScreenGui.Name = CapturesInExperienceModule.Constants.OverlayName
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = CoreGui
local MomentsCreationFlow = Instance.new("ScreenGui")
MomentsCreationFlow.DisplayOrder = CapturesInExperienceModule.Constants.CreationFlowDisplayOrder
MomentsCreationFlow.Name = "MomentsCreationFlow"
MomentsCreationFlow.ResetOnSpawn = false
MomentsCreationFlow.ScreenInsets = Enum.ScreenInsets.None
MomentsCreationFlow.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
MomentsCreationFlow.Parent = CoreGui
App.mountCaptureManager(CaptureManager)
App.mountCarousel(ScreenshotsCarousel)
App.mountCoreUI(RobloxGui, EnabledFunction())
App.mountCaptureOverlay(ScreenGui)
App.mountMomentsCreationFlow(MomentsCreationFlow)

return App