local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local AnalyticsModule1 = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local FFlagAXEnableFoundationSegmentedMenu = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableFoundationSegmentedMenu
local AXSegmentedControlMenuModule = if FFlagAXEnableFoundationSegmentedMenu then require(Modules.AvatarExperience.Common.Components.AXSegmentedControlMenu) else nil
local SegmentedControl = require(CorePackages.Packages.UIBlox).App.Control.SegmentedControl

local function TwoTabSegmentedMenu(p1)
	-- upvalues: ReactModule (copy), UseRoactServiceModule (copy), AnalyticsModule (copy), AnalyticsModule1 (copy), UseNavigationFunction (copy), UseAvatarRouteFunction (copy), AvatarScreen (copy), FormFactor (copy), UseLocalizationFunction (copy), RoactGamepadModule (copy), SegmentedControl (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(234)
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
	local UseRoactServiceModuleResult1 = UseRoactServiceModule(AnalyticsModule1)
	local UseNavigationResult = UseNavigationFunction()
	local Name = UseAvatarRouteFunction().opaque.name
	local IsFormFactorMatch = p1.formFactor == FormFactor.WIDE
	local UseLocalizationResult = UseLocalizationFunction({
		shopText = "Feature.Avatar.Action.Marketplace",
		customizeText = "Feature.Catalog.Action.Customize"
	})
	
	return ReactModule.createElement(RoactGamepadModule.Focusable.Frame, {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		[ReactModule.Change.AbsoluteSize] = ReactModule.useCallback(function(Frame)
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(if Frame.AbsoluteSize.X >= 234 then 234 else 224)
		end, {})
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		SegmentedControl = ReactModule.createElement(SegmentedControl, {
			width = UDim.new(0, UseStateResult),
			maxWidth = if IsFormFactorMatch then nil else 234,
			selectedTabIndex = if Name == AvatarScreen.Catalog then 1 else 2,
			onTabActivated = ReactModule.useCallback(function(p2)
				-- upvalues: Name (copy), AvatarScreen (upval), UseNavigationResult (copy), UseRoactServiceModuleResult (copy), UseRoactServiceModuleResult1 (copy)
				if p2 == 1 and Name ~= AvatarScreen.Catalog then
					UseNavigationResult.navigate(AvatarScreen.Catalog)
					UseRoactServiceModuleResult.avatarToCatalogButton()
					
					return
				end
				if p2 == 2 and Name ~= AvatarScreen.AvatarEditor then
					UseNavigationResult.navigate(AvatarScreen.AvatarEditor)
					UseRoactServiceModuleResult1.catalogToAvatarButton()
				end
			end, {
				UseNavigationResult,
				UseRoactServiceModuleResult,
				UseRoactServiceModuleResult1,
				Name
			}),
			tabs = {
				{ tabName = UseLocalizationResult.shopText },
				{ tabName = UseLocalizationResult.customizeText }
			}
		})
	})
end

return function(p1)
	-- upvalues: FFlagAXEnableFoundationSegmentedMenu (copy), ReactModule (copy), AXSegmentedControlMenuModule (copy), TwoTabSegmentedMenu (copy)
	return if FFlagAXEnableFoundationSegmentedMenu then ReactModule.createElement(AXSegmentedControlMenuModule, p1) else ReactModule.createElement(TwoTabSegmentedMenu, p1)
end