local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)

local function hasOnlyAllowedAttribute(Attributes, AllowEditableInstances): boolean
	-- upvalues: ConstantsModule (copy)
	for i, attribute in Attributes do
		if not AllowEditableInstances or i ~= ConstantsModule.AlternateMeshIdAttributeName then
			if i ~= ConstantsModule.GUIDAttributeName then
				return false
			end
			if typeof(attribute) ~= "string" then
				return false
			elseif ConstantsModule.GUIDAttributeMaxLength < string.len(attribute) then
				return false
			end
			continue
		end
	end
	return true
end

return function(Object, p1)
	-- upvalues: hasOnlyAllowedAttribute (copy), ConstantsModule (copy), AnalyticsModule (copy)
	local AllowEditableInstances = p1.allowEditableInstances
	local FullNames = {}
	
	if not hasOnlyAllowedAttribute(Object:GetAttributes(), AllowEditableInstances) then
		table.insert(FullNames, Object:GetFullName())
	end
	for _, descendant in ipairs(Object:GetDescendants()) do
		if (not AllowEditableInstances or not descendant:GetAttribute(ConstantsModule.AlternateMeshIdAttributeName)) and next(descendant:GetAttributes()) ~= nil then
			table.insert(FullNames, descendant:GetFullName())
		end
	end
	if #FullNames <= 0 then
		return true
	end
	local List = {}
	table.insert(List, string.format("'%s' (or its descendants) contain Attributes. You need to remove Attributes from the following: ", Object.Name))
	
	for _, fullName in pairs(FullNames) do
		table.insert(List, fullName)
	end
	AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateAttributes, nil, p1)
	
	return false, List
end