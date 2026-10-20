local Parent = script.Parent.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetMeshMinMaxModule = require(Parent.util.getMeshMinMax)
local GetMeshSizeModule = require(Parent.util.getMeshSize)
local GetEditableMeshFromContextModule = require(Parent.util.getEditableMeshFromContext)
local GetExpectedPartSizeModule = require(Parent.util.getExpectedPartSize)
local GetMeshInfoModule = require(Parent.util.getMeshInfo)

local function calculateMeshSizeForPart(Object, p1)
	-- upvalues: GetEditableMeshFromContextModule (copy), GetMeshSizeModule (copy)
	local config = {
		fieldName = "MeshId",
		fullName = Object:GetFullName(),
		contentId = Object.MeshId,
		context = Object.Name
	}
	local MeshId, MeshId2 = GetEditableMeshFromContextModule(Object, "MeshId", p1)
	
	if MeshId then
		config.editableMesh = MeshId2
		
		return true, (GetMeshSizeModule(config))
	else
		return false, nil
	end
end

local function validateWrapTargetComparison(Scale, Object, p1, p2)
	-- upvalues: GetMeshInfoModule (copy), ConstantsModule (copy), ErrorSourceStringsModule (copy), GetMeshMinMaxModule (copy)
	local MeshInfoModule, _, MeshInfoModule3 = GetMeshInfoModule(Object, ConstantsModule.MESH_CONTENT_TYPE.RENDER_MESH, p1)
	
	if not MeshInfoModule then
		p2:fail(ErrorSourceStringsModule.Keys.BodyMesh_LoadFailed, { meshName = Object:GetFullName() }, Object)
		
		return
	end
	local WrapTarget = Object:FindFirstChildWhichIsA("WrapTarget")
	
	if not WrapTarget then return end
	local MeshInfoModule1, _, MeshInfoModule3_1 = GetMeshInfoModule(WrapTarget, ConstantsModule.MESH_CONTENT_TYPE.OUTER_CAGE, p1)
	
	if not MeshInfoModule1 then
		p2:fail(ErrorSourceStringsModule.Keys.BodyMesh_LoadFailed, { meshName = WrapTarget:GetFullName() }, Object)
		
		return
	end
	MeshInfoModule3.scale = Scale
	MeshInfoModule3_1.scale = Scale
	local RenderVsWrapMeshMaxDiff = ConstantsModule.RenderVsWrapMeshMaxDiff
	local MeshMinMaxModule, _, MeshMinMaxModule3, MeshMinMaxModule4 = GetMeshMinMaxModule(MeshInfoModule3, p1)
	
	if not MeshMinMaxModule then
		p2:fetchError("Failed to read mesh: " .. MeshInfoModule3.fullName)
		
		return
	end
	local MeshMinMaxModule1, _, MeshMinMaxModule3_1, MeshMinMaxModule4_1 = GetMeshMinMaxModule(MeshInfoModule3_1, p1)
	
	if not MeshMinMaxModule1 then
		p2:fetchError("Failed to read mesh: " .. MeshInfoModule3_1.fullName)
		
		return
	end
	if RenderVsWrapMeshMaxDiff < (MeshMinMaxModule3 - MeshMinMaxModule3_1).Magnitude or RenderVsWrapMeshMaxDiff < (MeshMinMaxModule4 - MeshMinMaxModule4_1).Magnitude then
		p2:fail(ErrorSourceStringsModule.Keys.BodyMesh_SizeMismatch, {
			meshContext = MeshInfoModule3.fullName .. "." .. MeshInfoModule3.fieldName,
			maxDiff = string.format("%.2f", RenderVsWrapMeshMaxDiff),
			otherMeshContext = MeshInfoModule3_1.fullName .. "." .. MeshInfoModule3_1.fieldName
		}, Object)
	end
end

return {
	categories = {
		ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = {
		ValidationEnumsModule.SharedDataMember.rootInstance,
		ValidationEnumsModule.SharedDataMember.uploadEnum,
		ValidationEnumsModule.SharedDataMember.consumerConfig
	},
	conditionalData = {
		ValidationEnumsModule.SharedDataMember.renderMeshesData,
		ValidationEnumsModule.SharedDataMember.outerCagesData
	},
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: ValidationEnumsModule (copy), calculateMeshSizeForPart (copy), ErrorSourceStringsModule (copy), GetExpectedPartSizeModule (copy), validateWrapTargetComparison (copy), ConstantsModule (copy)
		local RootInstance = p2.rootInstance
		local AssetType = p2.uploadEnum.assetType
		local IsValidationEnvMatch = p2.consumerConfig.validationEnv == ValidationEnumsModule.ValidationEnv.Backend
		local EditableMeshes = {}
		
		if p2.renderMeshesData then
			local Descendants = RootInstance:GetDescendants()
			table.insert(Descendants, RootInstance)
			
			for _, descendant in Descendants do
				local RenderMeshes = p2.renderMeshesData[descendant.Name]
				
				if RenderMeshes and RenderMeshes.editable then
					EditableMeshes[descendant] = {
						MeshId = {
							instance = RenderMeshes.editable,
							created = RenderMeshes.createdInValidation
						}
					}
				end
			end
		end
		if p2.outerCagesData then
			local Descendants = RootInstance:GetDescendants()
			table.insert(Descendants, RootInstance)
			
			for _, BaseWrap in Descendants do
				if BaseWrap:IsA("BaseWrap") and BaseWrap.Parent then
					local OuterCages = p2.outerCagesData[BaseWrap.Parent.Name]
					
					if OuterCages and OuterCages.editable then
						EditableMeshes[BaseWrap] = {
							CageMeshId = {
								instance = OuterCages.editable,
								created = OuterCages.createdInValidation
							}
						}
					end
				end
			end
		end
		local config = {
			assetTypeEnum = AssetType,
			isServer = IsValidationEnvMatch,
			editableMeshes = EditableMeshes,
			bypassFlags = { skipPhysicsDataReset = true }
		}
		
		local function validateSingleMeshPart(RootInstance)
			-- upvalues: calculateMeshSizeForPart (upval), config (copy), p1 (copy), ErrorSourceStringsModule (upval), GetExpectedPartSizeModule (upval), validateWrapTargetComparison (upval)
			local MeshSizeForPart, MeshSizeForPart2 = calculateMeshSizeForPart(RootInstance, config)
			
			if MeshSizeForPart and MeshSizeForPart2 then
				validateWrapTargetComparison(GetExpectedPartSizeModule(RootInstance, config) / MeshSizeForPart2, RootInstance, config, p1)
				
				return
			else
				p1:fail(ErrorSourceStringsModule.Keys.BodyMesh_LoadFailed, { meshName = RootInstance:GetFullName() }, RootInstance)
			end
		end
		
		local ASSETTYPE = ConstantsModule.ASSET_TYPE_INFO[AssetType]
		
		if Enum.AssetType.DynamicHead == AssetType then
			validateSingleMeshPart(RootInstance)
			
			return
		end
		if not ASSETTYPE then return end
		for subPart in pairs(ASSETTYPE.subParts) do
			local Child = RootInstance:FindFirstChild(subPart)
			
			if Child then
				validateSingleMeshPart(Child)
			end
		end
	end
}