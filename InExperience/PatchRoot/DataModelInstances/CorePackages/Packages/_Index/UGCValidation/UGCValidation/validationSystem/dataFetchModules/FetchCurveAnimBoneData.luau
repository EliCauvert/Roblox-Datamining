local curveAnimBoneHierarchyUtilsModule = require(script.Parent.Parent.Parent.util.CurveAnimBoneHierarchyUtils)

return {
	getData = function(p1)
		-- upvalues: curveAnimBoneHierarchyUtilsModule (ref)
		if not p1 then
			return nil
		elseif typeof(p1) ~= "table" or #p1 == 0 then
			return nil
		end
		local var1 = false
		
		for i, v in p1 do
			for i_1, v_1 in v:GetDescendants() do
				if v_1:IsA("Folder") and curveAnimBoneHierarchyUtilsModule.isBoneFolderName(v_1.Name) then
					var1 = true
					break
				end
			end
			if var1 then break end
		end
		return if var1 then { hasBones = true } else nil
	end
}