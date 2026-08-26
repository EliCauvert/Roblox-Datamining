local parent = script.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.Parent.React)
local useAnimatedValueModule = require(parent.useAnimatedValue)
local _ = require(parent_1.Types)
local timingConfigsModule = require(parent.TimingConfigs)
local transitionPresetModule = require(parent_1.Enums.TransitionPreset)

return function(p1)
	-- upvalues: reactModule (ref), useAnimatedValueModule (ref), transitionPresetModule (ref), timingConfigsModule (ref)
	local t = {}
	local t_1 = {}
	local var1 = reactModule.useRef({})
	
	for i, v in p1 do
		if type(v) ~= "table" or i ~= "transition" then
			local var2, var3 = useAnimatedValueModule(v)
			t[i] = var2
			t_1[i] = var3
		end
	end
	return t, function(p2, p3)
		-- upvalues: t_1 (ref), var1 (ref), transitionPresetModule (copy), timingConfigsModule (copy)
		if not p2 then return end
		local var4 = 0
		local t = {}
		
		for i in t_1 do
			if i ~= "transition" and p2[i] ~= nil then
				var4 += 1
			end
		end
		local var5 = 0
		
		local function _(p4)
			-- upvalues: t (ref), p2 (ref), var5 (write), p3 (ref), var4 (write)
			t[p4] = p2[p4]
			var5 += 1
			
			if p3 and p3.onAnimationComplete then
				p3.onAnimationComplete(p4)
			end
			if var5 == var4 and p3 and p3.onAnimationComplete then
				p3.onAnimationComplete(true)
			end
		end
		
		for i_1, v in t_1 do
			if i_1 ~= "transition" and p2[i_1] ~= nil then
				if var1.current[i_1] then
					local var6 = var1.current[i_1]
					
					if var6 then
						task.cancel(var6)
					end
					var1.current[i_1] = nil
				end
				local transition = p2.transition or {
					[transitionPresetModule.Default] = timingConfigsModule.getDefaultTransition()
				}
				local cloned = table.clone(transition[i_1] or (transition[transitionPresetModule.Default] or timingConfigsModule.getDefaultTransition()))
				
				function cloned.onComplete()
					-- upvalues: i_1 (ref), t (ref), p2 (ref), var5 (write), p3 (ref), var4 (write)
					t[i_1] = p2[i_1]
					var5 += 1
					
					if p3 and p3.onAnimationComplete then
						p3.onAnimationComplete(i_1)
					end
					if var5 == var4 and p3 and p3.onAnimationComplete then
						p3.onAnimationComplete(true)
					end
				end
				
				local delay = cloned.delay or 0
				
				if delay > 0 then
					var1.current[i_1] = task.delay(delay, function()
						-- upvalues: var1 (copy), i_1 (ref), v (ref), p2 (ref), cloned (ref)
						var1.current[i_1] = nil
						v(p2[i_1], cloned)
					end)
				else
					v(p2[i_1], cloned)
				end
			end
		end
	end
end