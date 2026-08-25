local parent = script.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)

return function(p0)
	-- upvalues: constantsModule (ref)
	if not p0 or not p0.consumerConfig or not p0.consumerConfig.enforceR15FolderStructure then
		return false
	end
	local uploadEnum = p0.uploadEnum
	
	if uploadEnum.bundleType == Enum.BundleType.BodyParts then
		return true
	end
	local assetType = uploadEnum.assetType
	
	return assetType ~= nil and constantsModule.AssetUploadsWithFolderStructure[assetType] == true
end