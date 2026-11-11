local AvatarExperienceSave = script:FindFirstAncestor("AvatarExperienceSave")
local TutilsModule = require(AvatarExperienceSave.Parent.tutils)
local _ = require(AvatarExperienceSave.Context.AvatarSaveContext)

return function(p1, List)
	-- upvalues: TutilsModule (copy)
	local Flag = false
	
	for i, value in List do
		if p1.equipped.EquippedAssets[value] and p1.equipped.EquippedAssets[value][i] then
			Flag = true
			p1.equipped.EquippedAssets[value][i] = nil
			
			if TutilsModule.fieldCount(p1.equipped.EquippedAssets[value]) == 0 then
				p1.equipped.EquippedAssets[value] = nil
			end
		end
	end
	return p1, Flag
end