local ReactModule = require(script:FindFirstAncestor("AvatarExperienceSave").Parent.React)
local AvatarSaveContextModule = require(script.Parent.AvatarSaveContext)

return function()
	-- upvalues: ReactModule (copy), AvatarSaveContextModule (copy)
	local UseContextResult = ReactModule.useContext(AvatarSaveContextModule)
	assert(UseContextResult, "useAvatarSaveContext returned nil, usually this means the AvatarSaveContextProvider is not present in the tree")
	
	return UseContextResult
end