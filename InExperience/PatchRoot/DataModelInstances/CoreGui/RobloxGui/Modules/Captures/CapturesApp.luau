local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local enabled = require(corePackagesService.Workspace.Packages.Chrome).Enabled
local capturesInExperienceModule = require(corePackagesService.Workspace.Packages.CapturesInExperience)
local var1 = capturesInExperienceModule.App.createApp()
local screenshotsCarousel = Instance.new("ScreenGui")
screenshotsCarousel.DisplayOrder = capturesInExperienceModule.Constants.CarouselDisplayOrder
screenshotsCarousel.Name = "ScreenshotsCarousel"
screenshotsCarousel.ResetOnSpawn = false
screenshotsCarousel.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
screenshotsCarousel.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenshotsCarousel.Parent = coreGuiService
local captureManager = Instance.new("ScreenGui")
captureManager.DisplayOrder = capturesInExperienceModule.Constants.CarouselDisplayOrder
captureManager.Name = "CaptureManager"
captureManager.ResetOnSpawn = false
captureManager.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
captureManager.Parent = coreGuiService
local screenGui_2 = Instance.new("ScreenGui")
screenGui_2.DisplayOrder = capturesInExperienceModule.Constants.OverlayDisplayOrder
screenGui_2.Name = capturesInExperienceModule.Constants.OverlayName
screenGui_2.ResetOnSpawn = false
screenGui_2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui_2.Parent = coreGuiService
local momentsCreationFlow = Instance.new("ScreenGui")
momentsCreationFlow.DisplayOrder = capturesInExperienceModule.Constants.CreationFlowDisplayOrder
momentsCreationFlow.Name = "MomentsCreationFlow"
momentsCreationFlow.ResetOnSpawn = false
momentsCreationFlow.ScreenInsets = Enum.ScreenInsets.None
momentsCreationFlow.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
momentsCreationFlow.Parent = coreGuiService
var1.mountCaptureManager(captureManager)
var1.mountCarousel(screenshotsCarousel)
var1.mountCoreUI(robloxGui, enabled())
var1.mountCaptureOverlay(screenGui_2)
var1.mountMomentsCreationFlow(momentsCreationFlow)

return var1