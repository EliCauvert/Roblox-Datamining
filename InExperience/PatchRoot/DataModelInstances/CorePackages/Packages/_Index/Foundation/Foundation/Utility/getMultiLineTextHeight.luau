local fontScalesModule = require(script:FindFirstAncestor("Foundation").Components.Text.FontScales)

return function(p0, p1, p2) --[[ line: 5 ]]
	-- upvalues: fontScalesModule (ref)
	if p0 <= 0 or p1 <= 0 then
		return 0
	elseif p2 <= 1 then
		p2 = 1
	end
	local floored = math.floor(p0)
	floored = 0
	local family = fontScalesModule[Font.fromEnum(Enum.Font.BuilderSans).Family]
	
	if family ~= nil then
		floored = (floored / family * (p2 * family) - floored) / 2
	end
	return math.ceil((p1 - 1) * p2 * floored) + floored + (if floored >= 1 then math.ceil(floored) else math.floor(floored))
end