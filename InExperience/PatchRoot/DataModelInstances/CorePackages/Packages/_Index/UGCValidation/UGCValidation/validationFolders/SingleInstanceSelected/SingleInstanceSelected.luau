local Parent = script.Parent.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule = require(Parent.flags.getEngineFeatureEngineUGCValidateInstanceTreesEquivalent)
local UGCValidationService = game:GetService("UGCValidationService")

local function _(ExpectedTree, CandidateTree, Backend) --[[ Line: 20 | Named "deepEquals" ]]
	-- upvalues: GetEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule (copy), ValidationEnumsModule (copy), UGCValidationService (copy)
	return not GetEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule() or Backend ~= ValidationEnumsModule.ConsumerEnv.Backend or UGCValidationService:AreInstanceTreesEquivalent(ExpectedTree, CandidateTree)
end

local function getFoldersMapping(EntrypointInput) --[[ Line: 33 ]]
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
	run = function(p1, p2) --[[ Line: 50 ]]
		-- upvalues: ConstantsModule (copy), ErrorSourceStringsModule (copy), getFoldersMapping (copy), GetEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule (copy), ValidationEnumsModule (copy), UGCValidationService (copy)
		local EntrypointInput = p2.entrypointInput
		local ConsumerConfig = p2.consumerConfig
		
		if ConstantsModule.AssetUploadsWithFolderStructure[p2.uploadEnum.assetType] and ConsumerConfig.enforceR15FolderStructure then
			if #EntrypointInput ~= 3 then
				p1:fail(ErrorSourceStringsModule.Keys.FolderStructureMismatch)
				
				return
			end
			local FoldersMapping = getFoldersMapping(EntrypointInput)
			
			if FoldersMapping.R15ArtistIntent and FoldersMapping.R15Fixed and FoldersMapping.R6 and #FoldersMapping.R6:GetChildren() == 0 then
				local R15ArtistIntent = FoldersMapping.R15ArtistIntent
				local R15Fixed = FoldersMapping.R15Fixed
				local ConsumerEnv = ConsumerConfig.consumerEnv
				
				if not GetEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule() or ConsumerEnv ~= ValidationEnumsModule.ConsumerEnv.Backend or UGCValidationService:AreInstanceTreesEquivalent(R15ArtistIntent, R15Fixed) then return end
			end
			p1:fail(ErrorSourceStringsModule.Keys.FolderStructureMismatch)
			
			return
		elseif #EntrypointInput ~= 1 then
			p1:fail(ErrorSourceStringsModule.Keys.SelectionCountNotOne)
		end
	end
}