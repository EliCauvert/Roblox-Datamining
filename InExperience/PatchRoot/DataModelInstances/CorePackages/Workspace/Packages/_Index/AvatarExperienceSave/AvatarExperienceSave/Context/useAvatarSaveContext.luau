local reactModule = require(script:FindFirstAncestor("AvatarExperienceSave").Parent.React)
local avatarSaveContextModule = require(script.Parent.AvatarSaveContext)

return function()
	-- upvalues: reactModule (ref), avatarSaveContextModule (ref)
	local var1 = reactModule.useContext(avatarSaveContextModule)
	assert(var1, "useAvatarSaveContext returned nil, usually this means the AvatarSaveContextProvider is not present in the tree")
	
	return var1
end