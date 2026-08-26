local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local reactModule = require(parent_2.React)
local reactOtterModule = require(parent_2.ReactOtter)
local default = require(parent.TimingConfigs).presets[require(parent_1.Enums.TransitionPreset).Default]
local _ = require(parent_1.Types)

local function _(p1, p2)
	return if type(p1) == "number" then p1 else p2 or 0
end

return function(p1)
	-- upvalues: reactModule (ref), reactOtterModule (ref), default (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useCallback(function(...)
		-- upvalues: var1 (ref)
		if var1.current ~= nil then
			if type(var1.current) == "function" then
				var1.current(...)
				
				return
			elseif var1.current._isMockFunction then
				var1.current(...)
			end
		end
	end, { var1 })
	
	if typeof(p1) == "table" and p1.Color3 and p1.Transparency then
		local useAnimatedBinding = reactOtterModule.useAnimatedBinding
		local t = {}
		local r = p1.Color3.R
		t.r = if type(r) == "number" then r else 0
		local g = p1.Color3.G
		t.g = if type(g) == "number" then g else 0
		local b = p1.Color3.B
		t.b = if type(b) == "number" then b else 0
		local transparency = p1.Transparency
		t.Transparency = if type(transparency) == "number" then transparency else 0
		useAnimatedBinding, t = useAnimatedBinding(t, var2)
		
		return useAnimatedBinding:map(function(p2)
			return {
				Color3 = Color3.new(p2.r, p2.g, p2.b),
				Transparency = p2.Transparency
			}
		end), function(p2, p3)
			-- upvalues: var1 (ref), default (copy), t (ref), reactOtterModule (copy)
			if typeof(p2) == "table" and p2.Color3 and p2.Transparency ~= nil then
				var1.current = if p3 then p3.onComplete else nil
				local var3 = if p3 then {
					duration = p3.duration or default.duration,
					easingStyle = p3.easingStyle
				} else nil
				local t_1 = {}
				local r = p2.Color3.R
				t_1.r = reactOtterModule.ease(if type(r) == "number" then r else 0, var3)
				local g = p2.Color3.G
				t_1.g = reactOtterModule.ease(if type(g) == "number" then g else 0, var3)
				local b = p2.Color3.B
				t_1.b = reactOtterModule.ease(if type(b) == "number" then b else 0, var3)
				local transparency = p2.Transparency
				t_1.Transparency = reactOtterModule.ease(if type(transparency) == "number" then transparency else 0, var3)
				t(t_1)
				
				return
			end
			warn("Expected target to be a table with Color3 and Transparency fields")
		end
	elseif typeof(p1) == "UDim" then
		local useAnimatedBinding = reactOtterModule.useAnimatedBinding
		local t = {}
		local scale = p1.Scale
		t.scale = if type(scale) == "number" then scale else 0
		local offset = p1.Offset
		t.offset = if type(offset) == "number" then offset else 0
		useAnimatedBinding, t = useAnimatedBinding(t, var2)
		
		return useAnimatedBinding:map(function(p2)
			return UDim.new(p2.scale, p2.offset)
		end), function(p2, p3)
			-- upvalues: var1 (ref), default (copy), t (ref), reactOtterModule (copy)
			if not p2 then return end
			if typeof(p2) == "UDim" then
				var1.current = if p3 then p3.onComplete else nil
				local var3 = if p3 then {
					duration = p3.duration or default.duration,
					easingStyle = p3.easingStyle
				} else nil
				local t_1 = {}
				local scale = p2.Scale
				t_1.scale = reactOtterModule.ease(if type(scale) == "number" then scale else 0, var3)
				local offset = p2.Offset
				t_1.offset = reactOtterModule.ease(if type(offset) == "number" then offset else 0, var3)
				t(t_1)
				
				return
			end
			warn("Expected UDim target but got", typeof(p2))
		end
	elseif typeof(p1) == "UDim2" then
		local useAnimatedBinding = reactOtterModule.useAnimatedBinding
		local t = {}
		local scale = p1.X.Scale
		t.xScale = if type(scale) == "number" then scale else 0
		local offset = p1.X.Offset
		t.xOffset = if type(offset) == "number" then offset else 0
		local scale_1 = p1.Y.Scale
		t.yScale = if type(scale_1) == "number" then scale_1 else 0
		local offset_1 = p1.Y.Offset
		t.yOffset = if type(offset_1) == "number" then offset_1 else 0
		useAnimatedBinding, t = useAnimatedBinding(t, var2)
		
		return useAnimatedBinding:map(function(p2)
			return UDim2.new(p2.xScale, p2.xOffset, p2.yScale, p2.yOffset)
		end), function(p2, p3)
			-- upvalues: var1 (ref), default (copy), t (ref), reactOtterModule (copy)
			if not p2 then return end
			if typeof(p2) == "UDim2" then
				var1.current = if p3 then p3.onComplete else nil
				local var3 = if p3 then {
					duration = p3.duration or default.duration,
					easingStyle = p3.easingStyle
				} else nil
				local t_1 = {}
				local scale = p2.X.Scale
				t_1.xScale = reactOtterModule.ease(if type(scale) == "number" then scale else 0, var3)
				local offset = p2.X.Offset
				t_1.xOffset = reactOtterModule.ease(if type(offset) == "number" then offset else 0, var3)
				local scale_1 = p2.Y.Scale
				t_1.yScale = reactOtterModule.ease(if type(scale_1) == "number" then scale_1 else 0, var3)
				local offset_1 = p2.Y.Offset
				t_1.yOffset = reactOtterModule.ease(if type(offset_1) == "number" then offset_1 else 0, var3)
				t(t_1)
				
				return
			end
			warn("Expected UDim2 target but got", typeof(p2))
		end
	elseif typeof(p1) == "Vector2" then
		local useAnimatedBinding = reactOtterModule.useAnimatedBinding
		local t = {}
		local x = p1.X
		t.x = if type(x) == "number" then x else 0
		local y = p1.Y
		t.y = if type(y) == "number" then y else 0
		useAnimatedBinding, t = useAnimatedBinding(t, var2)
		
		return useAnimatedBinding:map(function(p2)
			return Vector2.new(p2.x, p2.y)
		end), function(p2, p3)
			-- upvalues: var1 (ref), default (copy), t (ref), reactOtterModule (copy)
			if not p2 then return end
			if typeof(p2) == "Vector2" then
				var1.current = if p3 then p3.onComplete else nil
				local var3 = if p3 then {
					duration = p3.duration or default.duration,
					easingStyle = p3.easingStyle
				} else nil
				local t_1 = {}
				local x = p2.X
				t_1.x = reactOtterModule.ease(if type(x) == "number" then x else 0, var3)
				local y = p2.Y
				t_1.y = reactOtterModule.ease(if type(y) == "number" then y else 0, var3)
				t(t_1)
				
				return
			end
			warn("Expected Vector2 target but got", typeof(p2))
		end
	elseif typeof(p1) == "Color3" then
		local useAnimatedBinding = reactOtterModule.useAnimatedBinding
		local t = {}
		local r = p1.R
		t.r = if type(r) == "number" then r else 0
		local g = p1.G
		t.g = if type(g) == "number" then g else 0
		local b = p1.B
		t.b = if type(b) == "number" then b else 0
		useAnimatedBinding, t = useAnimatedBinding(t, var2)
		
		return useAnimatedBinding:map(function(p2)
			return Color3.new(p2.r, p2.g, p2.b)
		end), function(p2, p3)
			-- upvalues: var1 (ref), default (copy), t (ref), reactOtterModule (copy)
			if not p2 then return end
			if typeof(p2) == "Color3" then
				var1.current = if p3 then p3.onComplete else nil
				local var3 = if p3 then {
					duration = p3.duration or default.duration,
					easingStyle = p3.easingStyle
				} else nil
				local t_1 = {}
				local r = p2.R
				t_1.r = reactOtterModule.ease(if type(r) == "number" then r else 0, var3)
				local g = p2.G
				t_1.g = reactOtterModule.ease(if type(g) == "number" then g else 0, var3)
				local b = p2.B
				t_1.b = reactOtterModule.ease(if type(b) == "number" then b else 0, var3)
				t(t_1)
				
				return
			end
			warn("Expected Color3 target but got", typeof(p2))
		end
	elseif typeof(p1) == "number" then
		local var3, var4 = reactOtterModule.useAnimatedBinding(if type(p1) == "number" then p1 else 0, var2)
		
		return var3:map(function(p2)
			return p2
		end), function(p2, p3)
			-- upvalues: var1 (ref), default (copy), var4 (ref), reactOtterModule (copy)
			if typeof(p2) == "number" then
				var1.current = if p3 then p3.onComplete else nil
				var4(reactOtterModule.ease(p2, if p3 then {
					duration = p3.duration or default.duration,
					easingStyle = p3.easingStyle
				} else nil))
				
				return
			end
		end
	end
	warn("Unsupported type for animated value:", typeof(p1))
	
	return reactModule.createBinding(p1), function() end
end