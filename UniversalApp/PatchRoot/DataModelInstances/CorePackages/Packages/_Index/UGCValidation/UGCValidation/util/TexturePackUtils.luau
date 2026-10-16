local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent
local ParseContentIdsModule = require(Parent.util.ParseContentIds)
local GetFFlagUGCValidateEmptySurfaceAppearanceModule = require(Parent.flags.getFFlagUGCValidateEmptySurfaceAppearance)

local function findSurfaceAppearances(Object, p1) --[[ Line: 17 ]]
	-- upvalues: UGCValidationService (copy), ParseContentIdsModule (copy), GetFFlagUGCValidateEmptySurfaceAppearanceModule (copy)
	local List = {}
	local List1 = {}
	local Descendants = Object:GetDescendants()
	table.insert(Descendants, Object)
	
	for _, SurfaceAppearance in Descendants do
		if SurfaceAppearance:IsA("SurfaceAppearance") then
			local TexturePackPropertyValue = UGCValidationService:GetPropertyValue(SurfaceAppearance, "TexturePack")
			
			if if TexturePackPropertyValue then ParseContentIdsModule.tryGetAssetIdFromContentId(TexturePackPropertyValue) else nil then
				table.insert(List, SurfaceAppearance)
			elseif not GetFFlagUGCValidateEmptySurfaceAppearanceModule() then
				table.insert(List1, SurfaceAppearance)
			elseif SurfaceAppearance.ColorMap and SurfaceAppearance.ColorMap ~= "" or (SurfaceAppearance.MetalnessMap and SurfaceAppearance.MetalnessMap ~= "" or (SurfaceAppearance.NormalMap and SurfaceAppearance.NormalMap ~= "" or (SurfaceAppearance.RoughnessMap and SurfaceAppearance.RoughnessMap ~= "" or SurfaceAppearance.EmissiveMaskContent and (SurfaceAppearance.EmissiveMaskContent.SourceType == Enum.ContentSourceType.Uri and (SurfaceAppearance.EmissiveMaskContent.Uri and SurfaceAppearance.EmissiveMaskContent.Uri ~= ""))))) or not p1 then
				table.insert(List1, SurfaceAppearance)
			end
		end
	end
	return List, List1
end

return {
	findSurfaceAppearancesMissingTexturePacks = function(p2, p3) --[[ Line: 60 ]]
		-- upvalues: findSurfaceAppearances (copy)
		local _, SurfaceAppearances2 = findSurfaceAppearances(p2, p3)
		
		return SurfaceAppearances2
	end,
	findSurfaceAppearancesWithTexturePacks = function(p2) --[[ Line: 68 ]]
		-- upvalues: findSurfaceAppearances (copy)
		return (findSurfaceAppearances(p2, false))
	end
}