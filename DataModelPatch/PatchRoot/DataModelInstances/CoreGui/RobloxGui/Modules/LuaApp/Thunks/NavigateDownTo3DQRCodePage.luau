local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local NavigateDownToAvatarScreenModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.NavigateDownToAvatarScreen)
local ProfileQRCodeUniversalAppWrapperModule = require(Modules.LuaApp.Components.ProfileQRCodePage.ProfileQRCodeUniversalAppWrapper)
local TitleKey = require(Modules.LuaApp.Components.ProfileQRCodePage.api).TitleKey
local CryoModule = require(CorePackages.Packages.Cryo)
local FullscreenPageWithSafeAreaModule = require(Modules.LuaApp.Components.FullscreenPageWithSafeArea)

return function(p1)
	-- upvalues: ReactModule (copy), FullscreenPageWithSafeAreaModule (copy), ProfileQRCodeUniversalAppWrapperModule (copy), CryoModule (copy), TitleKey (copy), NavigateDownToAvatarScreenModule (copy), AvatarScreen (copy)
	return NavigateDownToAvatarScreenModule(AvatarScreen.AvatarBackground, "QRCode", {
		playEmote = true,
		isTopBarVisible = false,
		renderContent = function(p2)
			-- upvalues: ReactModule (upval), FullscreenPageWithSafeAreaModule (upval), ProfileQRCodeUniversalAppWrapperModule (upval), CryoModule (upval), p1 (copy)
			return ReactModule.createElement(FullscreenPageWithSafeAreaModule, { includeStatusBar = true, BackgroundTransparency = 1 }, {
				QRCode = ReactModule.createElement(ProfileQRCodeUniversalAppWrapperModule, CryoModule.Dictionary.join(p1, p2))
			})
		end,
		title = TitleKey
	})
end