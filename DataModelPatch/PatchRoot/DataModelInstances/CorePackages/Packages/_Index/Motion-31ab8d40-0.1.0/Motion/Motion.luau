local _ = require(script.Parent.Types)
local Presets = require(script.Parent.Utility.TimingConfigs).presets
local Preset = Presets[require(script.Parent.Enums.TransitionPreset).Default]

local function _(p1)
	-- upvalues: Preset (copy)
	return p1.transition or { default = Preset }
end

return {
	createState = function(List, p1)
		-- upvalues: Preset (copy)
		local config = { transition = { default = p1 and p1.default or Preset } }
		
		for i, value in List do
			config[i] = value
			
			if p1 and p1[i] then
				(config.transition or { default = Preset })[i] = p1[i]
			end
		end
		return config
	end,
	transition = function(p2, p3)
		-- upvalues: Presets (copy), Preset (copy)
		local Preset1 = if type(p2) == "string" then Presets[p2] or Preset else p2
		local config = {
			duration = Preset1 and Preset1.duration or Preset.duration,
			easingStyle = Preset1 and Preset1.easingStyle or Preset.easingStyle,
			delay = Preset1 and Preset1.delay or Preset.delay
		}
		
		if p3 then
			if p3.duration then
				config.duration = p3.duration
			end
			if p3.easingStyle then
				config.easingStyle = p3.easingStyle
			end
			if p3.delay then
				config.delay = p3.delay
			end
		end
		return config
	end,
	animate = function(p2, List)
		-- upvalues: Preset (copy)
		if not p2 then return end
		local Transition = p2.transition or { default = Preset }
		for i, value in List do
			local TransitionEntry = Transition[i]
			local Default = if TransitionEntry == nil then Transition.default else TransitionEntry
			
			if Default.delay and Default.delay > 0 then
				local Copy = table.clone(Default)
				task.delay(Default.delay, function()
					-- upvalues: value (copy), p2 (copy), i (copy), Copy (copy)
					value(p2[i], Copy)
				end)
			else
				value(p2[i], Default)
			end
		end
	end
}