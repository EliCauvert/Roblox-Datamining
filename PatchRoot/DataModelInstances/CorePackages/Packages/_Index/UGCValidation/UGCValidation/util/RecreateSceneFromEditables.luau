-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:40 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local assetService = game:GetService("AssetService")
local getFFlagUGCValidationAddPBRToSharedDataModule = require(parent.flags.getFFlagUGCValidationAddPBRToSharedData)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local r15plusUtilsModule = require(parent.util.R15plusUtils)
local getFFlagUGCValidationAddGeometryToExportsModule = require(parent.flags.getFFlagUGCValidationAddGeometryToExports)
local getFFlagUGCValidateAllowEmissivesModule = require(parent.flags.getFFlagUGCValidateAllowEmissives)
local t = {}

local function createCagePart(p0, p1, p2, p3) --[[ line: 18 ]]
	-- upvalues: assetService (ref)
	local editable = assetService:CreateMeshPartAsync(Content.fromObject(p2.editable))
	editable.Name = `{p0}_{p3}`
	editable.Size *= p1.scale
	editable.CFrame = p0.CFrame * (CFrame.new(p2.origin.Position * p1.scale) * p2.origin.Rotation)
	
	return editable
end

local function copyMeshPart(p4, p5, p6) --[[ line: 32 ]]
	-- upvalues: assetService (ref), getFFlagUGCValidationAddPBRToSharedDataModule (ref), getFFlagUGCValidateAllowEmissivesModule (ref), r15plusUtilsModule (ref)
	local editable = assetService:CreateMeshPartAsync(Content.fromObject(p5.editable))
	
	if getFFlagUGCValidationAddPBRToSharedDataModule() then
		if p6 and not p6.isPBR and p6.Texture then
			editable.TextureContent = Content.fromObject(p6.Texture.editable)
		elseif p6 and p6.isPBR then
			local surfaceAppearance = Instance.new("SurfaceAppearance")
			
			if p6.ColorMap then
				surfaceAppearance.ColorMapContent = Content.fromObject(p6.ColorMap.editable)
			end
			if p6.MetalnessMap then
				surfaceAppearance.MetalnessMapContent = Content.fromObject(p6.MetalnessMap.editable)
			end
			if p6.NormalMap then
				surfaceAppearance.NormalMapContent = Content.fromObject(p6.NormalMap.editable)
			end
			if p6.RoughnessMap then
				surfaceAppearance.RoughnessMapContent = Content.fromObject(p6.RoughnessMap.editable)
			end
			if getFFlagUGCValidateAllowEmissivesModule() and p6.EmissiveMask then
				surfaceAppearance.EmissiveMaskContent = Content.fromObject(p6.EmissiveMask.editable)
			end
			surfaceAppearance.Parent = editable
		end
	elseif p6 then
		editable.TextureContent = Content.fromObject(p6.editable)
	end
	editable.Name = p4.Name
	editable.Size = p4.Size
	editable.CFrame = p4.CFrame
	
	for i, v in p4:GetChildren() do
		if (v:IsA("Attachment") or v:IsA("FaceControls")) and (not r15plusUtilsModule.checkFlagEnabledForAllowHrd() or not v:IsA("Bone")) then
			v:Clone().Parent = editable
		end
	end
	if r15plusUtilsModule.checkFlagEnabledForAllowHrd() then
		for i_1, v_1 in r15plusUtilsModule.getNameWhitelistOfClassInSchema(r15plusUtilsModule.getAvatarBoneSchema(p4.Name), "Attachment") do
			if v_1 and editable:FindFirstChild(i_1) == nil then
				local var12 = p4:FindFirstChild(i_1, true)
				local var13 = if var12 ~= nil then editable.CFrame else var12.WorldCFrame
				local attachment = Instance.new("Attachment")
				attachment.Name = i_1
				attachment.Parent = editable
				attachment.WorldCFrame = var13
			end
		end
	end
	return editable
end

function t.createModelForGltfExport(p7) --[[ line: 113 ]]
	-- upvalues: copyMeshPart (ref), createCagePart (ref), getFFlagUGCValidationAddGeometryToExportsModule (ref), validationEnumsModule (ref)
	local model = Instance.new("Model")
	local descendants = p7.rootInstance:GetDescendants()
	table.insert(descendants, p7.rootInstance)
	
	for i, v in descendants do
		if v:IsA("MeshPart") then
			local name = v.Name
			local var17 = p7.renderMeshesData[name]
			
			if not var17 then
				error("Missing editable data")
			end
			local var18 = copyMeshPart(v, var17, p7.meshTextures[name])
			var18.Parent = model
			local var19 = p7.outerCagesData[name]
			
			if var19 then
				createCagePart(var18, var17, var19, "OuterCage").Parent = model
			end
			local var20 = p7.innerCagesData[name]
			
			if var20 then
				createCagePart(var18, var17, var20, "InnerCage").Parent = model
			end
			if getFFlagUGCValidationAddGeometryToExportsModule() and p7.uploadCategory == validationEnumsModule.UploadCategory.FULL_BODY then
				var18.Name = `{name}_Geo`
			end
		end
	end
	model:PivotTo(CFrame.new())
	
	return model
end

return t