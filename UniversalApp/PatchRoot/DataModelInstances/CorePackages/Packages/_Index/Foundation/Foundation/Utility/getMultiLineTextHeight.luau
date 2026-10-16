local FontScalesModule = require(script:FindFirstAncestor("Foundation").Components.Text.FontScales)

return function(Value: number, p1: number, p2: number): number --[[ Line: 5 ]]
	-- upvalues: FontScalesModule (copy)
	if Value <= 0 or p1 <= 0 then
		return 0
	end
	if p2 <= 1 then
		p2 = 1
	end
	local Floored = math.floor(Value)
	local Value1 = 0
	local FontScalesModuleEntry = FontScalesModule[Font.fromEnum(Enum.Font.BuilderSans).Family]
	
	if FontScalesModuleEntry ~= nil then
		Value1 = (Floored / FontScalesModuleEntry * (p2 * FontScalesModuleEntry) - Floored) / 2
	end
	return math.ceil((p1 - 1) * p2 * Floored) + Floored + (if Value1 >= 1 then math.ceil(Value1) else math.floor(Value1))
end