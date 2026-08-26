local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local t = { categories = constantsModule.AllAssetUploadCategories }
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule = require(parent.flags.getEngineFeatureEngineUGCValidateInstanceTreesEquivalent)
local UGCValidationService = game:GetService("UGCValidationService")
t.requiredData = {
	validationEnumsModule.SharedDataMember.entrypointInput,
	validationEnumsModule.SharedDataMember.consumerConfig,
	validationEnumsModule.SharedDataMember.uploadEnum
}

local function _(p1, p2, p3)
	-- upvalues: getEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule (ref), validationEnumsModule (ref), UGCValidationService (ref)
	return if getEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule() and p3 == validationEnumsModule.ConsumerEnv.Backend then UGCValidationService:AreInstanceTreesEquivalent(p1, p2) else true
end

local function getFoldersMapping(p1)
	local t = { R15ArtistIntent = true, R15Fixed = true, R6 = true }
	local t_1 = {}
	
	for i, v in p1 do
		if v:IsA("Folder") and t[v.Name] then
			t_1[v.Name] = v
		end
	end
	return t_1
end

function t.run(p2, p3)
	-- upvalues: constantsModule (ref), errorSourceStringsModule (ref), getFoldersMapping (ref), getEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule (ref), validationEnumsModule (ref), UGCValidationService (ref)
	local entrypointInput = p3.entrypointInput
	local consumerConfig = p3.consumerConfig
	
	if constantsModule.AssetUploadsWithFolderStructure[p3.uploadEnum.assetType] and consumerConfig.enforceR15FolderStructure then
		if #entrypointInput ~= 3 then
			p2:fail(errorSourceStringsModule.Keys.FolderStructureMismatch)
			
			return
		end
		local var1 = getFoldersMapping(entrypointInput)
		
		if var1.R15ArtistIntent and var1.R15Fixed and (var1.R6 and #var1.R6:GetChildren() == 0) then
			if if getEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule() and consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.Backend then UGCValidationService:AreInstanceTreesEquivalent(var1.R15ArtistIntent, var1.R15Fixed) else true then
				return
			else
				p2:fail(errorSourceStringsModule.Keys.FolderStructureMismatch)
				
				return
			end
		end
	elseif #entrypointInput ~= 1 then
		p2:fail(errorSourceStringsModule.Keys.SelectionCountNotOne)
	end
end

return t