local reactModule = require(script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent.React)
local avatarEditorStoresModule = require(script.Parent.AvatarEditorStores)
local createAvatarEditorStoresModule = require(script.Parent.Parent.Stores.createAvatarEditorStores)

return function()
	-- upvalues: reactModule (ref), avatarEditorStoresModule (ref), createAvatarEditorStoresModule (ref)
	local var3 = reactModule.useContext(avatarEditorStoresModule)
	
	if not var3 then
		warn("useAvatarEditorStores was used without an AvatarEditorStores context provider. Providing a temporary default value instead.")
		var3 = createAvatarEditorStoresModule()
	end
	return var3
end