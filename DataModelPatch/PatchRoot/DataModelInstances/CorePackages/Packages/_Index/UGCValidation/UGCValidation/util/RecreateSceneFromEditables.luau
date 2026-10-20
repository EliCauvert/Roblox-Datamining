local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local AssetService = game:GetService("AssetService")
local GetFFlagUGCValidationAddPBRToSharedDataModule = require(Parent.flags.getFFlagUGCValidationAddPBRToSharedData)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local R15plusUtilsModule = require(Parent.util.R15plusUtils)
local GetFFlagUGCValidationAddGeometryToExportsModule = require(Parent.flags.getFFlagUGCValidationAddGeometryToExports)
local GetFFlagUGCValidateAllowEmissivesModule = require(Parent.flags.getFFlagUGCValidateAllowEmissives)

local function createCagePart(p1, RenderMeshes, InnerCages, p2)
	-- upvalues: AssetService (copy)
	local MeshPartAsync = AssetService:CreateMeshPartAsync(Content.fromObject(InnerCages.editable))
	MeshPartAsync.Name = `{p1}_{p2}`
	MeshPartAsync.Size *= RenderMeshes.scale
	MeshPartAsync.CFrame = p1.CFrame * (CFrame.new(InnerCages.origin.Position * RenderMeshes.scale) * InnerCages.origin.Rotation)
	
	return MeshPartAsync
end

local function copyMeshPart(Object, RenderMeshes, MeshTexture)
	-- upvalues: AssetService (copy), GetFFlagUGCValidationAddPBRToSharedDataModule (copy), GetFFlagUGCValidateAllowEmissivesModule (copy), R15plusUtilsModule (copy)
	local MeshPartAsync = AssetService:CreateMeshPartAsync(Content.fromObject(RenderMeshes.editable))
	
	if GetFFlagUGCValidationAddPBRToSharedDataModule() then
		if MeshTexture and not MeshTexture.isPBR and MeshTexture.Texture then
			MeshPartAsync.TextureContent = Content.fromObject(MeshTexture.Texture.editable)
		elseif MeshTexture and MeshTexture.isPBR then
			local SurfaceAppearance = Instance.new("SurfaceAppearance")
			
			if MeshTexture.ColorMap then
				SurfaceAppearance.ColorMapContent = Content.fromObject(MeshTexture.ColorMap.editable)
			end
			if MeshTexture.MetalnessMap then
				SurfaceAppearance.MetalnessMapContent = Content.fromObject(MeshTexture.MetalnessMap.editable)
			end
			if MeshTexture.NormalMap then
				SurfaceAppearance.NormalMapContent = Content.fromObject(MeshTexture.NormalMap.editable)
			end
			if MeshTexture.RoughnessMap then
				SurfaceAppearance.RoughnessMapContent = Content.fromObject(MeshTexture.RoughnessMap.editable)
			end
			if GetFFlagUGCValidateAllowEmissivesModule() and MeshTexture.EmissiveMask then
				SurfaceAppearance.EmissiveMaskContent = Content.fromObject(MeshTexture.EmissiveMask.editable)
			end
			SurfaceAppearance.Parent = MeshPartAsync
		end
	elseif MeshTexture then
		MeshPartAsync.TextureContent = Content.fromObject(MeshTexture.editable)
	end
	MeshPartAsync.Name = Object.Name
	MeshPartAsync.Size = Object.Size
	MeshPartAsync.CFrame = Object.CFrame
	
	for _, child in Object:GetChildren() do
		if (child:IsA("Attachment") or child:IsA("FaceControls")) and (not R15plusUtilsModule.checkFlagEnabledForAllowHrd() or not child:IsA("Bone")) then
			child:Clone().Parent = MeshPartAsync
		end
	end
	if R15plusUtilsModule.checkFlagEnabledForAllowHrd() then
		for ChildName, value in R15plusUtilsModule.getNameWhitelistOfClassInSchema(R15plusUtilsModule.getAvatarBoneSchema(Object.Name), "Attachment") do
			if value and MeshPartAsync:FindFirstChild(ChildName) == nil then
				local ChildName1 = Object:FindFirstChild(ChildName, true)
				local Attachment = Instance.new("Attachment")
				Attachment.Name = ChildName
				Attachment.Parent = MeshPartAsync
				Attachment.WorldCFrame = if ChildName1 == nil then MeshPartAsync.CFrame else ChildName1.WorldCFrame
			end
		end
	end
	return MeshPartAsync
end

return {
	createModelForGltfExport = function(p1)
		-- upvalues: copyMeshPart (copy), createCagePart (copy), GetFFlagUGCValidationAddGeometryToExportsModule (copy), ValidationEnumsModule (copy)
		local Model = Instance.new("Model")
		local Descendants = p1.rootInstance:GetDescendants()
		table.insert(Descendants, p1.rootInstance)
		
		for _, Part in Descendants do
			if Part:IsA("MeshPart") then
				local Name = Part.Name
				local RenderMeshes = p1.renderMeshesData[Name]
				
				if not RenderMeshes then
					error("Missing editable data")
				end
				local CopyMeshPartResult = copyMeshPart(Part, RenderMeshes, p1.meshTextures[Name])
				CopyMeshPartResult.Parent = Model
				local OuterCages = p1.outerCagesData[Name]
				
				if OuterCages then
					createCagePart(CopyMeshPartResult, RenderMeshes, OuterCages, "OuterCage").Parent = Model
				end
				local InnerCages = p1.innerCagesData[Name]
				
				if InnerCages then
					createCagePart(CopyMeshPartResult, RenderMeshes, InnerCages, "InnerCage").Parent = Model
				end
				if GetFFlagUGCValidationAddGeometryToExportsModule() and p1.uploadCategory == ValidationEnumsModule.UploadCategory.FULL_BODY then
					CopyMeshPartResult.Name = `{Name}_Geo`
				end
			end
		end
		Model:PivotTo(CFrame.new())
		
		return Model
	end
}