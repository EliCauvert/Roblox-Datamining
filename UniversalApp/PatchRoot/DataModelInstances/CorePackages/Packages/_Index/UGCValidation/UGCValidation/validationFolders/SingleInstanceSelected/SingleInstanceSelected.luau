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

local function _(p0, p1, p2) --[[ line: 20 | named "deepEquals" ]]
	-- upvalues: getEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule (ref), validationEnumsModule (ref), UGCValidationService (ref)
	return if getEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule() and p2 == validationEnumsModule.ConsumerEnv.Backend then UGCValidationService:AreInstanceTreesEquivalent(p0, p1) else true
end

local function getFoldersMapping(p3) --[[ line: 35 ]]
	local t = { R15ArtistIntent = true, R15Fixed = true, R6 = true }
	local t_1 = {}
	
	for i, v in p3 do
		if v:IsA("Folder") and t[v.Name] then
			t_1[v.Name] = v
		end
	end
	return t_1
end

function t.run(p4, p5) --[[ line: 52 ]]
	-- upvalues: constantsModule (ref), errorSourceStringsModule (ref), getFoldersMapping (ref), getEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule (ref), validationEnumsModule (ref), UGCValidationService (ref)
	local entrypointInput = p5.entrypointInput
	local consumerConfig = p5.consumerConfig
	
	if constantsModule.AssetUploadsWithFolderStructure[p5.uploadEnum.assetType] and consumerConfig.enforceR15FolderStructure then
		if #entrypointInput ~= 3 then
			p4:fail(errorSourceStringsModule.Keys.FolderStructureMismatch)
			
			return
		end
		local var9 = getFoldersMapping(entrypointInput)
		
		if var9.R15ArtistIntent and var9.R15Fixed and (var9.R6 and #var9.R6:GetChildren() == 0) then
			if if getEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule() and consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.Backend then UGCValidationService:AreInstanceTreesEquivalent(var9.R15ArtistIntent, var9.R15Fixed) else true then
				return
			else
				p4:fail(errorSourceStringsModule.Keys.FolderStructureMismatch)
				
				return
			end
		end
	elseif #entrypointInput ~= 1 then
		p4:fail(errorSourceStringsModule.Keys.SelectionCountNotOne)
	end
end

return t