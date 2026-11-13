local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local CryoModule = require(Parent1.Cryo)
local RoduxModule = require(Parent1.Rodux)
local _ = require(Parent.Types)
local MomentsCreationFlowClosedModule = require(Parent.Actions.MomentsCreationFlowClosed)
local MomentsCreationFlowOpenedModule = require(Parent.Actions.MomentsCreationFlowOpened)
local config = { IsOpen = false, Capture = nil, SessionId = nil }

return RoduxModule.createReducer(config, {
	[MomentsCreationFlowOpenedModule.name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			IsOpen = true,
			Capture = p2.capture,
			SessionId = p2.sessionId
		})
	end,
	[MomentsCreationFlowClosedModule.name] = function(_, _)
		-- upvalues: config (copy)
		return config
	end
})