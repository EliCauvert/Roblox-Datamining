-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:48 2026 Pacific Standard Time.

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

local function _(_, _) --[[ line: 16 | named "deepEquals" ]]
	return true
end

local function getFoldersMapping(p0) --[[ line: 21 ]]
	local t = { R15ArtistIntent = true, R15Fixed = true, R6 = true }
	local t_1 = {}
	
	for i, v in p0 do
		if v:IsA("Folder") and t[v.Name] then
			t_1[v.Name] = v
		end
	end
	return t_1
end

function t.run(p1, p2) --[[ line: 38 ]]
	-- upvalues: constantsModule (ref), errorSourceStringsModule (ref), getFoldersMapping (ref)
	local entrypointInput = p2.entrypointInput
	
	if constantsModule.AssetUploadsWithFolderStructure[p2.uploadEnum.assetType] and p2.consumerConfig.enforceR15FolderStructure then
		if #entrypointInput ~= 3 then
			p1:fail(errorSourceStringsModule.Keys.FolderStructureMismatch)
			
			return
		end
		local var7 = getFoldersMapping(entrypointInput)
		
		if var7.R15ArtistIntent and var7.R15Fixed and (var7.R6 and #var7.R6:GetChildren() == 0) then
			local _ = var7.R15ArtistIntent
			local _ = var7.R15Fixed
			local _ = true
		else
			p1:fail(errorSourceStringsModule.Keys.FolderStructureMismatch)
			
			return
		end
	elseif #entrypointInput ~= 1 then
		p1:fail(errorSourceStringsModule.Keys.SelectionCountNotOne)
	end
end

return t