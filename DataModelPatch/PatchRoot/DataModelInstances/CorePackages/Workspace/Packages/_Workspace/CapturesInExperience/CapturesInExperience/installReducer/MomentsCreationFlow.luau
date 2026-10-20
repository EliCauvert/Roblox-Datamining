local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local CryoModule = require(Parent1.Cryo)
local _ = require(Parent.Types)
local config = { IsOpen = false, Capture = nil }

return require(Parent1.Rodux).createReducer(config, {
	[require(Parent.Actions.MomentsCreationFlowOpened).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { IsOpen = true, Capture = p2.capture })
	end,
	[require(Parent.Actions.MomentsCreationFlowClosed).name] = function(_, _)
		-- upvalues: config (copy)
		return config
	end
})