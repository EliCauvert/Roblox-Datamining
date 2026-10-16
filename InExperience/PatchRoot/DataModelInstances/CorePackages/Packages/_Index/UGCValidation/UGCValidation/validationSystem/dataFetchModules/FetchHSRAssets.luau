local parent = script.Parent.Parent.Parent
local parseContentIdsModule = require(parent.util.ParseContentIds)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local _ = require(parent.util.Types)

return {
	getData = function(p1, p2)
		-- upvalues: validationEnumsModule (ref), parseContentIdsModule (ref)
		if p2.consumerEnv == validationEnumsModule.ConsumerEnv.IEC then
			return {}
		end
		local HSRAssetId, var1
		local t = {}
		local descendants = p1:GetDescendants()
		table.insert(descendants, p1)
		
		for i, v in descendants do
			if v:IsA("WrapLayer") then
				HSRAssetId = v.HSRAssetId
				
				if HSRAssetId and HSRAssetId ~= "" then
					var1 = parseContentIdsModule.tryGetAssetIdFromContentId(HSRAssetId)
					
					if var1 and not t[var1] then
						local var2 = p2.preloadedHsrAssets[var1]
						
						if var2 then
							t[var1] = var2
						else
							local ok, status = pcall(function()
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