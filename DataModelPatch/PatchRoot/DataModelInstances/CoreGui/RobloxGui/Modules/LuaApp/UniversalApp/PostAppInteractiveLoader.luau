local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local AppStartupModule = require(CorePackages.Workspace.Packages.AppStartup)
local AppStartupSequence = AppStartupModule.AppStartupSequence
local PostAppInteractiveContainer = AppStartupModule.PostAppInteractiveContainer
local CreateLazyComponentFunction = require(CorePackages.Workspace.Packages.RoactUtils).Components.createLazyComponent
local LazyComponent = CreateLazyComponentFunction(function()
	-- upvalues: CorePackages (copy)
	return require(CorePackages.Workspace.Packages.QueryRefetch).QueryRefetchManager
end)
local LazyComponent1 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.ContactImporter.ContactImporterManagerWrapper)
end)
local LazyComponent2 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.AvatarExperience.Common.Components.AvatarExperienceMountedAtStartup)
end)
local LazyComponent3 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.UpdateRequiredPrompt)
end)

return function(_)
	-- upvalues: ReactModule (copy), PostAppInteractiveContainer (copy), AppStartupSequence (copy), LazyComponent (copy), LazyComponent1 (copy), LazyComponent2 (copy), LazyComponent3 (copy)
	return ReactModule.createElement(PostAppInteractiveContainer, { appStartupSequence = AppStartupSequence.default }, {
		QueryRefetchManager = ReactModule.createElement(LazyComponent),
		ContactImporterManager = ReactModule.createElement(LazyComponent1),
		AvatarExperienceMountedAtStartup = ReactModule.createElement(LazyComponent2),
		UpdateRequiredPrompt = ReactModule.createElement(LazyComponent3)
	})
end