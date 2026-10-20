local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local ConstantsInterfaceModule = require(Parent.ConstantsInterface)
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local FetchAllDesiredDataModule = require(Parent.validationSystem.dataFetchModules.FetchAllDesiredData)
local config = {
	ColorMap = game:DefineFastInt("AccessoryColorMapMaxSize", 1024),
	MetalnessMap = game:DefineFastInt("AccessoryMetalnessMapMaxSize", 256),
	NormalMap = game:DefineFastInt("AccessoryNormalMapMaxSize", 256),
	RoughnessMap = game:DefineFastInt("AccessoryRoughnessMapMaxSize", 256)
}

return {
	categories = {
		ValidationEnumsModule.UploadCategory.RIGID_ACCESSORY,
		ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		ValidationEnumsModule.UploadCategory.EYEBROW_EYELASH
	},
	requiredData = {},
	conditionalData = { ValidationEnumsModule.SharedDataMember.meshTextures },
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: FetchAllDesiredDataModule (copy), ValidationEnumsModule (copy), ConstantsInterfaceModule (copy), config (copy), UGCValidationService (copy), ErrorSourceStringsModule (copy)
		local RootInstance = p2.rootInstance
		local AssetType = p2.uploadEnum.assetType
		local MeshTextures = p2.meshTextures
		local ConsumerConfig = p2.consumerConfig
		
		if not MeshTextures or MeshTextures == FetchAllDesiredDataModule.DATA_FETCH_FAILURE then
			p1:fetchError("Failed to load texture data for surface appearance texture bounds check")
			
			return
		end
		local IsValidationEnvMatch = ConsumerConfig.validationEnv == ValidationEnumsModule.ValidationEnv.Backend
		local Descendants = RootInstance:GetDescendants()
		table.insert(Descendants, RootInstance)
		
		for _, Part in Descendants do
			if Part:IsA("MeshPart") then
				local SurfaceAppearance = Part:FindFirstChildWhichIsA("SurfaceAppearance")
				
				if SurfaceAppearance then
					local MeshTexture = MeshTextures[Part.Name]
					
					if MeshTexture and MeshTexture.isPBR then
						for _, FieldName in {
							"ColorMap",
							"MetalnessMap",
							"NormalMap",
							"RoughnessMap",
							"EmissiveMask"
						} do
							local MeshTextureEntry = MeshTexture[FieldName]
							
							if MeshTextureEntry and MeshTextureEntry.editable then
								local TextureLimit = if AssetType then ConstantsInterfaceModule.getTextureLimit(AssetType, SurfaceAppearance, FieldName) else config[FieldName]
								local Success, Result = pcall(function()
									-- upvalues: UGCValidationService (upval), MeshTextureEntry (copy)
									return UGCValidationService:GetEditableImageSize(MeshTextureEntry.editable)
								end)
								
								if not Success then
									if IsValidationEnvMatch then
										p1:fetchError(string.format("Failed to get texture size for '%s'. Make sure the texture exists and try again.", SurfaceAppearance:GetFullName() .. "." .. FieldName))
									end
									p1:fail(ErrorSourceStringsModule.Keys.TextureSize_FailedToLoad, {
										FullName = SurfaceAppearance:GetFullName() .. "." .. FieldName
									}, SurfaceAppearance)
								elseif TextureLimit < Result.X or TextureLimit < Result.Y then
									p1:fail(ErrorSourceStringsModule.Keys.TextureSize_TooBig, {
										Width = tostring(Result.X),
										Height = tostring(Result.Y),
										FullName = SurfaceAppearance:GetFullName() .. "." .. FieldName,
										MaxSize = tostring(TextureLimit),
										FieldName = FieldName
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