local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local _ = require(Parent.React)
local MotionModule = require(Parent.Motion)
local TransitionPreset = MotionModule.TransitionPreset
local _ = require(Foundation.Components.Types)

return function(KnobStyle, KnobStyle1)
	-- upvalues: MotionModule (copy), TransitionPreset (copy)
	return {
		Hidden = MotionModule.createState({
			transparency = 1,
			knobStyle = { Transparency = 1, Color3 = KnobStyle.Color3 }
		}, {
			default = MotionModule.transition(TransitionPreset.Default, { duration = 0.15 })
		}),
		Idle = MotionModule.createState({ transparency = 0, knobStyle = KnobStyle }, {
			default = MotionModule.transition(TransitionPreset.Default, { duration = 0.15 })
		}),
		Dragging = MotionModule.createState({ transparency = 0, knobStyle = KnobStyle1 }, {
			default = MotionModule.transition(TransitionPreset.Default, { duration = 0.1 })
		})
	}
end