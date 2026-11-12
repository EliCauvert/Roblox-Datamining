local CoreGui = game:GetService("CoreGui")
local InExperienceCloudPlay = script:FindFirstAncestor("InExperienceCloudPlay")
local Parent = InExperienceCloudPlay.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local TransientUIOverlayModule = require(Parent.TransientUIOverlay)
local RestyleTimeLimitSnackbarModule = require(InExperienceCloudPlay.Components.RestyleTimeLimitSnackbar)
local ShowUnsuccessfulJoinSnackbarModule = require(InExperienceCloudPlay.showUnsuccessfulJoinSnackbar)
local CloudPlayUIOverlayDisplayOrder = game:DefineFastInt("CloudPlayUIOverlayDisplayOrder", 6)

return function()
	-- upvalues: CoreGui (copy), ReactRobloxModule (copy), ReactModule (copy), FoundationModule (copy), TransientUIOverlayModule (copy), CloudPlayUIOverlayDisplayOrder (copy), RestyleTimeLimitSnackbarModule (copy), ShowUnsuccessfulJoinSnackbarModule (copy)
	local InExperienceCloudPlay = Instance.new("Folder")
	InExperienceCloudPlay.Name = "InExperienceCloudPlay"
	InExperienceCloudPlay.Parent = CoreGui
	local Root = ReactRobloxModule.createRoot(InExperienceCloudPlay)
	Root:render(ReactModule.createElement(FoundationModule.FoundationProvider, { colorMode = FoundationModule.Enums.ColorMode.Dark }, {
		OverlayScreen = ReactModule.createElement(TransientUIOverlayModule.OverlayScreen, { displayOrder = CloudPlayUIOverlayDisplayOrder }),
		RestyleTimeLimitSnackbar = ReactModule.createElement(RestyleTimeLimitSnackbarModule)
	}))
	ShowUnsuccessfulJoinSnackbarModule()
	
	return Root
end