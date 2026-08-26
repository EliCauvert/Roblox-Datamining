local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)

local function hasOnlyAllowedAttribute(p1, p2)
	-- upvalues: constantsModule (ref)
	for i, v in p1 do
		if not p2 or i ~= constantsModule.AlternateMeshIdAttributeName then
			if i == constantsModule.GUIDAttributeName then
				if typeof(v) == "string" then
					if constantsModule.GUIDAttributeMaxLength < string.len(v) then
						return false
					end
				end
				return false
			end
			return false
		end
	end
	return true
end

return function(p3, p4)
	-- upvalues: hasOnlyAllowedAttribute (ref), constantsModule (ref), analyticsModule (ref)
	local allowEditableInstances = p4.allowEditableInstances
	local t = {}
	
	if not hasOnlyAllowedAttribute(p3:GetAttributes(), allowEditableInstances) then
		table.insert(t, p3:GetFullName())
	end
	for i, v in ipairs(p3:GetDescendants()) do
		if (not allowEditableInstances or not v:GetAttribute(constantsModule.AlternateMeshIdAttributeName)) and next(v:GetAttributes()) ~= nil then
			table.insert(t, v:GetFullName())
		end
	end
	if #t <= 0 then
		return true
	end
	local t_1 = {}
	table.insert(t_1, string.format("'%s' (or its descendants) contain Attributes. You need to remove Attributes from the following: ", p3.Name))
	
	for i_1, v_1 in pairs(t) do
		table.insert(t_1, v_1)
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateAttributes, nil, p4)
	
	return false, t_1
end