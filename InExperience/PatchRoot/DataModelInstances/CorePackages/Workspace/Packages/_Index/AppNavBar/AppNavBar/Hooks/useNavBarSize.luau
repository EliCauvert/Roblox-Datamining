local useStyle = require(script.Parent.Parent.Parent.UIBlox).Core.Style.useStyle

return function()
	-- upvalues: useStyle (ref)
	return useStyle().Tokens.Size.Size_1600
end