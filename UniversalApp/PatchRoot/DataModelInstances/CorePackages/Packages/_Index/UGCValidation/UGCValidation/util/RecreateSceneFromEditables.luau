local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local AssetService = game:GetService("AssetService")
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local R15plusUtilsModule = require(Parent.util.R15plusUtils)
local RigBuilderModule = require(Parent.util.RigBuilder)
local BuildEmoteKeyframeSequenceFromCurveAnimModule = require(Parent.util.buildEmoteKeyframeSequenceFromCurveAnim)
local GetEngineFeatureEngineUGCValidateEmoteAnimationExportModule = require(Parent.flags.getEngineFeatureEngineUGCValidateEmoteAnimationExport)

local function createCagePart(p1, RenderMeshes, InnerCages, p2) --[[ Line: 19 ]]
	-- upvalues: AssetService (copy)
	local MeshPartAsync = AssetService:CreateMeshPartAsync(Content.fromObject(InnerCages.editable))
	MeshPartAsync.Name = `{p1}_{p2}`
	MeshPartAsync.Size *= RenderMeshes.scale
	MeshPartAsync.CFrame = p1.CFrame * (CFrame.new(InnerCages.origin.Position * RenderMeshes.scale) * InnerCages.origin.Rotation)
	
	return MeshPartAsync
end

local function copyMeshPart(Object, RenderMeshes, MeshTexture) --[[ Line: 33 ]]
	-- upvalues: AssetService (copy), R15plusUtilsModule (copy)
	local MeshPartAsync = AssetService:CreateMeshPartAsync(Content.fromObject(RenderMeshes.editable))
	
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
		if MeshTexture.EmissiveMask then
			SurfaceAppearance.EmissiveMaskContent = Content.fromObject(MeshTexture.EmissiveMask.editable)
		end
		SurfaceAppearance.Parent = MeshPartAsync
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

local function addBonesFromPoses(Pose, Parent, DefaultCharacter) --[[ Line: 113 ]]
	-- upvalues: addBonesFromPoses (copy)
	for _, Pose1 in Pose:GetChildren() do
		if Pose1:IsA("Pose") then
			local Name = Pose1.Name
			local Name1 = DefaultCharacter:FindFirstChild(Name)
			
			if Name1 and Name1:IsA("BasePart") then
				addBonesFromPoses(Pose1, Name1, DefaultCharacter)
			else
				local Bone = Instance.new("Bone")
				Bone.Name = Name
				Bone.Parent = Parent
				addBonesFromPoses(Pose1, Bone, DefaultCharacter)
			end
		end
	end
end

local function createEmoteExportScene(p1) --[[ Line: 130 ]]
	-- upvalues: RigBuilderModule (copy), BuildEmoteKeyframeSequenceFromCurveAnimModule (copy), addBonesFromPoses (copy)
	local DefaultCharacter = RigBuilderModule.createDefaultCharacter(false)
	local EmoteKeyframeSequenceFromCurveAnimModule = if p1.curveAnimations and #p1.curveAnimations > 0 then BuildEmoteKeyframeSequenceFromCurveAnimModule(p1.curveAnimations[1]) else nil
	
	if not EmoteKeyframeSequenceFromCurveAnimModule then
		error("Emote export requires a curve animation, but none was available")
	end
	EmoteKeyframeSequenceFromCurveAnimModule.Parent = DefaultCharacter
	local Children = EmoteKeyframeSequenceFromCurveAnimModule:GetChildren()
	local HumanoidRootPart = DefaultCharacter:FindFirstChild("HumanoidRootPart")
	
	if #Children > 0 and HumanoidRootPart and HumanoidRootPart:IsA("BasePart") then
		addBonesFromPoses(Children[1], HumanoidRootPart, DefaultCharacter)
	end
	DefaultCharacter:PivotTo(CFrame.new())
	
	return DefaultCharacter
end

return {
	createModelForGltfExport = function(p1) --[[ Line: 160 ]]
		-- upvalues: GetEngineFeatureEngineUGCValidateEmoteAnimationExportModule (copy), ValidationEnumsModule (copy), createEmoteExportScene (copy), copyMeshPart (copy), createCagePart (copy)
		if GetEngineFeatureEngineUGCValidateEmoteAnimationExportModule() and p1.uploadCategory == ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION then
			return (createEmoteExportScene(p1))
		end
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
				if p1.uploadCategory == ValidationEnumsModule.UploadCategory.FULL_BODY then
					CopyMeshPartResult.Name = `{Name}_Geo`
				end
			end
		end
		Model:PivotTo(CFrame.new())
		
		return Model
	end
}