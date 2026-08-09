local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local constantsModule = require(parent.Constants)
local createIndividualBodyPartSchemaModule = require(parent.util.createIndividualBodyPartSchema)
local createLayeredClothingSchemaModule = require(parent.util.createLayeredClothingSchema)
local createEyebrowEyelashSchemaModule = require(parent.util.createEyebrowEyelashSchema)
local createMeshPartAccessorySchemaModule = require(parent.util.createMeshPartAccessorySchema)
local createMakeupSchemaModule = require(parent.util.createMakeupSchema)
local createDynamicHeadMeshPartSchemaModule = require(parent.util.createDynamicHeadMeshPartSchema)
local createAccessorySchemaModule = require(parent.util.createAccessorySchema)
local createEmoteSchemaModule = require(parent.util.createEmoteSchema)
local createAnimationSchemaModule = require(parent.util.createAnimationSchema)
local getUploadCategoryModule = require(parent.util.getUploadCategory)
local getFFlagUGCValidateEyebrowEyelashThumbnailSchemaModule = require(parent.flags.getFFlagUGCValidateEyebrowEyelashThumbnailSchema)
local getFFlagUGCValidationAnimationPackSupportModule = require(parent.flags.getFFlagUGCValidationAnimationPackSupport)
local t = {}

local function _(p0) --[[ line: 22 | named "getRootInstance" ]]
	-- upvalues: constantsModule (ref)
	for i, v in p0 do
		if v.Name == constantsModule.FOLDER_NAMES.R15ArtistIntent then
			return v
		end
	end
	return p0[1]
end

function t.generateBundleSchema(p1) --[[ line: 33 ]]
	-- upvalues: constantsModule (ref), getUploadCategoryModule (ref), t (ref)
	local t_1 = { ClassName = "Folder", _children = {} }
	
	for i, v in p1 do
		local var17
		local allSelectedInstances = v.allSelectedInstances
		
		for i_1, v_1 in allSelectedInstances do
			if v_1.Name == constantsModule.FOLDER_NAMES.R15ArtistIntent then
				var17 = v_1
				local var18 = t.generateAssetSchema(getUploadCategoryModule(var17, v.assetTypeEnum, nil), v.assetTypeEnum, var17)
				
				if var18.ClassName == "Folder" then
					for v_1, v_2 in var18._children do
						table.insert(t_1._children, v_2)
					end
				else
					table.insert(t_1._children, var18)
				end
			end
		end
		var17 = allSelectedInstances[1]
	end
	return t_1
end

local function createBodyPartSchema(p2) --[[ line: 59 ]]
	-- upvalues: constantsModule (ref), createIndividualBodyPartSchemaModule (ref)
	local t = { ClassName = "Folder", _children = {} }
	
	for i in pairs(constantsModule.ASSET_TYPE_INFO[p2].subParts) do
		table.insert(t._children, createIndividualBodyPartSchemaModule(p2, i))
	end
	return t
end

local t_1 = {
	EMOTE_ANIMATION = function(_, _) --[[ line: 75 ]]
		-- upvalues: createEmoteSchemaModule (ref)
		return createEmoteSchemaModule()
	end,
	DYNAMIC_HEAD = function(_, _) --[[ line: 78 ]]
		-- upvalues: createDynamicHeadMeshPartSchemaModule (ref)
		return createDynamicHeadMeshPartSchemaModule()
	end,
	TORSO_AND_LIMBS = function(p3, _) --[[ line: 81 ]]
		-- upvalues: createBodyPartSchema (ref)
		return createBodyPartSchema(p3)
	end,
	LAYERED_CLOTHING = function(p4, _) --[[ line: 84 ]]
		-- upvalues: getFFlagUGCValidateEyebrowEyelashThumbnailSchemaModule (ref), createEyebrowEyelashSchemaModule (ref), constantsModule (ref), createLayeredClothingSchemaModule (ref)
		return if getFFlagUGCValidateEyebrowEyelashThumbnailSchemaModule() then if p4 == Enum.AssetType.EyebrowAccessory or p4 == Enum.AssetType.EyelashAccessory then createEyebrowEyelashSchemaModule(constantsModule.ASSET_TYPE_INFO[p4].attachmentNames) else createLayeredClothingSchemaModule(constantsModule.ASSET_TYPE_INFO[p4].attachmentNames) else createLayeredClothingSchemaModule(constantsModule.ASSET_TYPE_INFO[p4].attachmentNames)
	end,
	RIGID_ACCESSORY = function(p5, p6) --[[ line: 95 ]]
		-- upvalues: constantsModule (ref), createMeshPartAccessorySchemaModule (ref), createAccessorySchemaModule (ref)
		local var20 = constantsModule.ASSET_TYPE_INFO[p5]
		
		return if p6:FindFirstChildOfClass("MeshPart") then createMeshPartAccessorySchemaModule(var20.attachmentNames) else createAccessorySchemaModule(var20.attachmentNames)
	end,
	MAKEUP = function(_, _) --[[ line: 104 ]]
		-- upvalues: createMakeupSchemaModule (ref)
		return createMakeupSchemaModule()
	end
}

if getFFlagUGCValidationAnimationPackSupportModule() then
	function t_1.ANIMATION(p7, _) --[[ line: 110 ]]
		-- upvalues: createAnimationSchemaModule (ref)
		return createAnimationSchemaModule(p7)
	end
end
function t.generateAssetSchema(value, p8, p9) --[[ line: 115 ]]
	-- upvalues: t_1 (ref)
	return t_1[value](p8, p9)
end

function t.generateAnimationPackBundleSchema() --[[ line: 123 ]]
	-- upvalues: constantsModule (ref)
	local t = { ClassName = "Model", _children = {} }
	
	for i, v in constantsModule.ANIMATION_ASSET_INFO do
		table.insert(t._children, {
			ClassName = "Model",
			_ignoreDescendants = true,
			Name = v.modelName
		})
	end
	return t
end

return t