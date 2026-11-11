local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(game:GetService("CorePackages").Packages.React)
local UseEditEmotesPagePropsModule = require(Modules.AvatarExperience.EditEmotes.useEditEmotesPageProps)
local EditEmotesPageModule = require(Modules.AvatarExperience.EditEmotes.EditEmotesPage)

return (require(Modules.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)(function()
	-- upvalues: UseEditEmotesPagePropsModule (copy), ReactModule (copy), EditEmotesPageModule (copy)
	return ReactModule.createElement(EditEmotesPageModule, (UseEditEmotesPagePropsModule()))
end))