local parent = script.Parent
local styleContextModule = require(parent.StyleContext)
local reactModule = require(parent.Parent.Parent.Parent.React)

return function()
	-- upvalues: reactModule (ref), styleContextModule (ref)
	return reactModule.useContext(styleContextModule).derivedValues.textSizeOffset
end