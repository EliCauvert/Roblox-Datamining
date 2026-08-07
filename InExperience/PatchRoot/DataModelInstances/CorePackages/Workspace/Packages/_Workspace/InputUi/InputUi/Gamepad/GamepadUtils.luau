local AXSetAngularVelocityIsOptional = game:DefineFastFlag("AXSetAngularVelocityIsOptional", false)
local t = {
	normalizeStickByDeadzone = function(p0, p1) --[[ line: 18 ]]
		local magnitude = p0.Magnitude
		p1 = p1 or 0.2
		
		return if magnitude < p1 then Vector2.new(0, 0) else (magnitude - p1) / (1 - p1) * p0.Unit
	end
}

function t.rotateAndZoom(p2, p3, p4, p5, p6) --[[ line: 28 ]]
	-- upvalues: t (ref), AXSetAngularVelocityIsOptional (ref)
	local var3 = t.normalizeStickByDeadzone(Vector2.new(p2.Position.X, p2.Position.Y))
	
	if var3 == Vector2.new(0, 0) then return end
	if not AXSetAngularVelocityIsOptional then
		p4(0)
	elseif p4 then
		p4(0)
	end
	if p5 and math.abs(var3.X) > 0.5 then
		p5(p3 * var3.X * 2.094395102393)
	end
	if p6 and math.abs(var3.Y) > 0.5 then
		p6(p3 * -var3.Y * 10)
	end
end

function t.mapPositionToDirection(p7) --[[ line: 56 ]]
	-- upvalues: t (ref)
	local var4 = t.normalizeStickByDeadzone(p7)
	local x = var4.X
	local y = var4.Y
	
	if x * x + y * y > 0.25 then
		local var5 = math.atan2(y, x)
		
		return if var5 > -2.356194490192 and var5 <= -0.785398163397 then Enum.KeyCode.Down elseif var5 > -0.785398163397 and var5 <= 0.785398163397 then Enum.KeyCode.Right elseif var5 > 0.785398163397 and var5 <= 2.356194490192 then Enum.KeyCode.Up elseif var5 > 2.356194490192 or var5 <= -2.356194490192 then Enum.KeyCode.Left else nil
	end
end

return t