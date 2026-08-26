local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local parseContentIdsModule = require(parent.util.ParseContentIds)
local getFFlagUGCValidateEmptySurfaceAppearanceModule = require(parent.flags.getFFlagUGCValidateEmptySurfaceAppearance)
local t = {}

local function findSurfaceAppearances(p1, p2)
	-- upvalues: UGCValidationService (ref), parseContentIdsModule (ref), getFFlagUGCValidateEmptySurfaceAppearanceModule (ref)
	local t = {}
	local t_1 = {}
	local descendants = p1:GetDescendants()
	table.insert(descendants, p1)
	
	for i, v in descendants do
		if v:IsA("SurfaceAppearance") then
			local var1 = UGCValidationService:GetPropertyValue(v, "TexturePack")
			
			if if var1 then parseContentIdsModule.tryGetAssetIdFromContentId(var1) else nil then
				table.insert(t, v)
			elseif getFFlagUGCValidateEmptySurfaceAppearanceModule() then
				local var2
				if v.ColorMap then
					var2 = true
					
					if v.ColorMap == "" then
						if v.MetalnessMap then
							var2 = true
							
							if v.MetalnessMap == "" then
								if v.NormalMap then
									var2 = true
									
									if v.NormalMap == "" then
										if v.RoughnessMap then
											var2 = if v.RoughnessMap == "" then v.EmissiveMaskContent and (v.EmissiveMaskContent.SourceType == Enum.ContentSourceType.Uri and (v.EmissiveMaskContent.Uri and v.EmissiveMaskContent.Uri ~= "")) else true
										end
									end
								end
							end
						end
					end
					if var2 or not p2 then
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

function t.findSurfaceAppearancesMissingTexturePacks(p3, p4)
	-- upvalues: findSurfaceAppearances (ref)
	local _, var3 = findSurfaceAppearances(p3, p4)
	
	return var3
end

function t.findSurfaceAppearancesWithTexturePacks(p3)
	-- upvalues: findSurfaceAppearances (ref)
	return findSurfaceAppearances(p3, false)
end

return t