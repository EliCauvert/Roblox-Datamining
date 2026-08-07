-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:29 2026 Pacific Standard Time.

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