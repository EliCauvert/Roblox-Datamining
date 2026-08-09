local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local getEngineFeatureEngineUGCValidationExpandReturnSchemaModule = require(parent.flags.getEngineFeatureEngineUGCValidationExpandReturnSchema)
local validationFolders = parent.validationFolders
local assetQualityFolders = parent.assetQualityFolders
local t = {}
local list = {
	validationEnumsModule.SharedDataMember.aqsSummaryData,
	validationEnumsModule.SharedDataMember.renderMeshesData,
	validationEnumsModule.SharedDataMember.innerCagesData,
	validationEnumsModule.SharedDataMember.outerCagesData,
	validationEnumsModule.SharedDataMember.meshTextures
}
local t_1 = {}

for i, v in validationEnumsModule.ValidationModule do
	t_1[v] = validationFolders
end
if getEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then
	for i_1, v_1 in validationEnumsModule.AssetQualityCheck do
		t_1[v_1] = assetQualityFolders
	end
end
local t_2 = {}

for i_1, v_1 in validationEnumsModule do
	t_2[i_1] = {}
	
	if typeof(v_1) == "table" then
		for i_2, v_2 in v_1 do
			t_2[i_1][i_2] = true
		end
	end
end
local function tableOnlyHasExistingEnums(p0, p1, p2) --[[ line: 54 ]]
	-- upvalues: t_2 (ref)
	if typeof(p1) ~= "table" then
		error(`Invalid config option {p2} inside of {p0} - expected to be table`)
	end
	for i, v in p1 do
		if not t_2[p2][v] then
			error(`Invalid config option {v} in {p2} inside of {p0}`)
		end
	end
end

local function defaultFlagCheck() --[[ line: 66 ]]
	return true
end

local function defaultShadowCheck() --[[ line: 70 ]]
	return false
end

local t_3 = {}

for i_2, v_2 in t_1 do
	local var10 = v_2:FindFirstChild(i_2)
	
	if var10 == nil then
		error(`{i_2} validation folder is missing from {v_2.Name}`)
	end
	local var11 = var10:FindFirstChild(i_2)
	
	if var11 == nil or not var11:IsA("ModuleScript") then
		error(`{i_2}.lua validation file is missing from {v_2.Name}/{i_2}`)
	end
	local unknownModule = require(var11)
	
	for i_3, v_3 in unknownModule do
		if typeof(i_3) ~= "string" then
			error(`{i_2}.lua contains non-string key {tostring(i_3)}`)
		elseif not t_2.ValidationConfig[i_3] then
			error(`{i_2}.lua contains unexpected member {i_3}. Check for typos or add an extra ValidationEnums.ValidationConfig`)
		end
	end
	unknownModule.fflag = unknownModule.fflag or defaultFlagCheck
	unknownModule.shadowFlag = unknownModule.shadowFlag or defaultShadowCheck
	unknownModule.categories = unknownModule.categories or {}
	unknownModule.requiredData = unknownModule.requiredData or {}
	unknownModule.conditionalData = unknownModule.conditionalData or {}
	unknownModule.prereqTests = unknownModule.prereqTests or {}
	unknownModule.expectedFailures = unknownModule.expectedFailures or {}
	unknownModule.expectedAqsData = unknownModule.expectedAqsData or {}
	unknownModule.knownAqsUserErrors = unknownModule.knownAqsUserErrors or {}
	unknownModule.isAssetQualityModule = v_2 == assetQualityFolders
	
	if getEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then
		if unknownModule.isAssetQualityModule then
			for i_3, v_3 in list do
				if not table.find(unknownModule.requiredData, v_3) then
					table.insert(unknownModule.requiredData, v_3)
				end
			end
		end
	elseif next(unknownModule.expectedAqsData) ~= nil then
		for i_3, v_3 in list do
			if not table.find(unknownModule.requiredData, v_3) then
				table.insert(unknownModule.requiredData, v_3)
			end
		end
	end
	if unknownModule.run == nil or typeof(unknownModule.run) ~= "function" then
		error(`Missing module run function in {i_2}`)
	end
	setmetatable(unknownModule, {
		__index = function(_, p3) --[[ line: 136 ]]
			-- upvalues: i_2 (ref)
			error(`Invalid ValidationConfig {p3} used on the module {i_2}`)
		end
	})
	
	if typeof(unknownModule.fflag) ~= "function" or typeof(unknownModule.fflag()) ~= "boolean" then
		error(`Invalid FFlag config in {i_2}`)
	end
	if typeof(unknownModule.shadowFlag) ~= "function" or typeof(unknownModule.shadowFlag()) ~= "boolean" then
		error(`Invalid shadowFlag config in {i_2}`)
	end
	tableOnlyHasExistingEnums(i_2, unknownModule.categories, "UploadCategory")
	tableOnlyHasExistingEnums(i_2, unknownModule.requiredData, "SharedDataMember")
	tableOnlyHasExistingEnums(i_2, unknownModule.conditionalData, "SharedDataMember")
	tableOnlyHasExistingEnums(i_2, unknownModule.prereqTests, "ValidationModule")
	t_3[i_2] = unknownModule
end
t.allModules = t_3

function t.getValidationModule(p4) --[[ line: 159 ]]
	-- upvalues: t_3 (ref)
	if t_3[p4] == nil then
		error(`{p4} does not exist in the preload table.`)
	end
	return t_3[p4]
end

return t