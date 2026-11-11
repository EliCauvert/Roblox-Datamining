local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local ConstantsModule = require(Parent.Constants)
local ValidateWithSchemaModule = require(Parent.util.validateWithSchema)
local _ = require(Parent.util.Types)

return function(p1, Object, p2)
	-- upvalues: ValidateWithSchemaModule (copy), AnalyticsModule (copy), ConstantsModule (copy)
	local ValidateWithSchemaModuleResult = ValidateWithSchemaModule(p1, Object, p2)
	
	if ValidateWithSchemaModuleResult.success == false then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateInstanceTree, nil, p2)
		
		return false, {
			"Detected the following error(s): " .. ValidateWithSchemaModuleResult.message
		}
	end
	local List = {}
	
	if ConstantsModule.BANNED_NAMES[Object.Name] then
		table.insert(List, string.format("%s has an invalid name", Object:GetFullName()))
	end
	for _, descendant in pairs(Object:GetDescendants()) do
		for _, bANNEDCLASSNAME in pairs(ConstantsModule.BANNED_CLASS_NAMES) do
			if descendant:IsA(bANNEDCLASSNAME) then
				table.insert(List, string.format("%s is of type %s which is not allowed", descendant:GetFullName(), bANNEDCLASSNAME))
			end
		end
		if ConstantsModule.BANNED_NAMES[descendant.Name] then
			table.insert(List, string.format("%s has an invalid name", descendant:GetFullName()))
		end
	end
	if #List > 0 then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateInstanceTree_InvalidDescendants, nil, p2)
		
		return false, List
	else
		return true
	end
end