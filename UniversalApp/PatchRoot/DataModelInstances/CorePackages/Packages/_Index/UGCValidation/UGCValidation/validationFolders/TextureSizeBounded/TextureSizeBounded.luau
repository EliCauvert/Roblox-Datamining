local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local ConstantsInterfaceModule = require(Parent.ConstantsInterface)
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local FetchAllDesiredDataModule = require(Parent.validationSystem.dataFetchModules.FetchAllDesiredData)

local function checkEditableImageSize(Editable, TextureLimit, FullName, FieldName, p1, SurfaceAppearance, ConsumerConfig) --[[ Line: 28 ]]
	-- upvalues: UGCValidationService (copy), ValidationEnumsModule (copy), ErrorSourceStringsModule (copy)
	local Success, Result = pcall(function() --[[ Line: 37 ]]
		-- upvalues: UGCValidationService (upval), Editable (copy)
		return UGCValidationService:GetEditableImageSize(Editable)
	end)
	
	if not Success then
		if ConsumerConfig and ConsumerConfig.validationEnv == ValidationEnumsModule.ValidationEnv.Backend then
			p1:fetchError(string.format("Failed to get texture size for '%s'. Make sure the texture exists and try again.", FullName))
		end
		p1:fail(ErrorSourceStringsModule.Keys.TextureSize_FailedToLoad, { FullName = FullName }, SurfaceAppearance)
		
		return
	elseif TextureLimit < Result.X or TextureLimit < Result.Y then
		p1:fail(ErrorSourceStringsModule.Keys.TextureSize_TooBig, {
			Width = tostring(Result.X),
			Height = tostring(Result.Y),
			FullName = FullName,
			MaxSize = tostring(TextureLimit),
			FieldName = FieldName
		}, SurfaceAppearance)
	end
end

return {
	categories = {
		ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD,
		ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		ValidationEnumsModule.UploadCategory.EYEBROW_EYELASH,
		ValidationEnumsModule.UploadCategory.RIGID_ACCESSORY
	},
	requiredData = {},
	conditionalData = { ValidationEnumsModule.SharedDataMember.meshTextures },
	expectedFailures = {},
	run = function(p1, p2) --[[ Line: 67 ]]
		-- upvalues: FetchAllDesiredDataModule (copy), ValidationEnumsModule (copy), ConstantsInterfaceModule (copy), checkEditableImageSize (copy)
		local RootInstance = p2.rootInstance
		local AssetType = p2.uploadEnum.assetType
		local MeshTextures = p2.meshTextures
		local ConsumerConfig = p2.consumerConfig
		local UploadCategory = p2.uploadCategory
		
		if not MeshTextures or MeshTextures == FetchAllDesiredDataModule.DATA_FETCH_FAILURE then
			p1:fetchError("Failed to load texture data for texture size check")
			
			return
		end
		local Descendants = RootInstance:GetDescendants()
		table.insert(Descendants, RootInstance)
		
		for _, descendant in Descendants do
			local Object = nil
			local Name = ""
			
			if descendant:IsA("MeshPart") then
				Object = descendant
				Name = descendant.Name
			elseif descendant:IsA("Part") then
				local SpecialMesh = descendant:FindFirstChildOfClass("SpecialMesh")
				
				if SpecialMesh then
					Object = SpecialMesh
					Name = descendant.Name
				end
			end
			if Object then
				local MeshTexture = MeshTextures[Name]
				
				if MeshTexture then
					local IsUploadCategoryMatch: boolean = UploadCategory == ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS or UploadCategory == ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD
					
					if MeshTexture.isPBR and IsUploadCategoryMatch then
						local SurfaceAppearance = Object:FindFirstChildWhichIsA("SurfaceAppearance")
						
						if SurfaceAppearance then
							for _, value in {
								"ColorMap",
								"MetalnessMap",
								"NormalMap",
								"RoughnessMap",
								"EmissiveMask"
							} do
								local MeshTextureEntry = MeshTexture[value]
								
								if MeshTextureEntry and MeshTextureEntry.editable then
									checkEditableImageSize(MeshTextureEntry.editable, ConstantsInterfaceModule.getTextureLimit(AssetType, SurfaceAppearance, value), SurfaceAppearance:GetFullName() .. "." .. value, value, p1, SurfaceAppearance, ConsumerConfig)
								end
							end
						end
					elseif not MeshTexture.isPBR and MeshTexture.Texture and MeshTexture.Texture.editable then
						local TextureID: string = if Object:IsA("MeshPart") then "TextureID" else "TextureId"
						checkEditableImageSize(MeshTexture.Texture.editable, ConstantsInterfaceModule.getTextureLimit(AssetType, Object, TextureID), Object:GetFullName(), TextureID, p1, Object, ConsumerConfig)
					end
				end
			end
		end
	end
}