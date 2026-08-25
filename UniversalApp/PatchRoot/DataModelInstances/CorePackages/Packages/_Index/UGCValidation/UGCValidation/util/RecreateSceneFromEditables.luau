local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local assetService = game:GetService("AssetService")
local getFFlagUGCValidationAddPBRToSharedDataModule = require(parent.flags.getFFlagUGCValidationAddPBRToSharedData)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local r15plusUtilsModule = require(parent.util.R15plusUtils)
local rigBuilderModule = require(parent.util.RigBuilder)
local buildEmoteKeyframeSequenceFromCurveAnimModule = require(parent.util.buildEmoteKeyframeSequenceFromCurveAnim)
local getEngineFeatureEngineUGCValidateEmoteAnimationExportModule = require(parent.flags.getEngineFeatureEngineUGCValidateEmoteAnimationExport)
local getFFlagUGCValidationAddGeometryToExportsModule = require(parent.flags.getFFlagUGCValidationAddGeometryToExports)
local getFFlagUGCValidateAllowEmissivesModule = require(parent.flags.getFFlagUGCValidateAllowEmissives)
local t = {}

local function createCagePart(p1, p2, p3, p4)
	-- upvalues: assetService (ref)
	local editable = assetService:CreateMeshPartAsync(Content.fromObject(p3.editable))
	editable.Name = `{p1}_{p4}`
	editable.Size *= p2.scale
	editable.CFrame = p1.CFrame * (CFrame.new(p3.origin.Position * p2.scale) * p3.origin.Rotation)
	
	return editable
end

local function copyMeshPart(p1, p2, p3)
	-- upvalues: assetService (ref), getFFlagUGCValidationAddPBRToSharedDataModule (ref), getFFlagUGCValidateAllowEmissivesModule (ref), r15plusUtilsModule (ref)
	local editable = assetService:CreateMeshPartAsync(Content.fromObject(p2.editable))
	
	if getFFlagUGCValidationAddPBRToSharedDataModule() then
		if p3 and not p3.isPBR and p3.Texture then
			editable.TextureContent = Content.fromObject(p3.Texture.editable)
		elseif p3 and p3.isPBR then
			local surfaceAppearance = Instance.new("SurfaceAppearance")
			
			if p3.ColorMap then
				surfaceAppearance.ColorMapContent = Content.fromObject(p3.ColorMap.editable)
			end
			if p3.MetalnessMap then
				surfaceAppearance.MetalnessMapContent = Content.fromObject(p3.MetalnessMap.editable)
			end
			if p3.NormalMap then
				surfaceAppearance.NormalMapContent = Content.fromObject(p3.NormalMap.editable)
			end
			if p3.RoughnessMap then
				surfaceAppearance.RoughnessMapContent = Content.fromObject(p3.RoughnessMap.editable)
			end
			if getFFlagUGCValidateAllowEmissivesModule() and p3.EmissiveMask then
				surfaceAppearance.EmissiveMaskContent = Content.fromObject(p3.EmissiveMask.editable)
			end
			surfaceAppearance.Parent = editable
		end
	elseif p3 then
		editable.TextureContent = Content.fromObject(p3.editable)
	end
	editable.Name = p1.Name
	editable.Size = p1.Size
	editable.CFrame = p1.CFrame
	
	for i, v in p1:GetChildren() do
		if (v:IsA("Attachment") or v:IsA("FaceControls")) and (not r15plusUtilsModule.checkFlagEnabledForAllowHrd() or not v:IsA("Bone")) then
			v:Clone().Parent = editable
		end
	end
	if r15plusUtilsModule.checkFlagEnabledForAllowHrd() then
		for i_1, v_1 in r15plusUtilsModule.getNameWhitelistOfClassInSchema(r15plusUtilsModule.getAvatarBoneSchema(p1.Name), "Attachment") do
			if v_1 and editable:FindFirstChild(i_1) == nil then
				local var1 = p1:FindFirstChild(i_1, true)
				local var2 = if var1 ~= nil then editable.CFrame else var1.WorldCFrame
				local attachment = Instance.new("Attachment")
				attachment.Name = i_1
				attachment.Parent = editable
				attachment.WorldCFrame = var2
			end
		end
	end
	return editable
end

local function addBonesFromPoses(p1, p2, p3)
	-- upvalues: addBonesFromPoses (ref)
	for i, v in p1:GetChildren() do
		if v:IsA("Pose") then
			local name = v.Name
			local var1 = p3:FindFirstChild(name)
			
			if var1 and var1:IsA("BasePart") then
				addBonesFromPoses(v, var1, p3)
			else
				local bone = Instance.new("Bone")
				bone.Name = name
				bone.Parent = p2
				addBonesFromPoses(v, bone, p3)
			end
		end
	end
end

local function createEmoteExportScene(p1)
	-- upvalues: rigBuilderModule (ref), buildEmoteKeyframeSequenceFromCurveAnimModule (ref), addBonesFromPoses (ref)
	local var1 = rigBuilderModule.createDefaultCharacter(false)
	local var2 = if p1.curveAnimations and #p1.curveAnimations > 0 then buildEmoteKeyframeSequenceFromCurveAnimModule(p1.curveAnimations[1]) else nil
	
	if not var2 then
		error("Emote export requires a curve animation, but none was available")
	end
	var2.Parent = var1
	local children = var2:GetChildren()
	local humanoidRootPart = var1:FindFirstChild("HumanoidRootPart")
	
	if #children > 0 and humanoidRootPart and humanoidRootPart:IsA("BasePart") then
		addBonesFromPoses(children[1], humanoidRootPart, var1)
	end
	var1:PivotTo(CFrame.new())
	
	return var1
end

function t.createModelForGltfExport(p1)
	-- upvalues: getEngineFeatureEngineUGCValidateEmoteAnimationExportModule (ref), validationEnumsModule (ref), createEmoteExportScene (ref), copyMeshPart (ref), createCagePart (ref), getFFlagUGCValidationAddGeometryToExportsModule (ref)
	if getEngineFeatureEngineUGCValidateEmoteAnimationExportModule() and p1.uploadCategory == validationEnumsModule.UploadCategory.EMOTE_ANIMATION then
		return createEmoteExportScene(p1)
	end
	local model = Instance.new("Model")
	local descendants = p1.rootInstance:GetDescendants()
	table.insert(descendants, p1.rootInstance)
	
	for i, v in descendants do
		if v:IsA("MeshPart") then
			local name = v.Name
			local var1 = p1.renderMeshesData[name]
			
			if not var1 then
				error("Missing editable data")
			end
			local var2 = copyMeshPart(v, var1, p1.meshTextures[name])
			var2.Parent = model
			local var3 = p1.outerCagesData[name]
			
			if var3 then
				createCagePart(var2, var1, var3, "OuterCage").Parent = model
			end
			local var4 = p1.innerCagesData[name]
			
			if var4 then
				createCagePart(var2, var1, var4, "InnerCage").Parent = model
			end
			if getFFlagUGCValidationAddGeometryToExportsModule() and p1.uploadCategory == validationEnumsModule.UploadCategory.FULL_BODY then
				var2.Name = `{name}_Geo`
			end
		end
	end
	model:PivotTo(CFrame.new())
	
	return model
end

return t