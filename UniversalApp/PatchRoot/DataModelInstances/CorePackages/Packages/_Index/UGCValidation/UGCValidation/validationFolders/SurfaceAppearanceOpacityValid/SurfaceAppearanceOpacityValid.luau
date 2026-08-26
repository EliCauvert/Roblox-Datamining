local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local fetchAllDesiredDataModule = require(parent.validationSystem.dataFetchModules.FetchAllDesiredData)
local t = { ColorMap = true, NormalMap = true }
local t_1 = {
	categories = { validationEnumsModule.UploadCategory.RIGID_ACCESSORY },
	requiredData = {},
	conditionalData = { validationEnumsModule.SharedDataMember.meshTextures },
	fflag = require(parent.flags.getFFlagUGCValidateMigrateTextureTransparency),
	expectedFailures = {}
}

local function getIsOpaque(p1)
	local var1 = p1:ReadPixelsBuffer(Vector2.new(0, 0), p1.Size)
	
	for i = 0, buffer.len(var1) - 1, 4 do
		if buffer.readu8(var1, i + 3) >= 255 then
			continue
		end
		return false
	end
	return true
end

function t_1.run(p2, p3)
	-- upvalues: fetchAllDesiredDataModule (ref), errorSourceStringsModule (ref), t (ref), getIsOpaque (ref)
	local rootInstance = p3.rootInstance
	local meshTextures = p3.meshTextures
	
	if not meshTextures or meshTextures == fetchAllDesiredDataModule.DATA_FETCH_FAILURE then
		p2:fetchError("Failed to load texture data for surface appearance opacity check")
		
		return
	end
	local descendants = rootInstance:GetDescendants()
	table.insert(descendants, rootInstance)
	
	for i, v in descendants do
		if v:IsA("MeshPart") then
			local surfaceAppearance = v:FindFirstChildWhichIsA("SurfaceAppearance")
			
			if surfaceAppearance then
				if surfaceAppearance.AlphaMode ~= Enum.AlphaMode.Overlay then
					p2:fail(errorSourceStringsModule.Keys.SAOpacity_InvalidAlphaMode, { FullName = v:GetFullName() }, surfaceAppearance)
				end
				local name = meshTextures[v.Name]
				
				if name and name.isPBR then
					for i_1, v_1 in t do
						local var2 = name[i_1]
						
						if var2 then
							if not var2.editable then
								p2:fail(errorSourceStringsModule.Keys.SAOpacity_FailedToLoadTexture, {
									FullName = surfaceAppearance:GetFullName(),
									FieldName = i_1
								}, surfaceAppearance)
							elseif not getIsOpaque(var2.editable) then
								p2:fail(errorSourceStringsModule.Keys.SAOpacity_TextureNotOpaque, { FullName = surfaceAppearance:GetFullName() .. "." .. i_1 }, surfaceAppearance)
							end
						end
					end
				end
			end
		end
	end
end

return t_1