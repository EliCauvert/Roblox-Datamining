local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
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
for i_1, v_1 in validationEnumsModule.AssetQualityCheck do
	t_1[v_1] = assetQualityFolders
end
local t_2 = {}

for i_2, v_2 in validationEnumsModule do
	t_2[i_2] = {}
	
	if typeof(v_2) == "table" then
		for i_3, v_3 in v_2 do
			t_2[i_2][i_3] = true
		end
	end
end
local function tableOnlyHasExistingEnums(p1, p2, p3)
	-- upvalues: t_2 (ref)
	if typeof(p2) ~= "table" then
		error(`Invalid config option {p3} inside of {p1} - expected to be table`)
	end
	for i, v in p2 do
		if not t_2[p3][v] then
			error(`Invalid config option {v} in {p3} inside of {p1}`)
		end
	end
end

local function defaultFlagCheck()
	return true
end

local function defaultShadowCheck()
	return false
end

local t_3 = {}

for i_3, v_3 in t_1 do
	local var1 = v_3:FindFirstChild(i_3)
	
	if var1 == nil then
		error(`{i_3} validation folder is missing from {v_3.Name}`)
	end
	local var2 = var1:FindFirstChild(i_3)
	
	if var2 == nil or not var2:IsA("ModuleScript") then
		error(`{i_3}.lua validation file is missing from {v_3.Name}/{i_3}`)
	end
	local unknownModule = require(var2)
	
	for i_4, v_4 in unknownModule do
		if typeof(i_4) ~= "string" then
			error(`{i_3}.lua contains non-string key {tostring(i_4)}`)
		elseif not t_2.ValidationConfig[i_4] then
			error(`{i_3}.lua contains unexpected member {i_4}. Check for typos or add an extra ValidationEnums.ValidationConfig`)
		end
	end
	unknownModule.fflag = unknownModule.fflag or defaultFlagCheck
	unknownModule.shadowFlag = unknownModule.shadowFlag or defaultShadowCheck
	unknownModule.categories = unknownModule.categories or {}
	unknownModule.requiredData = unknownModule.requiredData or {}
	unknownModule.conditionalData = unknownModule.conditionalData or {}
	unknownModule.prereqTests = unknownModule.prereqTests or {}
	unknownModule.expectedFailures = unknownModule.expectedFailures or {}
	unknownModule.knownAqsUserErrors = unknownModule.knownAqsUserErrors or {}
	unknownModule.isAssetQualityModule = v_3 == assetQualityFolders
	
	if unknownModule.isAssetQualityModule then
		for i_4, v_4 in list do
			if not table.find(unknownModule.requiredData, v_4) then
				table.insert(unknownModule.requiredData, v_4)
			end
		end
	end
	if unknownModule.run == nil or typeof(unknownModule.run) ~= "function" then
		error(`Missing module run function in {i_3}`)
	end
	setmetatable(unknownModule, {
		__index = function(_, p1)
			-- upvalues: i_3 (ref)
			error(`Invalid ValidationConfig {p1} used on the module {i_3}`)
		end
	})
	
	if typeof(unknownModule.fflag) ~= "function" or typeof(unknownModule.fflag()) ~= "boolean" then
		error(`Invalid FFlag config in {i_3}`)
	end
	if typeof(unknownModule.shadowFlag) ~= "function" or typeof(unknownModule.shadowFlag()) ~= "boolean" then
		error(`Invalid shadowFlag config in {i_3}`)
	end
	tableOnlyHasExistingEnums(i_3, unknownModule.categories, "UploadCategory")
	tableOnlyHasExistingEnums(i_3, unknownModule.requiredData, "SharedDataMember")
	tableOnlyHasExistingEnums(i_3, unknownModule.conditionalData, "SharedDataMember")
	tableOnlyHasExistingEnums(i_3, unknownModule.prereqTests, "ValidationModule")
	t_3[i_3] = unknownModule
end
t.allModules = t_3

function t.getValidationModule(p1)
	-- upvalues: t_3 (ref)
	if t_3[p1] == nil then
		error(`{p1} does not exist in the preload table.`)
	end
	return t_3[p1]
end

return t