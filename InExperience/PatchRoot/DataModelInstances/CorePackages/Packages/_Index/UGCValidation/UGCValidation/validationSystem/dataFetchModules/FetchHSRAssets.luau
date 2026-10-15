local parent = script.Parent.Parent.Parent
local parseContentIdsModule = require(parent.util.ParseContentIds)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local _ = require(parent.util.Types)
local getFFlagUGCValidateVersionedContentIdsModule = require(parent.flags.getFFlagUGCValidateVersionedContentIds)

return {
	getData = function(p1, p2)
		-- upvalues: validationEnumsModule (ref), getFFlagUGCValidateVersionedContentIdsModule (ref), parseContentIdsModule (ref)
		if p2.consumerEnv == validationEnumsModule.ConsumerEnv.IEC then
			return {}
		end
		local HSRAssetId, ok, var1
		local t = {}
		local descendants = p1:GetDescendants()
		table.insert(descendants, p1)
		
		for i, v in descendants do
			if v:IsA("WrapLayer") then
				HSRAssetId = v.HSRAssetId
				
				if HSRAssetId and HSRAssetId ~= "" then
					local _ = nil
					
					if getFFlagUGCValidateVersionedContentIdsModule() then
						var5, ok = parseContentIdsModule.tryParseContentId(HSRAssetId)
						var1 = if var5 then parseContentIdsModule.getReferenceKey(var5, ok) else nil
					else
						var1 = parseContentIdsModule.tryGetAssetIdFromContentId(HSRAssetId)
					end
					if var1 and not t[var1] then
						local var2 = p2.preloadedHsrAssets[var1]
						
						if var2 then
							t[var1] = var2
						else
							ok, status = pcall(function()
								-- upvalues: HSRAssetId (ref)
								return game:GetObjectsAllOrNone(HSRAssetId)
							end)
							
							if ok then
								t[var1] = status or {}
								continue
							end
							return nil
						end
					end
				end
			end
		end
		return t
	end
}