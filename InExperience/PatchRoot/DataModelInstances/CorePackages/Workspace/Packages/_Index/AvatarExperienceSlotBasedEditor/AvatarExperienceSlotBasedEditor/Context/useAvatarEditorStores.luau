local ReactModule = require(script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent.React)
local AvatarEditorStoresModule = require(script.Parent.AvatarEditorStores)
local CreateAvatarEditorStoresModule = require(script.Parent.Parent.Stores.createAvatarEditorStores)

return function() --[[ Line: 14 | Named "useAvatarEditorStores" ]]
	-- upvalues: ReactModule (copy), AvatarEditorStoresModule (copy), CreateAvatarEditorStoresModule (copy)
	local UseContextResult = ReactModule.useContext(AvatarEditorStoresModule)
	
	if UseContextResult then
		return UseContextResult
	else
		warn("useAvatarEditorStores was used without an AvatarEditorStores context provider. Providing a temporary default value instead.")
		
		return CreateAvatarEditorStoresModule()
	end
end