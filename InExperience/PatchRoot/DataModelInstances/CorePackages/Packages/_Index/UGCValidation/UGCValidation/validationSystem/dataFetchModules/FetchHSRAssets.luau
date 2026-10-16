local Parent = script.Parent.Parent.Parent
local ParseContentIdsModule = require(Parent.util.ParseContentIds)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local _ = require(Parent.util.Types)
local GetFFlagUGCValidateVersionedContentIdsModule = require(Parent.flags.getFFlagUGCValidateVersionedContentIds)

return {
	getData = function(Object, p1) --[[ Line: 11 ]]
		-- upvalues: ValidationEnumsModule (copy), GetFFlagUGCValidateVersionedContentIdsModule (copy), ParseContentIdsModule (copy)
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
					local ReferenceKey = nil
					if GetFFlagUGCValidateVersionedContentIdsModule() then
						local TryParseContentIdResult, TryParseContentIdResult2 = ParseContentIdsModule.tryParseContentId(HSRAssetId)
						ReferenceKey = if TryParseContentIdResult then ParseContentIdsModule.getReferenceKey(TryParseContentIdResult, TryParseContentIdResult2) else nil
					else
						ReferenceKey = ParseContentIdsModule.tryGetAssetIdFromContentId(HSRAssetId)
					end
					if ReferenceKey and not PreloadedHsrAssets[ReferenceKey] then
						local PreloadedHsrAsset = p1.preloadedHsrAssets[ReferenceKey]
						
						if PreloadedHsrAsset then
							PreloadedHsrAssets[ReferenceKey] = PreloadedHsrAsset
						else
							local Success, Result = pcall(function() --[[ Line: 57 ]]
								-- upvalues: HSRAssetId (copy)
								return game:GetObjectsAllOrNone(HSRAssetId)
							end)
							
							if not Success then
								return nil
							end
							PreloadedHsrAssets[ReferenceKey] = Result or {}
						end
					end
				end
			end
		end
		return PreloadedHsrAssets
	end
}