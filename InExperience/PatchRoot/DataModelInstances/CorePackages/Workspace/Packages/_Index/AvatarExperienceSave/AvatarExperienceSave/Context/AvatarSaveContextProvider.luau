local reactModule = require(script:FindFirstAncestor("AvatarExperienceSave").Parent.React)
local avatarSaveContextModule = require(script.Parent.AvatarSaveContext)
local useAvatarSaveContextProviderValueModule = require(script.Parent.useAvatarSaveContextProviderValue)

return function(p0) --[[ line: 9 | named "AvatarSaveContextProvider" ]]
	-- upvalues: useAvatarSaveContextProviderValueModule (ref), reactModule (ref), avatarSaveContextModule (ref)
	return reactModule.createElement(avatarSaveContextModule.Provider, { value = useAvatarSaveContextProviderValueModule() }, p0.children)
end