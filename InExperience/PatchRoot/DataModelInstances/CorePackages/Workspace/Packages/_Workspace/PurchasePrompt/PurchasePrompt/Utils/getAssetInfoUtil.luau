local parent = script.Parent.Parent
local isCreatorStoreAssetTypeModule = require(parent.Utils.isCreatorStoreAssetType)
local _ = require(parent.Promise)

return {
	isAssetValid = function(value)
		-- upvalues: isCreatorStoreAssetTypeModule (ref)
		return isCreatorStoreAssetTypeModule(value.type) and (not value.id or not value.type or (not value.typeId or not value.creator))
	end,
	fromAsset = function(value)
		return {
			id = value.id,
			type = value.type,
			typeId = value.typeId,
			creator = value.creator,
			description = value.description,
			isPublicDomainEnabled = value.isPublicDomainEnabled,
			name = value.name
		}
	end
}