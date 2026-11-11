local CorePackages = game:GetService("CorePackages")
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local CreateNavigatorFunction = RoactNavigationModule.createNavigator
local RobloxStackView = RoactNavigationModule.RobloxStackView
local RobloxAppNavigationCoreModule = require(CorePackages.Workspace.Packages.RobloxAppNavigationCore)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local AvatarExperienceStackRouterModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Components.RoactNavigation.AvatarExperienceStackRouter)

return function(p1, p2)
	-- upvalues: AvatarExperienceStackRouterModule (copy), CreateNavigatorFunction (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), RobloxAppNavigationCoreModule (copy), RobloxStackView (copy)
	return CreateNavigatorFunction(if FFlagAXMigrateAXToGlobalAutofocus then RobloxAppNavigationCoreModule.AppStackView else RobloxStackView, AvatarExperienceStackRouterModule(p1, p2), p2 or {})
end