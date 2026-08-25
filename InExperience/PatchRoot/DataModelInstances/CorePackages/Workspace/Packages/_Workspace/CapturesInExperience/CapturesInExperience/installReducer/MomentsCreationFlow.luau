local parent = script.Parent.Parent
local parent_1 = parent.Parent
local cryoModule = require(parent_1.Cryo)
local roduxModule = require(parent_1.Rodux)
local _ = require(parent.Types)
local t = { IsOpen = false, Capture = nil, SessionId = nil }

return roduxModule.createReducer(t, {
	[require(parent.Actions.MomentsCreationFlowOpened).name] = function(p0, p1)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p0, {
			IsOpen = true,
			Capture = p1.capture,
			SessionId = p1.sessionId
		})
	end,
	[require(parent.Actions.MomentsCreationFlowClosed).name] = function(_, _)
		-- upvalues: t (ref)
		return t
	end
})