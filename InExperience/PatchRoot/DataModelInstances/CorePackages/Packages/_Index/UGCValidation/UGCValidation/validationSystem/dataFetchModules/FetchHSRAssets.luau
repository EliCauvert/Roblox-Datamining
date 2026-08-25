local parent = script.Parent.Parent.Parent
local parseContentIdsModule = require(parent.util.ParseContentIds)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local _ = require(parent.util.Types)

return {
	getData = function(p0, p1)
		-- upvalues: validationEnumsModule (ref), parseContentIdsModule (ref)
		if p1.consumerEnv == validationEnumsModule.ConsumerEnv.IEC then
			return {}
		end
		local HSRAssetId, var4
		local t = {}
		local descendants = p0:GetDescendants()
		table.insert(descendants, p0)
		
		for i, v in descendants do
			if v:IsA("WrapLayer") then
				HSRAssetId = v.HSRAssetId
				
				if HSRAssetId and HSRAssetId ~= "" then
					var4 = parseContentIdsModule.tryGetAssetIdFromContentId(HSRAssetId)
					
					if var4 and not t[var4] then
						local var5 = p1.preloadedHsrAssets[var4]
						
						if var5 then
							t[var4] = var5
						else
							local ok, status = pcall(function()
								-- upvalues: HSRAssetId (ref)
								return game:GetObjectsAllOrNone(HSRAssetId)
							end)
							
							if ok then
								t[var4] = status or {}
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