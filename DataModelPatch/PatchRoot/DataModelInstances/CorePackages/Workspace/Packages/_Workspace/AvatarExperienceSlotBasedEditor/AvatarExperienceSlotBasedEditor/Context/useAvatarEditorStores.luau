local ReactModule = require(script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent.React)
local AvatarEditorStoresModule = require(script.Parent.AvatarEditorStores)
local CreateAvatarEditorStoresModule = require(script.Parent.Parent.Stores.createAvatarEditorStores)

return function()
	-- upvalues: ReactModule (copy), AvatarEditorStoresModule (copy), CreateAvatarEditorStoresModule (copy)
	local UseContextResult = ReactModule.useContext(AvatarEditorStoresModule)
	
	if not UseContextResult then
		warn("useAvatarEditorStores was used without an AvatarEditorStores context provider. Providing a temporary default value instead.")
		UseContextResult = CreateAvatarEditorStoresModule()
	end
	return UseContextResult
end