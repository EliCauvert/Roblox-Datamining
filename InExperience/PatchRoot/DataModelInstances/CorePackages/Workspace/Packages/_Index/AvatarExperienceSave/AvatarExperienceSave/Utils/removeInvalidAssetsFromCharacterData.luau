local avatarExperienceSave = script:FindFirstAncestor("AvatarExperienceSave")
local tutilsModule = require(avatarExperienceSave.Parent.tutils)
local _ = require(avatarExperienceSave.Context.AvatarSaveContext)

return function(value, p0) --[[ line: 8 | named "removeInvalidAssetsFromCharacterData" ]]
	-- upvalues: tutilsModule (ref)
	local var2 = false
	
	for i, v in p0 do
		if value.equipped.EquippedAssets[v] and value.equipped.EquippedAssets[v][i] then
			var2 = true
			value.equipped.EquippedAssets[v][i] = nil
			
			if tutilsModule.fieldCount(value.equipped.EquippedAssets[v]) == 0 then
				value.equipped.EquippedAssets[v] = nil
			end
		end
	end
	return value, var2
end