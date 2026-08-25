local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local parseContentIdsModule = require(parent.util.ParseContentIds)
local getFFlagUGCValidateEmptySurfaceAppearanceModule = require(parent.flags.getFFlagUGCValidateEmptySurfaceAppearance)
local t = {}

local function findSurfaceAppearances(p0, p1)
	-- upvalues: UGCValidationService (ref), parseContentIdsModule (ref), getFFlagUGCValidateEmptySurfaceAppearanceModule (ref)
	local t = {}
	local t_1 = {}
	local descendants = p0:GetDescendants()
	table.insert(descendants, p0)
	
	for i, v in descendants do
		if v:IsA("SurfaceAppearance") then
			local var8 = UGCValidationService:GetPropertyValue(v, "TexturePack")
			
			if if var8 then parseContentIdsModule.tryGetAssetIdFromContentId(var8) else nil then
				table.insert(t, v)
			elseif getFFlagUGCValidateEmptySurfaceAppearanceModule() then
				local var9
				if v.ColorMap then
					var9 = true
					
					if v.ColorMap == "" then
						if v.MetalnessMap then
							var9 = true
							
							if v.MetalnessMap == "" then
								if v.NormalMap then
									var9 = true
									
									if v.NormalMap == "" then
										if v.RoughnessMap then
											var9 = if v.RoughnessMap == "" then v.EmissiveMaskContent and (v.EmissiveMaskContent.SourceType == Enum.ContentSourceType.Uri and (v.EmissiveMaskContent.Uri and v.EmissiveMaskContent.Uri ~= "")) else true
										end
									end
								end
							end
						end
					end
					if var9 or not p1 then
						table.insert(t_1, v)
					end
				end
			else
				table.insert(t_1, v)
			end
		end
	end
	return t, t_1
end

function t.findSurfaceAppearancesMissingTexturePacks(p2, p3)
	-- upvalues: findSurfaceAppearances (ref)
	local _, var10 = findSurfaceAppearances(p2, p3)
	
	return var10
end

function t.findSurfaceAppearancesWithTexturePacks(p4)
	-- upvalues: findSurfaceAppearances (ref)
	return findSurfaceAppearances(p4, false)
end

return t