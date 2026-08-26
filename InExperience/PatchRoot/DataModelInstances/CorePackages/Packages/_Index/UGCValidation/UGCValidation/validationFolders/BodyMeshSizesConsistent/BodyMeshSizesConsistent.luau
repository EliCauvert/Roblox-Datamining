local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getMeshMinMaxModule = require(parent.util.getMeshMinMax)
local getMeshSizeModule = require(parent.util.getMeshSize)
local getEditableMeshFromContextModule = require(parent.util.getEditableMeshFromContext)
local getExpectedPartSizeModule = require(parent.util.getExpectedPartSize)
local getMeshInfoModule = require(parent.util.getMeshInfo)
local t = {
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = {
		validationEnumsModule.SharedDataMember.rootInstance,
		validationEnumsModule.SharedDataMember.uploadEnum,
		validationEnumsModule.SharedDataMember.consumerConfig
	},
	conditionalData = {
		validationEnumsModule.SharedDataMember.renderMeshesData,
		validationEnumsModule.SharedDataMember.outerCagesData
	},
	fflag = require(parent.flags.getFFlagUGCValidateMigrateBodyPartBounds),
	expectedFailures = {}
}

local function calculateMeshSizeForPart(p1, p2)
	-- upvalues: getEditableMeshFromContextModule (ref), getMeshSizeModule (ref)
	local t = {
		fieldName = "MeshId",
		fullName = p1:GetFullName(),
		contentId = p1.MeshId,
		context = p1.Name
	}
	local var1, var2 = getEditableMeshFromContextModule(p1, "MeshId", p2)
	
	if var1 then
		t.editableMesh = var2
		
		return true, getMeshSizeModule(t)
	end
	return false, nil
end

local function validateWrapTargetComparison(p1, p2, p3, p4)
	-- upvalues: getMeshInfoModule (ref), constantsModule (ref), errorSourceStringsModule (ref), getMeshMinMaxModule (ref)
	local var1, _, var2 = getMeshInfoModule(p2, constantsModule.MESH_CONTENT_TYPE.RENDER_MESH, p3)
	
	if not var1 then
		p4:fail(errorSourceStringsModule.Keys.BodyMesh_LoadFailed, { meshName = p2:GetFullName() }, p2)
		
		return
	end
	local wrapTarget = p2:FindFirstChildWhichIsA("WrapTarget")
	
	if not wrapTarget then return end
	local var3, _, var4 = getMeshInfoModule(wrapTarget, constantsModule.MESH_CONTENT_TYPE.OUTER_CAGE, p3)
	
	if not var3 then
		p4:fail(errorSourceStringsModule.Keys.BodyMesh_LoadFailed, { meshName = wrapTarget:GetFullName() }, p2)
		
		return
	end
	var2.scale = p1
	var4.scale = p1
	local renderVsWrapMeshMaxDiff = constantsModule.RenderVsWrapMeshMaxDiff
	local var5, _, var6, var7 = getMeshMinMaxModule(var2, p3)
	
	if not var5 then
		p4:fetchError("Failed to read mesh: " .. var15.fullName)
		
		return
	end
	local var8, _, var9, var10 = getMeshMinMaxModule(var4, p3)
	
	if not var8 then
		p4:fetchError("Failed to read mesh: " .. var18.fullName)
		
		return
	elseif renderVsWrapMeshMaxDiff < (var6 - var9).Magnitude or renderVsWrapMeshMaxDiff < (var7 - var10).Magnitude then
		p4:fail(errorSourceStringsModule.Keys.BodyMesh_SizeMismatch, {
			meshContext = var2.fullName .. "." .. var15.fieldName,
			maxDiff = string.format("%.2f", renderVsWrapMeshMaxDiff),
			otherMeshContext = var4.fullName .. "." .. var18.fieldName
		}, p2)
	end
end

function t.run(p1, p2)
	-- upvalues: validationEnumsModule (ref), calculateMeshSizeForPart (ref), errorSourceStringsModule (ref), getExpectedPartSizeModule (ref), validateWrapTargetComparison (ref), constantsModule (ref)
	local rootInstance = p2.rootInstance
	local assetType = p2.uploadEnum.assetType
	local var1 = p2.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.Backend
	local t = {}
	
	if p2.renderMeshesData then
		local descendants = rootInstance:GetDescendants()
		table.insert(descendants, rootInstance)
		
		for i, v in descendants do
			local name = p2.renderMeshesData[v.Name]
			
			if name and name.editable then
				t[v] = {
					MeshId = {
						instance = name.editable,
						created = name.createdInValidation
					}
				}
			end
		end
	end
	if p2.outerCagesData then
		local descendants = rootInstance:GetDescendants()
		table.insert(descendants, rootInstance)
		
		for i, v in descendants do
			if v:IsA("BaseWrap") and v.Parent then
				local name = p2.outerCagesData[v.Parent.Name]
				
				if name and name.editable then
					t[v] = {
						CageMeshId = {
							instance = name.editable,
							created = name.createdInValidation
						}
					}
				end
			end
		end
	end
	local t_1 = {
		assetTypeEnum = assetType,
		isServer = var1,
		editableMeshes = t,
		bypassFlags = { skipPhysicsDataReset = true }
	}
	
	local function validateSingleMeshPart(p3)
		-- upvalues: calculateMeshSizeForPart (copy), t_1 (ref), p1 (ref), errorSourceStringsModule (copy), getExpectedPartSizeModule (copy), validateWrapTargetComparison (copy)
		local var2, var3 = calculateMeshSizeForPart(p3, t_1)
		
		if var2 and var3 then
			validateWrapTargetComparison(getExpectedPartSizeModule(p3, t_1) / var3, p3, t_1, p1)
			
			return
		end
		p1:fail(errorSourceStringsModule.Keys.BodyMesh_LoadFailed, { meshName = p3:GetFullName() }, p3)
	end
	
	local var2 = constantsModule.ASSET_TYPE_INFO[assetType]
	
	if Enum.AssetType.DynamicHead == assetType then
		validateSingleMeshPart(rootInstance)
		
		return
	elseif not var2 then return end
	for i_1 in pairs(var2.subParts) do
		local var3 = rootInstance:FindFirstChild(i_1)
		
		if var3 then
			validateSingleMeshPart(var3)
		end
	end
end

return t