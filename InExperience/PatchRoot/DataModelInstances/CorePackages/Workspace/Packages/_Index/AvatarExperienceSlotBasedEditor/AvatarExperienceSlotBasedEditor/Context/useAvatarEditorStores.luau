local reactModule = require(script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent.React)
local avatarEditorStoresModule = require(script.Parent.AvatarEditorStores)
local createAvatarEditorStoresModule = require(script.Parent.Parent.Stores.createAvatarEditorStores)

return function()
	-- upvalues: reactModule (ref), avatarEditorStoresModule (ref), createAvatarEditorStoresModule (ref)
	local var1 = reactModule.useContext(avatarEditorStoresModule)
	
	if var1 then
		return var1
	end
	warn("useAvatarEditorStores was used without an AvatarEditorStores context provider. Providing a temporary default value instead.")
	
	return createAvatarEditorStoresModule()
end