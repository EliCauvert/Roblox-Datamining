local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local ReactModule = require(Parent2.React)
local ReactOtterModule = require(Parent2.ReactOtter)
local Preset = require(Parent.TimingConfigs).presets[require(Parent1.Enums.TransitionPreset).Default]
local _ = require(Parent1.Types)

local function _(p1, p2) --[[ Line: 54 | Named "validateNumber" ]]
	return if type(p1) == "number" then p1 else p2 or 0
end

return function(Vector) --[[ Line: 63 | Named "useAnimatedValue" ]]
	-- upvalues: ReactModule (copy), ReactOtterModule (copy), Preset (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(...) --[[ Line: 66 ]]
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
	
	if typeof(Vector) == "table" and Vector.Color3 and Vector.Transparency then
		local R = Vector.Color3.R
		local R1 = if type(R) == "number" then R else 0
		local G = Vector.Color3.G
		local G1 = if type(G) == "number" then G else 0
		local B = Vector.Color3.B
		local B1 = if type(B) == "number" then B else 0
		local Transparency = Vector.Transparency
		local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding({
			r = R1,
			g = G1,
			b = B1,
			Transparency = if type(Transparency) == "number" then Transparency else 0
		}, UseResult)
		
		return UseAnimatedBindingResult:map(function(p1) --[[ Line: 85 ]]
			return {
				Color3 = Color3.new(p1.r, p1.g, p1.b),
				Transparency = p1.Transparency
			}
		end), function(p1, p2) --[[ Line: 92 ]]
			-- upvalues: UseRefResult (copy), Preset (upval), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval)
			if typeof(p1) == "table" and p1.Color3 and p1.Transparency ~= nil then
				UseRefResult.current = p2 and p2.onComplete or nil
				local Config = if p2 then {
					duration = p2.duration or Preset.duration,
					easingStyle = p2.easingStyle
				} else nil
				local R = p1.Color3.R
				local R1 = if type(R) == "number" then R else 0
				local G = p1.Color3.G
				local G1 = if type(G) == "number" then G else 0
				local B = p1.Color3.B
				local B1 = if type(B) == "number" then B else 0
				local Transparency = p1.Transparency
				UseAnimatedBindingResult2({
					r = ReactOtterModule.ease(R1, Config),
					g = ReactOtterModule.ease(G1, Config),
					b = ReactOtterModule.ease(B1, Config),
					Transparency = ReactOtterModule.ease(if type(Transparency) == "number" then Transparency else 0, Config)
				})
				
				return
			else
				warn("Expected target to be a table with Color3 and Transparency fields")
			end
		end
	elseif typeof(Vector) == "UDim" then
		local Scale = Vector.Scale
		local Scale1 = if type(Scale) == "number" then Scale else 0
		local Offset = Vector.Offset
		local UseAnimatedBindingResult1, UseAnimatedBindingResult2_1 = ReactOtterModule.useAnimatedBinding({
			scale = Scale1,
			offset = if type(Offset) == "number" then Offset else 0
		}, UseResult)
		
		return UseAnimatedBindingResult1:map(function(p1): UDim --[[ Line: 125 ]]
			return UDim.new(p1.scale, p1.offset)
		end), function(p1, p2) --[[ Line: 129 ]]
			-- upvalues: UseRefResult (copy), Preset (upval), UseAnimatedBindingResult2_1 (copy), ReactOtterModule (upval)
			if not p1 then return end
			if typeof(p1) == "UDim" then
				UseRefResult.current = p2 and p2.onComplete or nil
				local Config = if p2 then {
					duration = p2.duration or Preset.duration,
					easingStyle = p2.easingStyle
				} else nil
				local Scale = p1.Scale
				local Scale1 = if type(Scale) == "number" then Scale else 0
				local Offset = p1.Offset
				UseAnimatedBindingResult2_1({
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
		local UseAnimatedBindingResult3, UseAnimatedBindingResult2_2 = ReactOtterModule.useAnimatedBinding({
			xScale = Scale2,
			xOffset = Offset1,
			yScale = Scale31,
			yOffset = if type(Offset2) == "number" then Offset2 else 0
		}, UseResult)
		
		return UseAnimatedBindingResult3:map(function(p1): UDim2 --[[ Line: 166 ]]
			return UDim2.new(p1.xScale, p1.xOffset, p1.yScale, p1.yOffset)
		end), function(Vector, p1) --[[ Line: 170 ]]
			-- upvalues: UseRefResult (copy), Preset (upval), UseAnimatedBindingResult2_2 (copy), ReactOtterModule (upval)
			if not Vector then return end
			if typeof(Vector) == "UDim2" then
				UseRefResult.current = p1 and p1.onComplete or nil
				local Config = if p1 then {
					duration = p1.duration or Preset.duration,
					easingStyle = p1.easingStyle
				} else nil
				local Scale = Vector.X.Scale
				local Scale1 = if type(Scale) == "number" then Scale else 0
				local Offset = Vector.X.Offset
				local Offset1 = if type(Offset) == "number" then Offset else 0
				local Scale2 = Vector.Y.Scale
				local Scale21 = if type(Scale2) == "number" then Scale2 else 0
				local Offset2 = Vector.Y.Offset
				UseAnimatedBindingResult2_2({
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
		local UseAnimatedBindingResult5, UseAnimatedBindingResult2_4 = ReactOtterModule.useAnimatedBinding({ x = X1, y = if type(Y) == "number" then Y else 0 }, UseResult)
		
		return UseAnimatedBindingResult5:map(function(Vector): Vector2 --[[ Line: 205 ]]
			return Vector2.new(Vector.x, Vector.y)
		end), function(Vector, p1) --[[ Line: 209 ]]
			-- upvalues: UseRefResult (copy), Preset (upval), UseAnimatedBindingResult2_4 (copy), ReactOtterModule (upval)
			if not Vector then return end
			if typeof(Vector) == "Vector2" then
				UseRefResult.current = p1 and p1.onComplete or nil
				local Config = if p1 then {
					duration = p1.duration or Preset.duration,
					easingStyle = p1.easingStyle
				} else nil
				local X = Vector.X
				local X1 = if type(X) == "number" then X else 0
				local Y = Vector.Y
				UseAnimatedBindingResult2_4({
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
		local R2 = if type(R) == "number" then R else 0
		local G = Vector.G
		local G2 = if type(G) == "number" then G else 0
		local B = Vector.B
		local UseAnimatedBindingResult6, UseAnimatedBindingResult2_5 = ReactOtterModule.useAnimatedBinding({ r = R2, g = G2, b = if type(B) == "number" then B else 0 }, UseResult)
		
		return UseAnimatedBindingResult6:map(function(p1): Color3 --[[ Line: 244 ]]
			return Color3.new(p1.r, p1.g, p1.b)
		end), function(p1, p2) --[[ Line: 248 ]]
			-- upvalues: UseRefResult (copy), Preset (upval), UseAnimatedBindingResult2_5 (copy), ReactOtterModule (upval)
			if not p1 then return end
			if typeof(p1) == "Color3" then
				UseRefResult.current = p2 and p2.onComplete or nil
				local Config = if p2 then {
					duration = p2.duration or Preset.duration,
					easingStyle = p2.easingStyle
				} else nil
				local R = p1.R
				local R1 = if type(R) == "number" then R else 0
				local G = p1.G
				local G1 = if type(G) == "number" then G else 0
				local B = p1.B
				UseAnimatedBindingResult2_5({
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
		local UseAnimatedBindingResult4, UseAnimatedBindingResult2_3 = ReactOtterModule.useAnimatedBinding(if type(Vector) == "number" then Vector else 0, UseResult)
		
		return UseAnimatedBindingResult4:map(function(p1) --[[ Line: 280 ]]
			return p1
		end), function(p1, p2) --[[ Line: 284 ]]
			-- upvalues: UseRefResult (copy), Preset (upval), UseAnimatedBindingResult2_3 (copy), ReactOtterModule (upval)
			if typeof(p1) == "number" then
				UseRefResult.current = p2 and p2.onComplete or nil
				UseAnimatedBindingResult2_3(ReactOtterModule.ease(p1, if p2 then {
					duration = p2.duration or Preset.duration,
					easingStyle = p2.easingStyle
				} else nil))
				
				return
			end
		end
	else
		warn("Unsupported type for animated value:", (typeof(Vector)))
		
		return ReactModule.createBinding(Vector), function() --[[ Line: 304 ]] end
	end
end