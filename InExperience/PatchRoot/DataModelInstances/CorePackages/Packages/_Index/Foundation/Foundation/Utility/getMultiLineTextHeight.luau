local fontScalesModule = require(script:FindFirstAncestor("Foundation").Components.Text.FontScales)

return function(p1, p2, p3)
	-- upvalues: fontScalesModule (ref)
	if p1 <= 0 or p2 <= 0 then
		return 0
	elseif p3 <= 1 then
		p3 = 1
	end
	local floored = math.floor(p1)
	floored = 0
	local family = fontScalesModule[Font.fromEnum(Enum.Font.BuilderSans).Family]
	
	if family ~= nil then
		floored = (floored / family * (p3 * family) - floored) / 2
	end
	return math.ceil((p2 - 1) * p3 * floored) + floored + (if floored >= 1 then math.ceil(floored) else math.floor(floored))
end