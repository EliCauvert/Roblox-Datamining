local Parent = script.Parent.Parent
local _ = require(Parent.Enums.CaptureTriggerType)

return require(Parent.Parent.Rodux).createReducer({ status = false, triggerType = nil }, {
	[require(Parent.Actions.VideoCaptureStarted).name] = function(_, p1) --[[ Line: 22 ]]
		return { status = true, triggerType = p1.triggerType }
	end,
	[require(Parent.Actions.VideoCaptureStopped).name] = function(_, p1) --[[ Line: 29 ]]
		return { status = false, triggerType = p1.triggerType }
	end
})