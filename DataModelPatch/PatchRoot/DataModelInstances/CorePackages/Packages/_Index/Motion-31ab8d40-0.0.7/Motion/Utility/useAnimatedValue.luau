local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local ReactOtterModule = require(Parent1.ReactOtter)
local _ = require(Parent.Types)

local function _(p1, p2)
	return if type(p1) == "number" then p1 else p2 or 0
end

return function(Vector)
	-- upvalues: ReactModule (copy), ReactOtterModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(...)
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current ~= nil then
			if type(UseRefResult.current) == "function" then
				UseRefResult.current(...)
				
				return
			end
			if UseRefResult.current._isMockFunction then
				UseRefResult.current(...)
			end
		end
	end, { UseRefResult })
	
	if typeof(Vector) == "UDim" then
		local Scale = Vector.Scale
		local Scale1 = if type(Scale) == "number" then Scale else 0
		local Offset = Vector.Offset
		local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding({
			scale = Scale1,
			offset = if type(Offset) == "number" then Offset else 0
		}, UseResult)
		
		return UseAnimatedBindingResult:map(function(p1): UDim
			return UDim.new(p1.scale, p1.offset)
		end), function(p1, p2)
			-- upvalues: UseRefResult (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval)
			if not p1 then return end
			if typeof(p1) == "UDim" then
				UseRefResult.current = p2 and p2.onComplete or nil
				local Config = if p2 then {
					duration = p2.duration or 0.3,
					easingStyle = p2.easingStyle
				} else nil
				local Scale = p1.Scale
				local Scale1 = if type(Scale) == "number" then Scale else 0
				local Offset = p1.Offset
				UseAnimatedBindingResult2({
					scale = ReactOtterModule.ease(Scale1, Config),
					offset = ReactOtterModule.ease(if type(Offset) == "number" then Offset else 0, Config)
				})
				
				return
			else
				warn("Expected UDim target but got", (typeof(p1)))
			end
		end
	elseif typeof(Vector) == "UDim2" then
		local Scale = Vector.X.Scale
		local Scale2 = if type(Scale) == "number" then Scale else 0
		local Offset = Vector.X.Offset
		local Offset1 = if type(Offset) == "number" then Offset else 0
		local Scale3 = Vector.Y.Scale
		local Scale31 = if type(Scale3) == "number" then Scale3 else 0
		local Offset2 = Vector.Y.Offset
		local UseAnimatedBindingResult1, UseAnimatedBindingResult2_1 = ReactOtterModule.useAnimatedBinding({
			xScale = Scale2,
			xOffset = Offset1,
			yScale = Scale31,
			yOffset = if type(Offset2) == "number" then Offset2 else 0
		}, UseResult)
		
		return UseAnimatedBindingResult1:map(function(p1): UDim2
			return UDim2.new(p1.xScale, p1.xOffset, p1.yScale, p1.yOffset)
		end), function(Vector, p1)
			-- upvalues: UseRefResult (copy), UseAnimatedBindingResult2_1 (copy), ReactOtterModule (upval)
			if not Vector then return end
			if typeof(Vector) == "UDim2" then
				UseRefResult.current = p1 and p1.onComplete or nil
				local Config = if p1 then {
					duration = p1.duration or 0.3,
					easingStyle = p1.easingStyle
				} else nil
				local Scale = Vector.X.Scale
				local Scale1 = if type(Scale) == "number" then Scale else 0
				local Offset = Vector.X.Offset
				local Offset1 = if type(Offset) == "number" then Offset else 0
				local Scale2 = Vector.Y.Scale
				local Scale21 = if type(Scale2) == "number" then Scale2 else 0
				local Offset2 = Vector.Y.Offset
				UseAnimatedBindingResult2_1({
					xScale = ReactOtterModule.ease(Scale1, Config),
					xOffset = ReactOtterModule.ease(Offset1, Config),
					yScale = ReactOtterModule.ease(Scale21, Config),
					yOffset = ReactOtterModule.ease(if type(Offset2) == "number" then Offset2 else 0, Config)
				})
				
				return
			else
				warn("Expected UDim2 target but got", (typeof(Vector)))
			end
		end
	elseif typeof(Vector) == "Vector2" then
		local X = Vector.X
		local X1 = if type(X) == "number" then X else 0
		local Y = Vector.Y
		local UseAnimatedBindingResult3, UseAnimatedBindingResult2_2 = ReactOtterModule.useAnimatedBinding({ x = X1, y = if type(Y) == "number" then Y else 0 }, UseResult)
		
		return UseAnimatedBindingResult3:map(function(Vector): Vector2
			return Vector2.new(Vector.x, Vector.y)
		end), function(Vector, p1)
			-- upvalues: UseRefResult (copy), UseAnimatedBindingResult2_2 (copy), ReactOtterModule (upval)
			if not Vector then return end
			if typeof(Vector) == "Vector2" then
				UseRefResult.current = p1 and p1.onComplete or nil
				local Config = if p1 then {
					duration = p1.duration or 0.3,
					easingStyle = p1.easingStyle
				} else nil
				local X = Vector.X
				local X1 = if type(X) == "number" then X else 0
				local Y = Vector.Y
				UseAnimatedBindingResult2_2({
					x = ReactOtterModule.ease(X1, Config),
					y = ReactOtterModule.ease(if type(Y) == "number" then Y else 0, Config)
				})
				
				return
			else
				warn("Expected Vector2 target but got", (typeof(Vector)))
			end
		end
	elseif typeof(Vector) == "Color3" then
		local R = Vector.R
		local R1 = if type(R) == "number" then R else 0
		local G = Vector.G
		local G1 = if type(G) == "number" then G else 0
		local B = Vector.B
		local UseAnimatedBindingResult4, UseAnimatedBindingResult2_3 = ReactOtterModule.useAnimatedBinding({ r = R1, g = G1, b = if type(B) == "number" then B else 0 }, UseResult)
		
		return UseAnimatedBindingResult4:map(function(p1): Color3
			return Color3.new(p1.r, p1.g, p1.b)
		end), function(p1, p2)
			-- upvalues: UseRefResult (copy), UseAnimatedBindingResult2_3 (copy), ReactOtterModule (upval)
			if not p1 then return end
			if typeof(p1) == "Color3" then
				UseRefResult.current = p2 and p2.onComplete or nil
				local Config = if p2 then {
					duration = p2.duration or 0.3,
					easingStyle = p2.easingStyle
				} else nil
				local R = p1.R
				local R1 = if type(R) == "number" then R else 0
				local G = p1.G
				local G1 = if type(G) == "number" then G else 0
				local B = p1.B
				UseAnimatedBindingResult2_3({
					r = ReactOtterModule.ease(R1, Config),
					g = ReactOtterModule.ease(G1, Config),
					b = ReactOtterModule.ease(if type(B) == "number" then B else 0, Config)
				})
				
				return
			else
				warn("Expected Color3 target but got", (typeof(p1)))
			end
		end
	elseif typeof(Vector) == "number" then
		local UseAnimatedBindingResult5, UseAnimatedBindingResult2_4 = ReactOtterModule.useAnimatedBinding(if type(Vector) == "number" then Vector else 0, UseResult)
		
		return UseAnimatedBindingResult5:map(function(p1)
			return p1
		end), function(p1, p2)
			-- upvalues: UseRefResult (copy), UseAnimatedBindingResult2_4 (copy), ReactOtterModule (upval)
			if typeof(p1) == "number" then
				UseRefResult.current = p2 and p2.onComplete or nil
				UseAnimatedBindingResult2_4(ReactOtterModule.ease(p1, if p2 then {
					duration = p2.duration or 0.3,
					easingStyle = p2.easingStyle
				} else nil))
				
				return
			end
		end
	else
		warn("Unsupported type for animated value:", (typeof(Vector)))
		
		return ReactModule.createBinding(Vector), function() end
	end
end