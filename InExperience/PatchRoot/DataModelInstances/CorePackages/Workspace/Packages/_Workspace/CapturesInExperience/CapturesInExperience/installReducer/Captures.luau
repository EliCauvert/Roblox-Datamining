local parent = script.Parent.Parent
local _ = require(parent.Types)

return require(parent.Parent.Rodux).createReducer({}, {
	[require(parent.Actions.CapturesRetrieved).name] = function(_, p0)
		return p0.captures
	end
})