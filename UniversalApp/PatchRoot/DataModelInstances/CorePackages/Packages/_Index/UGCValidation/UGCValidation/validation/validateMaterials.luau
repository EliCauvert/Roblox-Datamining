local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)

return function(p0, p1) --[[ line: 9 | named "validateMaterials" ]]
	-- upvalues: constantsModule (ref), analyticsModule (ref)
	local t = {}
	local descendants = p0:GetDescendants()
	table.insert(descendants, p0)
	
	for i, v in descendants do
		if v:IsA("BasePart") and not constantsModule.MATERIAL_WHITELIST[v.Material] then
			table.insert(t, v:GetFullName())
		end
	end
	if #t <= 0 then
		return true
	end
	local t_1 = {}
	local t_2 = {}
	
	for i_1 in pairs(constantsModule.MATERIAL_WHITELIST) do
		table.insert(t_2, i_1.Name)
	end
	table.insert(t_1, "Invalid material setup for")
	
	for i_2, v_1 in pairs(t) do
		table.insert(t_1, v_1)
	end
	table.insert(t_1, "Accepted values are: " .. table.concat(t_2, ", "))
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateMaterials, nil, p1)
	
	return false, t_1
end