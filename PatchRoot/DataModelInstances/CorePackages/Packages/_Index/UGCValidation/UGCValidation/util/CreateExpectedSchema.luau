-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:38 2026 Pacific Standard Time.

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
local getFFlagUGCValidationAnimationPackFolderStructureModule = require(parent.flags.getFFlagUGCValidationAnimationPackFolderStructure)
local getFFlagUGCValidationAnimationPackDisableModelStructureModule = require(parent.flags.getFFlagUGCValidationAnimationPackDisableModelStructure)
local t = {}

local function _(p0) --[[ line: 26 | named "getRootInstance" ]]
	-- upvalues: constantsModule (ref)
	for i, v in p0 do
		if v.Name == constantsModule.FOLDER_NAMES.R15ArtistIntent then
			return v
		end
	end
	return p0[1]
end

function t.generateBundleSchema(p1) --[[ line: 37 ]]
	-- upvalues: constantsModule (ref), getUploadCategoryModule (ref), t (ref)
	local t_1 = { ClassName = "Folder", _children = {} }
	
	for i, v in p1 do
		local var19
		local allSelectedInstances = v.allSelectedInstances
		
		for i_1, v_1 in allSelectedInstances do
			if v_1.Name == constantsModule.FOLDER_NAMES.R15ArtistIntent then
				var19 = v_1
				local var20 = t.generateAssetSchema(getUploadCategoryModule(var19, v.assetTypeEnum, nil), v.assetTypeEnum, var19)
				
				if var20.ClassName == "Folder" then
					for v_1, v_2 in var20._children do
						table.insert(t_1._children, v_2)
					end
				else
					table.insert(t_1._children, var20)
				end
			end
		end
		var19 = allSelectedInstances[1]
	end
	return t_1
end

local function createBodyPartSchema(p2) --[[ line: 63 ]]
	-- upvalues: constantsModule (ref), createIndividualBodyPartSchemaModule (ref)
	local t = { ClassName = "Folder", _children = {} }
	
	for i in pairs(constantsModule.ASSET_TYPE_INFO[p2].subParts) do
		table.insert(t._children, createIndividualBodyPartSchemaModule(p2, i))
	end
	return t
end

local t_1 = {
	EMOTE_ANIMATION = function(_, _) --[[ line: 79 ]]
		-- upvalues: createEmoteSchemaModule (ref)
		return createEmoteSchemaModule()
	end,
	DYNAMIC_HEAD = function(_, _) --[[ line: 82 ]]
		-- upvalues: createDynamicHeadMeshPartSchemaModule (ref)
		return createDynamicHeadMeshPartSchemaModule()
	end,
	TORSO_AND_LIMBS = function(p3, _) --[[ line: 85 ]]
		-- upvalues: createBodyPartSchema (ref)
		return createBodyPartSchema(p3)
	end,
	LAYERED_CLOTHING = function(p4, _) --[[ line: 88 ]]
		-- upvalues: getFFlagUGCValidateEyebrowEyelashThumbnailSchemaModule (ref), createEyebrowEyelashSchemaModule (ref), constantsModule (ref), createLayeredClothingSchemaModule (ref)
		return if getFFlagUGCValidateEyebrowEyelashThumbnailSchemaModule() then if p4 == Enum.AssetType.EyebrowAccessory or p4 == Enum.AssetType.EyelashAccessory then createEyebrowEyelashSchemaModule(constantsModule.ASSET_TYPE_INFO[p4].attachmentNames) else createLayeredClothingSchemaModule(constantsModule.ASSET_TYPE_INFO[p4].attachmentNames) else createLayeredClothingSchemaModule(constantsModule.ASSET_TYPE_INFO[p4].attachmentNames)
	end,
	RIGID_ACCESSORY = function(p5, p6) --[[ line: 99 ]]
		-- upvalues: constantsModule (ref), createMeshPartAccessorySchemaModule (ref), createAccessorySchemaModule (ref)
		local var22 = constantsModule.ASSET_TYPE_INFO[p5]
		
		return if p6:FindFirstChildOfClass("MeshPart") then createMeshPartAccessorySchemaModule(var22.attachmentNames) else createAccessorySchemaModule(var22.attachmentNames)
	end,
	MAKEUP = function(_, _) --[[ line: 108 ]]
		-- upvalues: createMakeupSchemaModule (ref)
		return createMakeupSchemaModule()
	end
}

if getFFlagUGCValidationAnimationPackSupportModule() then
	function t_1.ANIMATION(p7, p8) --[[ line: 114 ]]
		-- upvalues: createAnimationSchemaModule (ref)
		return createAnimationSchemaModule(p7, p8)
	end
end
function t.generateAssetSchema(value, p9, p10) --[[ line: 119 ]]
	-- upvalues: t_1 (ref)
	return t_1[value](p9, p10)
end

local _ = function(p11) --[[ line: 127 | named "hasTopLevelR15Anim" ]]
	if not p11 then
		return false
	end
	for i, v in p11:GetChildren() do
		if v.Name == "R15Anim" then
			return true
		end
	end
	return false
end

function t.generateAnimationPackBundleSchema(p12) --[[ line: 140 ]]
	-- upvalues: getFFlagUGCValidationAnimationPackDisableModelStructureModule (ref), getFFlagUGCValidationAnimationPackFolderStructureModule (ref), constantsModule (ref)
	local t = { ClassName = "Model", _children = {} }
	local var24 = getFFlagUGCValidationAnimationPackDisableModelStructureModule()
	
	if not var24 then
		var24 = getFFlagUGCValidationAnimationPackFolderStructureModule()
		
		if var24 then
			if p12 then
				for i, v in p12:GetChildren() do
					if v.Name == "R15Anim" then
						var24 = true
					end
				end
				var24 = false
			else
				var24 = false
			end
		end
	end
	for i, v in constantsModule.ANIMATION_ASSET_INFO do
		if var24 then
			table.insert(t._children, {
				ClassName = "Folder",
				Name = "R15Anim",
				_ignoreDescendants = true
			})
		else
			table.insert(t._children, {
				ClassName = "Model",
				_ignoreDescendants = true,
				Name = v.modelName
			})
		end
	end
	return t
end

return t