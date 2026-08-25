local parent = script.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.Parent.React)
local useAnimatedValueModule = require(parent.useAnimatedValue)
local _ = require(parent_1.Types)
local timingConfigsModule = require(parent.TimingConfigs)
local transitionPresetModule = require(parent_1.Enums.TransitionPreset)

return function(p0)
	-- upvalues: reactModule (ref), useAnimatedValueModule (ref), transitionPresetModule (ref), timingConfigsModule (ref)
	local t = {}
	local t_1 = {}
	local var6 = reactModule.useRef({})
	
	for i, v in p0 do
		if type(v) ~= "table" or i ~= "transition" then
			local var7, var8 = useAnimatedValueModule(v)
			t[i] = var7
			t_1[i] = var8
		end
	end
	return t, function(p1, p2)
		-- upvalues: t_1 (ref), var6 (ref), transitionPresetModule (copy), timingConfigsModule (copy)
		if not p1 then return end
		local var9 = 0
		local t = {}
		
		for i in t_1 do
			if i ~= "transition" and p1[i] ~= nil then
				var9 += 1
			end
		end
		local var11 = 0
		
		local function _(p3)
			-- upvalues: t (ref), p1 (ref), var11 (write), p2 (ref), var9 (write)
			t[p3] = p1[p3]
			var11 += 1
			
			if p2 and p2.onAnimationComplete then
				p2.onAnimationComplete(p3)
			end
			if var11 == var9 and p2 and p2.onAnimationComplete then
				p2.onAnimationComplete(true)
			end
		end
		
		for i_1, v in t_1 do
			if i_1 ~= "transition" and p1[i_1] ~= nil then
				if var6.current[i_1] then
					local var12 = var6.current[i_1]
					
					if var12 then
						task.cancel(var12)
					end
					var6.current[i_1] = nil
				end
				local transition = p1.transition or {
					[transitionPresetModule.Default] = timingConfigsModule.getDefaultTransition()
				}
				local cloned = table.clone(transition[i_1] or (transition[transitionPresetModule.Default] or timingConfigsModule.getDefaultTransition()))
				
				function cloned.onComplete()
					-- upvalues: i_1 (ref), t (ref), p1 (ref), var11 (write), p2 (ref), var9 (write)
					t[i_1] = p1[i_1]
					var11 += 1
					
					if p2 and p2.onAnimationComplete then
						p2.onAnimationComplete(i_1)
					end
					if var11 == var9 and p2 and p2.onAnimationComplete then
						p2.onAnimationComplete(true)
					end
				end
				
				local delay = cloned.delay or 0
				
				if delay > 0 then
					var6.current[i_1] = task.delay(delay, function()
						-- upvalues: var6 (copy), i_1 (ref), v (ref), p1 (ref), cloned (ref)
						var6.current[i_1] = nil
						v(p1[i_1], cloned)
					end)
				else
					v(p1[i_1], cloned)
				end
			end
		end
	end
end