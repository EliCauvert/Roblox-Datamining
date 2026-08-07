local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local floatEqualsModule = require(parent.util.floatEquals)
local getMeshSizeModule = require(parent.util.getMeshSize)
local getEditableMeshFromContextModule = require(parent.util.getEditableMeshFromContext)
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
	conditionalData = { validationEnumsModule.SharedDataMember.renderMeshesData },
	fflag = require(parent.flags.getFFlagUGCValidateMigrateBodyPartBounds),
	expectedFailures = {}
}

local function _(p0, p1) --[[ line: 30 | named "vector3Equals" ]]
	-- upvalues: floatEqualsModule (ref)
	return floatEqualsModule(p0.X, p1.X, 0.00001) and (floatEqualsModule(p0.Y, p1.Y, 0.00001) and floatEqualsModule(p0.Z, p1.Z, 0.00001))
end

local function validateSingleMeshPart(p2, p3, p4) --[[ line: 35 ]]
	-- upvalues: getEditableMeshFromContextModule (ref), errorSourceStringsModule (ref), getMeshSizeModule (ref), floatEqualsModule (ref)
	local t = {
		fieldName = "MeshId",
		fullName = p2:GetFullName(),
		contentId = p2.MeshId,
		context = p2.Name
	}
	local var9, var10 = getEditableMeshFromContextModule(p2, "MeshId", p3)
	
	if not var9 then
		p4:fail(errorSourceStringsModule.Keys.MeshSize_LoadFailed, { meshName = p2.Name }, p2)
		
		return
	end
	t.editableMesh = var10
	local var11 = getMeshSizeModule(t)
	local meshSize = p2.MeshSize
	
	if not floatEqualsModule(meshSize.X, var11.X, 0.00001) or (not floatEqualsModule(meshSize.Y, var11.Y, 0.00001) or not floatEqualsModule(meshSize.Z, var11.Z, 0.00001)) then
		p4:fail(errorSourceStringsModule.Keys.MeshSize_Mismatch, { meshName = p2.Name }, p2)
	end
end

function t.run(p5, p6) --[[ line: 58 ]]
	-- upvalues: validationEnumsModule (ref), validateSingleMeshPart (ref), constantsModule (ref)
	local rootInstance = p6.rootInstance
	local assetType = p6.uploadEnum.assetType
	local consumerEnv = p6.consumerConfig.consumerEnv
	local var12 = consumerEnv == validationEnumsModule.ConsumerEnv.Backend
	
	if consumerEnv == validationEnumsModule.ConsumerEnv.IEC then return end
	local t = {}
	
	if p6.renderMeshesData then
		local descendants = rootInstance:GetDescendants()
		table.insert(descendants, rootInstance)
		
		for i, v in descendants do
			local name = p6.renderMeshesData[v.Name]
			
			if name and name.editable then
				t[v] = { MeshId = { created = false, instance = name.editable } }
			end
		end
	end
	local t_1 = {
		assetTypeEnum = assetType,
		isServer = var12,
		editableMeshes = t
	}
	
	if Enum.AssetType.DynamicHead == assetType then
		validateSingleMeshPart(rootInstance, t_1, p5)
		
		return
	end
	local var16 = constantsModule.ASSET_TYPE_INFO[assetType]
	
	if not var16 then return end
	for i in pairs(var16.subParts) do
		local var17 = rootInstance:FindFirstChild(i)
		
		if var17 then
			validateSingleMeshPart(var17, t_1, p5)
		end
	end
end

return t