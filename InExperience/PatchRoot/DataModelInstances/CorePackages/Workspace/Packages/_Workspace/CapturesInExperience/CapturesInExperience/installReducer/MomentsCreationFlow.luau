local parent = script.Parent.Parent
local parent_1 = parent.Parent
local cryoModule = require(parent_1.Cryo)
local roduxModule = require(parent_1.Rodux)
local _ = require(parent.Types)
local t = { IsOpen = false, Capture = nil, SessionId = nil }

return roduxModule.createReducer(t, {
	[require(parent.Actions.MomentsCreationFlowOpened).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, {
			IsOpen = true,
			Capture = p2.capture,
			SessionId = p2.sessionId
		})
	end,
	[require(parent.Actions.MomentsCreationFlowClosed).name] = function(_, _)
		-- upvalues: t (ref)
		return t
	end
})