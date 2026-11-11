local Parent = script.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.Parent.React)
local UseAnimatedValueModule = require(Parent.useAnimatedValue)
local _ = require(Parent1.Types)
local TimingConfigsModule = require(Parent.TimingConfigs)
local TransitionPresetModule = require(Parent1.Enums.TransitionPreset)

return function(List)
	-- upvalues: ReactModule (copy), UseAnimatedValueModule (copy), TransitionPresetModule (copy), TimingConfigsModule (copy)
	local t = {}
	local t1 = {}
	local UseRefResult = ReactModule.useRef({})
	
	for i, value in List do
		if type(value) ~= "table" or i ~= "transition" then
			t[i], t1[i] = UseAnimatedValueModule(value)
		end
	end
	return t, function(p1, p2)
		-- upvalues: t1 (copy), UseRefResult (copy), TransitionPresetModule (upval), TimingConfigsModule (upval)
		if not p1 then return end
		local Count = 0
		local t = {}
		
		for i in t1 do
			if i ~= "transition" and p1[i] ~= nil then
				Count += 1
			end
		end
		local Count1 = 0
		
		local function _(Key)
			-- upvalues: t (copy), p1 (copy), Count1 (ref), p2 (copy), Count (ref)
			t[Key] = p1[Key]
			Count1 += 1
			
			if p2 and p2.onAnimationComplete then
				p2.onAnimationComplete(Key)
			end
			if Count1 == Count and p2 and p2.onAnimationComplete then
				p2.onAnimationComplete(true)
			end
		end
		
		for i1, value in t1 do
			if i1 ~= "transition" and p1[i1] ~= nil then
				if UseRefResult.current[i1] then
					local CurrentEntry = UseRefResult.current[i1]
					
					if CurrentEntry then
						task.cancel(CurrentEntry)
					end
					UseRefResult.current[i1] = nil
				end
				local Transition = p1.transition or {
					[TransitionPresetModule.Default] = TimingConfigsModule.getDefaultTransition()
				}
				local Copy = table.clone(Transition[i1] or (Transition[TransitionPresetModule.Default] or TimingConfigsModule.getDefaultTransition()))
				
				function Copy.onComplete()
					-- upvalues: i1 (copy), t (copy), p1 (copy), Count1 (ref), p2 (copy), Count (ref)
					t[i1] = p1[i1]
					Count1 += 1
					
					if p2 and p2.onAnimationComplete then
						p2.onAnimationComplete(i1)
					end
					if Count1 == Count and p2 and p2.onAnimationComplete then
						p2.onAnimationComplete(true)
					end
				end
				
				local Delay = Copy.delay or 0
				
				if Delay > 0 then
					UseRefResult.current[i1] = task.delay(Delay, function()
						-- upvalues: UseRefResult (upval), i1 (copy), value (copy), p1 (copy), Copy (copy)
						UseRefResult.current[i1] = nil
						value(p1[i1], Copy)
					end)
				else
					value(p1[i1], Copy)
				end
			end
		end
	end
end