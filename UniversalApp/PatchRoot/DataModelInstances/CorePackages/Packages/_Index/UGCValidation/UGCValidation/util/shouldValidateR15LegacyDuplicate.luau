local Parent = script.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)

return function(p1): boolean
	-- upvalues: ConstantsModule (copy)
	if not p1 or not p1.consumerConfig or not p1.consumerConfig.enforceR15FolderStructure then
		return false
	end
	local UploadEnum = p1.uploadEnum
	
	if UploadEnum.bundleType == Enum.BundleType.BodyParts then
		return true
	else
		local AssetType = UploadEnum.assetType
		
		return AssetType ~= nil and ConstantsModule.AssetUploadsWithFolderStructure[AssetType] == true
	end
end