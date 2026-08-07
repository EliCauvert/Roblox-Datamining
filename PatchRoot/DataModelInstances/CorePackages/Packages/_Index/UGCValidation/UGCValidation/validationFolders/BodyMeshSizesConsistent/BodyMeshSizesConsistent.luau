-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:45 2026 Pacific Standard Time.

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

local function calculateMeshSizeForPart(p0, p1) --[[ line: 33 ]]
	-- upvalues: getEditableMeshFromContextModule (ref), getMeshSizeModule (ref)
	local t = {
		fieldName = "MeshId",
		fullName = p0:GetFullName(),
		contentId = p0.MeshId,
		context = p0.Name
	}
	local var12, var13 = getEditableMeshFromContextModule(p0, "MeshId", p1)
	
	if var12 then
		t.editableMesh = var13
		
		return true, getMeshSizeModule(t)
	end
	return false, nil
end

local function validateWrapTargetComparison(p2, p3, p4, p5) --[[ line: 52 ]]
	-- upvalues: getMeshInfoModule (ref), constantsModule (ref), errorSourceStringsModule (ref), getMeshMinMaxModule (ref)
	local var14, _, var15 = getMeshInfoModule(p3, constantsModule.MESH_CONTENT_TYPE.RENDER_MESH, p4)
	
	if not var14 then
		p5:fail(errorSourceStringsModule.Keys.BodyMesh_LoadFailed, { meshName = p3:GetFullName() }, p3)
		
		return
	end
	local wrapTarget = p3:FindFirstChildWhichIsA("WrapTarget")
	
	if not wrapTarget then return end
	local var17, _, var18 = getMeshInfoModule(wrapTarget, constantsModule.MESH_CONTENT_TYPE.OUTER_CAGE, p4)
	
	if not var17 then
		p5:fail(errorSourceStringsModule.Keys.BodyMesh_LoadFailed, { meshName = wrapTarget:GetFullName() }, p3)
		
		return
	end
	var15.scale = p2
	var18.scale = p2
	local renderVsWrapMeshMaxDiff = constantsModule.RenderVsWrapMeshMaxDiff
	local var19, _, var20, var21 = getMeshMinMaxModule(var15, p4)
	
	if not var19 then
		p5:fetchError("Failed to read mesh: " .. var15.fullName)
		
		return
	end
	local var22, _, var23, var24 = getMeshMinMaxModule(var18, p4)
	
	if not var22 then
		p5:fetchError("Failed to read mesh: " .. var18.fullName)
		
		return
	elseif renderVsWrapMeshMaxDiff < (var20 - var23).Magnitude or renderVsWrapMeshMaxDiff < (var21 - var24).Magnitude then
		p5:fail(errorSourceStringsModule.Keys.BodyMesh_SizeMismatch, {
			meshContext = var15.fullName .. "." .. var15.fieldName,
			maxDiff = string.format("%.2f", renderVsWrapMeshMaxDiff),
			otherMeshContext = var18.fullName .. "." .. var18.fieldName
		}, p3)
	end
end

function t.run(p6, p7) --[[ line: 112 ]]
	-- upvalues: validationEnumsModule (ref), calculateMeshSizeForPart (ref), errorSourceStringsModule (ref), getExpectedPartSizeModule (ref), validateWrapTargetComparison (ref), constantsModule (ref)
	local rootInstance = p7.rootInstance
	local assetType = p7.uploadEnum.assetType
	local var25 = p7.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.Backend
	local t = {}
	
	if p7.renderMeshesData then
		local descendants = rootInstance:GetDescendants()
		table.insert(descendants, rootInstance)
		
		for i, v in descendants do
			local name = p7.renderMeshesData[v.Name]
			
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
	if p7.outerCagesData then
		local descendants = rootInstance:GetDescendants()
		table.insert(descendants, rootInstance)
		
		for i, v in descendants do
			if v:IsA("BaseWrap") and v.Parent then
				local name = p7.outerCagesData[v.Parent.Name]
				
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
		isServer = var25,
		editableMeshes = t,
		bypassFlags = { skipPhysicsDataReset = true }
	}
	
	local function validateSingleMeshPart(p8) --[[ line: 156 ]]
		-- upvalues: calculateMeshSizeForPart (copy), t_1 (ref), p6 (ref), errorSourceStringsModule (copy), getExpectedPartSizeModule (copy), validateWrapTargetComparison (copy)
		local var33, var34 = calculateMeshSizeForPart(p8, t_1)
		
		if var33 and var34 then
			validateWrapTargetComparison(getExpectedPartSizeModule(p8, t_1) / var34, p8, t_1, p6)
			
			return
		end
		p6:fail(errorSourceStringsModule.Keys.BodyMesh_LoadFailed, { meshName = p8:GetFullName() }, p8)
	end
	
	local var31 = constantsModule.ASSET_TYPE_INFO[assetType]
	
	if Enum.AssetType.DynamicHead == assetType then
		validateSingleMeshPart(rootInstance)
		
		return
	elseif not var31 then return end
	for i_1 in pairs(var31.subParts) do
		local var32 = rootInstance:FindFirstChild(i_1)
		
		if var32 then
			validateSingleMeshPart(var32)
		end
	end
end

return t