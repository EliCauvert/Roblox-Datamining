local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local MakeAvatarBackButtonModule = require(Modules.AvatarExperience.Common.Components.TopBar.makeAvatarBackButton)

local function selectIsPortrait(p1): boolean
	-- upvalues: DeviceOrientationMode (copy)
	return p1.DeviceOrientation == DeviceOrientationMode.Portrait
end

return function(p1)
	-- upvalues: UseNavigationFunction (copy), UseSelectorFunction (copy), selectIsPortrait (copy), UseLocalizationFunction (copy), ReactModule (copy), MakeAvatarBackButtonModule (copy), TopBarModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	
	return ReactModule.createElement(TopBarModule.Container, {
		transparentBackground = true,
		hideSiteMessageBanner = UseSelectorFunction(selectIsPortrait),
		ref = p1.topBarRef,
		titleText = UseLocalizationFunction({ title = "Feature.Catalog.Label.Favorites" }).title,
		leftItem = MakeAvatarBackButtonModule((ReactModule.useCallback(function()
			-- upvalues: UseNavigationResult (copy)
			UseNavigationResult.goBack()
		end, { UseNavigationResult }))),
		rightItems = {}
	})
end