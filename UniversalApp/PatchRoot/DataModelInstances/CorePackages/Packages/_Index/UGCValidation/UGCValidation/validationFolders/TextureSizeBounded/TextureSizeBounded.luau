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

local function checkEditableImageSize(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: UGCValidationService (ref), validationEnumsModule (ref), errorSourceStringsModule (ref)
	local ok, status = pcall(function()
		-- upvalues: UGCValidationService (copy), p1 (ref)
		return UGCValidationService:GetEditableImageSize(p1)
	end)
	
	if ok then
		if p2 < status.X or p2 < status.Y then
			p5:fail(errorSourceStringsModule.Keys.TextureSize_TooBig, {
				Width = tostring(status.X),
				Height = tostring(status.Y),
				FullName = p3,
				MaxSize = tostring(p2),
				FieldName = p4
			}, p6)
		end
		return
	elseif p7 and p7.consumerEnv == validationEnumsModule.ConsumerEnv.Backend then
		p5:fetchError(string.format("Failed to get texture size for '%s'. Make sure the texture exists and try again.", p3))
	end
	p5:fail(errorSourceStringsModule.Keys.TextureSize_FailedToLoad, { FullName = p3 }, p6)
end

function t.run(p1, p2)
	-- upvalues: fetchAllDesiredDataModule (ref), validationEnumsModule (ref), getFFlagUGCValidateAllowEmissivesModule (ref), constantsInterfaceModule (ref), checkEditableImageSize (ref)
	local rootInstance = p2.rootInstance
	local assetType = p2.uploadEnum.assetType
	local meshTextures = p2.meshTextures
	local consumerConfig = p2.consumerConfig
	local uploadCategory = p2.uploadCategory
	
	if not meshTextures or meshTextures == fetchAllDesiredDataModule.DATA_FETCH_FAILURE then
		p1:fetchError("Failed to load texture data for texture size check")
		
		return
	end
	local descendants = rootInstance:GetDescendants()
	table.insert(descendants, rootInstance)
	
	for i, v in descendants do
		local specialMesh
		local var1 = nil
		local var2 = ""
		
		if v:IsA("MeshPart") then
			var1 = v
			var2 = v.Name
		elseif v:IsA("Part") then
			specialMesh = v:FindFirstChildOfClass("SpecialMesh")
			
			if specialMesh then
				var1 = specialMesh
				var2 = v.Name
			end
		end
		if var1 then
			specialMesh = meshTextures[var2]
			
			if specialMesh then
				if specialMesh.isPBR and (if uploadCategory ~= validationEnumsModule.UploadCategory.TORSO_AND_LIMBS then uploadCategory == validationEnumsModule.UploadCategory.DYNAMIC_HEAD else true) then
					local surfaceAppearance = var1:FindFirstChildWhichIsA("SurfaceAppearance")
					
					if surfaceAppearance then
						local list = { "ColorMap", "MetalnessMap", "NormalMap", "RoughnessMap" }
						
						if getFFlagUGCValidateAllowEmissivesModule() then
							table.insert(list, "EmissiveMask")
						end
						for i_1, v_1 in list do
							local var3 = specialMesh[v_1]
							
							if var3 and var3.editable then
								checkEditableImageSize(var3.editable, constantsInterfaceModule.getTextureLimit(assetType, surfaceAppearance, v_1), surfaceAppearance:GetFullName() .. "." .. v_1, v_1, p1, surfaceAppearance, consumerConfig)
							end
						end
					end
				elseif not specialMesh.isPBR and specialMesh.Texture and specialMesh.Texture.editable then
					local var4 = if var1:IsA("MeshPart") then "TextureID" else "TextureId"
					checkEditableImageSize(specialMesh.Texture.editable, constantsInterfaceModule.getTextureLimit(assetType, var1, var4), var1:GetFullName(), var4, p1, var1, consumerConfig)
				end
			end
		end
	end
end

return t