local Parent = script.Parent.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local FloatEqualsModule = require(Parent.util.floatEquals)
local GetMeshSizeModule = require(Parent.util.getMeshSize)
local GetEditableMeshFromContextModule = require(Parent.util.getEditableMeshFromContext)

local function _(Vector, Vector1)
	-- upvalues: FloatEqualsModule (copy)
	return FloatEqualsModule(Vector.X, Vector1.X, 0.00001) and (FloatEqualsModule(Vector.Y, Vector1.Y, 0.00001) and FloatEqualsModule(Vector.Z, Vector1.Z, 0.00001))
end

local function validateSingleMeshPart(RootInstance, p1, p2)
	-- upvalues: GetEditableMeshFromContextModule (copy), ErrorSourceStringsModule (copy), GetMeshSizeModule (copy), FloatEqualsModule (copy)
	local config = {
		fieldName = "MeshId",
		fullName = RootInstance:GetFullName(),
		contentId = RootInstance.MeshId,
		context = RootInstance.Name
	}
	local MeshId, MeshId2 = GetEditableMeshFromContextModule(RootInstance, "MeshId", p1)
	
	if not MeshId then
		p2:fail(ErrorSourceStringsModule.Keys.MeshSize_LoadFailed, { meshName = RootInstance.Name }, RootInstance)
		
		return
	end
	config.editableMesh = MeshId2
	local MeshSizeModule = GetMeshSizeModule(config)
	local MeshSize = RootInstance.MeshSize
	
	if not FloatEqualsModule(MeshSize.X, MeshSizeModule.X, 0.00001) or (not FloatEqualsModule(MeshSize.Y, MeshSizeModule.Y, 0.00001) or not FloatEqualsModule(MeshSize.Z, MeshSizeModule.Z, 0.00001)) then
		p2:fail(ErrorSourceStringsModule.Keys.MeshSize_Mismatch, { meshName = RootInstance.Name }, RootInstance)
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
	conditionalData = { ValidationEnumsModule.SharedDataMember.renderMeshesData },
	fflag = require(Parent.flags.getFFlagUGCValidateMigrateBodyPartBounds),
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: ValidationEnumsModule (copy), validateSingleMeshPart (copy), ConstantsModule (copy)
		local RootInstance = p2.rootInstance
		local AssetType = p2.uploadEnum.assetType
		local ConsumerEnv = p2.consumerConfig.consumerEnv
		local IsConsumerEnvMatch = ConsumerEnv == ValidationEnumsModule.ConsumerEnv.Backend
		
		if ConsumerEnv == ValidationEnumsModule.ConsumerEnv.IEC then return end
		local EditableMeshes = {}
		
		if p2.renderMeshesData then
			local Descendants = RootInstance:GetDescendants()
			table.insert(Descendants, RootInstance)
			
			for _, descendant in Descendants do
				local RenderMeshes = p2.renderMeshesData[descendant.Name]
				
				if RenderMeshes and RenderMeshes.editable then
					EditableMeshes[descendant] = {
						MeshId = { created = false, instance = RenderMeshes.editable }
					}
				end
			end
		end
		local config = {
			assetTypeEnum = AssetType,
			isServer = IsConsumerEnvMatch,
			editableMeshes = EditableMeshes
		}
		
		if Enum.AssetType.DynamicHead == AssetType then
			validateSingleMeshPart(RootInstance, config, p1)
			
			return
		end
		local ASSETTYPE = ConstantsModule.ASSET_TYPE_INFO[AssetType]
		
		if not ASSETTYPE then return end
		for subPart in pairs(ASSETTYPE.subParts) do
			local Child = RootInstance:FindFirstChild(subPart)
			
			if Child then
				validateSingleMeshPart(Child, config, p1)
			end
		end
	end
}