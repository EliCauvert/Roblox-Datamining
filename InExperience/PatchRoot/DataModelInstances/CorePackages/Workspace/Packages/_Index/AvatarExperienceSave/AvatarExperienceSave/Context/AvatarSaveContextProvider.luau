local ReactModule = require(script:FindFirstAncestor("AvatarExperienceSave").Parent.React)
local AvatarSaveContextModule = require(script.Parent.AvatarSaveContext)
local UseAvatarSaveContextProviderValueModule = require(script.Parent.useAvatarSaveContextProviderValue)

return function(p1)
	-- upvalues: UseAvatarSaveContextProviderValueModule (copy), ReactModule (copy), AvatarSaveContextModule (copy)
	return ReactModule.createElement(AvatarSaveContextModule.Provider, { value = UseAvatarSaveContextProviderValueModule() }, p1.children)
end