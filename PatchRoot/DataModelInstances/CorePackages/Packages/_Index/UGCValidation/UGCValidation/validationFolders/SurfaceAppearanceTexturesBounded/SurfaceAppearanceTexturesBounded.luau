-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:48 2026 Pacific Standard Time.

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
	run = function(p0, p1) --[[ line: 48 ]]
		-- upvalues: fetchAllDesiredDataModule (ref), getFFlagUGCValidateAllowEmissivesModule (ref), constantsInterfaceModule (ref), t (ref), UGCValidationService (ref), validationEnumsModule (ref), errorSourceStringsModule (ref)
		local rootInstance = p1.rootInstance
		local assetType = p1.uploadEnum.assetType
		local meshTextures = p1.meshTextures
		local consumerConfig = p1.consumerConfig
		
		if not meshTextures or meshTextures == fetchAllDesiredDataModule.DATA_FETCH_FAILURE then
			p0:fetchError("Failed to load texture data for surface appearance texture bounds check")
			
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
							local var11 = name[v_1]
							
							if var11 and var11.editable then
								local var12 = if assetType then constantsInterfaceModule.getTextureLimit(assetType, surfaceAppearance, v_1) else t[v_1]
								local ok, status = pcall(function() --[[ line: 96 ]]
									-- upvalues: UGCValidationService (copy), var11 (ref)
									return UGCValidationService:GetEditableImageSize(var11.editable)
								end)
								
								if not ok then
									if consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.Backend then
										p0:fetchError(string.format("Failed to get texture size for '%s'. Make sure the texture exists and try again.", surfaceAppearance:GetFullName() .. "." .. v_1))
									end
									p0:fail(errorSourceStringsModule.Keys.TextureSize_FailedToLoad, { FullName = surfaceAppearance:GetFullName() .. "." .. v_1 }, surfaceAppearance)
								elseif var12 < status.X or var12 < status.Y then
									p0:fail(errorSourceStringsModule.Keys.TextureSize_TooBig, {
										Width = tostring(status.X),
										Height = tostring(status.Y),
										FullName = surfaceAppearance:GetFullName() .. "." .. v_1,
										MaxSize = tostring(var12),
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