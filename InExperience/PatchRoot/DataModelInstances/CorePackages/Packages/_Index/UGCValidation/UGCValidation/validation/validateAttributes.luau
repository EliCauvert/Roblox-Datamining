local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)

local function hasOnlyAllowedAttribute(p0, p1)
	-- upvalues: constantsModule (ref)
	for i, v in p0 do
		if not p1 or i ~= constantsModule.AlternateMeshIdAttributeName then
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

return function(p2, p3)
	-- upvalues: hasOnlyAllowedAttribute (ref), constantsModule (ref), analyticsModule (ref)
	local allowEditableInstances = p3.allowEditableInstances
	local t = {}
	
	if not hasOnlyAllowedAttribute(p2:GetAttributes(), allowEditableInstances) then
		table.insert(t, p2:GetFullName())
	end
	for i, v in ipairs(p2:GetDescendants()) do
		if (not allowEditableInstances or not v:GetAttribute(constantsModule.AlternateMeshIdAttributeName)) and next(v:GetAttributes()) ~= nil then
			table.insert(t, v:GetFullName())
		end
	end
	if #t <= 0 then
		return true
	end
	local t_1 = {}
	table.insert(t_1, string.format("'%s' (or its descendants) contain Attributes. You need to remove Attributes from the following: ", p2.Name))
	
	for i_1, v_1 in pairs(t) do
		table.insert(t_1, v_1)
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateAttributes, nil, p3)
	
	return false, t_1
end