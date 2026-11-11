local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local MakeBackButtonModule = require(Modules.LuaApp.Components.TopBar.Buttons.makeBackButton)
local ReactModule = require(CorePackages.Packages.React)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local TopBarConstantsModule = require(Modules.LuaApp.Components.TopBar.TopBarConstants)
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals
local UseInitializedValueFunction = require(CorePackages.Packages.ReactUtils).useInitializedValue
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local CryoModule = require(CorePackages.Packages.Cryo)
local AXRestoreBackButtonForTouch = game:DefineFastFlag("AXRestoreBackButtonForTouch", false)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local FFlagAXCustomizeMakeupSupport = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXCustomizeMakeupSupport
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole

local function selectTabBarVisible(p1)
	return p1.TabBarVisible
end

return function(p1, CustomIcon)
	-- upvalues: UseInitializedValueFunction (copy), MakeBackButtonModule (copy), AXRestoreBackButtonForTouch (copy), UseSelectorFunction (copy), selectTabBarVisible (copy), GetUseSelectorDeepEqualsFunction (copy), DeviceOrientationMode (copy), UseAvatarRouteFunction (copy), AvatarScreen (copy), UsePreferredInputFunction (copy), ResponsiveModule (copy), FFlagEnableLeftNavOnConsole (copy), FFlagAXCustomizeMakeupSupport (copy), ReactModule (copy), TopBarConstantsModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), CryoModule (copy)
	return function(p2)
		-- upvalues: UseInitializedValueFunction (upval), MakeBackButtonModule (upval), p1 (copy), AXRestoreBackButtonForTouch (upval), UseSelectorFunction (upval), selectTabBarVisible (upval), GetUseSelectorDeepEqualsFunction (upval), DeviceOrientationMode (upval), UseAvatarRouteFunction (upval), AvatarScreen (upval), UsePreferredInputFunction (upval), ResponsiveModule (upval), FFlagEnableLeftNavOnConsole (upval), FFlagAXCustomizeMakeupSupport (upval), ReactModule (upval), TopBarConstantsModule (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), CustomIcon (copy), CryoModule (upval)
		local UseInitializedValueResult = UseInitializedValueFunction(function()
			-- upvalues: MakeBackButtonModule (upval), p1 (upval)
			return MakeBackButtonModule(p1)
		end)
		local UseSelectorResult = if AXRestoreBackButtonForTouch then UseSelectorFunction(selectTabBarVisible, GetUseSelectorDeepEqualsFunction()) else nil
		local UseSelectorResult1 = UseSelectorFunction(function(p3): boolean
			-- upvalues: DeviceOrientationMode (upval)
			return p3.DeviceOrientation == DeviceOrientationMode.Portrait
		end, GetUseSelectorDeepEqualsFunction())
		local UseAvatarRouteResult = UseAvatarRouteFunction()
		local IsNameMatch = UseAvatarRouteResult.current.name == AvatarScreen.SortAndFilters
		local IsNameMatch1: boolean = UseSelectorResult1 and IsNameMatch
		local IsNotUsePreferredInputResultMatch = UsePreferredInputFunction() ~= ResponsiveModule.Input.Directional or FFlagEnableLeftNavOnConsole
		
		if AXRestoreBackButtonForTouch then
			IsNotUsePreferredInputResultMatch = IsNotUsePreferredInputResultMatch and UseSelectorResult
		end
		if IsNotUsePreferredInputResultMatch then
			if FFlagAXCustomizeMakeupSupport then
				local IsNotNameMatch: boolean = not UseSelectorResult1 and (UseAvatarRouteResult.current.name ~= AvatarScreen.LayeredClothingSort and UseAvatarRouteResult.current.name ~= AvatarScreen.LayeredMakeupSort)
				IsNameMatch1 = IsNameMatch1 or IsNotNameMatch
			else
				local IsNotNameMatch: boolean = not UseSelectorResult1 and UseAvatarRouteResult.current.name ~= AvatarScreen.LayeredClothingSort
				IsNameMatch1 = IsNameMatch1 or IsNotNameMatch
			end
		end
		return if IsNameMatch1 then ReactModule.createElement("TextButton", {
			Active = false,
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			Text = "",
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(TopBarConstantsModule.BACK_BUTTON_SIZE, TopBarConstantsModule.BACK_BUTTON_SIZE),
			Selectable = not FFlagAXMigrateAXToGlobalAutofocus and nil
		}) else ReactModule.createElement(UseInitializedValueResult, if CustomIcon then CryoModule.Dictionary.join(p2, { customIcon = CustomIcon }) else p2)
	end
end