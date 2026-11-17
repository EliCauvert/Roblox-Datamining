local CoreGui = game:GetService("CoreGui")
local LocalizationService = game:GetService("LocalizationService")
local InExperienceCloudPlay = script:FindFirstAncestor("InExperienceCloudPlay")
local Parent = InExperienceCloudPlay.Parent
local FoundationModule = require(Parent.Foundation)
local Localization = require(Parent.InExperienceLocales).Localization
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local TransientUIOverlayModule = require(Parent.TransientUIOverlay)
local RestyleTimeLimitSnackbarModule = require(InExperienceCloudPlay.Components.RestyleTimeLimitSnackbar)
local ShowUnsuccessfulJoinSnackbarModule = require(InExperienceCloudPlay.showUnsuccessfulJoinSnackbar)
local CloudPlayUIOverlayDisplayOrder = game:DefineFastInt("CloudPlayUIOverlayDisplayOrder", 6)

return function()
	-- upvalues: CoreGui (copy), Localization (copy), LocalizationService (copy), ReactRobloxModule (copy), ReactModule (copy), LocalizationProvider (copy), FoundationModule (copy), TransientUIOverlayModule (copy), CloudPlayUIOverlayDisplayOrder (copy), RestyleTimeLimitSnackbarModule (copy), ShowUnsuccessfulJoinSnackbarModule (copy)
	local InExperienceCloudPlay = Instance.new("Folder")
	InExperienceCloudPlay.Name = "InExperienceCloudPlay"
	InExperienceCloudPlay.Parent = CoreGui
	local NewLocalization = Localization.new(LocalizationService.RobloxLocaleId)
	local Root = ReactRobloxModule.createRoot(InExperienceCloudPlay)
	Root:render(ReactModule.createElement(LocalizationProvider, { localization = NewLocalization }, {
		Foundation = ReactModule.createElement(FoundationModule.FoundationProvider, { colorMode = FoundationModule.Enums.ColorMode.Dark }, {
			OverlayScreen = ReactModule.createElement(TransientUIOverlayModule.OverlayScreen, { displayOrder = CloudPlayUIOverlayDisplayOrder }),
			RestyleTimeLimitSnackbar = ReactModule.createElement(RestyleTimeLimitSnackbarModule)
		})
	}))
	ShowUnsuccessfulJoinSnackbarModule(NewLocalization)
	
	return Root
end