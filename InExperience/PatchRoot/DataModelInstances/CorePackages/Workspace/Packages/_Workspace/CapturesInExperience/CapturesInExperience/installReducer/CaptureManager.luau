local parent = script.Parent.Parent
local parent_1 = parent.Parent
local roduxModule = require(parent_1.Rodux)
local cryoModule = require(parent_1.Cryo)
local _ = require(parent.Types)

return roduxModule.createReducer({ IsOpen = false, SelectedCaptures = {} }, {
	[require(parent.Actions.CaptureManagerClosed).name] = function(p1, _)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { IsOpen = false, SelectedCaptures = {} })
	end,
	[require(parent.Actions.CaptureManagerOpened).name] = function(p1, _)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { IsOpen = true })
	end,
	[require(parent.Actions.CapturesRetrieved).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, {
			IsOpen = p1.IsOpen and #p2.captures > 0,
			SelectedCaptures = {}
		})
	end,
	[require(parent.Actions.UpdateSelectedCaptures).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { SelectedCaptures = p2.selectedCaptures })
	end
})