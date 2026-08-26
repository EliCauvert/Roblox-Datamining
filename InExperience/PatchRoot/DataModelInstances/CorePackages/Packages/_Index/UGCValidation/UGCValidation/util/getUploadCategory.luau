local parent = script.Parent.Parent
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local constantsModule = require(parent.Constants)
local constantsInterfaceModule = require(parent.ConstantsInterface)
local getFFlagUGCValidationAnimationPackSupportModule = require(parent.flags.getFFlagUGCValidationAnimationPackSupport)
local parts = string.split(require(parent.flags.getFStringUGCLCAllowedAssetTypeIds)(), ",")

return function(p1, p2, p3)
	-- upvalues: validationEnumsModule (ref), getFFlagUGCValidationAnimationPackSupportModule (ref), constantsModule (ref), parts (ref), constantsInterfaceModule (ref)
	if p3 == nil then
		assert(p2)
		local ANIMATION = nil
		
		if p2 == Enum.AssetType.EmoteAnimation then
			ANIMATION = validationEnumsModule.UploadCategory.EMOTE_ANIMATION
		elseif constantsModule.ASSET_TYPE_INFO[p2] and constantsModule.ASSET_TYPE_INFO[p2].isBodyPart then
			ANIMATION = if p2 == Enum.AssetType.DynamicHead then validationEnumsModule.UploadCategory.DYNAMIC_HEAD else validationEnumsModule.UploadCategory.TORSO_AND_LIMBS
		elseif table.find(parts, tostring(p2.Value)) then
			ANIMATION = validationEnumsModule.UploadCategory.LAYERED_CLOTHING
		elseif constantsModule.ASSET_TYPE_INFO[p2] and constantsModule.ASSET_TYPE_INFO[p2].rigidAllowed then
			ANIMATION = validationEnumsModule.UploadCategory.RIGID_ACCESSORY
		elseif constantsInterfaceModule.isMakeupAsset(p2) then
			ANIMATION = validationEnumsModule.UploadCategory.MAKEUP
		elseif getFFlagUGCValidationAnimationPackSupportModule() and constantsModule.ANIMATION_ASSET_INFO and constantsModule.ANIMATION_ASSET_INFO[p2] then
			ANIMATION = validationEnumsModule.UploadCategory.ANIMATION
		end
		if ANIMATION == nil then
			error(`No assigned validation category for {p1.Name}, {p2}, {p3} `)
		end
		return ANIMATION
	else
		return if p3 == Enum.BundleType.BodyParts then validationEnumsModule.UploadCategory.FULL_BODY elseif getFFlagUGCValidationAnimationPackSupportModule() and p3 == Enum.BundleType.Animations then validationEnumsModule.UploadCategory.ANIMATION_PACK else validationEnumsModule.UploadCategory.BOTH_SHOES
	end
end