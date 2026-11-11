local Parent = script.Parent.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)

local function _(_, _): boolean
	return true
end

local function getFoldersMapping(EntrypointInput)
	local config = { R15ArtistIntent = true, R15Fixed = true, R6 = true }
	local Folders = {}
	
	for _, Folder in EntrypointInput do
		if Folder:IsA("Folder") and config[Folder.Name] then
			Folders[Folder.Name] = Folder
		end
	end
	return Folders
end

return {
	categories = ConstantsModule.AllAssetUploadCategories,
	requiredData = {
		ValidationEnumsModule.SharedDataMember.entrypointInput,
		ValidationEnumsModule.SharedDataMember.consumerConfig,
		ValidationEnumsModule.SharedDataMember.uploadEnum
	},
	run = function(p1, p2)
		-- upvalues: ConstantsModule (copy), ErrorSourceStringsModule (copy), getFoldersMapping (copy)
		local EntrypointInput = p2.entrypointInput
		local ConsumerConfig = p2.consumerConfig
		
		if ConstantsModule.AssetUploadsWithFolderStructure[p2.uploadEnum.assetType] and ConsumerConfig.enforceR15FolderStructure then
			if #EntrypointInput ~= 3 then
				p1:fail(ErrorSourceStringsModule.Keys.FolderStructureMismatch)
				
				return
			end
			local FoldersMapping = getFoldersMapping(EntrypointInput)
			
			if not FoldersMapping.R15ArtistIntent or not FoldersMapping.R15Fixed or not FoldersMapping.R6 or #FoldersMapping.R6:GetChildren() ~= 0 then
				p1:fail(ErrorSourceStringsModule.Keys.FolderStructureMismatch)
				
				return
			end
			local _ = FoldersMapping.R15ArtistIntent
			local _ = FoldersMapping.R15Fixed
		elseif #EntrypointInput ~= 1 then
			p1:fail(ErrorSourceStringsModule.Keys.SelectionCountNotOne)
		end
	end
}