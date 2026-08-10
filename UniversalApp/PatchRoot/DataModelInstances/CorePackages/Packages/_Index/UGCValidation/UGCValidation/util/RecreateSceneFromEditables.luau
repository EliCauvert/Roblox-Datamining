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

local function createCagePart(p0, p1, p2, p3) --[[ line: 22 ]]
	-- upvalues: assetService (ref)
	local editable = assetService:CreateMeshPartAsync(Content.fromObject(p2.editable))
	editable.Name = `{p0}_{p3}`
	editable.Size *= p1.scale
	editable.CFrame = p0.CFrame * (CFrame.new(p2.origin.Position * p1.scale) * p2.origin.Rotation)
	
	return editable
end

local function copyMeshPart(p4, p5, p6) --[[ line: 36 ]]
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
				local var17 = p4:FindFirstChild(i_1, true)
				local var18 = if var17 ~= nil then editable.CFrame else var17.WorldCFrame
				local attachment = Instance.new("Attachment")
				attachment.Name = i_1
				attachment.Parent = editable
				attachment.WorldCFrame = var18
			end
		end
	end
	return editable
end

local function addBonesFromPoses(p7, p8, p9) --[[ line: 122 ]]
	-- upvalues: addBonesFromPoses (ref)
	for i, v in p7:GetChildren() do
		if v:IsA("Pose") then
			local name = v.Name
			local var20 = p9:FindFirstChild(name)
			
			if var20 and var20:IsA("BasePart") then
				addBonesFromPoses(v, var20, p9)
			else
				local bone = Instance.new("Bone")
				bone.Name = name
				bone.Parent = p8
				addBonesFromPoses(v, bone, p9)
			end
		end
	end
end

local function createEmoteExportScene(p10) --[[ line: 139 ]]
	-- upvalues: rigBuilderModule (ref), buildEmoteKeyframeSequenceFromCurveAnimModule (ref), addBonesFromPoses (ref)
	local var22 = rigBuilderModule.createDefaultCharacter(false)
	local var23 = if p10.curveAnimations and #p10.curveAnimations > 0 then buildEmoteKeyframeSequenceFromCurveAnimModule(p10.curveAnimations[1]) else nil
	
	if not var23 then
		error("Emote export requires a curve animation, but none was available")
	end
	var23.Parent = var22
	local children = var23:GetChildren()
	local humanoidRootPart = var22:FindFirstChild("HumanoidRootPart")
	
	if #children > 0 and humanoidRootPart and humanoidRootPart:IsA("BasePart") then
		addBonesFromPoses(children[1], humanoidRootPart, var22)
	end
	var22:PivotTo(CFrame.new())
	
	return var22
end

function t.createModelForGltfExport(p11) --[[ line: 169 ]]
	-- upvalues: getEngineFeatureEngineUGCValidateEmoteAnimationExportModule (ref), validationEnumsModule (ref), createEmoteExportScene (ref), copyMeshPart (ref), createCagePart (ref), getFFlagUGCValidationAddGeometryToExportsModule (ref)
	if getEngineFeatureEngineUGCValidateEmoteAnimationExportModule() and p11.uploadCategory == validationEnumsModule.UploadCategory.EMOTE_ANIMATION then
		return createEmoteExportScene(p11)
	end
	local model = Instance.new("Model")
	local descendants = p11.rootInstance:GetDescendants()
	table.insert(descendants, p11.rootInstance)
	
	for i, v in descendants do
		if v:IsA("MeshPart") then
			local name = v.Name
			local var28 = p11.renderMeshesData[name]
			
			if not var28 then
				error("Missing editable data")
			end
			local var29 = copyMeshPart(v, var28, p11.meshTextures[name])
			var29.Parent = model
			local var30 = p11.outerCagesData[name]
			
			if var30 then
				createCagePart(var29, var28, var30, "OuterCage").Parent = model
			end
			local var31 = p11.innerCagesData[name]
			
			if var31 then
				createCagePart(var29, var28, var31, "InnerCage").Parent = model
			end
			if getFFlagUGCValidationAddGeometryToExportsModule() and p11.uploadCategory == validationEnumsModule.UploadCategory.FULL_BODY then
				var29.Name = `{name}_Geo`
			end
		end
	end
	model:PivotTo(CFrame.new())
	
	return model
end

return t