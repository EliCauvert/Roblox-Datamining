local ConfigModule = require(script.Parent.Config)
local MotionTypeModule = require(script.Parent.MotionType)

return {
	spring = function(Value, p1, p2, p3)
		-- upvalues: ConfigModule (copy), MotionTypeModule (copy)
		return {
			type = MotionTypeModule.Spring,
			value = Value,
			stiffness = p1 or ConfigModule.DEFAULT_STIFFNESS,
			damping = p2 or ConfigModule.DEFAULT_DAMPING,
			precision = p3 or ConfigModule.SPRING_PRECISION
		}
	end,
	extractValue = function(p1)
		return if type(p1) == "table" then p1.value else p1
	end,
	getType = function(p1)
		-- upvalues: MotionTypeModule (copy)
		return if type(p1) == "table" then p1.type else MotionTypeModule.Instant
	end
}