local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local reactModule = require(parent_2.React)
local reactOtterModule = require(parent_2.ReactOtter)
local default = require(parent.TimingConfigs).presets[require(parent_1.Enums.TransitionPreset).Default]
local _ = require(parent_1.Types)

local function _(p0, p1)
	return if type(p0) == "number" then p0 else p1 or 0
end

return function(p2)
	-- upvalues: reactModule (ref), reactOtterModule (ref), default (ref)
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useCallback(function(...)
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
	
	if typeof(p2) == "table" and p2.Color3 and p2.Transparency then
		local useAnimatedBinding = reactOtterModule.useAnimatedBinding
		local t = {}
		local r = p2.Color3.R
		t.r = if type(r) == "number" then r else 0
		local g = p2.Color3.G
		t.g = if type(g) == "number" then g else 0
		local b = p2.Color3.B
		t.b = if type(b) == "number" then b else 0
		local transparency = p2.Transparency
		t.Transparency = if type(transparency) == "number" then transparency else 0
		useAnimatedBinding, t = useAnimatedBinding(t, var3)
		
		return useAnimatedBinding:map(function(p3)
			return {
				Color3 = Color3.new(p3.r, p3.g, p3.b),
				Transparency = p3.Transparency
			}
		end), function(p4, p5)
			-- upvalues: var2 (ref), default (copy), t (ref), reactOtterModule (copy)
			if typeof(p4) == "table" and p4.Color3 and p4.Transparency ~= nil then
				var2.current = if p5 then p5.onComplete else nil
				local var11 = if p5 then {
					duration = p5.duration or default.duration,
					easingStyle = p5.easingStyle
				} else nil
				local t_1 = {}
				local r = p4.Color3.R
				t_1.r = reactOtterModule.ease(if type(r) == "number" then r else 0, var11)
				local g = p4.Color3.G
				t_1.g = reactOtterModule.ease(if type(g) == "number" then g else 0, var11)
				local b = p4.Color3.B
				t_1.b = reactOtterModule.ease(if type(b) == "number" then b else 0, var11)
				local transparency = p4.Transparency
				t_1.Transparency = reactOtterModule.ease(if type(transparency) == "number" then transparency else 0, var11)
				t(t_1)
				
				return
			end
			warn("Expected target to be a table with Color3 and Transparency fields")
		end
	elseif typeof(p2) == "UDim" then
		local useAnimatedBinding = reactOtterModule.useAnimatedBinding
		local t = {}
		local scale = p2.Scale
		t.scale = if type(scale) == "number" then scale else 0
		local offset = p2.Offset
		t.offset = if type(offset) == "number" then offset else 0
		useAnimatedBinding, t = useAnimatedBinding(t, var3)
		
		return useAnimatedBinding:map(function(p6)
			return UDim.new(p6.scale, p6.offset)
		end), function(p7, p8)
			-- upvalues: var2 (ref), default (copy), t (ref), reactOtterModule (copy)
			if not p7 then return end
			if typeof(p7) == "UDim" then
				var2.current = if p8 then p8.onComplete else nil
				local var13 = if p8 then {
					duration = p8.duration or default.duration,
					easingStyle = p8.easingStyle
				} else nil
				local t_1 = {}
				local scale = p7.Scale
				t_1.scale = reactOtterModule.ease(if type(scale) == "number" then scale else 0, var13)
				local offset = p7.Offset
				t_1.offset = reactOtterModule.ease(if type(offset) == "number" then offset else 0, var13)
				t(t_1)
				
				return
			end
			warn("Expected UDim target but got", typeof(p7))
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
		
		return useAnimatedBinding:map(function(p9)
			return UDim2.new(p9.xScale, p9.xOffset, p9.yScale, p9.yOffset)
		end), function(p10, p11)
			-- upvalues: var2 (ref), default (copy), t (ref), reactOtterModule (copy)
			if not p10 then return end
			if typeof(p10) == "UDim2" then
				var2.current = if p11 then p11.onComplete else nil
				local var15 = if p11 then {
					duration = p11.duration or default.duration,
					easingStyle = p11.easingStyle
				} else nil
				local t_1 = {}
				local scale = p10.X.Scale
				t_1.xScale = reactOtterModule.ease(if type(scale) == "number" then scale else 0, var15)
				local offset = p10.X.Offset
				t_1.xOffset = reactOtterModule.ease(if type(offset) == "number" then offset else 0, var15)
				local scale_1 = p10.Y.Scale
				t_1.yScale = reactOtterModule.ease(if type(scale_1) == "number" then scale_1 else 0, var15)
				local offset_1 = p10.Y.Offset
				t_1.yOffset = reactOtterModule.ease(if type(offset_1) == "number" then offset_1 else 0, var15)
				t(t_1)
				
				return
			end
			warn("Expected UDim2 target but got", typeof(p10))
		end
	elseif typeof(p2) == "Vector2" then
		local useAnimatedBinding = reactOtterModule.useAnimatedBinding
		local t = {}
		local x = p2.X
		t.x = if type(x) == "number" then x else 0
		local y = p2.Y
		t.y = if type(y) == "number" then y else 0
		useAnimatedBinding, t = useAnimatedBinding(t, var3)
		
		return useAnimatedBinding:map(function(p12)
			return Vector2.new(p12.x, p12.y)
		end), function(p13, p14)
			-- upvalues: var2 (ref), default (copy), t (ref), reactOtterModule (copy)
			if not p13 then return end
			if typeof(p13) == "Vector2" then
				var2.current = if p14 then p14.onComplete else nil
				local var17 = if p14 then {
					duration = p14.duration or default.duration,
					easingStyle = p14.easingStyle
				} else nil
				local t_1 = {}
				local x = p13.X
				t_1.x = reactOtterModule.ease(if type(x) == "number" then x else 0, var17)
				local y = p13.Y
				t_1.y = reactOtterModule.ease(if type(y) == "number" then y else 0, var17)
				t(t_1)
				
				return
			end
			warn("Expected Vector2 target but got", typeof(p13))
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
		
		return useAnimatedBinding:map(function(p15)
			return Color3.new(p15.r, p15.g, p15.b)
		end), function(p16, p17)
			-- upvalues: var2 (ref), default (copy), t (ref), reactOtterModule (copy)
			if not p16 then return end
			if typeof(p16) == "Color3" then
				var2.current = if p17 then p17.onComplete else nil
				local var19 = if p17 then {
					duration = p17.duration or default.duration,
					easingStyle = p17.easingStyle
				} else nil
				local t_1 = {}
				local r = p16.R
				t_1.r = reactOtterModule.ease(if type(r) == "number" then r else 0, var19)
				local g = p16.G
				t_1.g = reactOtterModule.ease(if type(g) == "number" then g else 0, var19)
				local b = p16.B
				t_1.b = reactOtterModule.ease(if type(b) == "number" then b else 0, var19)
				t(t_1)
				
				return
			end
			warn("Expected Color3 target but got", typeof(p16))
		end
	elseif typeof(p2) == "number" then
		local var9, var10 = reactOtterModule.useAnimatedBinding(if type(p2) == "number" then p2 else 0, var3)
		
		return var9:map(function(p18)
			return p18
		end), function(p19, p20)
			-- upvalues: var2 (ref), default (copy), var10 (ref), reactOtterModule (copy)
			if typeof(p19) == "number" then
				var2.current = if p20 then p20.onComplete else nil
				var10(reactOtterModule.ease(p19, if p20 then {
					duration = p20.duration or default.duration,
					easingStyle = p20.easingStyle
				} else nil))
				
				return
			end
		end
	end
	warn("Unsupported type for animated value:", typeof(p2))
	
	return reactModule.createBinding(p2), function() end
end