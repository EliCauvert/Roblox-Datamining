local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local View = FoundationModule.View
local SegmentedControl = FoundationModule.SegmentedControl
local InputSize = FoundationModule.Enums.InputSize
local BuilderIconsModule = require(CorePackages.Packages.BuilderIcons)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local AnalyticsModule1 = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local FFlagAXEnableProfileTab = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXEnableProfileTab
local config = {
	Catalog = AvatarScreen.Catalog,
	Customize = AvatarScreen.AvatarEditor,
	Profile = AvatarScreen.Profile
}
local ShoppingBasket = BuilderIconsModule.Icon.ShoppingBasket
local Backpack = BuilderIconsModule.Icon.Backpack
local CirclePerson = BuilderIconsModule.Icon.CirclePerson

return function(p1)
	-- upvalues: UseRoactServiceFunction (copy), AnalyticsModule (copy), AnalyticsModule1 (copy), UseNavigationFunction (copy), UseAvatarRouteFunction (copy), FormFactor (copy), UseLocalizationFunction (copy), ReactModule (copy), ShoppingBasket (copy), Backpack (copy), FFlagAXEnableProfileTab (copy), CirclePerson (copy), AvatarScreen (copy), config (copy), View (copy), SegmentedControl (copy), InputSize (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(AnalyticsModule)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AnalyticsModule1)
	local UseNavigationResult = UseNavigationFunction()
	local Name = UseAvatarRouteFunction().opaque.name
	local IsFormFactorMatch = p1.formFactor == FormFactor.WIDE
	local UseLocalizationResult = UseLocalizationFunction({
		shopText = "Feature.Avatar.Action.Marketplace",
		customizeText = "Feature.Catalog.Action.Customize",
		profileText = "CommonUI.Features.Label.Profile"
	})
	
	return ReactModule.createElement(View, {
		tag = "size-full",
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}
	}, {
		SegmentedControl = ReactModule.createElement(SegmentedControl, {
			isCircular = true,
			size = InputSize.Medium,
			segments = ReactModule.useMemo(function()
				-- upvalues: IsFormFactorMatch (copy), UseLocalizationResult (copy), ShoppingBasket (upval), Backpack (upval), FFlagAXEnableProfileTab (upval), CirclePerson (upval)
				local List = if IsFormFactorMatch then {
					{ id = "Catalog", text = UseLocalizationResult.shopText },
					{
						id = "Customize",
						text = UseLocalizationResult.customizeText
					}
				} else {
					{ id = "Catalog", icon = ShoppingBasket },
					{ id = "Customize", icon = Backpack }
				}
				
				if FFlagAXEnableProfileTab then
					table.insert(List, if IsFormFactorMatch then { id = "Profile", text = UseLocalizationResult.profileText } else { id = "Profile", icon = CirclePerson })
				end
				return List
			end, {
				IsFormFactorMatch,
				UseLocalizationResult.shopText,
				UseLocalizationResult.customizeText,
				UseLocalizationResult.profileText
			}),
			value = if Name == AvatarScreen.Catalog then "Catalog" elseif Name == AvatarScreen.Profile then "Profile" else "Customize",
			onActivated = ReactModule.useCallback(function(p2)
				-- upvalues: config (upval), Name (copy), UseNavigationResult (copy), AvatarScreen (upval), UseRoactServiceResult (copy), UseRoactServiceResult1 (copy)
				local Entry = config[tostring(p2)]
				
				if not Entry or Entry == Name then return end
				UseNavigationResult.navigate(Entry)
				
				if Entry == AvatarScreen.Catalog then
					UseRoactServiceResult.avatarToCatalogButton()
					
					return
				end
				if Entry == AvatarScreen.AvatarEditor then
					UseRoactServiceResult1.catalogToAvatarButton()
				end
			end, {
				UseNavigationResult,
				UseRoactServiceResult,
				UseRoactServiceResult1,
				Name
			})
		})
	})
end