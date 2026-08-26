local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local constantsInterfaceModule = require(parent.ConstantsInterface)
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local fetchAllDesiredDataModule = require(parent.validationSystem.dataFetchModules.FetchAllDesiredData)
local getFFlagUGCValidateMigrateTextureTransparencyModule = require(parent.flags.getFFlagUGCValidateMigrateTextureTransparency)
local getFFlagUGCValidateAllowEmissivesModule = require(parent.flags.getFFlagUGCValidateAllowEmissives)
local t = {
	ColorMap = game:DefineFastInt("AccessoryColorMapMaxSize", 1024),
	MetalnessMap = game:DefineFastInt("AccessoryMetalnessMapMaxSize", 256),
	NormalMap = game:DefineFastInt("AccessoryNormalMapMaxSize", 256),
	RoughnessMap = game:DefineFastInt("AccessoryRoughnessMapMaxSize", 256)
}

return {
	categories = {
		validationEnumsModule.UploadCategory.RIGID_ACCESSORY,
		validationEnumsModule.UploadCategory.LAYERED_CLOTHING
	},
	requiredData = {},
	conditionalData = { validationEnumsModule.SharedDataMember.meshTextures },
	fflag = getFFlagUGCValidateMigrateTextureTransparencyModule,
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: fetchAllDesiredDataModule (ref), getFFlagUGCValidateAllowEmissivesModule (ref), constantsInterfaceModule (ref), t (ref), UGCValidationService (ref), validationEnumsModule (ref), errorSourceStringsModule (ref)
		local rootInstance = p2.rootInstance
		local assetType = p2.uploadEnum.assetType
		local meshTextures = p2.meshTextures
		local consumerConfig = p2.consumerConfig
		
		if not meshTextures or meshTextures == fetchAllDesiredDataModule.DATA_FETCH_FAILURE then
			p1:fetchError("Failed to load texture data for surface appearance texture bounds check")
			
			return
		end
		local descendants = rootInstance:GetDescendants()
		table.insert(descendants, rootInstance)
		
		for i, v in descendants do
			if v:IsA("MeshPart") then
				local surfaceAppearance = v:FindFirstChildWhichIsA("SurfaceAppearance")
				
				if surfaceAppearance then
					local name = meshTextures[v.Name]
					
					if name and name.isPBR then
						local list = { "ColorMap", "MetalnessMap", "NormalMap", "RoughnessMap" }
						
						if getFFlagUGCValidateAllowEmissivesModule() then
							table.insert(list, "EmissiveMask")
						end
						for i_1, v_1 in list do
							local var1 = name[v_1]
							
							if var1 and var1.editable then
								local var2 = if assetType then constantsInterfaceModule.getTextureLimit(assetType, surfaceAppearance, v_1) else t[v_1]
								local ok, status = pcall(function()
									-- upvalues: UGCValidationService (copy), var1 (ref)
									return UGCValidationService:GetEditableImageSize(var1.editable)
								end)
								
								if not ok then
									if consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.Backend then
										p1:fetchError(string.format("Failed to get texture size for '%s'. Make sure the texture exists and try again.", surfaceAppearance:GetFullName() .. "." .. v_1))
									end
									p1:fail(errorSourceStringsModule.Keys.TextureSize_FailedToLoad, { FullName = surfaceAppearance:GetFullName() .. "." .. v_1 }, surfaceAppearance)
								elseif var2 < status.X or var2 < status.Y then
									p1:fail(errorSourceStringsModule.Keys.TextureSize_TooBig, {
										Width = tostring(status.X),
										Height = tostring(status.Y),
										FullName = surfaceAppearance:GetFullName() .. "." .. v_1,
										MaxSize = tostring(var2),
										FieldName = v_1
									}, surfaceAppearance)
								end
							end
						end
					end
				end
			end
		end
	end
}