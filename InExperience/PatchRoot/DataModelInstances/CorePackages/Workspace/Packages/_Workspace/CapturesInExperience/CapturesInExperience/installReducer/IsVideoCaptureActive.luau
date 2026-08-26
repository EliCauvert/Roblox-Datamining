local parent = script.Parent.Parent
local _ = require(parent.Enums.CaptureTriggerType)

return require(parent.Parent.Rodux).createReducer({ status = false, triggerType = nil }, {
	[require(parent.Actions.VideoCaptureStarted).name] = function(_, p1)
		return { status = true, triggerType = p1.triggerType }
	end,
	[require(parent.Actions.VideoCaptureStopped).name] = function(_, p1)
		return { status = false, triggerType = p1.triggerType }
	end
})