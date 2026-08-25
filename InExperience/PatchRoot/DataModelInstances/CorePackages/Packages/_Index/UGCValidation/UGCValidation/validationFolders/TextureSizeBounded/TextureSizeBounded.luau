local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local constantsInterfaceModule = require(parent.ConstantsInterface)
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local fetchAllDesiredDataModule = require(parent.validationSystem.dataFetchModules.FetchAllDesiredData)
local getFFlagUGCValidateAllowEmissivesModule = require(parent.flags.getFFlagUGCValidateAllowEmissives)
local t = {
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD,
		validationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		validationEnumsModule.UploadCategory.RIGID_ACCESSORY
	},
	requiredData = {},
	conditionalData = { validationEnumsModule.SharedDataMember.meshTextures },
	fflag = require(parent.flags.getFFlagUGCValidateMigrateTextureTransparency),
	expectedFailures = {}
}

local function checkEditableImageSize(p0, p1, p2, p3, p4, p5, p6)
	-- upvalues: UGCValidationService (ref), validationEnumsModule (ref), errorSourceStringsModule (ref)
	local ok, status = pcall(function()
		-- upvalues: UGCValidationService (copy), p0 (ref)
		return UGCValidationService:GetEditableImageSize(p0)
	end)
	
	if ok then
		if p1 < status.X or p1 < status.Y then
			p4:fail(errorSourceStringsModule.Keys.TextureSize_TooBig, {
				Width = tostring(status.X),
				Height = tostring(status.Y),
				FullName = p2,
				MaxSize = tostring(p1),
				FieldName = p3
			}, p5)
		end
		return
	elseif p6 and p6.consumerEnv == validationEnumsModule.ConsumerEnv.Backend then
		p4:fetchError(string.format("Failed to get texture size for '%s'. Make sure the texture exists and try again.", p2))
	end
	p4:fail(errorSourceStringsModule.Keys.TextureSize_FailedToLoad, { FullName = p2 }, p5)
end

function t.run(p7, p8)
	-- upvalues: fetchAllDesiredDataModule (ref), validationEnumsModule (ref), getFFlagUGCValidateAllowEmissivesModule (ref), constantsInterfaceModule (ref), checkEditableImageSize (ref)
	local rootInstance = p8.rootInstance
	local assetType = p8.uploadEnum.assetType
	local meshTextures = p8.meshTextures
	local consumerConfig = p8.consumerConfig
	local uploadCategory = p8.uploadCategory
	
	if not meshTextures or meshTextures == fetchAllDesiredDataModule.DATA_FETCH_FAILURE then
		p7:fetchError("Failed to load texture data for texture size check")
		
		return
	end
	local descendants = rootInstance:GetDescendants()
	table.insert(descendants, rootInstance)
	
	for i, v in descendants do
		local specialMesh
		local var9 = nil
		local var10 = ""
		
		if v:IsA("MeshPart") then
			var9 = v
			var10 = v.Name
		elseif v:IsA("Part") then
			specialMesh = v:FindFirstChildOfClass("SpecialMesh")
			
			if specialMesh then
				var9 = specialMesh
				var10 = v.Name
			end
		end
		if var9 then
			specialMesh = meshTextures[var10]
			
			if specialMesh then
				if specialMesh.isPBR and (if uploadCategory ~= validationEnumsModule.UploadCategory.TORSO_AND_LIMBS then uploadCategory == validationEnumsModule.UploadCategory.DYNAMIC_HEAD else true) then
					local surfaceAppearance = var9:FindFirstChildWhichIsA("SurfaceAppearance")
					
					if surfaceAppearance then
						local list = { "ColorMap", "MetalnessMap", "NormalMap", "RoughnessMap" }
						
						if getFFlagUGCValidateAllowEmissivesModule() then
							table.insert(list, "EmissiveMask")
						end
						for i_1, v_1 in list do
							local var15 = specialMesh[v_1]
							
							if var15 and var15.editable then
								checkEditableImageSize(var15.editable, constantsInterfaceModule.getTextureLimit(assetType, surfaceAppearance, v_1), surfaceAppearance:GetFullName() .. "." .. v_1, v_1, p7, surfaceAppearance, consumerConfig)
							end
						end
					end
				elseif not specialMesh.isPBR and specialMesh.Texture and specialMesh.Texture.editable then
					local var12 = if var9:IsA("MeshPart") then "TextureID" else "TextureId"
					checkEditableImageSize(specialMesh.Texture.editable, constantsInterfaceModule.getTextureLimit(assetType, var9, var12), var9:GetFullName(), var12, p7, var9, consumerConfig)
				end
			end
		end
	end
end

return t