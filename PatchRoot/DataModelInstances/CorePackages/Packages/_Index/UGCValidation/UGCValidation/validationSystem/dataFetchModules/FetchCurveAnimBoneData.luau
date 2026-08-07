-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:49 2026 Pacific Standard Time.

local curveAnimBoneHierarchyUtilsModule = require(script.Parent.Parent.Parent.util.CurveAnimBoneHierarchyUtils)

return {
	getData = function(p0) --[[ line: 6 ]]
		-- upvalues: curveAnimBoneHierarchyUtilsModule (ref)
		if not p0 then
			return nil
		elseif typeof(p0) ~= "table" or #p0 == 0 then
			return nil
		end
		local var1 = false
		
		for i, v in p0 do
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