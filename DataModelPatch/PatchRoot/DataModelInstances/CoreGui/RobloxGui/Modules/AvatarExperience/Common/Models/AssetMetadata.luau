local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local FFlagAXSimplifyOutfitEquipCheckModule = require(Modules.AvatarExperience.Flags.FFlagAXSimplifyOutfitEquipCheck)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXCustomizeMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCustomizeMakeupSupport
local FFlagParseHeadShapeFromAPIResponse = AvatarExperienceFlagsModule.FFlagParseHeadShapeFromAPIResponse
local FFlagHeadRefinementFacialAnimationToggle = AvatarExperienceFlagsModule.FFlagHeadRefinementFacialAnimationToggle
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local ASSETTYPEIDSTRINGTOMAKEUPTYPE = AvatarExperienceCommonModule.Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE
local LAYEREDMAKEUPORDER = AvatarExperienceCommonModule.Constants.LAYERED_MAKEUP_ORDER
local AssetMetadataModule = {
	mock = function()
		return {
			version = "1",
			order = 1,
			type = Enum.AccessoryType.Hat,
			isLayered = true,
			position = Vector3.new(),
			rotation = Vector3.new(),
			scale = vector.create(1, 1, 1)
		}
	end,
	getDefaultLayeredClothingMetadata = function(p1)
		-- upvalues: ConstantsModule (copy)
		return if ConstantsModule.AssetTypeIdToAccessoryTypeEnum[p1] == nil then { version = "1" } else {
			version = "1",
			order = ConstantsModule.LayeredClothingOrder[p1],
			type = ConstantsModule.AssetTypeIdToAccessoryTypeEnum[p1],
			isLayered = ConstantsModule.LayeredAssetTypes[p1] ~= nil
		}
	end
}

if FFlagAXCustomizeMakeupSupport then
	function AssetMetadataModule.getDefaultLayeredMakeupMetadata(p1)
		-- upvalues: ASSETTYPEIDSTRINGTOMAKEUPTYPE (copy), LAYEREDMAKEUPORDER (copy)
		return if ASSETTYPEIDSTRINGTOMAKEUPTYPE[p1] == nil then { version = "1" } else {
			version = "1",
			isLayered = true,
			order = LAYEREDMAKEUPORDER[p1],
			type = ASSETTYPEIDSTRINGTOMAKEUPTYPE[p1]
		}
	end
end
if FFlagAXCustomizeMakeupSupport then
	function AssetMetadataModule.getDefaultMetadata(p1)
		-- upvalues: ASSETTYPEIDSTRINGTOMAKEUPTYPE (copy), AssetMetadataModule (copy)
		return if ASSETTYPEIDSTRINGTOMAKEUPTYPE[p1] then AssetMetadataModule.getDefaultLayeredMakeupMetadata(p1) else AssetMetadataModule.getDefaultLayeredClothingMetadata(p1)
	end
else
	function AssetMetadataModule.getDefaultMetadata(p1)
		-- upvalues: AssetMetadataModule (copy)
		return (AssetMetadataModule.getDefaultLayeredClothingMetadata(p1))
	end
end
local function _(Vector)
	return if Vector then Vector3.new(Vector.x, Vector.y, Vector.z) else nil
end

if FFlagAXCustomizeMakeupSupport then
	function AssetMetadataModule.fromMetadata(p1, p2)
		-- upvalues: ASSETTYPEIDSTRINGTOMAKEUPTYPE (copy), LAYEREDMAKEUPORDER (copy), FFlagAXSimplifyOutfitEquipCheckModule (copy), ConstantsModule (copy), FFlagParseHeadShapeFromAPIResponse (copy), FFlagHeadRefinementFacialAnimationToggle (copy)
		local P5 = p1 or {}
		
		if ASSETTYPEIDSTRINGTOMAKEUPTYPE[p2] then
			local LAYEREDMAKEUPORDEREntry = LAYEREDMAKEUPORDER[p2]
			
			return {
				isLayered = true,
				version = if FFlagAXSimplifyOutfitEquipCheckModule() == false or P5.version then tostring(P5.version) else "1",
				order = P5.order or LAYEREDMAKEUPORDEREntry,
				type = P5.type
			}
		end
		local LayeredClothingOrderEntry = ConstantsModule.LayeredClothingOrder[p2]
		local config = {
			version = if FFlagAXSimplifyOutfitEquipCheckModule() == false or P5.version then tostring(P5.version) else "1",
			order = P5.order or LayeredClothingOrderEntry,
			type = P5.type,
			isLayered = ConstantsModule.LayeredAssetTypes[p2] ~= nil
		}
		
		if FFlagParseHeadShapeFromAPIResponse then
			config.headShape = P5.headShape
		end
		if FFlagHeadRefinementFacialAnimationToggle then
			config.staticFacialAnimation = P5.staticFacialAnimation
		end
		local Position = P5.position
		config.position = if Position then Vector3.new(Position.x, Position.y, Position.z) else nil
		local Rotation = P5.rotation
		config.rotation = if Rotation then Vector3.new(Rotation.x, Rotation.y, Rotation.z) else nil
		local Scale = P5.scale
		config.scale = if Scale then Vector3.new(Scale.x, Scale.y, Scale.z) else nil
		
		return config
	end
	
	return AssetMetadataModule
else
	function AssetMetadataModule.fromMetadata(p1, p2)
		-- upvalues: ConstantsModule (copy), FFlagAXSimplifyOutfitEquipCheckModule (copy), FFlagParseHeadShapeFromAPIResponse (copy), FFlagHeadRefinementFacialAnimationToggle (copy)
		local P7 = p1 or {}
		local LayeredClothingOrderEntry = ConstantsModule.LayeredClothingOrder[p2]
		local config = {
			version = if FFlagAXSimplifyOutfitEquipCheckModule() == false or P7.version then tostring(P7.version) else "1",
			order = P7.order or LayeredClothingOrderEntry,
			type = P7.type,
			isLayered = ConstantsModule.LayeredAssetTypes[p2] ~= nil
		}
		
		if FFlagParseHeadShapeFromAPIResponse then
			config.headShape = P7.headShape
		end
		if FFlagHeadRefinementFacialAnimationToggle then
			config.staticFacialAnimation = P7.staticFacialAnimation
		end
		local Position = P7.position
		config.position = if Position then Vector3.new(Position.x, Position.y, Position.z) else nil
		local Rotation = P7.rotation
		config.rotation = if Rotation then Vector3.new(Rotation.x, Rotation.y, Rotation.z) else nil
		local Scale = P7.scale
		config.scale = if Scale then Vector3.new(Scale.x, Scale.y, Scale.z) else nil
		
		return config
	end
	
	return AssetMetadataModule
end