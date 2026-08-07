-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:52 2026 Pacific Standard Time.

local _ = require(script.Parent.Types)
local presets = require(script.Parent.Utility.TimingConfigs).presets
local default = presets[require(script.Parent.Enums.TransitionPreset).Default]

local function _(p0) --[[ line: 12 | named "getTransition" ]]
	-- upvalues: default (ref)
	return p0.transition or { default = default }
end

return {
	createState = function(p1, p2) --[[ line: 18 ]]
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
	transition = function(p3, p4) --[[ line: 40 ]]
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
	animate = function(p5, p6) --[[ line: 69 ]]
		-- upvalues: default (ref)
		if not p5 then return end
		local transition = p5.transition or { default = default }
		
		for i, v in p6 do
			local var4 = transition[i]
			local var5 = if var4 ~= nil then transition.default else var4
			
			if var5.delay and var5.delay > 0 then
				local cloned = table.clone(var5)
				task.delay(var5.delay, function() --[[ line: 88 ]]
					-- upvalues: v (ref), p5 (ref), i (ref), cloned (ref)
					v(p5[i], cloned)
				end)
			else
				v(p5[i], var5)
			end
		end
	end
}