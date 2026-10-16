local AXSetAngularVelocityIsOptional = game:DefineFastFlag("AXSetAngularVelocityIsOptional", false)
local GamepadUtils = {
	normalizeStickByDeadzone = function(Direction, p1) --[[ Line: 18 ]]
		local Magnitude: number = Direction.Magnitude
		local P1 = p1 or 0.2
		
		return if Magnitude < P1 then Vector2.new(0, 0) else (Magnitude - P1) / (1 - P1) * Direction.Unit
	end
}

function GamepadUtils.rotateAndZoom(p1, p2, Callback: (any) -> (), Callback1: (any) -> (), Callback2: (any) -> ()) --[[ Line: 28 ]]
	-- upvalues: GamepadUtils (copy), AXSetAngularVelocityIsOptional (copy)
	local NormalizeStickByDeadzoneResult = GamepadUtils.normalizeStickByDeadzone(Vector2.new(p1.Position.X, p1.Position.Y))
	
	if NormalizeStickByDeadzoneResult == Vector2.new(0, 0) then return end
	if AXSetAngularVelocityIsOptional then
		if Callback then
			Callback(0)
		end
	else
		Callback(0)
	end
	if Callback1 and math.abs(NormalizeStickByDeadzoneResult.X) > 0.5 then
		Callback1(p2 * NormalizeStickByDeadzoneResult.X * 2.0943951023931953)
	end
	if Callback2 and math.abs(NormalizeStickByDeadzoneResult.Y) > 0.5 then
		Callback2(p2 * -NormalizeStickByDeadzoneResult.Y * 10)
	end
end

function GamepadUtils.mapPositionToDirection(Direction) --[[ Line: 56 ]]
	-- upvalues: GamepadUtils (copy)
	local NormalizeStickByDeadzoneResult = GamepadUtils.normalizeStickByDeadzone(Direction)
	local X: number = NormalizeStickByDeadzoneResult.X
	local Y: number = NormalizeStickByDeadzoneResult.Y
	
	if X * X + Y * Y > 0.25 then
		local Angle = math.atan2(Y, X)
		
		if Angle > -2.356194490192345 and Angle <= -0.7853981633974483 then
			return Enum.KeyCode.Down
		elseif Angle > -0.7853981633974483 and Angle <= 0.7853981633974483 then
			return Enum.KeyCode.Right
		elseif Angle > 0.7853981633974483 and Angle <= 2.356194490192345 then
			return Enum.KeyCode.Up
		elseif Angle > 2.356194490192345 or Angle <= -2.356194490192345 then
			return Enum.KeyCode.Left
		end
	end
	return nil
end

return GamepadUtils