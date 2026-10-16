local Parent = script.Parent.Parent
local IsCreatorStoreAssetTypeModule = require(Parent.Utils.isCreatorStoreAssetType)
local _ = require(Parent.Promise)

return {
	isAssetValid = function(p1) --[[ Line: 17 ]]
		-- upvalues: IsCreatorStoreAssetTypeModule (copy)
		return not IsCreatorStoreAssetTypeModule(p1.type) or p1.id and p1.type and p1.typeId and p1.creator
	end,
	fromAsset = function(p1) --[[ Line: 29 ]]
		return {
			id = p1.id,
			type = p1.type,
			typeId = p1.typeId,
			creator = p1.creator,
			description = p1.description,
			isPublicDomainEnabled = p1.isPublicDomainEnabled,
			name = p1.name
		}
	end
}