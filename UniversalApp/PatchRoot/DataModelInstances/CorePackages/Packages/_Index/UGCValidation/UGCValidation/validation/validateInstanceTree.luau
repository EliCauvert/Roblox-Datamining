local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)
local validateWithSchemaModule = require(parent.util.validateWithSchema)
local _ = require(parent.util.Types)

return function(p1, p2, p3)
	-- upvalues: validateWithSchemaModule (ref), analyticsModule (ref), constantsModule (ref)
	local var1 = validateWithSchemaModule(p1, p2, p3)
	
	if var1.success == false then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateInstanceTree, nil, p3)
		
		return false, { "Detected the following error(s): " .. var3.message }
	end
	local t = {}
	
	if constantsModule.BANNED_NAMES[p2.Name] then
		table.insert(t, string.format("%s has an invalid name", p2:GetFullName()))
	end
	for i, v in pairs(p2:GetDescendants()) do
		for i_1, v_1 in pairs(constantsModule.BANNED_CLASS_NAMES) do
			if v:IsA(v_1) then
				table.insert(t, string.format("%s is of type %s which is not allowed", v:GetFullName(), v_1))
			end
		end
		if constantsModule.BANNED_NAMES[v.Name] then
			table.insert(t, string.format("%s has an invalid name", v:GetFullName()))
		end
	end
	if #t > 0 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateInstanceTree_InvalidDescendants, nil, p3)
		
		return false, t
	end
	return true
end