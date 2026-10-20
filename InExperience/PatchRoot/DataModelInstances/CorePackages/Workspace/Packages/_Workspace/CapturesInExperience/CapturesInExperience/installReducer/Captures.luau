local Parent = script.Parent.Parent
local _ = require(Parent.Types)

return require(Parent.Parent.Rodux).createReducer({}, {
	[require(Parent.Actions.CapturesRetrieved).name] = function(_, p1)
		return p1.captures
	end
})