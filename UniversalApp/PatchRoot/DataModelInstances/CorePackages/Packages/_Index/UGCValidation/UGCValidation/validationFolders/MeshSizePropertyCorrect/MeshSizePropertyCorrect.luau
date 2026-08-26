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

local function _(p1, p2)
	-- upvalues: floatEqualsModule (ref)
	return floatEqualsModule(p1.X, p2.X, 0.00001) and (floatEqualsModule(p1.Y, p2.Y, 0.00001) and floatEqualsModule(p1.Z, p2.Z, 0.00001))
end

local function validateSingleMeshPart(p1, p2, p3)
	-- upvalues: getEditableMeshFromContextModule (ref), errorSourceStringsModule (ref), getMeshSizeModule (ref), floatEqualsModule (ref)
	local t = {
		fieldName = "MeshId",
		fullName = p1:GetFullName(),
		contentId = p1.MeshId,
		context = p1.Name
	}
	local var1, var2 = getEditableMeshFromContextModule(p1, "MeshId", p2)
	
	if not var1 then
		p3:fail(errorSourceStringsModule.Keys.MeshSize_LoadFailed, { meshName = p1.Name }, p1)
		
		return
	end
	t.editableMesh = var2
	local var3 = getMeshSizeModule(t)
	local meshSize = p1.MeshSize
	
	if not floatEqualsModule(meshSize.X, var3.X, 0.00001) or (not floatEqualsModule(meshSize.Y, var3.Y, 0.00001) or not floatEqualsModule(meshSize.Z, var3.Z, 0.00001)) then
		p3:fail(errorSourceStringsModule.Keys.MeshSize_Mismatch, { meshName = p1.Name }, p1)
	end
end

function t.run(p1, p2)
	-- upvalues: validationEnumsModule (ref), validateSingleMeshPart (ref), constantsModule (ref)
	local rootInstance = p2.rootInstance
	local assetType = p2.uploadEnum.assetType
	local consumerEnv = p2.consumerConfig.consumerEnv
	local var1 = consumerEnv == validationEnumsModule.ConsumerEnv.Backend
	
	if consumerEnv == validationEnumsModule.ConsumerEnv.IEC then return end
	local t = {}
	
	if p2.renderMeshesData then
		local descendants = rootInstance:GetDescendants()
		table.insert(descendants, rootInstance)
		
		for i, v in descendants do
			local name = p2.renderMeshesData[v.Name]
			
			if name and name.editable then
				t[v] = { MeshId = { created = false, instance = name.editable } }
			end
		end
	end
	local t_1 = {
		assetTypeEnum = assetType,
		isServer = var1,
		editableMeshes = t
	}
	
	if Enum.AssetType.DynamicHead == assetType then
		validateSingleMeshPart(rootInstance, t_1, p1)
		
		return
	end
	local var2 = constantsModule.ASSET_TYPE_INFO[assetType]
	
	if not var2 then return end
	for i in pairs(var2.subParts) do
		local var3 = rootInstance:FindFirstChild(i)
		
		if var3 then
			validateSingleMeshPart(var3, t_1, p1)
		end
	end
end

return t