local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local t = { categories = constantsModule.AllAssetUploadCategories }
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
t.requiredData = {
	validationEnumsModule.SharedDataMember.entrypointInput,
	validationEnumsModule.SharedDataMember.consumerConfig,
	validationEnumsModule.SharedDataMember.uploadEnum
}

local function _(_, _)
	return true
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
	-- upvalues: constantsModule (ref), errorSourceStringsModule (ref), getFoldersMapping (ref)
	local entrypointInput = p3.entrypointInput
	
	if constantsModule.AssetUploadsWithFolderStructure[p3.uploadEnum.assetType] and p3.consumerConfig.enforceR15FolderStructure then
		if #entrypointInput ~= 3 then
			p2:fail(errorSourceStringsModule.Keys.FolderStructureMismatch)
			
			return
		end
		local var1 = getFoldersMapping(entrypointInput)
		
		if var1.R15ArtistIntent and var1.R15Fixed and (var1.R6 and #var1.R6:GetChildren() == 0) then
			local _ = var1.R15ArtistIntent
			local _ = var1.R15Fixed
			local _ = true
		else
			p2:fail(errorSourceStringsModule.Keys.FolderStructureMismatch)
			
			return
		end
	elseif #entrypointInput ~= 1 then
		p2:fail(errorSourceStringsModule.Keys.SelectionCountNotOne)
	end
end

return t