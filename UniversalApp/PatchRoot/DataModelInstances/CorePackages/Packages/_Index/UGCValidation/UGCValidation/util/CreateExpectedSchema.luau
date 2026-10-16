local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local ConstantsModule = require(Parent.Constants)
local CreateIndividualBodyPartSchemaModule = require(Parent.util.createIndividualBodyPartSchema)
local CreateLayeredClothingSchemaModule = require(Parent.util.createLayeredClothingSchema)
local CreateEyebrowEyelashSchemaModule = require(Parent.util.createEyebrowEyelashSchema)
local CreateMeshPartAccessorySchemaModule = require(Parent.util.createMeshPartAccessorySchema)
local CreateMakeupSchemaModule = require(Parent.util.createMakeupSchema)
local CreateDynamicHeadMeshPartSchemaModule = require(Parent.util.createDynamicHeadMeshPartSchema)
local CreateAccessorySchemaModule = require(Parent.util.createAccessorySchema)
local CreateEmoteSchemaModule = require(Parent.util.createEmoteSchema)
local CreateAnimationSchemaModule = require(Parent.util.createAnimationSchema)
local GetUploadCategoryModule = require(Parent.util.getUploadCategory)
local GetFFlagUGCValidationEyebrowEyelashCategoryModule = require(Parent.flags.getFFlagUGCValidationEyebrowEyelashCategory)
local CreateExpectedSchemaModule = {}

local function _(Entry) --[[ Line: 19 | Named "getRootInstance" ]]
	-- upvalues: ConstantsModule (copy)
	for _, value in Entry do
		if value.Name == ConstantsModule.FOLDER_NAMES.R15ArtistIntent then
			return value
		end
	end
	return Entry[1]
end

function CreateExpectedSchemaModule.generateBundleSchema(List) --[[ Line: 30 ]]
	-- upvalues: ConstantsModule (copy), GetUploadCategoryModule (copy), CreateExpectedSchemaModule (copy)
	local config = { ClassName = "Folder", _children = {} }
	
	for _, value in List do
		local AllSelectedInstances = value.allSelectedInstances
		local allSelectedInstance1 = nil
		
		for _, allSelectedInstance in AllSelectedInstances do
			if allSelectedInstance.Name == ConstantsModule.FOLDER_NAMES.R15ArtistIntent then
				allSelectedInstance1 = allSelectedInstance
				local AssetSchema = CreateExpectedSchemaModule.generateAssetSchema(GetUploadCategoryModule(allSelectedInstance1, value.assetTypeEnum, nil), value.assetTypeEnum, allSelectedInstance1)
				
				if AssetSchema.ClassName == "Folder" then
					for _, child in AssetSchema._children do
						table.insert(config._children, child)
					end
				else
					table.insert(config._children, AssetSchema)
				end
			else
				continue
			end
		end
		allSelectedInstance1 = AllSelectedInstances[1]
	end
	return config
end

local function createBodyPartSchema(p1) --[[ Line: 56 ]]
	-- upvalues: ConstantsModule (copy), CreateIndividualBodyPartSchemaModule (copy)
	local config = { ClassName = "Folder", _children = {} }
	
	for subPart in pairs(ConstantsModule.ASSET_TYPE_INFO[p1].subParts) do
		table.insert(config._children, (CreateIndividualBodyPartSchemaModule(p1, subPart)))
	end
	return config
end

local config = {
	EMOTE_ANIMATION = function(_, _) --[[ Line: 72 ]]
		-- upvalues: CreateEmoteSchemaModule (copy)
		return CreateEmoteSchemaModule()
	end,
	DYNAMIC_HEAD = function(_, _) --[[ Line: 75 ]]
		-- upvalues: CreateDynamicHeadMeshPartSchemaModule (copy)
		return CreateDynamicHeadMeshPartSchemaModule()
	end,
	TORSO_AND_LIMBS = function(p2, _) --[[ Line: 78 ]]
		-- upvalues: createBodyPartSchema (copy)
		return (createBodyPartSchema(p2))
	end,
	LAYERED_CLOTHING = function(AssetType, _) --[[ Line: 81 ]]
		-- upvalues: GetFFlagUGCValidationEyebrowEyelashCategoryModule (copy), CreateEyebrowEyelashSchemaModule (copy), ConstantsModule (copy), CreateLayeredClothingSchemaModule (copy)
		return if GetFFlagUGCValidationEyebrowEyelashCategoryModule() or AssetType ~= Enum.AssetType.EyebrowAccessory and AssetType ~= Enum.AssetType.EyelashAccessory then CreateLayeredClothingSchemaModule(ConstantsModule.ASSET_TYPE_INFO[AssetType].attachmentNames) else CreateEyebrowEyelashSchemaModule(ConstantsModule.ASSET_TYPE_INFO[AssetType].attachmentNames)
	end,
	EYEBROW_EYELASH = function(p2, _) --[[ Line: 91 ]]
		-- upvalues: CreateEyebrowEyelashSchemaModule (copy), ConstantsModule (copy)
		return CreateEyebrowEyelashSchemaModule(ConstantsModule.ASSET_TYPE_INFO[p2].attachmentNames)
	end,
	RIGID_ACCESSORY = function(p2, Object) --[[ Line: 94 ]]
		-- upvalues: ConstantsModule (copy), CreateMeshPartAccessorySchemaModule (copy), CreateAccessorySchemaModule (copy)
		local ASSETTYPE = ConstantsModule.ASSET_TYPE_INFO[p2]
		
		return if Object:FindFirstChildOfClass("MeshPart") then CreateMeshPartAccessorySchemaModule(ASSETTYPE.attachmentNames) else CreateAccessorySchemaModule(ASSETTYPE.attachmentNames)
	end,
	MAKEUP = function(_, _) --[[ Line: 103 ]]
		-- upvalues: CreateMakeupSchemaModule (copy)
		return CreateMakeupSchemaModule()
	end,
	ANIMATION = function(p2, _) --[[ Line: 108 ]]
		-- upvalues: CreateAnimationSchemaModule (copy)
		return CreateAnimationSchemaModule(p2)
	end
}

function CreateExpectedSchemaModule.generateAssetSchema(p2, AssetTypeEnum, p3) --[[ Line: 112 ]]
	-- upvalues: config (copy)
	return config[p2](AssetTypeEnum, p3)
end

function CreateExpectedSchemaModule.generateAnimationPackBundleSchema() --[[ Line: 120 ]]
	-- upvalues: ConstantsModule (copy)
	local config = { ClassName = "Model", _children = {} }
	
	for _ in ConstantsModule.ANIMATION_ASSET_INFO do
		table.insert(config._children, {
			ClassName = "Folder",
			Name = "R15Anim",
			_ignoreDescendants = true
		})
	end
	return config
end

return CreateExpectedSchemaModule