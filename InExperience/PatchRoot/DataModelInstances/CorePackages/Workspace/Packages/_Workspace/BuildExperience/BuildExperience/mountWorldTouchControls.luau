local CoreGui = game:GetService("CoreGui")
local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local ReactRobloxModule = require(Parent.ReactRoblox)
local LibraryThemeProviderModule = require(BuildExperience.Components.Library.LibraryThemeProvider)
local WorldTouchControlsContainerModule = require(BuildExperience.Components.WorldTouchControls.WorldTouchControlsContainer)
local _ = require(BuildExperience.WorldTouchControls.createWorldTouchInput)

return function(TouchInput)
	-- upvalues: CoreGui (copy), ReactRobloxModule (copy), ReactFocusNavigationModule (copy), ReactModule (copy), LibraryThemeProviderModule (copy), FocusNavigationUtilsModule (copy), WorldTouchControlsContainerModule (copy)
	local BuildExperienceWorldTouchControls = Instance.new("ScreenGui")
	BuildExperienceWorldTouchControls.Name = "BuildExperienceWorldTouchControls"
	BuildExperienceWorldTouchControls.ResetOnSpawn = false
	BuildExperienceWorldTouchControls.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	BuildExperienceWorldTouchControls.DisplayOrder = 8
	BuildExperienceWorldTouchControls.Parent = CoreGui
	local Root = ReactRobloxModule.createRoot(BuildExperienceWorldTouchControls)
	Root:render(ReactModule.createElement(LibraryThemeProviderModule, { displayOrder = 8 }, {
		FocusNavigation = ReactModule.createElement(ReactFocusNavigationModule.FocusNavigationContext.Provider, {
			value = ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
		}, {
			Registry = ReactModule.createElement(FocusNavigationUtilsModule.FocusNavigableSurfaceRegistry.Provider, nil, {
				Controls = ReactModule.createElement(WorldTouchControlsContainerModule, {
					touchInput = TouchInput,
					screen = BuildExperienceWorldTouchControls
				})
			})
		})
	}))
	
	return Root
end