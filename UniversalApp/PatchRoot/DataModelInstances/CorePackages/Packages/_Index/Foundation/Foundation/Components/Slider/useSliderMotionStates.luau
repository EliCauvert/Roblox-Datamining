local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local _ = require(parent.React)
local motionModule = require(parent.Motion)
local transitionPreset = motionModule.TransitionPreset
local _ = require(foundation.Components.Types)

return function(p0, p1) --[[ line: 28 | named "useSliderMotionStates" ]]
	-- upvalues: motionModule (ref), transitionPreset (ref)
	return {
		Hidden = motionModule.createState({
			transparency = 1,
			knobStyle = { Transparency = 1, Color3 = p0.Color3 }
		}, {
			default = motionModule.transition(transitionPreset.Default, { duration = 0.15 })
		}),
		Idle = motionModule.createState({ transparency = 0, knobStyle = p0 }, {
			default = motionModule.transition(transitionPreset.Default, { duration = 0.15 })
		}),
		Dragging = motionModule.createState({ transparency = 0, knobStyle = p1 }, {
			default = motionModule.transition(transitionPreset.Default, { duration = 0.1 })
		})
	}
end