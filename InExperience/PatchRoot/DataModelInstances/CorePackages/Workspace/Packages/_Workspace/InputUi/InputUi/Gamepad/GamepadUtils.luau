local AXSetAngularVelocityIsOptional = game:DefineFastFlag("AXSetAngularVelocityIsOptional", false)
local t = {
	normalizeStickByDeadzone = function(p1, p2)
		local magnitude = p1.Magnitude
		p2 = p2 or 0.2
		
		return if magnitude < p2 then Vector2.new(0, 0) else (magnitude - p2) / (1 - p2) * p1.Unit
	end
}

function t.rotateAndZoom(p1, p2, p3, p4, p5)
	-- upvalues: t (ref), AXSetAngularVelocityIsOptional (ref)
	local var1 = t.normalizeStickByDeadzone(Vector2.new(p1.Position.X, p1.Position.Y))
	
	if var1 == Vector2.new(0, 0) then return end
	if not AXSetAngularVelocityIsOptional then
		p3(0)
	elseif p3 then
		p3(0)
	end
	if p4 and math.abs(var1.X) > 0.5 then
		p4(p2 * var1.X * 2.094395102393)
	end
	if p5 and math.abs(var1.Y) > 0.5 then
		p5(p2 * -var1.Y * 10)
	end
end

function t.mapPositionToDirection(p1)
	-- upvalues: t (ref)
	local var1 = t.normalizeStickByDeadzone(p1)
	local x = var1.X
	local y = var1.Y
	
	if x * x + y * y > 0.25 then
		local var2 = math.atan2(y, x)
		
		return if var2 > -2.356194490192 and var2 <= -0.785398163397 then Enum.KeyCode.Down elseif var2 > -0.785398163397 and var2 <= 0.785398163397 then Enum.KeyCode.Right elseif var2 > 0.785398163397 and var2 <= 2.356194490192 then Enum.KeyCode.Up elseif var2 > 2.356194490192 or var2 <= -2.356194490192 then Enum.KeyCode.Left else nil
	end
end

return t