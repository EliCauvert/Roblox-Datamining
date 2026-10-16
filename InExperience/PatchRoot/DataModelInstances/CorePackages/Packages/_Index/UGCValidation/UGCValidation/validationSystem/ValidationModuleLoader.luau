local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ValidationFolders = Parent.validationFolders
local AssetQualityFolders = Parent.assetQualityFolders
local t = {}
local list = {
	ValidationEnumsModule.SharedDataMember.aqsSummaryData,
	ValidationEnumsModule.SharedDataMember.renderMeshesData,
	ValidationEnumsModule.SharedDataMember.innerCagesData,
	ValidationEnumsModule.SharedDataMember.outerCagesData,
	ValidationEnumsModule.SharedDataMember.meshTextures
}
local t1 = {}

for _, value in ValidationEnumsModule.ValidationModule do
	t1[value] = ValidationFolders
end
for _, value1 in ValidationEnumsModule.AssetQualityCheck do
	t1[value1] = AssetQualityFolders
end
local t2 = {}

for i, value2 in ValidationEnumsModule do
	t2[i] = {}
	
	if typeof(value2) == "table" then
		for i1, _ in value2 do
			t2[i][i1] = true
		end
	end
end
local function tableOnlyHasExistingEnums(ChildName, Categories, p1) --[[ Line: 50 ]]
	-- upvalues: t2 (copy)
	if typeof(Categories) ~= "table" then
		error(`Invalid config option {p1} inside of {ChildName} - expected to be table`)
	end
	for _, category in Categories do
		if not t2[p1][category] then
			error(`Invalid config option {category} in {p1} inside of {ChildName}`)
		end
	end
end

local function defaultFlagCheck(): boolean --[[ Line: 62 ]]
	return true
end

local function defaultShadowCheck(): boolean --[[ Line: 66 ]]
	return false
end

local AllModules = {}

for ChildName, value3 in t1 do
	local Child = value3:FindFirstChild(ChildName)
	
	if Child == nil then
		error(`{ChildName} validation folder is missing from {value3.Name}`)
	end
	local ChildName1 = Child:FindFirstChild(ChildName)
	
	if ChildName1 == nil or not ChildName1:IsA("ModuleScript") then
		error(`{ChildName}.lua validation file is missing from {value3.Name}/{ChildName}`)
	end
	local Module = require(ChildName1)
	
	for i2, value4 in Module do
		if typeof(i2) ~= "string" then
			error(`{ChildName}.lua contains non-string key {tostring(i2)}`)
		elseif not t2.ValidationConfig[i2] then
			error(`{ChildName}.lua contains unexpected member {i2}. Check for typos or add an extra ValidationEnums.ValidationConfig`)
		end
	end
	Module.fflag = Module.fflag or defaultFlagCheck
	Module.shadowFlag = Module.shadowFlag or defaultShadowCheck
	Module.categories = Module.categories or {}
	Module.requiredData = Module.requiredData or {}
	Module.conditionalData = Module.conditionalData or {}
	Module.prereqTests = Module.prereqTests or {}
	Module.expectedFailures = Module.expectedFailures or {}
	Module.knownAqsUserErrors = Module.knownAqsUserErrors or {}
	Module.isAssetQualityModule = value3 == AssetQualityFolders
	
	if Module.isAssetQualityModule then
		for _, value4 in list do
			if not table.find(Module.requiredData, value4) then
				table.insert(Module.requiredData, value4)
			end
		end
	end
	if Module.run == nil or typeof(Module.run) ~= "function" then
		error(`Missing module run function in {ChildName}`)
	end
	setmetatable(Module, {
		__index = function(_, p2) --[[ Line: 123 ]]
			-- upvalues: ChildName (copy)
			error(`Invalid ValidationConfig {p2} used on the module {ChildName}`)
		end
	})
	
	if typeof(Module.fflag) ~= "function" or typeof(Module.fflag()) ~= "boolean" then
		error(`Invalid FFlag config in {ChildName}`)
	end
	if typeof(Module.shadowFlag) ~= "function" or typeof(Module.shadowFlag()) ~= "boolean" then
		error(`Invalid shadowFlag config in {ChildName}`)
	end
	tableOnlyHasExistingEnums(ChildName, Module.categories, "UploadCategory")
	tableOnlyHasExistingEnums(ChildName, Module.requiredData, "SharedDataMember")
	tableOnlyHasExistingEnums(ChildName, Module.conditionalData, "SharedDataMember")
	tableOnlyHasExistingEnums(ChildName, Module.prereqTests, "ValidationModule")
	AllModules[ChildName] = Module
end
t.allModules = AllModules

function t.getValidationModule(p2) --[[ Line: 146 ]]
	-- upvalues: AllModules (copy)
	if AllModules[p2] == nil then
		error(`{p2} does not exist in the preload table.`)
	end
	return AllModules[p2]
end

return t