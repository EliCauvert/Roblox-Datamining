local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local t = {
	categories = constantsModule.AllUploadCategories,
	requiredData = {
		require(parent.validationSystem.ValidationEnums).SharedDataMember.entrypointInput
	},
	fflag = require(parent.flags.getEngineFeatureEngineUGCValidateInstanceTreesEquivalent)
}

local function collectAllInstances(p1)
	local t = {}
	
	for i, v in p1 do
		local t_1 = {}
		
		if typeof(v) == "Instance" then
			table.insert(t_1, v)
		elseif typeof(v) == "table" and v.allSelectedInstances ~= nil then
			t_1 = v.allSelectedInstances
		end
		for i_1, v_1 in t_1 do
			table.insert(t, v_1)
			
			for i_2, v_2 in v_1:GetDescendants() do
				table.insert(t, v_2)
			end
		end
	end
	return t
end

function t.run(p2, p3)
	-- upvalues: collectAllInstances (ref), errorSourceStringsModule (ref), constantsModule (ref)
	for i, v in collectAllInstances(p3.entrypointInput) do
		if v.Archivable == false then
			p2:fail(errorSourceStringsModule.Keys.PropertyValueInvalid, {
				PropertyName = "Archivable",
				ExpectedValue = "true",
				InstancePath = v:GetFullName(),
				ComparisonMethod = constantsModule.COMPARISON_METHODS.EXACT_EQ
			})
		end
	end
end

return t