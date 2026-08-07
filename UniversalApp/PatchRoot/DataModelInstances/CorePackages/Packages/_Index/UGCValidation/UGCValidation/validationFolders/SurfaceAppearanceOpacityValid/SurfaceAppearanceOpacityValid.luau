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

local function getIsOpaque(p0) --[[ line: 30 ]]
	local var6 = p0:ReadPixelsBuffer(Vector2.new(0, 0), p0.Size)
	
	for i = 0, buffer.len(var6) - 1, 4 do
		if buffer.readu8(var6, i + 3) >= 255 then
			continue
		end
		return false
	end
	return true
end

function t_1.run(p1, p2) --[[ line: 41 ]]
	-- upvalues: fetchAllDesiredDataModule (ref), errorSourceStringsModule (ref), t (ref), getIsOpaque (ref)
	local rootInstance = p2.rootInstance
	local meshTextures = p2.meshTextures
	
	if not meshTextures or meshTextures == fetchAllDesiredDataModule.DATA_FETCH_FAILURE then
		p1:fetchError("Failed to load texture data for surface appearance opacity check")
		
		return
	end
	local descendants = rootInstance:GetDescendants()
	table.insert(descendants, rootInstance)
	
	for i, v in descendants do
		if v:IsA("MeshPart") then
			local surfaceAppearance = v:FindFirstChildWhichIsA("SurfaceAppearance")
			
			if surfaceAppearance then
				if surfaceAppearance.AlphaMode ~= Enum.AlphaMode.Overlay then
					p1:fail(errorSourceStringsModule.Keys.SAOpacity_InvalidAlphaMode, { FullName = v:GetFullName() }, surfaceAppearance)
				end
				local name = meshTextures[v.Name]
				
				if name and name.isPBR then
					for i_1, v_1 in t do
						local var9 = name[i_1]
						
						if var9 then
							if not var9.editable then
								p1:fail(errorSourceStringsModule.Keys.SAOpacity_FailedToLoadTexture, {
									FullName = surfaceAppearance:GetFullName(),
									FieldName = i_1
								}, surfaceAppearance)
							elseif not getIsOpaque(var9.editable) then
								p1:fail(errorSourceStringsModule.Keys.SAOpacity_TextureNotOpaque, { FullName = surfaceAppearance:GetFullName() .. "." .. i_1 }, surfaceAppearance)
							end
						end
					end
				end
			end
		end
	end
end

return t_1