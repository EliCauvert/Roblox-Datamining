local Parent = script.Parent.Parent
local _ = require(Parent.Types)
local TransitionPresetModule = require(Parent.Enums.TransitionPreset)
local TimingConfigsModule = {
	presets = {
		[TransitionPresetModule.Default] = {
			duration = 0.3,
			delay = 0,
			easingStyle = { 0.2, 0, 0, 1 }
		},
		[TransitionPresetModule.Quick] = {
			duration = 0.05,
			delay = 0,
			easingStyle = { 0.2, 0, 0, 1 }
		},
		[TransitionPresetModule.Slow] = { duration = 1, delay = 0, easingStyle = { 0.2, 0, 0, 1 } }
	}
}

function TimingConfigsModule.getDefaultTransition()
	-- upvalues: TimingConfigsModule (copy), TransitionPresetModule (copy)
	local Preset = TimingConfigsModule.presets[TransitionPresetModule.Default]
	
	return {
		duration = Preset.duration,
		easingStyle = Preset.easingStyle,
		delay = Preset.delay
	}
end

function TimingConfigsModule.createDefaultTransitionState()
	-- upvalues: TimingConfigsModule (copy)
	return { default = TimingConfigsModule.getDefaultTransition() }
end

return TimingConfigsModule