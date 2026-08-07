local parent = script.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local reactOtterModule = require(parent_1.ReactOtter)
local _ = require(parent.Types)

local function _(p0, p1) --[[ line: 40 | named "validateNumber" ]]
	return if type(p0) == "number" then p0 else p1 or 0
end

return function(p2) --[[ line: 49 | named "useAnimatedValue" ]]
	-- upvalues: reactModule (ref), reactOtterModule (ref)
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useCallback(function(...) --[[ line: 52 ]]
		-- upvalues: var2 (ref)
		if var2.current ~= nil then
			if type(var2.current) == "function" then
				var2.current(...)
				
				return
			elseif var2.current._isMockFunction then
				var2.current(...)
			end
		end
	end, { var2 })
	
	if typeof(p2) == "UDim" then
		local useAnimatedBinding = reactOtterModule.useAnimatedBinding
		local t = {}
		local scale = p2.Scale
		t.scale = if type(scale) == "number" then scale else 0
		local offset = p2.Offset
		t.offset = if type(offset) == "number" then offset else 0
		useAnimatedBinding, t = useAnimatedBinding(t, var3)
		
		return useAnimatedBinding:map(function(p3) --[[ line: 69 ]]
			return UDim.new(p3.scale, p3.offset)
		end), function(p4, p5) --[[ line: 73 ]]
			-- upvalues: var2 (ref), t (ref), reactOtterModule (copy)
			if not p4 then return end
			if typeof(p4) == "UDim" then
				var2.current = if p5 then p5.onComplete else nil
				local var10 = if p5 then {
					duration = p5.duration or 0.3,
					easingStyle = p5.easingStyle
				} else nil
				local t_1 = {}
				local scale = p4.Scale
				t_1.scale = reactOtterModule.ease(if type(scale) == "number" then scale else 0, var10)
				local offset = p4.Offset
				t_1.offset = reactOtterModule.ease(if type(offset) == "number" then offset else 0, var10)
				t(t_1)
				
				return
			end
			warn("Expected UDim target but got", typeof(p4))
		end
	elseif typeof(p2) == "UDim2" then
		local useAnimatedBinding = reactOtterModule.useAnimatedBinding
		local t = {}
		local scale = p2.X.Scale
		t.xScale = if type(scale) == "number" then scale else 0
		local offset = p2.X.Offset
		t.xOffset = if type(offset) == "number" then offset else 0
		local scale_1 = p2.Y.Scale
		t.yScale = if type(scale_1) == "number" then scale_1 else 0
		local offset_1 = p2.Y.Offset
		t.yOffset = if type(offset_1) == "number" then offset_1 else 0
		useAnimatedBinding, t = useAnimatedBinding(t, var3)
		
		return useAnimatedBinding:map(function(p6) --[[ line: 110 ]]
			return UDim2.new(p6.xScale, p6.xOffset, p6.yScale, p6.yOffset)
		end), function(p7, p8) --[[ line: 114 ]]
			-- upvalues: var2 (ref), t (ref), reactOtterModule (copy)
			if not p7 then return end
			if typeof(p7) == "UDim2" then
				var2.current = if p8 then p8.onComplete else nil
				local var12 = if p8 then {
					duration = p8.duration or 0.3,
					easingStyle = p8.easingStyle
				} else nil
				local t_1 = {}
				local scale = p7.X.Scale
				t_1.xScale = reactOtterModule.ease(if type(scale) == "number" then scale else 0, var12)
				local offset = p7.X.Offset
				t_1.xOffset = reactOtterModule.ease(if type(offset) == "number" then offset else 0, var12)
				local scale_1 = p7.Y.Scale
				t_1.yScale = reactOtterModule.ease(if type(scale_1) == "number" then scale_1 else 0, var12)
				local offset_1 = p7.Y.Offset
				t_1.yOffset = reactOtterModule.ease(if type(offset_1) == "number" then offset_1 else 0, var12)
				t(t_1)
				
				return
			end
			warn("Expected UDim2 target but got", typeof(p7))
		end
	elseif typeof(p2) == "Vector2" then
		local useAnimatedBinding = reactOtterModule.useAnimatedBinding
		local t = {}
		local x = p2.X
		t.x = if type(x) == "number" then x else 0
		local y = p2.Y
		t.y = if type(y) == "number" then y else 0
		useAnimatedBinding, t = useAnimatedBinding(t, var3)
		
		return useAnimatedBinding:map(function(p9) --[[ line: 149 ]]
			return Vector2.new(p9.x, p9.y)
		end), function(p10, p11) --[[ line: 153 ]]
			-- upvalues: var2 (ref), t (ref), reactOtterModule (copy)
			if not p10 then return end
			if typeof(p10) == "Vector2" then
				var2.current = if p11 then p11.onComplete else nil
				local var14 = if p11 then {
					duration = p11.duration or 0.3,
					easingStyle = p11.easingStyle
				} else nil
				local t_1 = {}
				local x = p10.X
				t_1.x = reactOtterModule.ease(if type(x) == "number" then x else 0, var14)
				local y = p10.Y
				t_1.y = reactOtterModule.ease(if type(y) == "number" then y else 0, var14)
				t(t_1)
				
				return
			end
			warn("Expected Vector2 target but got", typeof(p10))
		end
	elseif typeof(p2) == "Color3" then
		local useAnimatedBinding = reactOtterModule.useAnimatedBinding
		local t = {}
		local r = p2.R
		t.r = if type(r) == "number" then r else 0
		local g = p2.G
		t.g = if type(g) == "number" then g else 0
		local b = p2.B
		t.b = if type(b) == "number" then b else 0
		useAnimatedBinding, t = useAnimatedBinding(t, var3)
		
		return useAnimatedBinding:map(function(p12) --[[ line: 188 ]]
			return Color3.new(p12.r, p12.g, p12.b)
		end), function(p13, p14) --[[ line: 192 ]]
			-- upvalues: var2 (ref), t (ref), reactOtterModule (copy)
			if not p13 then return end
			if typeof(p13) == "Color3" then
				var2.current = if p14 then p14.onComplete else nil
				local var16 = if p14 then {
					duration = p14.duration or 0.3,
					easingStyle = p14.easingStyle
				} else nil
				local t_1 = {}
				local r = p13.R
				t_1.r = reactOtterModule.ease(if type(r) == "number" then r else 0, var16)
				local g = p13.G
				t_1.g = reactOtterModule.ease(if type(g) == "number" then g else 0, var16)
				local b = p13.B
				t_1.b = reactOtterModule.ease(if type(b) == "number" then b else 0, var16)
				t(t_1)
				
				return
			end
			warn("Expected Color3 target but got", typeof(p13))
		end
	elseif typeof(p2) == "number" then
		local var8, var9 = reactOtterModule.useAnimatedBinding(if type(p2) == "number" then p2 else 0, var3)
		
		return var8:map(function(p15) --[[ line: 224 ]]
			return p15
		end), function(p16, p17) --[[ line: 228 ]]
			-- upvalues: var2 (ref), var9 (ref), reactOtterModule (copy)
			if typeof(p16) == "number" then
				var2.current = if p17 then p17.onComplete else nil
				var9(reactOtterModule.ease(p16, if p17 then {
					duration = p17.duration or 0.3,
					easingStyle = p17.easingStyle
				} else nil))
				
				return
			end
		end
	end
	warn("Unsupported type for animated value:", typeof(p2))
	
	return reactModule.createBinding(p2), function() --[[ line: 248 ]] end
end