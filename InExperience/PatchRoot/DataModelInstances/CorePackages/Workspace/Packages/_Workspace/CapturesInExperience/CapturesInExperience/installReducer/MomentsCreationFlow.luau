local parent = script.Parent.Parent
local parent_1 = parent.Parent
local cryoModule = require(parent_1.Cryo)
local roduxModule = require(parent_1.Rodux)
local _ = require(parent.Types)
local t = { IsOpen = false, Capture = nil }

return roduxModule.createReducer(t, {
	[require(parent.Actions.MomentsCreationFlowOpened).name] = function(p0, p1) --[[ line: 23 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p0, { IsOpen = true, Capture = p1.capture })
	end,
	[require(parent.Actions.MomentsCreationFlowClosed).name] = function(_, _) --[[ line: 30 ]]
		-- upvalues: t (ref)
		return t
	end
})