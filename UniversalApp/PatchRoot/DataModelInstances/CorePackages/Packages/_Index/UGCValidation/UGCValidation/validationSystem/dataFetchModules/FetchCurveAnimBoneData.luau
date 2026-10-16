local CurveAnimBoneHierarchyUtilsModule = require(script.Parent.Parent.Parent.util.CurveAnimBoneHierarchyUtils)

return {
	getData = function(List) --[[ Line: 6 ]]
		-- upvalues: CurveAnimBoneHierarchyUtilsModule (copy)
		if not List then
			return nil
		end
		if typeof(List) ~= "table" or #List == 0 then
			return nil
		end
		local Flag = false
		
		for _, value in List do
			for _, Folder in value:GetDescendants() do
				if Folder:IsA("Folder") and CurveAnimBoneHierarchyUtilsModule.isBoneFolderName(Folder.Name) then
					Flag = true
					break
				end
			end
			if Flag then break end
		end
		return if Flag then { hasBones = true } else nil
	end
}