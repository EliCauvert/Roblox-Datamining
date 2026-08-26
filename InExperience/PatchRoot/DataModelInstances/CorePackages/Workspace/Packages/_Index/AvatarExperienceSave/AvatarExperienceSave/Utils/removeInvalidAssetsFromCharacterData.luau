local avatarExperienceSave = script:FindFirstAncestor("AvatarExperienceSave")
local tutilsModule = require(avatarExperienceSave.Parent.tutils)
local _ = require(avatarExperienceSave.Context.AvatarSaveContext)

return function(value, p1)
	-- upvalues: tutilsModule (ref)
	local var1 = false
	
	for i, v in p1 do
		if value.equipped.EquippedAssets[v] and value.equipped.EquippedAssets[v][i] then
			var1 = true
			value.equipped.EquippedAssets[v][i] = nil
			
			if tutilsModule.fieldCount(value.equipped.EquippedAssets[v]) == 0 then
				value.equipped.EquippedAssets[v] = nil
			end
		end
	end
	return value, var1
end