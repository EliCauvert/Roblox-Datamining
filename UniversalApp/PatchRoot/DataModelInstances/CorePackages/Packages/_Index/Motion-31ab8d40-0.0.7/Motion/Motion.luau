local _ = require(script.Parent.Types)
local presets = require(script.Parent.Utility.TimingConfigs).presets
local default = presets[require(script.Parent.Enums.TransitionPreset).Default]

local function _(p1)
	-- upvalues: default (ref)
	return p1.transition or { default = default }
end

return {
	createState = function(p1, p2)
		-- upvalues: default (ref)
		local t = {
			transition = { default = if p2 then p2.default else default }
		}
		
		for i, v in p1 do
			t[i] = v
			
			if p2 and p2[i] then
				(t.transition or { default = default })[i] = p2[i]
			end
		end
		return t
	end,
	transition = function(p3, p4)
		-- upvalues: presets (ref), default (ref)
		local var1 = if type(p3) == "string" then presets[p3] or default else p3
		local t = {
			duration = if var1 then var1.duration else default.duration,
			easingStyle = if var1 then var1.easingStyle else default.easingStyle,
			delay = if var1 then var1.delay else default.delay
		}
		
		if p4 then
			if p4.duration then
				t.duration = p4.duration
			end
			if p4.easingStyle then
				t.easingStyle = p4.easingStyle
			end
			if p4.delay then
				t.delay = p4.delay
			end
		end
		return t
	end,
	animate = function(p3, p4)
		-- upvalues: default (ref)
		if not p3 then return end
		local transition = p3.transition or { default = default }
		
		for i, v in p4 do
			local var1 = transition[i]
			local var2 = if var1 ~= nil then transition.default else var1
			
			if var2.delay and var2.delay > 0 then
				local cloned = table.clone(var2)
				task.delay(var2.delay, function()
					-- upvalues: v (ref), p3 (ref), i (ref), cloned (ref)
					v(p3[i], cloned)
				end)
			else
				v(p3[i], var2)
			end
		end
	end
}