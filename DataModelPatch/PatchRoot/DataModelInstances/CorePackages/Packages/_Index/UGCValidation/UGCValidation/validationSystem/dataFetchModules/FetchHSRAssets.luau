local Parent = script.Parent.Parent.Parent
local ParseContentIdsModule = require(Parent.util.ParseContentIds)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local _ = require(Parent.util.Types)

return {
	getData = function(Object, p1)
		-- upvalues: ValidationEnumsModule (copy), ParseContentIdsModule (copy)
		if p1.consumerEnv == ValidationEnumsModule.ConsumerEnv.IEC then
			return {}
		end
		local PreloadedHsrAssets = {}
		local Descendants = Object:GetDescendants()
		table.insert(Descendants, Object)
		
		for _, WrapLayer in Descendants do
			if WrapLayer:IsA("WrapLayer") then
				local HSRAssetId = WrapLayer.HSRAssetId
				
				if HSRAssetId and HSRAssetId ~= "" then
					local TryGetAssetIdFromContentIdResult = ParseContentIdsModule.tryGetAssetIdFromContentId(HSRAssetId)
					
					if TryGetAssetIdFromContentIdResult and not PreloadedHsrAssets[TryGetAssetIdFromContentIdResult] then
						local PreloadedHsrAsset = p1.preloadedHsrAssets[TryGetAssetIdFromContentIdResult]
						
						if PreloadedHsrAsset then
							PreloadedHsrAssets[TryGetAssetIdFromContentIdResult] = PreloadedHsrAsset
						else
							local Success, Result = pcall(function()
								-- upvalues: HSRAssetId (copy)
								return game:GetObjectsAllOrNone(HSRAssetId)
							end)
							
							if not Success then
								return nil
							end
							PreloadedHsrAssets[TryGetAssetIdFromContentIdResult] = Result or {}
						end
					end
				end
			end
		end
		return PreloadedHsrAssets
	end
}