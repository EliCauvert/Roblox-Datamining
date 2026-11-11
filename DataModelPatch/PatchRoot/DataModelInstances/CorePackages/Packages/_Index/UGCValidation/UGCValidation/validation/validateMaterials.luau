local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local AnalyticsModule = require(Parent.Analytics)
local ConstantsModule = require(Parent.Constants)

return function(Object, p1)
	-- upvalues: ConstantsModule (copy), AnalyticsModule (copy)
	local FullNames = {}
	local Descendants = Object:GetDescendants()
	table.insert(Descendants, Object)
	
	for _, Part in Descendants do
		if Part:IsA("BasePart") and not ConstantsModule.MATERIAL_WHITELIST[Part.Material] then
			table.insert(FullNames, Part:GetFullName())
		end
	end
	if #FullNames <= 0 then
		return true
	end
	local List = {}
	local List1 = {}
	
	for i in pairs(ConstantsModule.MATERIAL_WHITELIST) do
		table.insert(List1, i.Name)
	end
	table.insert(List, "Invalid material setup for")
	
	for _, fullName in pairs(FullNames) do
		table.insert(List, fullName)
	end
	table.insert(List, "Accepted values are: " .. table.concat(List1, ", "))
	AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateMaterials, nil, p1)
	
	return false, List
end