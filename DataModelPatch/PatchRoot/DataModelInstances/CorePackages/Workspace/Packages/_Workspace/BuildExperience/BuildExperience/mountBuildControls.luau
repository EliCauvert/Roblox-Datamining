local CoreGui = game:GetService("CoreGui")
local LocalizationService = game:GetService("LocalizationService")
local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local Localization = require(Parent.RobloxAppLocales).Localization
local BuildExperienceCompositionStyleSheetModule = require(BuildExperience.Components.BuildExperienceCompositionStyleSheet)
local BuildControlsModule = require(BuildExperience.Components.BuildControls.BuildControls)

local function ConnectedBuildControls()
	-- upvalues: ReactModule (copy), Localization (copy), LocalizationService (copy), LocalizationProvider (copy), FoundationModule (copy), BuildExperienceCompositionStyleSheetModule (copy), View (copy), BuildControlsModule (copy), IconName (copy)
	return ReactModule.createElement(LocalizationProvider, {
		localization = ReactModule.useMemo(function()
			-- upvalues: Localization (upval), LocalizationService (upval)
			return Localization.new(LocalizationService.RobloxLocaleId)
		end, {})
	}, {
		FoundationProvider = ReactModule.createElement(FoundationModule.FoundationProvider, { theme = FoundationModule.Enums.Theme.Light }, {
			CompositionStyleSheet = ReactModule.createElement(BuildExperienceCompositionStyleSheetModule),
			Anchor = ReactModule.createElement(View, {
				tag = "auto-xy",
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, 0, 0, 0)
			}, {
				BuildControls = ReactModule.createElement(BuildControlsModule, { overflowIcon = IconName.ThreeDotsHorizontal })
			})
		})
	})
end

local LazyComponent = require(Parent.RoactUtils).Components.createLazyComponent(function()
	-- upvalues: ConnectedBuildControls (copy)
	return ConnectedBuildControls
end)

return function()
	-- upvalues: CoreGui (copy), ReactRobloxModule (copy), ReactModule (copy), LazyComponent (copy)
	local BuildExperienceBuildControls = Instance.new("ScreenGui")
	BuildExperienceBuildControls.Name = "BuildExperienceBuildControls"
	BuildExperienceBuildControls.ScreenInsets = Enum.ScreenInsets.TopbarSafeInsets
	BuildExperienceBuildControls.ResetOnSpawn = false
	BuildExperienceBuildControls.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	BuildExperienceBuildControls.Parent = CoreGui
	local Root = ReactRobloxModule.createRoot(BuildExperienceBuildControls)
	Root:render(ReactModule.createElement(LazyComponent))
	
	return Root
end