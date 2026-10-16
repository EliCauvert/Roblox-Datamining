local Parent = script.Parent.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)

local function collectAllInstances(EntrypointInput) --[[ Line: 23 ]]
	local List = {}
	
	for _, value in EntrypointInput do
		local AllSelectedInstances = {}
		
		if typeof(value) == "Instance" then
			table.insert(AllSelectedInstances, value)
		elseif typeof(value) == "table" and value.allSelectedInstances ~= nil then
			AllSelectedInstances = value.allSelectedInstances
		end
		for _, allSelectedInstance in AllSelectedInstances do
			table.insert(List, allSelectedInstance)
			
			for _, descendant in allSelectedInstance:GetDescendants() do
				table.insert(List, descendant)
			end
		end
	end
	return List
end

return {
	categories = ConstantsModule.AllUploadCategories,
	requiredData = {
		require(Parent.validationSystem.ValidationEnums).SharedDataMember.entrypointInput
	},
	fflag = require(Parent.flags.getEngineFeatureEngineUGCValidateInstanceTreesEquivalent),
	run = function(p1, p2) --[[ Line: 44 ]]
		-- upvalues: collectAllInstances (copy), ErrorSourceStringsModule (copy), ConstantsModule (copy)
		for _, value in collectAllInstances(p2.entrypointInput) do
			if value.Archivable == false then
				p1:fail(ErrorSourceStringsModule.Keys.PropertyValueInvalid, {
					PropertyName = "Archivable",
					ExpectedValue = "true",
					InstancePath = value:GetFullName(),
					ComparisonMethod = ConstantsModule.COMPARISON_METHODS.EXACT_EQ
				})
			end
		end
	end
}