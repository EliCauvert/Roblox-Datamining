local reactModule = require(script:FindFirstAncestor("AvatarExperienceSave").Parent.React)
local avatarSaveContextModule = require(script.Parent.AvatarSaveContext)

return function()
	-- upvalues: reactModule (ref), avatarSaveContextModule (ref)
	local var2 = reactModule.useContext(avatarSaveContextModule)
	assert(var2, "useAvatarSaveContext returned nil, usually this means the AvatarSaveContextProvider is not present in the tree")
	
	return var2
end