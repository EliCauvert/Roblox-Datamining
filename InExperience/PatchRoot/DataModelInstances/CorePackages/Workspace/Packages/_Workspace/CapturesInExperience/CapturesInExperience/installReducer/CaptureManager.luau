local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local CryoModule = require(Parent1.Cryo)
local _ = require(Parent.Types)

return require(Parent1.Rodux).createReducer({ IsOpen = false, SelectedCaptures = {} }, {
	[require(Parent.Actions.CaptureManagerClosed).name] = function(p1, _) --[[ Line: 24 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { IsOpen = false, SelectedCaptures = {} })
	end,
	[require(Parent.Actions.CaptureManagerOpened).name] = function(p1, _) --[[ Line: 31 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { IsOpen = true })
	end,
	[require(Parent.Actions.CapturesRetrieved).name] = function(p1, p2) --[[ Line: 37 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			IsOpen = p1.IsOpen and #p2.captures > 0,
			SelectedCaptures = {}
		})
	end,
	[require(Parent.Actions.UpdateSelectedCaptures).name] = function(p1, p2) --[[ Line: 44 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { SelectedCaptures = p2.selectedCaptures })
	end
})