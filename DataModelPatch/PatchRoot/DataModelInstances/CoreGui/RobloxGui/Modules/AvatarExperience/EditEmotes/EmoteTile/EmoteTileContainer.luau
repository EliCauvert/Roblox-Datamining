local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local DashModule = require(CorePackages.Packages.Dash)
local EmoteTileModule = require(Modules.AvatarExperience.EditEmotes.EmoteTile.EmoteTile)
local UseEmoteTilePropsModule = require(Modules.AvatarExperience.EditEmotes.EmoteTile.useEmoteTileProps)

return ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: UseEmoteTilePropsModule (copy), ReactModule (copy), EmoteTileModule (copy), DashModule (copy)
	return ReactModule.createElement(EmoteTileModule, DashModule.assign(UseEmoteTilePropsModule(p1, Ref), { ref = Ref }))
end)