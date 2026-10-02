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
local getFFlagUGCValidationEyebrowEyelashCategoryModule = require(parent.flags.getFFlagUGCValidationEyebrowEyelashCategory)
local t = {}

local function _(p1)
	-- upvalues: constantsModule (ref)
	for i, v in p1 do
		if v.Name == constantsModule.FOLDER_NAMES.R15ArtistIntent then
			return v
		end
	end
	return p1[1]
end

function t.generateBundleSchema(p2)
	-- upvalues: constantsModule (ref), getUploadCategoryModule (ref), t (ref)
	local t_1 = { ClassName = "Folder", _children = {} }
	
	for i, v in p2 do
		local var1
		local allSelectedInstances = v.allSelectedInstances
		
		for i_1, v_1 in allSelectedInstances do
			if v_1.Name == constantsModule.FOLDER_NAMES.R15ArtistIntent then
				var1 = v_1
				local var2 = t.generateAssetSchema(getUploadCategoryModule(var1, v.assetTypeEnum, nil), v.assetTypeEnum, var1)
				
				if var2.ClassName == "Folder" then
					for v_1, v_2 in var2._children do
						table.insert(t_1._children, v_2)
					end
				else
					table.insert(t_1._children, var2)
				end
			end
		end
		var1 = allSelectedInstances[1]
	end
	return t_1
end

local function createBodyPartSchema(p3)
	-- upvalues: constantsModule (ref), createIndividualBodyPartSchemaModule (ref)
	local t = { ClassName = "Folder", _children = {} }
	
	for i in pairs(constantsModule.ASSET_TYPE_INFO[p3].subParts) do
		table.insert(t._children, createIndividualBodyPartSchemaModule(p3, i))
	end
	return t
end

local t_1 = {
	EMOTE_ANIMATION = function(_, _)
		-- upvalues: createEmoteSchemaModule (ref)
		return createEmoteSchemaModule()
	end,
	DYNAMIC_HEAD = function(_, _)
		-- upvalues: createDynamicHeadMeshPartSchemaModule (ref)
		return createDynamicHeadMeshPartSchemaModule()
	end,
	TORSO_AND_LIMBS = function(p4, _)
		-- upvalues: createBodyPartSchema (ref)
		return createBodyPartSchema(p4)
	end,
	LAYERED_CLOTHING = function(p4, _)
		-- upvalues: getFFlagUGCValidationEyebrowEyelashCategoryModule (ref), createEyebrowEyelashSchemaModule (ref), constantsModule (ref), createLayeredClothingSchemaModule (ref)
		return if getFFlagUGCValidationEyebrowEyelashCategoryModule() or p4 ~= Enum.AssetType.EyebrowAccessory and p4 ~= Enum.AssetType.EyelashAccessory then createLayeredClothingSchemaModule(constantsModule.ASSET_TYPE_INFO[p4].attachmentNames) else createEyebrowEyelashSchemaModule(constantsModule.ASSET_TYPE_INFO[p4].attachmentNames)
	end,
	EYEBROW_EYELASH = function(p4, _)
		-- upvalues: createEyebrowEyelashSchemaModule (ref), constantsModule (ref)
		return createEyebrowEyelashSchemaModule(constantsModule.ASSET_TYPE_INFO[p4].attachmentNames)
	end,
	RIGID_ACCESSORY = function(p4, p5)
		-- upvalues: constantsModule (ref), createMeshPartAccessorySchemaModule (ref), createAccessorySchemaModule (ref)
		local var3 = constantsModule.ASSET_TYPE_INFO[p4]
		
		return if p5:FindFirstChildOfClass("MeshPart") then createMeshPartAccessorySchemaModule(var3.attachmentNames) else createAccessorySchemaModule(var3.attachmentNames)
	end,
	MAKEUP = function(_, _)
		-- upvalues: createMakeupSchemaModule (ref)
		return createMakeupSchemaModule()
	end,
	ANIMATION = function(p4, _)
		-- upvalues: createAnimationSchemaModule (ref)
		return createAnimationSchemaModule(p4)
	end
}

function t.generateAssetSchema(value, p4, p5)
	-- upvalues: t_1 (ref)
	return t_1[value](p4, p5)
end

function t.generateAnimationPackBundleSchema()
	-- upvalues: constantsModule (ref)
	local t = { ClassName = "Model", _children = {} }
	
	for i in constantsModule.ANIMATION_ASSET_INFO do
		table.insert(t._children, {
			ClassName = "Folder",
			Name = "R15Anim",
			_ignoreDescendants = true
		})
	end
	return t
end

return t