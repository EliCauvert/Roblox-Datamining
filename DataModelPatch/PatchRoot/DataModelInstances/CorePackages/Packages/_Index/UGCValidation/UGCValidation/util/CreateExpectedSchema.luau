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
local GetFFlagUGCValidateEyebrowEyelashThumbnailSchemaModule = require(Parent.flags.getFFlagUGCValidateEyebrowEyelashThumbnailSchema)
local GetFFlagUGCValidationAnimationPackSupportModule = require(Parent.flags.getFFlagUGCValidationAnimationPackSupport)
local GetFFlagUGCValidationAnimationPackFolderStructureModule = require(Parent.flags.getFFlagUGCValidationAnimationPackFolderStructure)
local CreateExpectedSchemaModule = {}

local function _(Entry)
	-- upvalues: ConstantsModule (copy)
	for _, value in Entry do
		if value.Name == ConstantsModule.FOLDER_NAMES.R15ArtistIntent then
			return value
		end
	end
	return Entry[1]
end

function CreateExpectedSchemaModule.generateBundleSchema(List)
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

local function createBodyPartSchema(p1)
	-- upvalues: ConstantsModule (copy), CreateIndividualBodyPartSchemaModule (copy)
	local config = { ClassName = "Folder", _children = {} }
	
	for subPart in pairs(ConstantsModule.ASSET_TYPE_INFO[p1].subParts) do
		table.insert(config._children, (CreateIndividualBodyPartSchemaModule(p1, subPart)))
	end
	return config
end

local config = {
	EMOTE_ANIMATION = function(_, _)
		-- upvalues: CreateEmoteSchemaModule (copy)
		return CreateEmoteSchemaModule()
	end,
	DYNAMIC_HEAD = function(_, _)
		-- upvalues: CreateDynamicHeadMeshPartSchemaModule (copy)
		return CreateDynamicHeadMeshPartSchemaModule()
	end,
	TORSO_AND_LIMBS = function(p2, _)
		-- upvalues: createBodyPartSchema (copy)
		return (createBodyPartSchema(p2))
	end,
	LAYERED_CLOTHING = function(AssetType, _)
		-- upvalues: GetFFlagUGCValidateEyebrowEyelashThumbnailSchemaModule (copy), CreateEyebrowEyelashSchemaModule (copy), ConstantsModule (copy), CreateLayeredClothingSchemaModule (copy)
		return if GetFFlagUGCValidateEyebrowEyelashThumbnailSchemaModule() and (AssetType == Enum.AssetType.EyebrowAccessory or AssetType == Enum.AssetType.EyelashAccessory) then CreateEyebrowEyelashSchemaModule(ConstantsModule.ASSET_TYPE_INFO[AssetType].attachmentNames) else CreateLayeredClothingSchemaModule(ConstantsModule.ASSET_TYPE_INFO[AssetType].attachmentNames)
	end,
	RIGID_ACCESSORY = function(p2, Object)
		-- upvalues: ConstantsModule (copy), CreateMeshPartAccessorySchemaModule (copy), CreateAccessorySchemaModule (copy)
		local ASSETTYPE = ConstantsModule.ASSET_TYPE_INFO[p2]
		
		return if Object:FindFirstChildOfClass("MeshPart") then CreateMeshPartAccessorySchemaModule(ASSETTYPE.attachmentNames) else CreateAccessorySchemaModule(ASSETTYPE.attachmentNames)
	end,
	MAKEUP = function(_, _)
		-- upvalues: CreateMakeupSchemaModule (copy)
		return CreateMakeupSchemaModule()
	end
}

if GetFFlagUGCValidationAnimationPackSupportModule() then
	function config.ANIMATION(p2, p3)
		-- upvalues: CreateAnimationSchemaModule (copy)
		return CreateAnimationSchemaModule(p2, p3)
	end
end
function CreateExpectedSchemaModule.generateAssetSchema(p2, AssetTypeEnum, p3)
	-- upvalues: config (copy)
	return config[p2](AssetTypeEnum, p3)
end

local _ = function(Object): boolean
	if not Object then
		return false
	end
	for _, child in Object:GetChildren() do
		if child.Name == "R15Anim" then
			return true
		end
	end
	return false
end

function CreateExpectedSchemaModule.generateAnimationPackBundleSchema(Object)
	-- upvalues: GetFFlagUGCValidationAnimationPackFolderStructureModule (copy), ConstantsModule (copy)
	local config = { ClassName = "Model", _children = {} }
	local FFlagUGCValidationAnimationPackFolderStructureModule = GetFFlagUGCValidationAnimationPackFolderStructureModule()
	
	if FFlagUGCValidationAnimationPackFolderStructureModule then
		if Object then
			FFlagUGCValidationAnimationPackFolderStructureModule = false
			
			for _, child in Object:GetChildren() do
				if child.Name == "R15Anim" then
					FFlagUGCValidationAnimationPackFolderStructureModule = true
					break
				end
			end
		else
			FFlagUGCValidationAnimationPackFolderStructureModule = false
		end
	end
	for _, value in ConstantsModule.ANIMATION_ASSET_INFO do
		if FFlagUGCValidationAnimationPackFolderStructureModule then
			table.insert(config._children, {
				ClassName = "Folder",
				Name = "R15Anim",
				_ignoreDescendants = true
			})
		else
			table.insert(config._children, {
				ClassName = "Model",
				_ignoreDescendants = true,
				Name = value.modelName
			})
		end
	end
	return config
end

return CreateExpectedSchemaModule