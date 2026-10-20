local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local FetchAllDesiredDataModule = require(Parent.validationSystem.dataFetchModules.FetchAllDesiredData)
local config = { ColorMap = true, NormalMap = true }

local function getIsOpaque(Editable): boolean
	local PixelsBuffer = Editable:ReadPixelsBuffer(Vector2.new(0, 0), Editable.Size)
	
	for i = 0, buffer.len(PixelsBuffer) - 1, 4 do
		if buffer.readu8(PixelsBuffer, i + 3) < 255 then
			return false
		end
	end
	return true
end

return {
	categories = { ValidationEnumsModule.UploadCategory.RIGID_ACCESSORY },
	requiredData = {},
	conditionalData = { ValidationEnumsModule.SharedDataMember.meshTextures },
	fflag = require(Parent.flags.getFFlagUGCValidateMigrateTextureTransparency),
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: FetchAllDesiredDataModule (copy), ErrorSourceStringsModule (copy), config (copy), getIsOpaque (copy)
		local RootInstance = p2.rootInstance
		local MeshTextures = p2.meshTextures
		
		if not MeshTextures or MeshTextures == FetchAllDesiredDataModule.DATA_FETCH_FAILURE then
			p1:fetchError("Failed to load texture data for surface appearance opacity check")
			
			return
		end
		local Descendants = RootInstance:GetDescendants()
		table.insert(Descendants, RootInstance)
		
		for _, Part in Descendants do
			if Part:IsA("MeshPart") then
				local SurfaceAppearance = Part:FindFirstChildWhichIsA("SurfaceAppearance")
				
				if SurfaceAppearance then
					if SurfaceAppearance.AlphaMode ~= Enum.AlphaMode.Overlay then
						p1:fail(ErrorSourceStringsModule.Keys.SAOpacity_InvalidAlphaMode, { FullName = Part:GetFullName() }, SurfaceAppearance)
					end
					local MeshTexture = MeshTextures[Part.Name]
					
					if MeshTexture and MeshTexture.isPBR then
						for FieldName, _ in config do
							local MeshTextureEntry = MeshTexture[FieldName]
							
							if MeshTextureEntry then
								if not MeshTextureEntry.editable then
									p1:fail(ErrorSourceStringsModule.Keys.SAOpacity_FailedToLoadTexture, {
										FullName = SurfaceAppearance:GetFullName(),
										FieldName = FieldName
									}, SurfaceAppearance)
								elseif not getIsOpaque(MeshTextureEntry.editable) then
									p1:fail(ErrorSourceStringsModule.Keys.SAOpacity_TextureNotOpaque, {
										FullName = SurfaceAppearance:GetFullName() .. "." .. FieldName
									}, SurfaceAppearance)
								end
							end
						end
					end
				end
			end
		end
	end
}